import argparse
import sys
import pandas as pd
import os
from global_params import *


# find feasible path of flow from the tainted var to sensitive var
class FlowAnalysis:
    def __init__(
        self,
        contracts,
        main_contract_sign_list,
        external_call_in_func_sigature,
        visited_contracts,
        visited_funcs,
    ):
        self.contracts = contracts
        self.main_contract_sign_list = main_contract_sign_list
        self.external_call_in_func_sigature = external_call_in_func_sigature
        self.intra_callsigs = []
        self.sensitive_callsigs = []
        self.attack_matrix = {"br": False, "dos": False, "reentrancy": False}
        self.visited_contracts = visited_contracts
        self.visited_funcs = visited_funcs
        self.victim_callback_info = {}
        self.attack_reenter_info = {}

    # helper
    def find_executed_pp(self, caller, callsite, contract_addr, func_sign):
        addr = ""
        level = -1
        for key in self.contracts.keys():
            temp = key.split("_")
            if (temp[0] == caller) and (temp[1] == callsite) and (temp[3] == func_sign):
                if addr == "":
                    # temp[2] is the logic address
                    addr = temp[2]
                    level = self.contracts[key].level
                else:
                    if self.contracts[key].level > level:
                        addr = temp[2]
                        level = self.contracts[key].level
        return addr

    def new_pp(
        self, caller, callsite, contract_addr, func_sign, index, caller_funcSign, type
    ):
        addr = self.find_executed_pp(caller, callsite, contract_addr, func_sign)
        return {
            'caller': caller,
            'callsite': callsite,
            'contract_addr': addr,
            'func_sign': func_sign,
            'index': index,
            "caller_funcSign": caller_funcSign,
            'type': type,
        }

    def is_same(self, pp1, pp2):
        pp1_str = (
            pp1["caller"]
            + "_"
            + pp1["callsite"]
            + "_"
            + pp1["func_sign"]
            + "_"
            + str(pp1["index"])
            + "_"
            + pp1["type"]
        )
        pp2_str = (
            pp2["caller"]
            + "_"
            + pp2["callsite"]
            + "_"
            + pp2["func_sign"]
            + "_"
            + str(pp2["index"])
            + "_"
            + pp2["type"]
        )
        if pp1_str == pp2_str:
            return True
        else:
            return False

    # find which contract call the logic_addr contract
    def find_parent(self, logic_addr, funcSign, caller, call_site):
        for key in self.contracts.keys():
            for external_call in self.contracts[key].external_calls:
                if (
                    (external_call["logic_addr"] == logic_addr)
                    and (external_call["funcSign"] == funcSign)
                    and (external_call["caller"] == caller)
                    and (external_call["call_site"] == call_site)
                ):
                    return self.contracts[key]
        return None

    # find the corresponding contract
    def find_contract(
        self, caller, callsite, contract_addr, func_sign, caller_funcSign
    ):
        return self.contracts[
            caller
            + "_"
            + callsite
            + "_"
            + contract_addr
            + "_"
            + func_sign
            + "_"
            + caller_funcSign
        ]

    # get the external call from the callsite
    def get_external_call_info(self, call_site, external_calls):
        for external_call in external_calls:
            if external_call["call_site"] == call_site:
                return (
                    external_call["caller"],
                    external_call["logic_addr"],
                    external_call["funcSign"],
                )
        return

    def intraprocedural_br_analysis(self):
        for key in self.contracts.keys():
            if self.contracts[key].level == 0:
                temp_address = key.split("_")[2]
                temp_funcSign = key.split("_")[3]
                if "__function_selector__" in key:
                    temp_funcSign = "__function_selector__"
                loc = (
                    OUTPUT_PATH
                    + ".temp/"
                    + temp_address
                    + "/out/Leslie_SensitiveOpOfBadRandomnessAfterExternalCall.csv"
                )
                if os.path.exists(loc) and (os.path.getsize(loc) > 0):
                    df = pd.read_csv(loc, header=None, sep='	')
                    df.columns = ["funcSign", "callStmt", "sensitiveVar", "sourceOp"]
                    # it is not neccessary to label the func, just focus on the callStmt
                    df = df.loc[df["funcSign"] == temp_funcSign]
                    if len(df) != 0:
                        return True
        return False

    def tainted_env_call_arg(self):
        for key in self.contracts.keys():
            if self.contracts[key].level == 0:
                temp_address = key.split("_")[2]
                temp_funcSign = key.split("_")[3]
                loc = (
                    OUTPUT_PATH
                    + ".temp/"
                    + temp_address
                    + "/out/Leslie_EnvVarFlowsToTaintedVar.csv"
                )
                if os.path.exists(loc) and (os.path.getsize(loc) > 0):
                    df = pd.read_csv(loc, header=None, sep='	')
                    df.columns = ["funcSign", "envVar", "taintedVar"]
                    # it is not neccessary to label the func, just focus on the callStmt
                    df = df.loc[df["funcSign"] == temp_funcSign]
                    if len(df) != 0:
                        return True
        return False

    def op_multicreate_analysis(self):
        for key in self.contracts.keys():
            if self.contracts[key].level == 0:
                temp_address = key.split("_")[2]
                temp_funcSign = key.split("_")[3]
                if "__function_selector__" in key:
                    temp_funcSign = "__function_selector__"
                loc = (
                    OUTPUT_PATH
                    + ".temp/"
                    + temp_address
                    + "/out/Leslie_Op_CreateInLoop.csv"
                )
                if os.path.exists(loc) and (os.path.getsize(loc) > 0):
                    df = pd.read_csv(loc, header=None, sep='	')
                    df.columns = ["funcSign", "stmt"]
                    # it is not neccessary to label the func, just focus on the callStmt
                    df = df.loc[df["funcSign"] == temp_funcSign]
                    if len(df) != 0:
                        return True
        return False

    def op_solecreate_analysis(self):
        for key in self.contracts.keys():
            if self.contracts[key].level == 0:
                temp_address = key.split("_")[2]
                temp_funcSign = key.split("_")[3]
                if "__function_selector__" in key:
                    temp_funcSign = "__function_selector__"
                loc = (
                    OUTPUT_PATH
                    + ".temp/"
                    + temp_address
                    + "/out/Leslie_Op_SoleCreate.csv"
                )
                if os.path.exists(loc) and (os.path.getsize(loc) > 0):
                    df = pd.read_csv(loc, header=None, sep='	')
                    df.columns = ["funcSign", "stmt"]
                    # it is not neccessary to label the func, just focus on the callStmt
                    df = df.loc[df["funcSign"] == temp_funcSign]
                    if len(df) != 0:
                        return True
        return False

    def op_selfdestruct_analysis(self):
        for key in self.contracts.keys():
            if self.contracts[key].level == 0:
                temp_address = key.split("_")[2]
                temp_funcSign = key.split("_")[3]
                if "__function_selector__" in key:
                    temp_funcSign = "__function_selector__"
                loc = (
                    OUTPUT_PATH
                    + ".temp/"
                    + temp_address
                    + "/out/Leslie_Op_Selfdestruct.csv"
                )
                if os.path.exists(loc) and (os.path.getsize(loc) > 0):
                    df = pd.read_csv(loc, header=None, sep='	')
                    df.columns = ["funcSign", "target"]
                    # it is not neccessary to label the func, just focus on the callStmt
                    df = df.loc[df["funcSign"] == temp_funcSign]
                    if len(df) != 0:
                        return True
        return False

    def externalcall_inhook(self):
        for key in self.contracts.keys():
            if self.contracts[key].level == 0:
                temp_address = key.split("_")[2]
                temp_funcSign = key.split("_")[3]
                loc = (
                    OUTPUT_PATH
                    + ".temp/"
                    + temp_address
                    + "/out/Leslie_ExternalCallInHook.csv"
                )
                if os.path.exists(loc) and (os.path.getsize(loc) > 0):
                    df = pd.read_csv(loc, header=None, sep='	')
                    df.columns = ["callStmt", "funcSign"]
                    # it is not neccessary to label the func, just focus on the callStmt
                    df = df.loc[df["funcSign"] == temp_funcSign]
                    if len(df) != 0:
                        return True
        return False

    def externalcall_infallback(self):
        for key in self.contracts.keys():
            if self.contracts[key].level == 0:
                temp_address = key.split("_")[2]
                temp_funcSign = key.split("_")[3]
                loc = (
                    OUTPUT_PATH
                    + ".temp/"
                    + temp_address
                    + "/out/Leslie_ExternalCallInFallback.csv"
                )
                if os.path.exists(loc) and (os.path.getsize(loc) > 0):
                    df = pd.read_csv(loc, header=None, sep='	')
                    df.columns = ["callStmt", "funcSign"]
                    # it is not neccessary to label the func, just focus on the callStmt
                    df = df.loc[df["funcSign"] == temp_funcSign]
                    if len(df) != 0:
                        return True
        return False

    def intraprocedural_dos_analysis(self):
        for key in self.contracts.keys():
            if self.contracts[key].level == 0:
                temp_address = key.split("_")[2]
                temp_funcSign = key.split("_")[3]
                if "__function_selector__" in key:
                    temp_funcSign = "__function_selector__"
                loc = (
                    OUTPUT_PATH
                    + ".temp/"
                    + temp_address
                    + "/out/Leslie_SensitiveOpOfDoSAfterExternalCall.csv"
                )
                if os.path.exists(loc) and (os.path.getsize(loc) > 0):
                    df = pd.read_csv(loc, header=None, sep='	')
                    df.columns = [
                        "funcSign",
                        "callStmt",
                        "callRetVar",
                        "callRetIndex",
                        "sensitiveVar",
                    ]
                    # it is not neccessary to label the func, just focus on the callStmt
                    df = df.loc[df["funcSign"] == temp_funcSign]
                    if len(df) != 0:
                        return True
        return False

    # source (actively spread the taint)
    def get_func_rets_flow_from_sources(self, contract_addr, func_sign):
        loc = OUTPUT_PATH + ".temp/" + contract_addr + "/out/Leslie_TaintedFuncRet.csv"
        if os.path.exists(loc) and (os.path.getsize(loc) > 0):
            df = pd.read_csv(loc, header=None, sep='	')
            df.columns = ["funcSign", "retIndex", "ret"]
            df = df.loc[df["funcSign"] == func_sign]
            if len(df) != 0:
                return list(df["retIndex"])
            else:
                return []
        else:
            return []

    def get_call_args_flow_from_sources(self, contract_addr, func_sign):
        call_args = []
        loc = OUTPUT_PATH + ".temp/" + contract_addr + "/out/Leslie_TaintedCallArg.csv"
        if os.path.exists(loc) and (os.path.getsize(loc) > 0):
            df = pd.read_csv(loc, header=None, sep='	')
            df.columns = ["funcSign", "callStmt", "callArgIndex"]
            df = df.loc[df["funcSign"] == func_sign]
            for i in range(len(df)):
                call_args.append(
                    {
                        "callStmt": df.iloc[i]["callStmt"],
                        "callArgIndex": df.iloc[i]["callArgIndex"],
                    }
                )
        return call_args

    def get_pps_near_source(self):
        pps_near_source = []
        for key in self.contracts.keys():
            temp_caller = key.split("_")[0]
            temp_callsite = key.split("_")[1]
            temp_address = key.split("_")[2]
            temp_funcSign = key.split("_")[3]

            # only mark the analyzed contract's source
            if self.contracts[key].level == 0:
                temp_caller_funcSign = self.contracts[key].func_sign
                # get the taint source: function returns of external calls
                temp_indexes = self.get_func_rets_flow_from_sources(
                    temp_address, temp_funcSign
                )
                if len(temp_indexes) > 0:
                    for temp_index in temp_indexes:
                        # generate a site, label the return index of the external call
                        pps_near_source.append(
                            self.new_pp(
                                temp_caller,
                                temp_callsite,
                                temp_address,
                                temp_funcSign,
                                temp_index,
                                temp_caller_funcSign,
                                "func_ret",
                            )
                        )

                # get the taint source: function arguments of the function
                temp_call_args = self.get_call_args_flow_from_sources(
                    temp_address, temp_funcSign
                )
                if len(temp_call_args) > 0:
                    for temp_call_arg in temp_call_args:
                        (
                            temp_external_call_caller,
                            temp_external_call_logic_addr,
                            temp_external_call_func_sign,
                        ) = self.get_external_call_info(
                            temp_call_arg["callStmt"],
                            self.contracts[key].external_calls,
                        )
                        pps_near_source.append(
                            self.new_pp(
                                temp_external_call_caller,
                                temp_call_arg["callStmt"],
                                temp_external_call_logic_addr,
                                temp_external_call_func_sign,
                                temp_call_arg["callArgIndex"],
                                temp_caller_funcSign,
                                "call_arg",
                            )
                        )
        return pps_near_source

    # sink
    def get_callsites_flow_to_sink(self, contract_addr, func_sign):
        callsites = []
        sensitive_callsigs = []
        loc = (
            OUTPUT_PATH
            + ".temp/"
            + contract_addr
            + "/out/Leslie_CallRetToSensitiveVar.csv"
        )
        if os.path.exists(loc) and (os.path.getsize(loc) > 0):
            df = pd.read_csv(loc, header=None, sep='	')
            df.columns = [
                "funcSign",
                "callStmt",
                "callRetVar",
                "callRetIndex",
                "sensitiveVar",
                "callFuncSig",
            ]
            df = df.loc[df["funcSign"] == func_sign]
            for i in range(len(df)):
                callsites.append(
                    {
                        "callStmt": df.iloc[i]["callStmt"],
                        "callRetIndex": df.iloc[i]["callRetIndex"],
                    }
                )
                sensitive_callsigs.append(
                    df.iloc[i]["callFuncSig"].replace(
                        "00000000000000000000000000000000000000000000000000000000", ""
                    )
                )

        return callsites, sensitive_callsigs

    # another sink: func arg to sensitive var
    def get_func_arg_flow_to_sink(self, contract_addr, func_sign):
        func_args = []
        sensitive_callsigs = []
        loc = (
            OUTPUT_PATH
            + ".temp/"
            + contract_addr
            + "/out/Leslie_FuncArgToSensitiveVar.csv"
        )
        if os.path.exists(loc) and (os.path.getsize(loc) > 0):
            df = pd.read_csv(loc, header=None, sep='	')
            df.columns = [
                "funcSign",
                "callStmt",
                "funcArg",
                "funcArgIndex",
                "sensitiveVar",
                "callFuncSig",
            ]
            df = df.loc[df["funcSign"] == func_sign]
            for i in range(len(df)):
                func_args.append(
                    {
                        "callStmt": df.iloc[i]["callStmt"],
                        "funcArgIndex": df.iloc[i]["funcArgIndex"],
                    }
                )
                sensitive_callsigs.append(
                    df.iloc[i]["callFuncSig"].replace(
                        "00000000000000000000000000000000000000000000000000000000", ""
                    )
                )

        return func_args, sensitive_callsigs

    def get_pps_near_sink(self):
        pps_near_sink = []
        sensitive_callsigs = []

        for key in self.contracts.keys():
            temp_caller = key.split("_")[0]
            temp_callsite = key.split("_")[1]
            temp_address = key.split("_")[2]
            temp_funcSign = key.split("_")[3]
            temp_caller_funcSign = key.split("_")[4]

            # get the taint source: function arguments of the call arg to callee address
            temp_call_args, sigs_funcarg = self.get_func_arg_flow_to_sink(
                temp_address, temp_funcSign
            )
            if len(temp_call_args) > 0:
                for temp_call_arg in temp_call_args:
                    (
                        temp_external_call_caller,
                        temp_external_call_logic_addr,
                        temp_external_call_func_sign,
                    ) = self.get_external_call_info(
                        temp_call_arg["callStmt"], self.contracts[key].external_calls
                    )
                    pps_near_sink.append(
                        self.new_pp(
                            temp_external_call_caller,
                            temp_call_arg["callStmt"],
                            temp_external_call_logic_addr,
                            temp_external_call_func_sign,
                            temp_call_arg["funcArgIndex"],
                            temp_caller_funcSign,
                            "call_arg",
                        )
                    )
            # temp = sigs_callret + sigs_funcarg
            temp = sigs_funcarg
            for i in temp:
                sensitive_callsigs.append(i)
        return pps_near_sink, sensitive_callsigs

    # spread: only functions as variable pass and transfer
    def spread_callRet_funcRet(self, contract_addr, call_stmt, func_sign, ret_index):
        loc = (
            OUTPUT_PATH
            + ".temp/"
            + contract_addr
            + "/out/Leslie_Spread_CallRetToFuncRet.csv"
        )
        if os.path.exists(loc) and (os.path.getsize(loc) > 0):
            df = pd.read_csv(loc, header=None, sep='	')
            df.columns = [
                "callStmt",
                "callRet",
                "callRetIndex",
                "funcSign",
                "funcRetIndex",
                "funcRet",
            ]
            df = df.loc[
                (df["callStmt"] == call_stmt)
                & (df["callRetIndex"] == ret_index)
                & (df["funcSign"] == func_sign)
            ]
            if len(df) != 0:
                return list(df["funcRetIndex"])
            else:
                return []
        else:
            return []

    def spread_callRet_CallArg(self, contract_addr, call_stmt, ret_index):
        callArgs = []
        loc = (
            OUTPUT_PATH
            + ".temp/"
            + contract_addr
            + "/out/Leslie_Spread_CallRetToCallArg.csv"
        )
        if os.path.exists(loc) and (os.path.getsize(loc) > 0):
            df = pd.read_csv(loc, header=None, sep='	')
            df.columns = [
                "callStmt1",
                "callRet",
                "callRetIndex",
                "callStmt2",
                "callArgIndex",
                "callArg",
            ]
            df = df.loc[
                (df["callStmt1"] == call_stmt) & (df["callRetIndex"] == ret_index)
            ]
            for i in range(len(df)):
                callArgs.append(
                    {
                        "callStmt": df.iloc[i]["callStmt2"],
                        "callArgIndex": df.iloc[i]["callArgIndex"],
                    }
                )
        return callArgs

    def spread_funcArg_callArg(self, contract_addr, funcSign, funcArgIndex):
        callArgs = []
        loc = (
            OUTPUT_PATH
            + ".temp/"
            + contract_addr
            + "/out/Leslie_Spread_FuncArgToCallArg.csv"
        )
        if os.path.exists(loc) and (os.path.getsize(loc) > 0):
            df = pd.read_csv(loc, header=None, sep='	')
            df.columns = [
                "funcSign",
                "funcArgIndex",
                "funcArg",
                "callStmt",
                "callArgIndex",
                "callArg",
            ]
            df = df.loc[
                (df["funcSign"] == funcSign) & (df["funcArgIndex"] == funcArgIndex)
            ]
            for i in range(len(df)):
                callArgs.append(
                    {
                        "callStmt": df.iloc[i]["callStmt"],
                        "callArgIndex": df.iloc[i]["callArgIndex"],
                    }
                )
        return callArgs

    def spread_funcArg_callee(self, contract_addr, funcSign, funcArgIndex):
        callArgs = []
        loc = (
            OUTPUT_PATH
            + ".temp/"
            + contract_addr
            + "/out/Leslie_Spread_FuncArgToCalleeVar.csv"
        )
        if os.path.exists(loc) and (os.path.getsize(loc) > 0):
            df = pd.read_csv(loc, header=None, sep='	')
            df.columns = [
                "funcSign",
                "funcArgIndex",
                "funcArg",
                "callStmt",
                "callArgIndex",
            ]
            df = df.loc[
                (df["funcSign"] == funcSign) & (df["funcArgIndex"] == funcArgIndex)
            ]
            for i in range(len(df)):
                # funcarg flows to themselves, must be true
                callArgs.append(
                    {
                        "callStmt": df.iloc[i]["callStmt"],
                        "callArgIndex": df.iloc[i]["funcArgIndex"],
                    }
                )
        return callArgs

    def spread_funcArg_funcRet(self, contract_addr, funcSign, funcArgIndex):
        loc = (
            OUTPUT_PATH
            + ".temp/"
            + contract_addr
            + "/out/Leslie_Spread_FuncArgToFuncRet.csv"
        )
        if os.path.exists(loc) and (os.path.getsize(loc) > 0):
            df = pd.read_csv(loc, header=None, sep='	')
            df.columns = [
                "funcSign",
                "funcArgIndex",
                "funcArg",
                "funcRetIndex",
                "funcRet",
            ]
            df = df.loc[
                (df["funcSign"] == funcSign) & (df["funcArgIndex"] == funcArgIndex)
            ]
            if len(df) != 0:
                return list(df["funcRetIndex"])
            else:
                return []
        else:
            return []

    # from tainted source flows to sink
    def transfer(self, pp):
        next_pps = []
        caller_funcSign = pp["func_sign"]
        parent_contract = self.find_parent(
            pp["contract_addr"], pp["func_sign"], pp["caller"], pp["callsite"]
        )
        try:
            child_contract = self.find_contract(
                pp["caller"],
                pp["callsite"],
                pp["contract_addr"],
                pp["func_sign"],
                pp["caller_funcSign"],
            )
        except:
            return next_pps

        # apply spread transfer for func_ret and call_arg, respectively
        if pp["type"] == "func_ret":
            if parent_contract != None:
                indexes = self.spread_callRet_funcRet(
                    pp["caller"], pp["callsite"], parent_contract.func_sign, pp["index"]
                )
                for index in indexes:
                    next_pps.append(
                        self.new_pp(
                            parent_contract.caller,
                            parent_contract.call_site,
                            parent_contract.logic_addr,
                            parent_contract.func_sign,
                            index,
                            caller_funcSign,
                            "func_ret",
                        )
                    )

            callArgs = self.spread_callRet_CallArg(
                pp["contract_addr"], pp["callsite"], pp["index"]
            )
            for callArg in callArgs:
                (
                    temp_caller,
                    temp_logic_addr,
                    temp_func_sign,
                ) = self.get_external_call_info(
                    callArg["callStmt"], child_contract.external_calls
                )
                next_pps.append(
                    self.new_pp(
                        temp_caller,
                        callArg["callStmt"],
                        temp_logic_addr,
                        temp_func_sign,
                        str(callArg["callArgIndex"]),
                        caller_funcSign,
                        "call_arg",
                    )
                )

        if pp["type"] == "call_arg":
            callArgs = []
            # function arg to call arg and callee var
            callArgs += self.spread_funcArg_callArg(
                pp["contract_addr"], pp["func_sign"], pp["index"]
            )
            callArgs += self.spread_funcArg_callee(
                pp["contract_addr"], pp["func_sign"], pp["index"]
            )

            for callArg in callArgs:
                temp_result = self.get_external_call_info(
                    callArg["callStmt"], child_contract.external_calls
                )
                if temp_result != None:
                    temp_caller, temp_logic_addr, temp_func_sign = temp_result
                else:
                    continue
                next_pps.append(
                    self.new_pp(
                        pp["contract_addr"],
                        callArg["callStmt"],
                        temp_logic_addr,
                        temp_func_sign,
                        str(callArg["callArgIndex"]),
                        caller_funcSign,
                        "call_arg",
                    )
                )

            indexes = self.spread_funcArg_funcRet(
                pp["contract_addr"], pp["func_sign"], pp["index"]
            )
            for index in indexes:
                next_pps.append(
                    self.new_pp(
                        pp["caller"],
                        pp["callsite"],
                        pp["contract_addr"],
                        pp["func_sign"],
                        index,
                        caller_funcSign,
                        "func_ret",
                    )
                )
        return next_pps

    def is_reachable(self, pp1, pp2):
        if self.is_same(pp1, pp2):
            return True
        pending = [pp1]
        while len(pending) > 0:
            temp_pp = pending.pop()
            for pp in self.transfer(temp_pp):
                if self.is_same(pp, pp2):
                    return True
                else:
                    pending.append(pp)
        return False

    def detect(self):
        cross_contract = False
        for key in self.contracts.keys():
            if self.contracts[key].level != 0:
                cross_contract = True

        if not cross_contract:
            return False, self.attack_matrix

        result = False

        # br and dos detection
        if self.intraprocedural_br_analysis():
            self.attack_matrix["br"] = True
            result = True

        if self.intraprocedural_dos_analysis():
            self.attack_matrix["dos"] = True
            result = True

        # so how to define the tainted source
        # !the tainted source should only be from the analyzed contracts (i.e., input contract)
        pps_near_source = self.get_pps_near_source()
        # and how to define the sentive sink
        pps_near_sink, sensitive_callsigs = self.get_pps_near_sink()

        # set call sigs
        self.sensitive_callsigs = sensitive_callsigs

        reachable = False
        reachable_site = {}
        for pp1 in pps_near_source:
            for pp2 in pps_near_sink:
                if self.is_same(pp1, pp2):
                    reachable = True
                    caller = pp2["caller"]
                    caller_funcSign = pp2["caller_funcSign"]
                    reachable_site[pp2["func_sign"]] = {
                        "caller": caller,
                        "caller_callback_funcSign": caller_funcSign,
                    }
                elif self.is_reachable(pp1, pp2):
                    reachable = True
                    caller = pp2["caller"]
                    caller_funcSign = pp2["caller_funcSign"]
                    reachable_site[pp2["func_sign"]] = {
                        "caller": caller,
                        "caller_callback_funcSign": caller_funcSign,
                    }

        victim_callback_info = {}
        attack_reenter_info = {}

        if reachable:
            overlap = list(
                set(sensitive_callsigs).intersection(
                    set(self.external_call_in_func_sigature)
                )
            )
            if len(overlap) > 0:
                for i in overlap:
                    victim_callback_info[i] = []
                    attack_reenter_info[i] = []

                    if i in reachable_site:
                        if reachable_site[i] not in victim_callback_info[i]:
                            victim_callback_info[i].append(reachable_site[i])
                    for key in self.contracts.keys():
                        if (
                            str(self.contracts[key].func_sign) == str(i)
                            and self.contracts[key].level == 0
                        ):
                            externall_calls = self.contracts[key].external_calls
                            for ec in externall_calls:
                                temp_target_address = ec["logic_addr"]
                                temp_funcSign = ec["funcSign"]

                                res = {
                                    'reenter_target': temp_target_address,
                                    'reenter_funcSign': temp_funcSign,
                                }
                                if (
                                    res not in attack_reenter_info[i]
                                    and temp_target_address in self.visited_contracts
                                    and temp_funcSign in self.visited_funcs
                                ):
                                    attack_reenter_info[i].append(res)
                            result = True
                            self.attack_matrix["reentrancy"] = True

        self.victim_callback_info = victim_callback_info
        self.attack_reenter_info = attack_reenter_info
        return result, self.attack_matrix

    def get_reen_info(self):
        return self.victim_callback_info, self.attack_reenter_info

    def get_sig_info(self):
        return self.sensitive_callsigs

    def get_attack_matric(self):
        return self.attack_matrix
