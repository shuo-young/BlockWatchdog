import logging
import os

from flow.token_flow import TokenFlowAnalysis
import global_params
import pandas as pd

log = logging.getLogger(__name__)


# find feasible path of flow from the tainted var to sensitive var
# generalization
# we induce two flows, the first one is the attacker trace, the external call target manipulated by the very beginning contract
# the second is the vulnerable trace which signifies the unhealthy dependent relationship
# the critical thing is these two trace converge at a very delicate program point, like transfer. For example, the floashloan attacker manipulated the transfer target while the transfer amount is be attacked too.

# all these tracers are augmented by the env tracer, which recover the context informantion in the call chain.
# also, there is a token tracer to record the token flow information during the call
# so on


class FlowAnalysis:

    def __init__(
        self,
        input_contract,
        contracts,
    ):
        self.contracts = contracts
        self.input_contract = input_contract
        self.token_flow_analysis = TokenFlowAnalysis(input_contract, contracts)
        self.token_flow_analysis.set_token_flows()

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
        # find the contract address that the current program point executes (with the highest level)
        addr = self.find_executed_pp(caller, callsite, contract_addr, func_sign)
        return {
            "caller": caller,
            "callsite": callsite,
            "contract_addr": addr,
            "func_sign": func_sign,
            "index": index,
            "caller_funcSign": caller_funcSign,
            "type": type,
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
            + "_"
            + pp1["caller_funcSign"]
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
            + "_"
            + pp2["caller_funcSign"]
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

    def get_external_call_known_arg_info(self, call_site, external_calls):
        for external_call in external_calls:
            if external_call["call_site"] == call_site:
                log.info(external_call["known_args"])
                return {call_site: external_call["known_args"]}  # {index: value}
        return

    def intraprocedural_fla_analysis(self):
        res = []
        for key in self.contracts.keys():
            temp_address = key.split("_")[2]
            temp_funcSign = key.split("_")[3]
            loc = (
                "./gigahorse-toolchain/.temp/"
                + temp_address
                + "/out/Leslie_FLTaintedVarToSensitiveVar.csv"
            )

            if os.path.exists(loc) and (os.path.getsize(loc) > 0):
                df = pd.read_csv(loc, header=None, sep="	")
                df.columns = ["funcSign", "taintedVar", "sensitiveVar"]
                df = df.loc[df["funcSign"] == temp_funcSign]
                if len(df) != 0:
                    log.info(key)
                    print(key)
                    print(temp_address)
                    # not the input contract which is under test (assumed attacker)
                    if (
                        temp_address != self.input_contract
                        and temp_funcSign != "0x22c0d9f"
                    ):
                        # tighter rule: the transfer target should be the input contract while the transfer amount is tainted\
                        for token_flow in self.token_flow_analysis.token_flows:
                            if (
                                token_flow["to"] == self.input_contract
                                and token_flow["from"] == temp_address
                                and token_flow["address"] != ""
                            ):  # and the amount is tainted
                                res.append(key)
                                print(
                                    "found flash loan vulnerability in contract "
                                    + temp_address
                                    + ", which is targeted by the attacker contract "
                                    + self.input_contract
                                )
                    # return True
        if len(res) > 0:
            return True
        return False

    def tainted_env_call_arg(self):
        for key in self.contracts.keys():
            if self.contracts[key].level == 0:
                temp_address = key.split("_")[2]
                temp_funcSign = key.split("_")[3]
                loc = (
                    global_params.OUTPUT_PATH
                    + ".temp/"
                    + temp_address
                    + "/out/Leslie_EnvVarFlowsToTaintedVar.csv"
                )
                if os.path.exists(loc) and (os.path.getsize(loc) > 0):
                    df = pd.read_csv(loc, header=None, sep="	")
                    df.columns = ["funcSign", "envVar", "taintedVar"]
                    # it is not neccessary to label the func, just focus on the callStmt
                    df = df.loc[df["funcSign"] == temp_funcSign]
                    if len(df) != 0:
                        return True
        return False

    # source (actively spread the taint)
    def get_func_rets_flow_from_sources(self, contract_addr, func_sign):
        loc = (
            global_params.OUTPUT_PATH
            + ".temp/"
            + contract_addr
            + "/out/Leslie_TaintedFuncRet.csv"
        )
        if os.path.exists(loc) and (os.path.getsize(loc) > 0):
            df = pd.read_csv(loc, header=None, sep="	")
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
        loc = (
            global_params.OUTPUT_PATH
            + ".temp/"
            + contract_addr
            + "/out/Leslie_TaintedCallArg.csv"
        )
        if os.path.exists(loc) and (os.path.getsize(loc) > 0):
            df = pd.read_csv(loc, header=None, sep="	")
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

    def get_fl_tainted_call_args(self, contract_addr, func_sign):
        call_args = []
        loc = (
            global_params.OUTPUT_PATH
            + ".temp/"
            + contract_addr
            + "/out/Leslie_FLTaintedCallArg.csv"
        )
        if os.path.exists(loc) and (os.path.getsize(loc) > 0):
            df = pd.read_csv(loc, header=None, sep="	")
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

    def get_fl_tainted_ret(self, contract_addr, func_sign):
        rets = []
        loc = (
            global_params.OUTPUT_PATH
            + ".temp/"
            + contract_addr
            + "/out/Leslie_FLTaintedFuncRet.csv"
        )
        if os.path.exists(loc) and (os.path.getsize(loc) > 0):
            df = pd.read_csv(loc, header=None, sep="	")
            df.columns = ["funcSign", "retIndex", "ret"]
            df = df.loc[df["funcSign"] == func_sign]
            for i in range(len(df)):
                rets.append(df.iloc[i]["retIndex"])
        return rets

    # trace vulnerable flashloan-related flow
    def get_pps_near_fl_source(self):
        pps_near_source = []
        for key in self.contracts.keys():
            temp_caller = key.split("_")[0]
            temp_callsite = key.split("_")[1]
            temp_address = key.split("_")[2]
            temp_funcSign = key.split("_")[3]

            # from tainted var to the function return
            temp_indexes = self.get_fl_tainted_ret(temp_address, temp_funcSign)
            if len(temp_indexes) > 0:
                for temp_index in temp_indexes:
                    pps_near_source.append(
                        self.new_pp(
                            temp_caller,
                            temp_callsite,
                            temp_address,
                            temp_funcSign,
                            temp_index,
                            self.contracts[key].func_sign,
                            "func_ret",
                        )
                    )
                    # log.info("found tainted ret in contract: " + temp_address)

            temp_call_args = self.get_fl_tainted_call_args(temp_address, temp_funcSign)
            if len(temp_call_args) > 0:
                for temp_call_arg in temp_call_args:
                    (
                        temp_external_call_caller,
                        temp_external_call_logic_addr,
                        temp_external_call_func_sign,
                    ) = self.get_external_call_info(
                        temp_call_arg["callStmt"], self.contracts[key].external_calls
                    )
                    pps_near_source.append(
                        self.new_pp(
                            temp_external_call_caller,
                            temp_call_arg["callStmt"],
                            temp_external_call_logic_addr,
                            temp_external_call_func_sign,
                            temp_call_arg["callArgIndex"],
                            self.contracts[key].func_sign,
                            "call_arg",
                        )
                    )
                    # log.info("found tainted call arg in contract: " + temp_address)
        log.info(pps_near_source)
        return pps_near_source

    # trace manipulated control flow
    def get_pps_near_source(self):
        pps_near_source = []
        for key in self.contracts.keys():
            temp_caller = key.split("_")[0]
            temp_callsite = key.split("_")[1]
            temp_address = key.split("_")[2]
            temp_funcSign = key.split("_")[3]

            # only mark the analyzed contract's source
            if self.contracts[key].level == 0:
                # get the caller function of the main contract (attack-initiate contract)
                temp_caller_funcSign = self.contracts[key].func_sign

                # get the taint source: function arguments of the function
                temp_call_args = self.get_call_args_flow_from_sources(
                    temp_address, temp_caller_funcSign
                )
                # log.info(temp_call_args)
                if len(temp_call_args) > 0:
                    # get details of the external call
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
                            # should identify several info:
                            # (1) caller initiates this possible attack call
                            # (2) call arguments of this call
                            # (3) callee address
                            # (4) callee function signature
                            # (5) call argument index
                            # (6) function that this call lies in
                            # (7) the taint type (for extension)
                            # summary: caller and caller_funcSign are from the current contract, other denotes the callee
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

        log.info(pps_near_source)
        return pps_near_source

    def fl_get_callsites_flow_to_sink(self, contract_addr, func_sign):
        callsites = []
        loc = (
            global_params.OUTPUT_PATH
            + ".temp/"
            + contract_addr
            + "/out/Leslie_FLCallRetToSensitiveVar.csv"
        )
        if os.path.exists(loc) and (os.path.getsize(loc) > 0):
            df = pd.read_csv(loc, header=None, sep="	")
            df.columns = [
                "funcSign",
                "callStmt",
                "callRetVar",
                "callRetIndex",
                "sensitiveVar",
            ]
            df = df.loc[df["funcSign"] == func_sign]
            for i in range(len(df)):
                callsites.append(
                    {
                        "callStmt": df.iloc[i]["callStmt"],
                        "callRetIndex": df.iloc[i]["callRetIndex"],
                    }
                )
        return callsites

    def get_callsites_flow_to_sink(self, contract_addr, func_sign):
        callsites = []
        sensitive_callsigs = []
        loc = (
            global_params.OUTPUT_PATH
            + ".temp/"
            + contract_addr
            + "/out/Leslie_CallRetToSensitiveVar.csv"
        )
        if os.path.exists(loc) and (os.path.getsize(loc) > 0):
            df = pd.read_csv(loc, header=None, sep="	")
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
            global_params.OUTPUT_PATH
            + ".temp/"
            + contract_addr
            + "/out/Leslie_FuncArgToSensitiveVar.csv"
        )
        if os.path.exists(loc) and (os.path.getsize(loc) > 0):
            df = pd.read_csv(loc, header=None, sep="	")
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

    # vulnerable sink
    def get_pps_near_fl_sink(self):
        pps_near_sink = []
        known_args = {}
        for key in self.contracts.keys():
            temp_caller = key.split("_")[0]
            temp_callsite = key.split("_")[1]
            temp_address = key.split("_")[2]
            temp_funcSign = key.split("_")[3]
            # the function that sink site lies in
            temp_caller_funcSign = key.split("_")[4]
            # log.info(temp_caller_funcSign)
            # get the taint sink: function arguments of the call arg to callee address
            temp_call_args = self.fl_get_callsites_flow_to_sink(
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
                            temp_call_arg["callRetIndex"],
                            # bug fixed
                            self.contracts[key].func_sign,
                            "func_ret",
                        )
                    )
                    # add a sink as the transfer target
                    # target = self.get_sensitive_call_from_call_ret(
                    #     temp_call_arg["callStmt"], temp_external_call_caller
                    # )
                    # known_args[temp_call_arg["callStmt"]] = (
                    #     self.get_external_call_known_arg_info(
                    #         temp_call_arg["callStmt"],
                    #         self.contracts[key].external_calls,
                    #     )[temp_call_arg["callStmt"]]
                    # )

                # log.info("====sink====")
                # notice: the 'caller_funcsign' is the function that call the victim to call the 'funcsign' in the attack contract
        log.info(pps_near_sink)
        # get the functions called by victim (possible)
        return pps_near_sink

    def get_pps_near_sink(self):
        pps_near_sink = []
        sensitive_callsigs = []

        for key in self.contracts.keys():
            temp_caller = key.split("_")[0]
            temp_callsite = key.split("_")[1]
            temp_address = key.split("_")[2]
            temp_funcSign = key.split("_")[3]
            # the function that sink site lies in
            temp_caller_funcSign = key.split("_")[4]
            # log.info(temp_caller_funcSign)
            # get the taint sink: function arguments of the call arg to callee address
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
                            # bug fixed
                            self.contracts[key].func_sign,
                            "call_arg",
                        )
                    )
                # log.info("====sink====")
                # notice: the 'caller_funcsign' is the function that call the victim to call the 'funcsign' in the attack contract
                # log.info(pps_near_sink)
            # get the functions called by victim (possible)
            for i in sigs_funcarg:
                sensitive_callsigs.append(i)
        return pps_near_sink, sensitive_callsigs

    # spread: only functions as variable pass and transfer
    def spread_callRet_funcRet(self, contract_addr, call_stmt, func_sign, ret_index):
        loc = (
            global_params.OUTPUT_PATH
            + ".temp/"
            + contract_addr
            + "/out/Leslie_Spread_CallRetToFuncRet.csv"
        )
        if os.path.exists(loc) and (os.path.getsize(loc) > 0):
            df = pd.read_csv(loc, header=None, sep="	")
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
            global_params.OUTPUT_PATH
            + ".temp/"
            + contract_addr
            + "/out/Leslie_Spread_CallRetToCallArg.csv"
        )
        if os.path.exists(loc) and (os.path.getsize(loc) > 0):
            df = pd.read_csv(loc, header=None, sep="	")
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
            global_params.OUTPUT_PATH
            + ".temp/"
            + contract_addr
            + "/out/Leslie_Spread_FuncArgToCallArg.csv"
        )
        if os.path.exists(loc) and (os.path.getsize(loc) > 0):
            df = pd.read_csv(loc, header=None, sep="	")
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
            global_params.OUTPUT_PATH
            + ".temp/"
            + contract_addr
            + "/out/Leslie_Spread_FuncArgToCalleeVar.csv"
        )
        if os.path.exists(loc) and (os.path.getsize(loc) > 0):
            df = pd.read_csv(loc, header=None, sep="	")
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
            global_params.OUTPUT_PATH
            + ".temp/"
            + contract_addr
            + "/out/Leslie_Spread_FuncArgToFuncRet.csv"
        )
        if os.path.exists(loc) and (os.path.getsize(loc) > 0):
            df = pd.read_csv(loc, header=None, sep="	")
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
        # log.info(pp)
        next_pps = []
        # log.info(pp["caller_funcSign"])
        parent_contract = self.find_parent(
            pp["contract_addr"], pp["func_sign"], pp["caller"], pp["callsite"]
        )
        # log.info(parent_contract.logic_addr)
        # log.info(parent_contract.caller)
        # log.info(parent_contract.func_sign)
        try:
            child_contract = self.find_contract(
                pp["caller"],
                pp["callsite"],
                pp["contract_addr"],
                pp["func_sign"],
                pp["caller_funcSign"],
            )
            # log.info(child_contract.logic_addr)
            # log.info(child_contract.caller)
            # log.info(child_contract.func_sign)
        except Exception:
            return next_pps

        # apply spread transfer for func_ret and call_arg, respectively
        if pp["type"] == "func_ret":
            if parent_contract is not None:
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
                            pp["caller_funcSign"],
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
                        # temp func sign is the called function that lies in the attacker contract
                        temp_func_sign,
                        callArg["callArgIndex"],
                        # pp[func_sign] is the function that calls back to attacker contract
                        pp["func_sign"],
                        "call_arg",
                    )
                )
                # log.info(next_pps)

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
                # log.info(temp_result)
                if temp_result is not None:
                    temp_caller, temp_logic_addr, temp_func_sign = temp_result
                else:
                    continue
                next_pps.append(
                    self.new_pp(
                        pp["contract_addr"],
                        callArg["callStmt"],
                        temp_logic_addr,
                        temp_func_sign,
                        callArg["callArgIndex"],
                        pp["func_sign"],
                        "call_arg",
                    )
                )
                # log.info(next_pps)
            # the return index of the function call
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
                        pp["caller_funcSign"],
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
                    # log.info(pp)
                    # log.info(pp2)
                    return True
                else:
                    pending.append(pp)
        return False

    def find_potential_price_manipulation_attack(self, source, sink):
        reachable = False
        is_pm_attack = False
        for pp1 in source:
            for pp2 in sink:
                if self.is_same(pp1, pp2):
                    reachable = True
                    print(pp1)
                    print(pp2)
                    is_pm_attack = True
                elif self.is_reachable(pp1, pp2):
                    reachable = True
                    print(pp1)
                    print(pp2)
                    is_pm_attack = True
        if is_pm_attack:
            log.info("price manipulation")
        return reachable
