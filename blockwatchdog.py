"""BlockWatchdog: Smart Contract Attack Detection Tool

This module serves as the main entry point for BlockWatchdog, a tool for detecting
premeditated attacks and vulnerabilities in Ethereum smart contracts.
"""

import argparse
import json
import logging
import time
from typing import Dict, List, Any

import global_params
from contract import Contract
from graph.call_graph import CallGraph
from identifier import AttackIdentifier

def create_argument_parser() -> argparse.ArgumentParser:
    """Create and configure command line argument parser."""
    parser = argparse.ArgumentParser(
        description='BlockWatchdog: Smart Contract Attack Detection Tool'
    )
    parser.add_argument(
        "-bp", "--blockchain_platform",
        help="The blockchain platform where the test contract is deployed",
        dest="platform",
        type=str,
        default="ETH",
        choices=["ETH", "BSC", "FTM", "ARB"]
    )
    parser.add_argument(
        "-la", "--logic_address",
        help="Contract address for storing business logic",
        dest="logic_addr",
        type=str,
        required=True
    )
    parser.add_argument(
        "-sa", "--storage_address",
        help="Contract address for storing business data",
        dest="storage_addr",
        type=str,
        default=""
    )
    parser.add_argument(
        "-bn", "--block_number",
        help="Blockchain snapshot",
        dest="block_number",
        type=int,
        default=16000000
    )
    parser.add_argument(
        "-fs", "--function_signature",
        help="The function signature to be analyzed",
        dest="func_sign",
        type=str,
        default=""
    )
    parser.add_argument(
        "-v", "--verbose",
        help="Verbose output, print everything.",
        action="store_true"
    )
    parser.add_argument(
        "-cc", "--complete_callflow",
        help="Fetch storage type call arg value for complete call flow recovery.",
        action="store_true"
    )
    
    return parser


def setup_logging(verbose: bool) -> None:
    """Configure logging based on verbosity level."""
    logging.basicConfig(
        format="[%(levelname)s][%(filename)s:%(lineno)d]: %(message)s",
        datefmt="%Y.%m.%d. %H:%M:%S",
    )
    root_logger = logging.getLogger(None)
    
    if verbose:
        root_logger.setLevel(level=logging.INFO)
    else:
        root_logger.setLevel(level=logging.WARNING)



def create_source_config(args: argparse.Namespace) -> Dict[str, Any]:
    """Create source configuration dictionary from command line arguments."""
    storage_addr = args.storage_addr if args.storage_addr else args.logic_addr
    
    return {
        "platform": args.platform,
        "logic_addr": args.logic_addr,
        "storage_addr": storage_addr,
        "func_sign": "",
        "block_number": args.block_number,
        "caller": "msg.sender",
        "caller_func_sign": "",
        "call_site": "",
        "level": 0,
        "callArgVals": {},
    }


def process_createbin_contract(
    source: Dict[str, Any], contracts: Dict[str, Any]
) -> tuple[List[str], int, List[str], List[str]]:
    """Process contracts that only have creation bytecode."""
    call_paths = []
    visited_contracts = []
    visited_funcs = []
    
    source["func_sign"] = "__function_selector__"
    cross_contract_call_graph = CallGraph(source, contracts, source["platform"])
    cross_contract_call_graph.construct_cross_contract_call_graph()
    
    visited_contracts.extend(cross_contract_call_graph.visited_contracts)
    visited_funcs.extend(cross_contract_call_graph.visited_funcs)
    max_call_depth = cross_contract_call_graph.max_level
    
    call_graph_str = cross_contract_call_graph.get_output()
    call_paths.append(call_graph_str)
    
    return call_paths, max_call_depth, visited_contracts, visited_funcs


def process_runtime_contract(
    external_call_signatures: List[str], source: Dict[str, Any], contracts: Dict[str, Any]
) -> tuple[List[str], int, List[str], List[str]]:
    """Process contracts with runtime bytecode by analyzing all functions with external calls."""
    call_paths = []
    visited_contracts = []
    visited_funcs = []
    max_call_depth = 0
    
    if "__function_selector__" in external_call_signatures:
        external_call_signatures.remove("__function_selector__")
    
    while external_call_signatures:
        source_copy = source.copy()
        source_copy["func_sign"] = external_call_signatures.pop(0)
        source_copy["callArgVals"] = {}
        
        cross_contract_call_graph = CallGraph(source_copy, contracts, source_copy["platform"])
        cross_contract_call_graph.construct_cross_contract_call_graph()
        
        visited_contracts.extend(cross_contract_call_graph.visited_contracts)
        visited_funcs.extend(cross_contract_call_graph.visited_funcs)
        
        call_depth = cross_contract_call_graph.max_level
        if call_depth > max_call_depth:
            max_call_depth = call_depth
        
        call_graph_str = cross_contract_call_graph.get_output()
        call_paths.append(call_graph_str)
    
    return call_paths, max_call_depth, visited_contracts, visited_funcs


