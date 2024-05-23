import global_params
import os
import pandas as pd


class AttackSemantics:
    def __init__(self, contracts):
        self.contracts = contracts

    def op_externalcall_callback_analysis(self):
        # pending...
        flashcallback_list = ["0xa1d48336"]
        flashcallfunc_list = ["0x490e6cbc"]
        print("=======analyzing externalcall in the callback")
        for key in self.contracts.keys():
            if self.contracts[key].level == 0:
                temp_address = key.split("_")[2]
                temp_funcSign = key.split("_")[3]
                if "__function_selector__" in key:
                    temp_funcSign = "__function_selector__"
                loc = (
                    global_params.OUTPUT_PATH
                    + ".temp/"
                    + temp_address
                    + "/out/Leslie_Op_ExternalCallInLoop.csv"
                )
                if os.path.exists(loc) and (os.path.getsize(loc) > 0):
                    df = pd.read_csv(loc, header=None, sep="	")
                    df.columns = ["funcSign", "stmt", "tarFuncSign"]
                    for i in range(len(df)):
                        if (
                            df.iloc[i]["funcSign"] in flashcallback_list
                            and df.iloc[i]["tarFuncSign"] in flashcallfunc_list
                        ):
                            return True
                loc2 = (
                    global_params.OUTPUT_PATH
                    + ".temp/"
                    + temp_address
                    + "/out/Leslie_Op_ControlledFlashCall.csv"
                )

                if os.path.exists(loc2) and (os.path.getsize(loc2) > 0):
                    df = pd.read_csv(loc2, header=None, sep="	")
                    df.columns = ["funcSign", "stmt", "tarFuncSign"]
                    for i in range(len(df)):
                        if (
                            df.iloc[i]["funcSign"] in flashcallback_list
                            and df.iloc[i]["tarFuncSign"] in flashcallfunc_list
                        ):
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
                    global_params.OUTPUT_PATH
                    + ".temp/"
                    + temp_address
                    + "/out/Leslie_Op_CreateInLoop.csv"
                )
                if os.path.exists(loc) and (os.path.getsize(loc) > 0):
                    df = pd.read_csv(loc, header=None, sep="	")
                    df.columns = ["funcSign", "stmt"]
                    # it is not neccessary to label the func, just focus on the callStmt
                    df = df.loc[df["funcSign"] == temp_funcSign]
                    if len(df) != 0:
                        return True
        return False

    # find other attack matrix
    def intraprocedural_br_analysis(self):
        for key in self.contracts.keys():
            if self.contracts[key].level == 0:
                temp_address = key.split("_")[2]
                temp_funcSign = key.split("_")[3]
                if "__function_selector__" in key:
                    temp_funcSign = "__function_selector__"
                loc = (
                    global_params.OUTPUT_PATH
                    + ".temp/"
                    + temp_address
                    + "/out/Leslie_SensitiveOpOfBadRandomnessAfterExternalCall.csv"
                )
                if os.path.exists(loc) and (os.path.getsize(loc) > 0):
                    df = pd.read_csv(loc, header=None, sep="	")
                    df.columns = ["funcSign", "callStmt", "sensitiveVar", "sourceOp"]
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
                    global_params.OUTPUT_PATH
                    + ".temp/"
                    + temp_address
                    + "/out/Leslie_Op_SoleCreate.csv"
                )
                if os.path.exists(loc) and (os.path.getsize(loc) > 0):
                    df = pd.read_csv(loc, header=None, sep="	")
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
                    global_params.OUTPUT_PATH
                    + ".temp/"
                    + temp_address
                    + "/out/Leslie_Op_Selfdestruct.csv"
                )
                if os.path.exists(loc) and (os.path.getsize(loc) > 0):
                    df = pd.read_csv(loc, header=None, sep="	")
                    df.columns = ["funcSign", "target"]
                    # it is not neccessary to label the func, just focus on the callStmt
                    df = df.loc[df["funcSign"] == temp_funcSign]
                    if len(df) != 0:
                        return True
        return False

    # possible features of attacker contracts
    def externalcall_inhook(self):
        for key in self.contracts.keys():
            if self.contracts[key].level == 0:
                temp_address = key.split("_")[2]
                temp_funcSign = key.split("_")[3]
                loc = (
                    global_params.OUTPUT_PATH
                    + ".temp/"
                    + temp_address
                    + "/out/Leslie_ExternalCallInHook.csv"
                )
                if os.path.exists(loc) and (os.path.getsize(loc) > 0):
                    df = pd.read_csv(loc, header=None, sep="	")
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
                    global_params.OUTPUT_PATH
                    + ".temp/"
                    + temp_address
                    + "/out/Leslie_ExternalCallInFallback.csv"
                )
                if os.path.exists(loc) and (os.path.getsize(loc) > 0):
                    df = pd.read_csv(loc, header=None, sep="	")
                    df.columns = ["callStmt", "funcSign"]
                    # it is not neccessary to label the func, just focus on the callStmt
                    df = df.loc[df["funcSign"] == temp_funcSign]
                    if len(df) != 0:
                        return True
        return False

    def double_call_to_same_contract(self):
        for key in self.contracts.keys():
            if self.contracts[key].level == 0:
                temp_address = key.split("_")[2]
                temp_funcSign = key.split("_")[3]
                loc = (
                    global_params.OUTPUT_PATH
                    + ".temp/"
                    + temp_address
                    + "/out/Leslie_DoubleCallToSameContract.csv"
                )
                if os.path.exists(loc) and (os.path.getsize(loc) > 0):
                    df = pd.read_csv(loc, header=None, sep="	")
                    df.columns = ["funcSign", "callee"]
                    # it is not neccessary to label the func, just focus on the callStmt
                    df = df.loc[df["funcSign"] == temp_funcSign]
                    if len(df) != 0:
                        return True
        return False

    def double_call_to_same_contract_by_storage(self):
        for key in self.contracts.keys():
            if self.contracts[key].level == 0:
                temp_address = key.split("_")[2]
                temp_funcSign = key.split("_")[3]
                loc = (
                    global_params.OUTPUT_PATH
                    + ".temp/"
                    + temp_address
                    + "/out/Leslie_DoubleCallToSameContractByStorage.csv"
                )
                if os.path.exists(loc) and (os.path.getsize(loc) > 0):
                    df = pd.read_csv(loc, header=None, sep="	")
                    df.columns = ["funcSign", "slot", "low", "high"]
                    # it is not neccessary to label the func, just focus on the callStmt
                    df = df.loc[df["funcSign"] == temp_funcSign]
                    if len(df) != 0:
                        return True
        return False

    def preset_call_in_standard_erc20_transfer(self):
        for key in self.contracts.keys():
            if self.contracts[key].level == 0:
                temp_address = key.split("_")[2]
                temp_funcSign = key.split("_")[3]
                loc = (
                    global_params.OUTPUT_PATH
                    + ".temp/"
                    + temp_address
                    + "/out/Leslie_CallInStandardTransfer.csv"
                )
                if os.path.exists(loc) and (os.path.getsize(loc) > 0):
                    df = pd.read_csv(loc, header=None, sep="	")
                    df.columns = ["funcSign", "callStmt", "storageSlot"]
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
                    global_params.OUTPUT_PATH
                    + ".temp/"
                    + temp_address
                    + "/out/Leslie_SensitiveOpOfDoSAfterExternalCall.csv"
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
                    # it is not neccessary to label the func, just focus on the callStmt
                    df = df.loc[df["funcSign"] == temp_funcSign]
                    if len(df) != 0:
                        return True
        return False
