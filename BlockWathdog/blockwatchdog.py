import argparse
import sys
import pandas as pd
import os
from datetime import datetime
from web3 import Web3
from contract import Contract
from flow_analysis import FlowAnalysis
import time
import multiprocessing
import json
from global_params import *
import shutil

# hook function list
#  (sigText = "tokensReceived(bytes4,bytes32,address,address,address,uint256,bytes,bytes)";
#   sigText = "transferFrom(address,address,uint256)";
#   sigText = "tokensToSend(address,address,address,uint256,bytes,bytes)";
#   sigText = "onERC721Received(address,address,uint256,bytes)";
#   sigText = "onERC1155Received(address,address,uint256,uint256,bytes)";
#   sigText = "canImplementInterfaceForAddress(bytes32,address)";
#   sigText = "delegatedTransferERC20(address,address,uint256)";
#   sigText = "onTokenTransfer(address,uint256,bytes)";
#   sigText = "onFlashLoan(address,address,uint256,uint256,bytes)";
#   sigText = "uniswapV2Call(address,uint256,uint256,bytes)").

# + fallback function


class CallGraph:
    output = ""
    visited_contracts = []
    visited_funcs = []
    max_level = 0

    def __init__(self, source, contracts):
        self.source = source
        self.contracts = contracts
        self.output = ""
        self.visited_contracts = []
        self.visited_funcs = []
        self.max_level = 0

    def get_contracts(self):
        return self.contracts

    def get_output(self):
        return self.output

    def construct_cross_contract_call_graph(self):
        source = self.source
        contracts = self.contracts
        pending = []
        pending.append(source)

        index = 0
        while len(pending) > 0:
            temp = pending.pop()
            index += 1
            if temp["level"] > self.max_level:
                self.max_level = temp["level"]

            temp_key = (
                temp["caller"]
                + "_"
                + temp["call_site"]
                + "_"
                + temp["logic_addr"]
                + "_"
                + temp["func_sign"]
                + "_"
                + temp["caller_func_sign"]
            )
            print(
                "     " * temp["level"]
                + temp["caller"]
                + "_"
                + temp["caller_func_sign"]
                + " -> "
                + temp["logic_addr"]
                + "_"
                + temp["func_sign"]
            )
            self.output = (
                self.output
                + "     " * temp["level"]
                + temp["caller"]
                + "_"
                + temp["caller_func_sign"]
                + " -> "
                + temp["logic_addr"]
                + "_"
                + temp["func_sign"]
                + '\n'
            )
            if temp_key in contracts.keys():
                continue

            if temp["logic_addr"] not in self.visited_contracts:
                self.visited_contracts.append(temp["logic_addr"])
            if temp["func_sign"] not in self.visited_funcs:
                self.visited_funcs.append(temp["func_sign"])

            contracts[temp_key] = Contract(
                temp["platform"],
                temp["logic_addr"],
                temp["storage_addr"],
                temp["func_sign"],
                temp["block_number"],
                temp["caller"],
                temp["call_site"],
                temp["level"],
            )
            for external_call in contracts[temp_key].external_calls:
                if (
                    external_call["logic_addr"] != ""
                    and external_call["storage_addr"] != ""
                    and external_call["funcSign"] != ""
                ):
                    pending.append(
                        {
                            "platform": temp["platform"],
                            "logic_addr": external_call["logic_addr"],
                            "storage_addr": external_call["storage_addr"],
                            "func_sign": external_call["funcSign"],
                            "block_number": temp["block_number"],
                            "caller": external_call["caller"],
                            "call_site": external_call["call_site"],
                            "level": temp["level"] + 1,
                            "caller_func_sign": temp["func_sign"],
                        }
                    )