def initialize_result_structure(args: argparse.Namespace) -> Dict[str, Any]:
    """Initialize the result dictionary with default values."""
    return {
        "is_attack": False,
        "warning": "medium",
        "attack_matrix": {},
        "analysis_loc": "",
        "platform": args.platform,
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


def populate_semantic_features(
    result: Dict[str, Any], detector: AttackIdentifier
) -> None:
    """Populate semantic features in the result dictionary."""
    semantic_features = result["semantic_features"]
    
    semantic_features["op_creation"]["op_multicreate"] = (
        detector.semantic_analysis.op_multicreate_analysis()
    )
    semantic_features["op_creation"]["op_solecreate"] = (
        detector.semantic_analysis.op_solecreate_analysis()
    )
    semantic_features["op_selfdestruct"] = (
        detector.semantic_analysis.op_selfdestruct_analysis()
    )
    semantic_features["op_env"] = detector.flow_analysis.tainted_env_call_arg()
    
    external_call = result["external_call"]
    external_call["externalcall_inhook"] = (
        detector.semantic_analysis.externalcall_inhook()
    )
    external_call["externalcall_infallback"] = (
        detector.semantic_analysis.externalcall_infallback()
    )

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


def calculate_warning_level(result: Dict[str, Any]) -> str:
    """Calculate warning level based on semantic features and overlaps."""
    semantic = result["semantic_features"]
    
    if (
        semantic["op_creation"]["op_multicreate"]
        or semantic["op_creation"]["op_solecreate"]
        or semantic["op_selfdestruct"]
        or semantic["op_env"]
        or result["overlap"]["has_overlap"]
        or result["external_call"]["externalcall_inhook"]
    ):
        return "high"
    
    return "medium"


def save_results(
    result: Dict[str, Any], logic_addr: str, execution_time: float
) -> None:
    """Save analysis results to JSON file."""
    result["time"] = execution_time
    output = {logic_addr: result}
    
    print(output)
    
    store_path = global_params.JSON_PATH + logic_addr + ".json"
    with open(store_path, "w", encoding="utf-8") as f:
        f.write(json.dumps(output, indent=2, ensure_ascii=False))


def main() -> None:
    """Main analysis workflow for BlockWatchdog."""
    parser = create_argument_parser()
    args = parser.parse_args()
    
    setup_logging(args.verbose)
    
    if args.complete_callflow:
        global_params.CALLARG_STORAGETYPE = True
    
    logging.info(f"Testing function signature {args.func_sign}...")
    
    contracts = {}
    source = create_source_config(args)
    start_time = time.perf_counter()
    
    original_contract = Contract(
        source["platform"],
        source["logic_addr"],
        source["storage_addr"],
        source["func_sign"],
        source["block_number"],
        source["caller"],
        source["call_site"],
        source["level"],
        source["callArgVals"],
    )
    
    func_sign_list = original_contract.get_func_sign_list()
    
    if args.func_sign:
        external_call_signatures = [args.func_sign]
    else:
        external_call_signatures = original_contract.get_external_call_in_func_sigature()
    
    external_call_signatures_backup = external_call_signatures.copy()
    
    is_createbin = original_contract.is_createbin()
    
    if is_createbin:
        call_paths, max_call_depth, visited_contracts, visited_funcs = (
            process_createbin_contract(source, contracts)
        )
    else:
        call_paths, max_call_depth, visited_contracts, visited_funcs = (
            process_runtime_contract(external_call_signatures, source, contracts)
        )
    
    detector = AttackIdentifier(
        source["logic_addr"],
        contracts,
        func_sign_list,
        external_call_signatures_backup,
        visited_contracts,
        visited_funcs,
    )
    
    result = initialize_result_structure(args)
    
    is_attack, attack_matrix = detector.detect()
    result["is_attack"] = is_attack
    result["attack_matrix"] = attack_matrix
    result["call_paths"] = call_paths
    result["max_call_depth"] = max_call_depth
    
    result["visited_contracts"] = list(set(visited_contracts))
    result["visited_contracts_num"] = len(result["visited_contracts"])
    result["visited_funcs"] = list(set(visited_funcs))
    result["visited_funcs_num"] = len(result["visited_funcs"])
    
    populate_semantic_features(result, detector)
    
    sensitive_callsigs = detector.get_sig_info()
    victim_callback_info, attack_reenter_info = detector.get_reen_info()
    
    reentrancy_info = {}
    for func_sig in victim_callback_info:
        reentrancy_info[func_sig] = {
            "victim_call": victim_callback_info[func_sig],
            "reenter_call": attack_reenter_info[func_sig],
        }
    result["reentrancy_path_info"] = reentrancy_info
    
    result["sensitive_callsigs"] = list(set(sensitive_callsigs))
    result["contract_funcsigs"] = func_sign_list
    result["contract_funcsigs_external_call"] = external_call_signatures_backup
    
    overlap = list(
        set(sensitive_callsigs).intersection(set(external_call_signatures_backup))
    )
    if overlap:
        result["overlap"]["has_overlap"] = True
        result["overlap"]["overlap_external_call"].extend(overlap)
    
    result["warning"] = calculate_warning_level(result)
    result["analysis_loc"] = "createbin" if is_createbin else "runtimebin"
    
    end_time = time.perf_counter()
    execution_time = end_time - start_time
    
    save_results(result, args.logic_addr, execution_time)


if __name__ == "__main__":
    main()
