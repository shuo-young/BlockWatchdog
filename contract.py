import logging
import os

import pandas as pd
from web3 import Web3

import global_params

log = logging.getLogger(__name__)


# Data structure of contracts in the tr}
class Contract:

    def __init__(
        self,
        platform,
        logic_addr,
        storage_addr,
        func_sign,
        block_number,
        caller,
        call_site,
        level,
        callArgVals={},
    ):
        self.platform = platform
        self.logic_addr = self.format_addr(logic_addr)
        self.storage_addr = self.format_addr(storage_addr)
        self.func_sign = func_sign
        # the first analyzed contract
        self.origin = False
        if self.func_sign == "":
            self.origin = True
        self.func = []
        # all funcs and func_sigs
        self.func_sign_dict = {}
        self.func_sign_list = []
        # signature of funcs that contain external call
        self.external_call_in_func_sigature = []
        self.block_number = block_number
        self.caller = caller
        self.call_site = call_site
        self.callArgVals = callArgVals
        self.knownArgVals = {}
        self.url = ""
        self.external_calls = []
        self.level = level
        self.createbin = False
        self.storage_space = {}
        # self.env_val = env_val
        logging.info(
            "known function args from the previous call: {}".format(self.callArgVals)
        )
        self.analyze()

    def format_addr(self, addr):
        if len(addr) != 42:
            return "0x" + "0" * (42 - len(addr)) + addr.replace("0x", "")
        else:
            return addr

    def is_createbin(self):
        return self.createbin

    def get_func_sign_list(self):
        return self.func_sign_list

    def get_external_call_in_func_sigature(self):
        return self.external_call_in_func_sigature

    def analyze(self):
        logging.info("analyzing " + self.logic_addr)
        logging.info("caller " + self.caller)
        logging.info("call_site " + self.call_site)
        logging.info("func_sign " + self.func_sign)
        self.set_url()
        self.download_bytecode()
        if os.path.exists(global_params.CONTRACT_PATH + self.logic_addr + ".hex"):
            self.analyze_contract()
            self.set_func()

            self.set_callArgVals()
            self.set_knownArgVals()
            logging.info(
                "call arg vals obtained from the previous contract call {}".format(
                    self.callArgVals
                )
            )
            logging.info(
                "known arg vals in the current contract call {}".format(
                    self.knownArgVals
                )
            )
            if self.origin is True:
                if not self.createbin:
                    # remove key 0x0 from the dict  func_sign_dict
                    del self.func_sign_dict["0x0"]
                for func in self.func_sign_dict.keys():
                    logging.info(
                        "set external calls in function " + self.func_sign_dict[func]
                    )
                    self.set_external_calls(func, self.func_sign_dict[func])
            else:
                self.set_external_calls(self.func, self.func_sign)

    def set_url(self):
        if self.platform == "ETH":
            self.url = "https://eth-mainnet.g.alchemy.com/v2/6t0LpEw9cr0OlGIVTFqs92aOIkfhktMk"  # backup: https://eth-mainnet.g.alchemy.com/v2/6t0LpEw9cr0OlGIVTFqs92aOIkfhktMk
        elif self.platform == "BSC":
            self.url = "https://little-aged-thunder.bsc.quiknode.pro/53b86587d990e1cb9354cd2a01ebb3b16109427f/"
        elif self.platform == "FTM":
            self.url = "https://practical-long-energy.fantom.discover.quiknode.pro/fc97af1ebab40f57ea698b6cf3dd67a2d24cac1a/"
        elif self.platform == "ARB":
            self.url = (
                "https://arb-mainnet.g.alchemy.com/v2/uQXNRP9T7_rg0AB1VZbjClHMf0w7OiCA"
            )
        else:
            self.url = ""
        # w3 = Web3(Web3.HTTPProvider(self.url))
        # self.block_number = w3.eth.get_block_number()

    def download_bytecode(self):
        if self.url == "":
            return
        loc = global_params.CONTRACT_PATH + self.logic_addr + ".hex"
        if os.path.exists(loc):
            with open(loc, "r") as f:
                bin = f.read()
                if bin == "0x":
                    bin_content = (
                        global_params.CONTRACT_PATH
                        + "createbin/"
                        + self.logic_addr
                        + "_createbin.hex"
                    )
                    with open(bin_content, "r") as bf:
                        bin = bf.read()
                    with open(loc, "w") as wf:
                        wf.write(bin[2:])
                    self.createbin = True
                    # self.origin = True
                    # createbin only has constructor
                    self.func_sign = "__function_selector__"
                    self.func_sign_list = ["__function_selector__"]
            return
        else:
            # switch case for http or wss provider
            if self.url.startswith("https"):
                w3 = Web3(Web3.HTTPProvider(self.url))
            else:
                w3 = Web3(Web3.WebsocketProvider(self.url))
            contract_address = Web3.to_checksum_address(self.logic_addr)
            code = str(w3.eth.get_code(contract_address).hex())
            if code != "0x":
                with open(loc, "w") as f:
                    f.write(code[2:])
            # todo: try to analyze the createbin of the contract (load from the firts transaction input)
            # else:

    def analyze_contract(self):
        # use leslie client to analyze the contract
        command = (
            "cd ./gigahorse-toolchain && ./gigahorse.py -C ./clients/leslie.dl "
            + global_params.CONTRACT_DIR
            + "{contract_addr}.hex >/dev/null 2>&1"
        )
        os.system(command.format(contract_addr=self.logic_addr))

    def set_func(self):
        loc = (
            "./gigahorse-toolchain/.temp/"
            + self.logic_addr
            + "/out/Leslie_FunctionSelector.csv"
        )
        if os.path.exists(loc) and (os.path.getsize(loc) > 0):
            df = pd.read_csv(loc, header=None, sep="	")
            df.columns = ["func", "funcSign"]
            # store all funcs and their signatures
            if self.origin is True:
                funcs = []
                func_signs = []
                for func in df["func"]:
                    funcs.append(func)
                for fun_sign in df["funcSign"]:
                    func_signs.append(fun_sign)
                self.func_sign_list = func_signs
                self.func_sign_dict = dict(zip(funcs, func_signs))
            else:  # for intermediate interacted contracts, we only trace targeted functions
                try:
                    self.func = list(df.loc[df["funcSign"] == self.func_sign, "func"])[
                        0
                    ]
                except Exception:
                    try:
                        self.func = list(
                            df.loc[df["funcSign"] == "0x00000000", "func"]
                        )[0]
                    except Exception:
                        None

    # add env var tracer (also known dynamically)
    def set_callArgVals(self):
        # change code to read the known_args from the previous contract call
        # if self.caller != "":
        #     self.callArgVals = self.knownArgVals
        # if self.caller != "":
        #     loc = (
        #         "./gigahorse-toolchain/.temp/"
        #         + self.caller
        #         + "/out/Leslie_ExternalCall_Known_Arg.csv"
        #     )
        #     if os.path.exists(loc) and (os.path.getsize(loc) > 0):
        #         df = pd.read_csv(loc, header=None, sep="	")
        #         df.columns = ["func", "callStmt", "argIndex", "argVal"]
        #         # it is not neccessary to label the func, just focus on the callStmt
        #         df = df.loc[df["callStmt"] == self.call_site]
        #         for i in range(len(df)):
        #             temp_index = int(df.iloc[i]["argIndex"])
        #             temp_callArgVal = df.iloc[i]["argVal"]
        #             self.callArgVals[temp_index] = temp_callArgVal
        #     if self.env_val is not None:
        #         for index in self.env_val.keys():
        #             self.callArgVals[index] = self.env_val[index]
        log.info("====call arg vals {}====".format(self.callArgVals))

    def get_fl_transfer(self):
        loc = (
            global_params.OUTPUT_PATH
            + ".temp/"
            + self.logic_addr
            + "/out/Leslie_FLTransferInLog.csv"
        )
        if os.path.exists(loc) and (os.path.getsize(loc) > 0):
            df = pd.read_csv(loc, header=None, sep="	")
            df.columns = ["logStmt", "recipient", "amount"]
            df = df.loc[df["funcSign"] == self.func_sign]
            return list(df["transferVar"])
        return []

    def get_sensitive_transfer_target(self):
        call = {}
        loc = (
            global_params.OUTPUT_PATH
            + ".temp/"
            + self.logic_addr
            + "/out/Leslie_FLSensitiveCallWithKeyArgIndex.csv"
        )
        if os.path.exists(loc) and (os.path.getsize(loc) > 0):
            df = pd.read_csv(loc, header=None, sep="	")
            df.columns = [
                "callStmt",
                "recipient",
                "recipientIndex",
                "amount",
                "amountIndex",
            ]
            # df = df.loc[df["funcSign"] == self.func_sign]
            for i in range(len(df)):
                if df.iloc[i]["amountIndex"] > 0:
                    call[df.iloc[i]["callStmt"]] = {
                        "cur": int(df.iloc[i]["recipientIndex"])
                    }
                else:
                    call[df.iloc[i]["callStmt"]] = {
                        "arg": int(df.iloc[i]["recipientIndex"])
                    }
        return call

    def set_knownArgVals(self):
        loc = (
            "./gigahorse-toolchain/.temp/"
            + self.logic_addr
            + "/out/Leslie_ExternalCall_Known_Arg.csv"
        )
        if os.path.exists(loc) and (os.path.getsize(loc) > 0):
            df = pd.read_csv(loc, header=None, sep="	")
            df.columns = ["func", "callStmt", "argIndex", "argVal"]
            for i in range(len(df)):
                temp_index = int(df.iloc[i]["argIndex"])
                temp_callArgVal = df.iloc[i]["argVal"]
                temp_stmt = df.iloc[i]["callStmt"]
                if temp_stmt not in self.knownArgVals.keys():
                    self.knownArgVals[temp_stmt] = {}
                self.knownArgVals[temp_stmt][temp_index] = temp_callArgVal
            logging.info(self.knownArgVals)

        # big overhead for rpc request
        if global_params.CALLARG_STORAGETYPE:
            known_storage_env_loc = (
                "./gigahorse-toolchain/.temp/"
                + self.logic_addr
                + "/out/Leslie_ExternalCall_Known_Arg_Storage.csv"
            )
            if os.path.exists(known_storage_env_loc) and (
                os.path.getsize(known_storage_env_loc) > 0
            ):
                df = pd.read_csv(known_storage_env_loc, header=None, sep="	")
                df.columns = ["func", "callStmt", "argIndex", "storageSlot"]
                for i in range(len(df)):
                    temp_index = int(df.iloc[i]["argIndex"])
                    temp_storageSlot = int(df.iloc[i]["storageSlot"], 16)
                    if df.iloc[i]["callStmt"] in self.knownArgVals.keys():
                        self.knownArgVals[df.iloc[i]["callStmt"]][temp_index] = (
                            self.get_storage_content(temp_storageSlot, 0, 19)
                        )
                    else:
                        self.knownArgVals[df.iloc[i]["callStmt"]] = {}
                        self.knownArgVals[df.iloc[i]["callStmt"]][temp_index] = (
                            self.get_storage_content(temp_storageSlot, 0, 19)
                        )

        loc_env = (
            "./gigahorse-toolchain/.temp/"
            + self.logic_addr
            + "/out/Leslie_ExternalCall_Known_Arg_Env.csv"
        )

        if os.path.exists(loc_env) and (os.path.getsize(loc_env) > 0):
            df = pd.read_csv(loc_env, header=None, sep="	")
            df.columns = ["func", "callStmt", "argIndex", "opcode"]
            for i in range(len(df)):
                temp_index = int(df.iloc[i]["argIndex"])
                env_op = df.iloc[i]["opcode"]
                if env_op == "CALLER":
                    temp_callArgVal = self.caller
                elif env_op == "ADDRESS":
                    temp_callArgVal = self.logic_addr
                elif env_op == "ORIGIN":
                    temp_callArgVal = "MSG.SENDER"  # EOA address
                if df.iloc[i]["callStmt"] in self.knownArgVals.keys():
                    self.knownArgVals[df.iloc[i]["callStmt"]][
                        temp_index
                    ] = temp_callArgVal
                else:
                    self.knownArgVals[df.iloc[i]["callStmt"]] = {}
                    self.knownArgVals[df.iloc[i]["callStmt"]][
                        temp_index
                    ] = temp_callArgVal
        # then, set known call arg flow from the function arguments by the callArgs
        loc_spread_rule = (
            "./gigahorse-toolchain/.temp/"
            + self.logic_addr
            + "/out/Leslie_Spread_FuncArgToCallArg.csv"
        )
        if os.path.exists(loc_spread_rule) and (os.path.getsize(loc_spread_rule) > 0):
            df = pd.read_csv(loc_spread_rule, header=None, sep="	")
            df.columns = [
                "funcSign",
                "funcArgIndex",
                "funcArg",
                "callStmt",
                "callArgIndex",
                "callArg",
            ]
            df = df.loc[df["funcSign"] == self.func_sign]
            for i in range(len(df)):
                if df.iloc[i]["funcArgIndex"] in self.callArgVals.keys():
                    if df.iloc[i]["callStmt"] in self.knownArgVals.keys():
                        self.knownArgVals[df.iloc[i]["callStmt"]][
                            df.iloc[i]["callArgIndex"]
                        ] = self.callArgVals[df.iloc[i]["funcArgIndex"]]
                    else:
                        self.knownArgVals[df.iloc[i]["callStmt"]] = {}
                        self.knownArgVals[df.iloc[i]["callStmt"]][
                            df.iloc[i]["callArgIndex"]
                        ] = self.callArgVals[df.iloc[i]["funcArgIndex"]]

        log.info("====known arg vals {}====".format(self.knownArgVals))

    # in some cases, the storage address is not the same as the logic address
    def get_storage_content(self, slot_index, byteLow, byteHigh):
        if self.url.startswith("https"):
            w3 = Web3(Web3.HTTPProvider(self.url))
        else:
            w3 = Web3(Web3.WebsocketProvider(self.url))
        contract_address = w3.to_checksum_address(self.storage_addr)
        storage_content = str(
            w3.eth.get_storage_at(
                contract_address,
                slot_index,
                block_identifier=self.block_number,
            ).hex()
        )
        # print(self.logic_addr)
        # print(slot_index)
        # print(storage_content)
        storage_content = storage_content.replace("0x", "")
        if byteLow == 0:
            contract_addr = "0x" + storage_content[-(byteHigh + 1) * 2 :]
        else:
            contract_addr = "0x" + storage_content[-(byteHigh + 1) * 2 : -byteLow * 2]
        return contract_addr

    def set_external_calls(self, func, func_sign):
        loc_external_call = (
            "./gigahorse-toolchain/.temp/"
            + self.logic_addr
            + "/out/Leslie_ExternalCallInfo.csv"
        )
        if os.path.exists(loc_external_call) and (
            os.path.getsize(loc_external_call) > 0
        ):
            df_external_call = pd.read_csv(loc_external_call, header=None, sep="	")
            df_external_call.columns = [
                "func",
                "callStmt",
                "callOp",
                "calleeVar",
                "numArg",
                "numRet",
            ]
            try:
                df_external_call = df_external_call.loc[
                    df_external_call["func"] == func
                ]
            except Exception:
                pass
        else:
            df_external_call = pd.DataFrame()

        if self.origin is True:
            for i in range(len(df_external_call)):
                func = df_external_call.iloc[i]["func"]
                # find functions with external calls
                if self.func_sign_dict[func] not in self.external_call_in_func_sigature:
                    self.external_call_in_func_sigature.append(
                        self.func_sign_dict[func]
                    )

        # for callee identification
        loc_callee_const = (
            "./gigahorse-toolchain/.temp/"
            + self.logic_addr
            + "/out/Leslie_ExternalCall_Callee_ConstType.csv"
        )
        if os.path.exists(loc_callee_const) and (os.path.getsize(loc_callee_const) > 0):
            df_callee_const = pd.read_csv(loc_callee_const, header=None, sep="	")
            df_callee_const.columns = ["func", "callStmt", "callee"]
        else:
            df_callee_const = pd.DataFrame()

        loc_callee_storage = (
            "./gigahorse-toolchain/.temp/"
            + self.logic_addr
            + "/out/Leslie_ExternalCall_Callee_StorageType.csv"
        )
        if os.path.exists(loc_callee_storage) and (
            os.path.getsize(loc_callee_storage) > 0
        ):
            df_callee_storage = pd.read_csv(loc_callee_storage, header=None, sep="	")
            df_callee_storage.columns = [
                "func",
                "callStmt",
                "storageSlot",
                "byteLow",
                "byteHigh",
            ]
        else:
            df_callee_storage = pd.DataFrame()

        loc_callee_storage_proxy = (
            "./gigahorse-toolchain/.temp/"
            + self.logic_addr
            + "/out/Leslie_ExternalCall_Callee_StorageType_ForProxy.csv"
        )
        if os.path.exists(loc_callee_storage_proxy) and (
            os.path.getsize(loc_callee_storage_proxy) > 0
        ):
            df_callee_storage_proxy = pd.read_csv(
                loc_callee_storage_proxy, header=None, sep="	"
            )
            df_callee_storage_proxy.columns = ["func", "callStmt", "storageSlot"]
        else:
            df_callee_storage_proxy = pd.DataFrame()

        loc_callee_env = (
            "./gigahorse-toolchain/.temp/"
            + self.logic_addr
            + "/out/Leslie_ExternalCall_Callee_EnvType.csv"
        )
        if os.path.exists(loc_callee_env) and (os.path.getsize(loc_callee_env) > 0):
            df_callee_env = pd.read_csv(loc_callee_env, header=None, sep="	")
            df_callee_env.columns = ["func", "callStmt", "opcode"]
        else:
            df_callee_env = pd.DataFrame()

        # for target function signature identification
        loc_fs_const = (
            "./gigahorse-toolchain/.temp/"
            + self.logic_addr
            + "/out/Leslie_ExternalCall_FuncSign_ConstType.csv"
        )
        if os.path.exists(loc_fs_const) and (os.path.getsize(loc_fs_const) > 0):
            df_fs_const = pd.read_csv(loc_fs_const, header=None, sep="	")
            df_fs_const.columns = ["func", "callStmt", "funcSign"]
        else:
            df_fs_const = pd.DataFrame()

        loc_fs_proxy = (
            "./gigahorse-toolchain/.temp/"
            + self.logic_addr
            + "/out/Leslie_ExternalCall_FuncSign_ProxyType.csv"
        )
        if os.path.exists(loc_fs_proxy) and (os.path.getsize(loc_fs_proxy) > 0):
            df_fs_proxy = pd.read_csv(loc_fs_proxy, header=None, sep="	")
            df_fs_proxy.columns = ["func", "callStmt"]
        else:
            df_fs_proxy = pd.DataFrame()

        loc_callee_funarg = (
            "./gigahorse-toolchain/.temp/"
            + self.logic_addr
            + "/out/Leslie_ExternalCall_Callee_FuncArgType.csv"
        )
        if os.path.exists(loc_callee_funarg) and (
            os.path.getsize(loc_callee_funarg) > 0
        ):
            df_callee_funarg = pd.read_csv(loc_callee_funarg, header=None, sep="	")
            df_callee_funarg.columns = ["func", "callStmt", "pubFun", "argIndex"]
        else:
            df_callee_funarg = pd.DataFrame()

        loc_transfer_target_funarg = (
            "./gigahorse-toolchain/.temp/"
            + self.logic_addr
            + "/out/Leslie_ExternalCall_TransferTarget_FuncArgType.csv"
        )
        if os.path.exists(loc_transfer_target_funarg) and (
            os.path.getsize(loc_transfer_target_funarg) > 0
        ):
            df_transfer_target_funarg = pd.read_csv(
                loc_transfer_target_funarg, header=None, sep="	"
            )
            df_transfer_target_funarg.columns = [
                "func",
                "callStmt",
                "pubFun",
                "argIndex",
            ]

        transfer_target_call = self.get_sensitive_transfer_target()
        log.info("transfer target call")
        log.info(transfer_target_call)

        # for every call point in the contract, try to find its call target
        for i in range(len(df_external_call)):
            call_stmt = df_external_call.iloc[i]["callStmt"]
            # find target callee's logic address
            external_call = {
                "logic_addr": "",  # target contract address
                "storage_addr": "",  # target contract storage address
                "funcSign": "",  # target function signature (after)
                "caller": "",  # caller address (msg.sender for the origin) (current)
                "call_site": "",  # external call site (current)
                "known_args": {},  # record all known args from env and storage, etc.
                "transfer_target": "",
            }
            if call_stmt in transfer_target_call.keys():
                if call_stmt in self.knownArgVals.keys():
                    # print("====has known args in the call stmt ", call_stmt, "====")
                    # print(self.knownArgVals[call_stmt])
                    # print("====transfer target call====")
                    # print(transfer_target_call)
                    # current env vars
                    if "cur" in transfer_target_call[call_stmt].keys():
                        if (
                            transfer_target_call[call_stmt]["cur"]
                            in self.knownArgVals[call_stmt].keys()
                        ):
                            external_call["transfer_target"] = self.knownArgVals[
                                call_stmt
                            ][transfer_target_call[call_stmt]["cur"]]
                            log.info("====transfer target====")
                            log.info(external_call["transfer_target"])
                        # print("====transfer target====")
                        # print(external_call["transfer_target"])
                else:  # recover from args
                    if "arg" in transfer_target_call[call_stmt].keys():
                        if (
                            transfer_target_call[call_stmt]["arg"]
                            in self.callArgVals.keys()
                        ):
                            external_call["transfer_target"] = self.callArgVals[
                                transfer_target_call[call_stmt]["arg"]
                            ]
                            log.info("====transfer target====")
                            log.info(external_call["transfer_target"])
                        # print("====transfer target====")
                        # print(external_call["transfer_target"])

            if len(df_callee_const) != 0:
                df_temp = df_callee_const.loc[df_callee_const["callStmt"] == call_stmt]
                if len(df_temp) > 0:
                    external_call["logic_addr"] = list(df_temp["callee"])[0].replace(
                        "000000000000000000000000", ""
                    )

            if len(df_callee_storage) != 0:
                df_temp = df_callee_storage.loc[
                    df_callee_storage["callStmt"] == call_stmt
                ]
                if len(df_temp) > 0:
                    external_call["logic_addr"] = self.get_storage_content(
                        list(df_temp["storageSlot"])[0],
                        int(list(df_temp["byteLow"])[0]),
                        int(list(df_temp["byteHigh"])[0]),
                    )

            if len(df_callee_storage_proxy) != 0:
                df_temp = df_callee_storage_proxy.loc[
                    df_callee_storage_proxy["callStmt"] == call_stmt
                ]
                if len(df_temp) > 0:
                    external_call["logic_addr"] = self.get_storage_content(
                        list(df_temp["storageSlot"])[0], 0, 19
                    )
            if len(df_callee_env) != 0:
                df_temp = df_callee_env.loc[df_callee_env["callStmt"] == call_stmt]
                if len(df_temp) > 0:
                    env_op = list(df_temp["opcode"])[0]
                    if env_op == "CALLER":
                        external_call["logic_addr"] = self.caller
                    elif env_op == "ADDRESS":
                        external_call["logic_addr"] = self.logic_addr
                    elif env_op == "ORIGIN":
                        external_call["logic_addr"] = "MSG.SENDER"

            # find callee got from the func arg (called by caller), and try to recover the know args
            if len(df_callee_funarg) != 0:
                df_temp = df_callee_funarg.loc[
                    df_callee_funarg["callStmt"] == call_stmt
                ]
                if len(df_temp) > 0:
                    # find the function that use the itself's public func args
                    for j in range(len(df_temp)):
                        if list(df_temp["func"])[j] == list(df_temp["pubFun"])[j]:
                            temp_index = int(list(df_temp["argIndex"])[j])
                            if temp_index in self.callArgVals.keys():
                                external_call["logic_addr"] = self.callArgVals[
                                    temp_index
                                ]
                                logging.info(
                                    "known target vals: {}".format(
                                        external_call["logic_addr"]
                                    )
                                )

            # record all args (const address, constants, and other env vars (e.g., msg.sender, address(this)))
            if call_stmt in self.knownArgVals.keys():
                external_call["known_args"] = self.knownArgVals[call_stmt]

            # to differentiate the delegatecall and normal call
            if df_external_call.iloc[i]["callOp"] == "DELEGATECALL":
                # the storage addr is still the current addr
                external_call["storage_addr"] = self.logic_addr
                external_call["caller"] = self.caller
                external_call["call_site"] = self.call_site
                external_call["known_args"] = (
                    self.callArgVals
                )  # propogate the function arguments
            else:
                external_call["storage_addr"] = external_call["logic_addr"]
                external_call["caller"] = self.logic_addr
                external_call["call_site"] = call_stmt

            # label the function signature
            if len(df_fs_const) != 0:
                df_temp = df_fs_const.loc[df_fs_const["callStmt"] == call_stmt]
                if len(df_temp) > 0:
                    external_call["funcSign"] = list(df_temp["funcSign"])[0][:10]

            if len(df_fs_proxy) != 0:
                df_temp = df_fs_proxy.loc[df_fs_proxy["callStmt"] == call_stmt]
                if len(df_temp) > 0:
                    external_call["funcSign"] = func_sign
            # print(external_call)
            self.external_calls.append(external_call)
            # if external_call["funcSign"] == "0xa9059cbb":
            #     print("transfer call identified")
            log.info("====external call {}".format(external_call))