def process(logic_addr):
    contracts = {}
    # default: storage_addr is the same as logic_addr
    storage_addr = logic_addr

    source = {
        "platform": "ETH",
        "logic_addr": logic_addr,
        "storage_addr": storage_addr,
        "func_sign": "",
        "block_number": 16000000,
        "caller": "msg.sender",
        "caller_func_sign": "",
        "call_site": "",
        "level": 0,
    }
    begin = time.perf_counter()

    call_paths = []
    try:
        original_contract = Contract(
            source["platform"],
            source["logic_addr"],
            source["storage_addr"],
            source["func_sign"],
            source["block_number"],
            source["caller"],
            source["call_site"],
            source["level"],
        )
        func_sign_list = original_contract.get_func_sign_list()
        external_call_in_func_sigature = (
            original_contract.get_external_call_in_func_sigature()
        )

        # store the signatures of functions that contain external calls
        store_external_call_in_func_sigature_list = []
        for i in external_call_in_func_sigature:
            store_external_call_in_func_sigature_list.append(i)

        visited_contracts = []
        visited_funcs = []
        # the max call depths of a contract
        m_call_depth = 0

        # if no runtime bin, just run __function_selector__ for the createbin
        is_createbin = original_contract.is_createbin()
        call_graph_str = ""
        if is_createbin:
            max_call_depth = 0
            source = {
                "platform": "ETH",
                "logic_addr": logic_addr,
                "storage_addr": storage_addr,
                "func_sign": "",
                "block_number": 16000000,
                "caller": "msg.sender",
                "caller_func_sign": "",
                "call_site": "",
                "level": 0,
            }
            source["func_sign"] = "__function_selector__"
            cross_contract_call_graph = CallGraph(source, contracts)
            cross_contract_call_graph.construct_cross_contract_call_graph()
            visited_contracts = (
                visited_contracts + cross_contract_call_graph.visited_contracts
            )
            visited_funcs = visited_funcs + cross_contract_call_graph.visited_funcs
            m_call_depth = cross_contract_call_graph.max_level

            call_graph_str = cross_contract_call_graph.get_output()
            call_paths.append(call_graph_str)
        else:
            # run all pub funs and remove function selector
            if "__function_selector__" in external_call_in_func_sigature:
                external_call_in_func_sigature.remove("__function_selector__")

            max_call_depth = 0
            # for every functions that contains external calls
            while len(external_call_in_func_sigature) > 0:
                source = {
                    "platform": "ETH",
                    "logic_addr": logic_addr,
                    "storage_addr": storage_addr,
                    "func_sign": "",
                    "block_number": 16000000,
                    "caller": "msg.sender",
                    "caller_func_sign": "",
                    "call_site": "",
                    "level": 0,
                }
                source["func_sign"] = external_call_in_func_sigature.pop()
                cross_contract_call_graph = CallGraph(source, contracts)
                cross_contract_call_graph.construct_cross_contract_call_graph()
                visited_contracts = (
                    visited_contracts + cross_contract_call_graph.visited_contracts
                )
                visited_funcs = visited_funcs + cross_contract_call_graph.visited_funcs
                call_depth = cross_contract_call_graph.max_level

                if call_depth > max_call_depth:
                    max_call_depth = call_depth

                call_graph_str = cross_contract_call_graph.get_output()
                call_paths.append(call_graph_str)

            m_call_depth = max_call_depth

        detector = FlowAnalysis(
            contracts,
            func_sign_list,
            store_external_call_in_func_sigature_list,
            visited_contracts,
            visited_funcs,
        )
        result = {
            "is_attack": False,
            "warning": "medium",
            "attack_matrix": {},
            "analysis_loc": "",
            "platform": "ETH",
            "block_number": 16000000,
            "time": None,
            "semantic_features": {
                "op_creation": {
                    "op_multicreate": False,
                    "op_solecreate": False,
                },
                "op_selfdestruct": False,
                "op_env": False,
            },
            "external_call": {
                "externalcall_inhook": False,
                "externalcall_infallback": False,
                "hooks_focused": [
                    "tokensReceived",
                    "transferFrom",
                    "tokensToSend",
                    "onERC721Received",
                    "onERC1155Received",
                    "canImplementInterfaceForAddress",
                    "delegatedTransferERC20",
                    "onTokenTransfer",
                    "onFlashLoan",
                    "uniswapV2Call",
                ],
            },
            "call_paths": [],
            "visited_contracts": [],
            "visited_contracts_num": 0,
            "visited_funcs": [],
            "visited_funcs_num": 0,
            "max_call_depth": 0,
            "contract_funcsigs": [],
            "contract_funcsigs_external_call": [],
            "sensitive_callsigs": [],
            "overlap": {"has_overlap": False, "overlap_external_call": []},
            "reentrancy_path_info": {},
        }

        result["is_attack"], result["attack_matrix"] = detector.detect()
        result["call_paths"] = call_paths

        result["max_call_depth"] = m_call_depth

        result["visited_contracts"] = list(set(visited_contracts))
        result["visited_contracts_num"] = len(list(set(visited_contracts)))
        result["visited_funcs"] = list(set(visited_funcs))
        result["visited_funcs_num"] = len(list(set(visited_funcs)))

        result["semantic_features"]["op_creation"][
            "op_multicreate"
        ] = detector.op_multicreate_analysis()
        result["semantic_features"]["op_creation"][
            "op_solecreate"
        ] = detector.op_solecreate_analysis()
        result["semantic_features"][
            "op_selfdestruct"
        ] = detector.op_selfdestruct_analysis()
        result["semantic_features"]["op_env"] = detector.tainted_env_call_arg()

        result["external_call"]["externalcall_inhook"] = detector.externalcall_inhook()
        result["external_call"][
            "externalcall_infallback"
        ] = detector.externalcall_infallback()

        sensitive_callsigs = detector.get_sig_info()
        victim_callback_info, attack_reenter_info = detector.get_reen_info()

        res = {}
        for i in victim_callback_info.keys():
            res[i] = {
                "victim_call": victim_callback_info[i],
                "reenter_call": attack_reenter_info[i],
            }
        result["reentrancy_path_info"] = res

        result["sensitive_callsigs"] = list(set(sensitive_callsigs))

        result["contract_funcsigs"] = func_sign_list
        result[
            "contract_funcsigs_external_call"
        ] = store_external_call_in_func_sigature_list

        # find whether there is a callback to the function that contains external call
        overlap = list(
            set(sensitive_callsigs).intersection(
                set(store_external_call_in_func_sigature_list)
            )
        )
        if len(overlap) > 0:
            result["overlap"]["has_overlap"] = True
            for i in overlap:
                result["overlap"]["overlap_external_call"].append(i)

        if (
            result["semantic_features"]["op_creation"]["op_multicreate"]
            or result["semantic_features"]["op_creation"]["op_solecreate"]
            or result["semantic_features"]["op_selfdestruct"]
            or result["semantic_features"]["op_env"]
        ):
            result["warning"] = "high"

        # just has overlap, lift the warning
        if result["overlap"]["has_overlap"]:
            result["warning"] = "high"

        if result["external_call"]["externalcall_inhook"]:
            result["warning"] = "high"

        if is_createbin:
            result["analysis_loc"] = "createbin"
        else:
            result["analysis_loc"] = "runtimebin"

        end = time.perf_counter()

        res = {}
        res[logic_addr] = result
        result["time"] = end - begin

        print(res)

        store_path = JSON_PATH + logic_addr + ".json"
        if not os.path.exists(store_path):
            with open(store_path, "w", encoding='utf-8') as f:
                f.write(json.dumps(res, indent=2, ensure_ascii=False))

        for contract in list(set(visited_contracts)):
            if os.path.exists(TEMP_WORKING_DIR + contract):
                shutil.rmtree(TEMP_WORKING_DIR + contract)

    except Exception as reason:
        # print(reason)
        pass


