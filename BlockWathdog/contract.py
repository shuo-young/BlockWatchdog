import pandas as pd
import os
from datetime import datetime
from web3 import Web3
from global_params import *


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
    ):
        self.platform = platform
        self.logic_addr = self.format_addr(logic_addr)
        self.storage_addr = self.format_addr(storage_addr)
        self.func_sign = func_sign
        # the first analyzed contract
        self.origin = False
        if self.func_sign == "":
            self.origin = True
        self.func = ""
        # all funcs and func_sigs
        self.func_sign_dict = {}
        self.func_sign_list = []
        # signature of funcs that contain external call
        self.external_call_in_func_sigature = []
        self.block_number = block_number
        self.caller = caller
        self.call_site = call_site
        self.callArgVals = {}
        self.url = ""
        self.external_calls = []
        self.level = level
        self.createbin = False
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
        self.set_url()
        self.download_bytecode()
        if os.path.exists(CONTRACT_PATH + self.logic_addr + ".hex"):
            self.analyze_contract()
            self.set_func()
            self.set_callArgVals()
            if self.origin == True:
                for func in self.func_sign_dict.keys():
                    self.set_external_calls(func, self.func_sign_dict[func])
            else:
                self.set_external_calls(self.func, self.func_sign)

    def set_url(self):
        if self.platform == "ETH":
            self.url = (
                "https://eth-mainnet.g.alchemy.com/v2/6t0LpEw9cr0OlGIVTFqs92aOIkfhktMk"
            )
        else:
            self.url = ""

    def download_bytecode(self):
        if self.url == "":
            return
        loc = CONTRACT_PATH + self.logic_addr + ".hex"
        if os.path.exists(loc):
            with open(loc, "r") as f:
                bin = f.read()
                if bin == "0x":
                    bin_content = (
                        CONTRACT_PATH
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
            w3 = Web3(Web3.HTTPProvider(self.url))
            contract_address = Web3.to_checksum_address(self.logic_addr)
            code = str(w3.eth.get_code(contract_address).hex())
            if code != "0x":
                with open(loc, "w") as f:
                    f.write(code[2:])
            # try to analyze the createbin of the contract (load from the firts transaction input)
            # else:

    def analyze_contract(self):
        # use leslie client to analyze the contract
        command = (
            "cd ./gigahorse-toolchain && ./gigahorse.py -C ./clients/leslie.dl "
            + CONTRACT_DIR
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
            df = pd.read_csv(loc, header=None, sep='	')
            df.columns = ["func", "funcSign"]
            # store all funcs and their signatures
            if self.origin == True:
                funcs = []
                func_signs = []
                for func in df["func"]:
                    funcs.append(func)
                for fun_sign in df["funcSign"]:
                    func_signs.append(fun_sign)
                self.func_sign_list = func_signs
                self.func_sign_dict = dict(zip(funcs, func_signs))
            else:
                try:
                    self.func = list(df.loc[df["funcSign"] == self.func_sign, "func"])[
                        0
                    ]
                except:
                    try:
                        self.func = list(
                            df.loc[df["funcSign"] == "0x00000000", "func"]
                        )[0]
                    except:
                        None

    def set_callArgVals(self):
        if self.caller != "":
            loc = (
                "./gigahorse-toolchain/.temp/"
                + self.caller
                + "/out/Leslie_ExternalCall_Known_Arg.csv"
            )
            if os.path.exists(loc) and (os.path.getsize(loc) > 0):
                df = pd.read_csv(loc, header=None, sep='	')
                df.columns = ["func", "callStmt", "argIndex", "argVal"]
                # it is not neccessary to label the func, just focus on the callStmt
                df = df.loc[df["callStmt"] == self.call_site]
                for i in range(len(df)):
                    temp_index = int(df.iloc[i]["argIndex"])
                    temp_callArgVal = df.iloc[i]["argVal"]
                    self.callArgVals[temp_index] = temp_callArgVal

    # in some cases, the storage address is not the same as the logic address
    def get_storage_content(self, slot_index, byteLow, byteHigh):
        w3 = Web3(Web3.HTTPProvider(self.url))
        contract_address = Web3.to_checksum_address(self.storage_addr)
        storage_content = str(
            w3.eth.get_storage_at(contract_address, slot_index, self.block_number).hex()
        )
        storage_content = storage_content.replace("0x", "")
        if byteLow == 0:
            contract_addr = "0x" + storage_content[-(byteHigh + 1) * 2 :]
        else:
            contract_addr = "0x" + storage_content[-(byteHigh + 1) * 2 : -byteLow * 2]
        return contract_addr

    def set_external_calls(self, func, func_sign):
        loc1 = (
            "./gigahorse-toolchain/.temp/"
            + self.logic_addr
            + "/out/Leslie_ExternalCallInfo.csv"
        )
        if os.path.exists(loc1) and (os.path.getsize(loc1) > 0):
            df1 = pd.read_csv(loc1, header=None, sep='	')
            df1.columns = [
                "func",
                "callStmt",
                "callOp",
                "calleeVar",
                "numArg",
                "numRet",
            ]
            df1 = df1.loc[df1["func"] == func]
        else:
            df1 = pd.DataFrame()

        if self.origin == True:
            for i in range(len(df1)):
                func = df1.iloc[i]["func"]
                if self.func_sign_dict[func] not in self.external_call_in_func_sigature:
                    self.external_call_in_func_sigature.append(
                        self.func_sign_dict[func]
                    )

        # for callee identification
        loc2 = (
            "./gigahorse-toolchain/.temp/"
            + self.logic_addr
            + "/out/Leslie_ExternalCall_Callee_ConstType.csv"
        )
        if os.path.exists(loc2) and (os.path.getsize(loc2) > 0):
            df2 = pd.read_csv(loc2, header=None, sep='	')
            df2.columns = ["func", "callStmt", "callee"]
        else:
            df2 = pd.DataFrame()

        loc3 = (
            "./gigahorse-toolchain/.temp/"
            + self.logic_addr
            + "/out/Leslie_ExternalCall_Callee_StorageType.csv"
        )
        if os.path.exists(loc3) and (os.path.getsize(loc3) > 0):
            df3 = pd.read_csv(loc3, header=None, sep='	')
            df3.columns = ["func", "callStmt", "storageSlot", "byteLow", "byteHigh"]
        else:
            df3 = pd.DataFrame()

        loc6 = (
            "./gigahorse-toolchain/.temp/"
            + self.logic_addr
            + "/out/Leslie_ExternalCall_Callee_StorageType_ForProxy.csv"
        )
        if os.path.exists(loc6) and (os.path.getsize(loc6) > 0):
            df6 = pd.read_csv(loc6, header=None, sep='	')
            df6.columns = ["func", "callStmt", "storageSlot"]
        else:
            df6 = pd.DataFrame()

        # for target function signature identification
        loc4 = (
            "./gigahorse-toolchain/.temp/"
            + self.logic_addr
            + "/out/Leslie_ExternalCall_FuncSign_ConstType.csv"
        )
        if os.path.exists(loc4) and (os.path.getsize(loc4) > 0):
            df4 = pd.read_csv(loc4, header=None, sep='	')
            df4.columns = ["func", "callStmt", "funcSign"]
        else:
            df4 = pd.DataFrame()

        loc5 = (
            "./gigahorse-toolchain/.temp/"
            + self.logic_addr
            + "/out/Leslie_ExternalCall_FuncSign_ProxyType.csv"
        )
        if os.path.exists(loc5) and (os.path.getsize(loc5) > 0):
            df5 = pd.read_csv(loc5, header=None, sep='	')
            df5.columns = ["func", "callStmt"]
        else:
            df5 = pd.DataFrame()

        loc7 = (
            "./gigahorse-toolchain/.temp/"
            + self.logic_addr
            + "/out/Leslie_ExternalCall_Callee_FuncArgType.csv"
        )
        if os.path.exists(loc7) and (os.path.getsize(loc7) > 0):
            df7 = pd.read_csv(loc7, header=None, sep='	')
            df7.columns = ["func", "callStmt", "pubFun", "argIndex"]
        else:
            df7 = pd.DataFrame()

        # for every call point in the contract, try to find its call target
        for i in range(len(df1)):
            call_stmt = df1.iloc[i]["callStmt"]
            # find target callee's logic address
            external_call = {
                "logic_addr": "",
                "storage_addr": "",
                "funcSign": "",
                "caller": "",
                "call_site": "",
            }

            if len(df2) != 0:
                df_temp = df2.loc[df2["callStmt"] == call_stmt]
                if len(df_temp) > 0:
                    external_call["logic_addr"] = list(df_temp["callee"])[0].replace(
                        "000000000000000000000000", ""
                    )

            if len(df3) != 0:
                df_temp = df3.loc[df3["callStmt"] == call_stmt]
                if len(df_temp) > 0:
                    external_call["logic_addr"] = self.get_storage_content(
                        list(df_temp["storageSlot"])[0],
                        list(df_temp["byteLow"])[0],
                        list(df_temp["byteHigh"])[0],
                    )

            if len(df6) != 0:
                df_temp = df6.loc[df6["callStmt"] == call_stmt]
                if len(df_temp) > 0:
                    external_call["logic_addr"] = self.get_storage_content(
                        list(df_temp["storageSlot"])[0], 0, 19
                    )

            # find callee got from the func arg, and try to recover the know args
            if len(df7) != 0:
                df_temp = df7.loc[df7["callStmt"] == call_stmt]
                if len(df_temp) > 0:
                    # find the function that use the itself's public func args
                    if list(df_temp["func"])[0] == list(df_temp["pubFun"])[0]:
                        temp_index = int(list(df_temp["argIndex"])[0])
                        if temp_index in self.callArgVals.keys():
                            external_call["logic_addr"] = self.callArgVals[temp_index]

            # to differentiate the delegatecall and normal call
            if df1.iloc[i]["callOp"] == "DELEGATECALL":
                external_call["storage_addr"] = self.logic_addr
                external_call["caller"] = self.caller
                external_call["call_site"] = self.call_site
            else:
                external_call["storage_addr"] = external_call["logic_addr"]
                external_call["caller"] = self.logic_addr
                external_call["call_site"] = call_stmt

            # label the function signature
            if len(df4) != 0:
                df_temp = df4.loc[df4["callStmt"] == call_stmt]
                if len(df_temp) > 0:
                    external_call["funcSign"] = list(df_temp["funcSign"])[0][:10]

            if len(df5) != 0:
                df_temp = df5.loc[df5["callStmt"] == call_stmt]
                if len(df_temp) > 0:
                    external_call["funcSign"] = func_sign

            self.external_calls.append(external_call)