if __name__ == '__main__':
    # Main Body
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "-bp",
        "--blockchain_platform",
        help="The blockchain platform where the test contract is deployed",
        action="store",
        dest="platform",
        type=str,
        default="ETH",
    )
    parser.add_argument(
        "-la",
        "--logic_address",
        help="Contract address for storing business logic",
        action="store",
        dest="logic_addr",
        type=str,
    )
    parser.add_argument(
        "-sa",
        "--storage_address",
        help="Contract address for storing business data",
        action="store",
        dest="storage_addr",
        type=str,
        default="",
    )
    parser.add_argument(
        "-bn",
        "--block_number",
        help="Blockchain snapshot",
        action="store",
        dest="block_number",
        type=int,
        default=16000000,
    )
    args = parser.parse_args()

    contracts = {}
    # default: storage_addr is the same as logic_addr
    storage_addr = ""
    if args.storage_addr == "":
        storage_addr = args.logic_addr
    else:
        storage_addr = args.storage_addr

    source = {
        "platform": args.platform,
        "logic_addr": args.logic_addr,
        "storage_addr": storage_addr,
        "func_sign": "",
        "block_number": args.block_number,
        "caller": "msg.sender",
        "caller_func_sign": "",
        "call_site": "",
        "level": 0,
    }
    begin = time.perf_counter()

    call_paths = []

    original_contract = Contract(
        source["platform"],
        source["logic_addr"],
        source["storage_addr"],
        source["func_sign"],
        source["block_number"],
        source["caller"],
        source["call_site"],
        source["level"],
    )
    func_sign_list = original_contract.get_func_sign_list()
    external_call_in_func_sigature = (
        original_contract.get_external_call_in_func_sigature()
    )

    # store the signatures of functions that contain external calls
    store_external_call_in_func_sigature_list = []
    for i in external_call_in_func_sigature:
        store_external_call_in_func_sigature_list.append(i)

    visited_contracts = []
    visited_funcs = []
    # the max call depths of a contract
    m_call_depth = 0

    # if no runtime bin, just run __function_selector__ for the createbin
    is_createbin = original_contract.is_createbin()
    call_graph_str = ""
    if is_createbin:
        max_call_depth = 0
        source = {
            "platform": "ETH",
            "logic_addr": args.logic_addr,
            "storage_addr": storage_addr,
            "func_sign": "",
            "block_number": args.block_number,
            "caller": "msg.sender",
            "caller_func_sign": "",
            "call_site": "",
            "level": 0,
        }
        source["func_sign"] = "__function_selector__"
        cross_contract_call_graph = CallGraph(source, contracts)
        cross_contract_call_graph.construct_cross_contract_call_graph()
        visited_contracts = (
            visited_contracts + cross_contract_call_graph.visited_contracts
        )
        visited_funcs = visited_funcs + cross_contract_call_graph.visited_funcs
        m_call_depth = cross_contract_call_graph.max_level

        call_graph_str = cross_contract_call_graph.get_output()
        call_paths.append(call_graph_str)
    else:
        # run all pub funs and remove function selector
        if "__function_selector__" in external_call_in_func_sigature:
            external_call_in_func_sigature.remove("__function_selector__")

        max_call_depth = 0
        # for every functions that contains external calls
        while len(external_call_in_func_sigature) > 0:
            source = {
                "platform": "ETH",
                "logic_addr": args.logic_addr,
                "storage_addr": storage_addr,
                "func_sign": "",
                "block_number": args.block_number,
                "caller": "msg.sender",
                "caller_func_sign": "",
                "call_site": "",
                "level": 0,
            }
            source["func_sign"] = external_call_in_func_sigature.pop()
            cross_contract_call_graph = CallGraph(source, contracts)
            cross_contract_call_graph.construct_cross_contract_call_graph()
            visited_contracts = (
                visited_contracts + cross_contract_call_graph.visited_contracts
            )
            visited_funcs = visited_funcs + cross_contract_call_graph.visited_funcs
            call_depth = cross_contract_call_graph.max_level

            if call_depth > max_call_depth:
                max_call_depth = call_depth

            call_graph_str = cross_contract_call_graph.get_output()
            call_paths.append(call_graph_str)

        m_call_depth = max_call_depth

    detector = FlowAnalysis(
        contracts,
        func_sign_list,
        store_external_call_in_func_sigature_list,
        visited_contracts,
        visited_funcs,
    )
    result = {
        "is_attack": False,
        "warning": "medium",
        "attack_matrix": {},
        "analysis_loc": "",
        "platform": "ETH",
        "block_number": args.block_number,
        "time": None,
        "semantic_features": {
            "op_creation": {
                "op_multicreate": False,
                "op_solecreate": False,
            },
            "op_selfdestruct": False,
            "op_env": False,
        },
        "external_call": {
            "externalcall_inhook": False,
            "externalcall_infallback": False,
            "hooks_focused": [
                "tokensReceived",
                "transferFrom",
                "tokensToSend",
                "onERC721Received",
                "onERC1155Received",
                "canImplementInterfaceForAddress",
                "delegatedTransferERC20",
                "onTokenTransfer",
                "onFlashLoan",
                "uniswapV2Call",
            ],
        },
        "call_paths": [],
        "visited_contracts": [],
        "visited_contracts_num": 0,
        "visited_funcs": [],
        "visited_funcs_num": 0,
        "max_call_depth": 0,
        "contract_funcsigs": [],
        "contract_funcsigs_external_call": [],
        "sensitive_callsigs": [],
        "overlap": {"has_overlap": False, "overlap_external_call": []},
        "reentrancy_path_info": {},
    }

    result["is_attack"], result["attack_matrix"] = detector.detect()
    result["call_paths"] = call_paths

    result["max_call_depth"] = m_call_depth

    result["visited_contracts"] = list(set(visited_contracts))
    result["visited_contracts_num"] = len(list(set(visited_contracts)))
    result["visited_funcs"] = list(set(visited_funcs))
    result["visited_funcs_num"] = len(list(set(visited_funcs)))

    result["semantic_features"]["op_creation"][
        "op_multicreate"
    ] = detector.op_multicreate_analysis()
    result["semantic_features"]["op_creation"][
        "op_solecreate"
    ] = detector.op_solecreate_analysis()
    result["semantic_features"]["op_selfdestruct"] = detector.op_selfdestruct_analysis()
    result["semantic_features"]["op_env"] = detector.tainted_env_call_arg()

    result["external_call"]["externalcall_inhook"] = detector.externalcall_inhook()
    result["external_call"][
        "externalcall_infallback"
    ] = detector.externalcall_infallback()

    sensitive_callsigs = detector.get_sig_info()
    victim_callback_info, attack_reenter_info = detector.get_reen_info()

    res = {}
    for i in victim_callback_info.keys():
        res[i] = {
            "victim_call": victim_callback_info[i],
            "reenter_call": attack_reenter_info[i],
        }
    result["reentrancy_path_info"] = res

    result["sensitive_callsigs"] = list(set(sensitive_callsigs))

    result["contract_funcsigs"] = func_sign_list
    result[
        "contract_funcsigs_external_call"
    ] = store_external_call_in_func_sigature_list

    # find whether there is a callback to the function that contains external call
    overlap = list(
        set(sensitive_callsigs).intersection(
            set(store_external_call_in_func_sigature_list)
        )
    )
    if len(overlap) > 0:
        result["overlap"]["has_overlap"] = True
        for i in overlap:
            result["overlap"]["overlap_external_call"].append(i)

    if (
        result["semantic_features"]["op_creation"]["op_multicreate"]
        or result["semantic_features"]["op_creation"]["op_solecreate"]
        or result["semantic_features"]["op_selfdestruct"]
        or result["semantic_features"]["op_env"]
    ):
        result["warning"] = "high"

    # just has overlap, lift the warning
    if result["overlap"]["has_overlap"]:
        result["warning"] = "high"

    if result["external_call"]["externalcall_inhook"]:
        result["warning"] = "high"

    if is_createbin:
        result["analysis_loc"] = "createbin"
    else:
        result["analysis_loc"] = "runtimebin"

    end = time.perf_counter()

    res = {}
    res[args.logic_addr] = result
    result["time"] = end - begin

    print(res)

    store_path = JSON_PATH + args.logic_addr + ".json"
    if not os.path.exists(store_path):
        with open(store_path, "w", encoding='utf-8') as f:
            f.write(json.dumps(res, indent=2, ensure_ascii=False))

    for contract in list(set(visited_contracts)):
        if os.path.exists(TEMP_WORKING_DIR + contract):
            shutil.rmtree(TEMP_WORKING_DIR + contract)
