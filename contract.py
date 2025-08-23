"""Contract Analysis Module

This module provides the Contract class for representing and analyzing
smart contracts. It handles bytecode download, decompilation via Gigahorse,
function signature extraction, and external call identification.
"""

import logging
import os
from typing import Dict, List, Any, Optional

import pandas as pd
from web3 import Web3

import global_params

log = logging.getLogger(__name__)


class Contract:
    """Represents a smart contract with analysis capabilities.
    
    This class encapsulates all contract-related data and provides methods
    for downloading bytecode, analyzing contract structure, and identifying
    external calls and function signatures.
    
    Attributes:
        platform: Blockchain platform (ETH, BSC, FTM, ARB)
        logic_addr: Contract address containing business logic
        storage_addr: Contract address containing storage data
        func_sign: Function signature being analyzed
        block_number: Blockchain snapshot block number
        caller: Address calling this contract
        call_site: Location of the external call
        level: Depth level in call graph traversal
        origin: Whether this is the original contract being analyzed
        createbin: Whether contract only has creation bytecode
        external_calls: List of external calls made by this contract
        func_sign_list: List of all function signatures in contract
        external_call_in_func_sigature: Function signatures with external calls
    """

    def __init__(
        self,
        platform: str,
        logic_addr: str,
        storage_addr: str,
        func_sign: str,
        block_number: int,
        caller: str,
        call_site: str,
        level: int,
        callArgVals: Optional[Dict[int, Any]] = None,
    ) -> None:
        """Initialize Contract instance.
        
        Args:
            platform: Blockchain platform identifier
            logic_addr: Contract logic address
            storage_addr: Contract storage address  
            func_sign: Target function signature
            block_number: Block number for analysis
            caller: Calling contract address
            call_site: External call location
            level: Call graph traversal depth
            callArgVals: Known function argument values
        """
        if callArgVals is None:
            callArgVals = {}
            
        self.platform = platform
        self.logic_addr = self._format_address(logic_addr)
        self.storage_addr = self._format_address(storage_addr)
        self.func_sign = func_sign
        self.block_number = block_number
        self.caller = caller
        self.call_site = call_site
        self.level = level
        self.callArgVals = callArgVals
        
        # Contract analysis state
        self.origin = not bool(func_sign)
        self.createbin = False
        self.func = []
        self.func_sign_dict: Dict[str, str] = {}
        self.func_sign_list: List[str] = []
        self.external_call_in_func_sigature: List[str] = []
        self.external_calls: List[Dict[str, Any]] = []
        self.knownArgVals: Dict[str, Dict[int, Any]] = {}
        self.storage_space: Dict = {}
        self.url = ""
        
        logging.info(f"Known function args from previous call: {self.callArgVals}")
        self.analyze()

    def _format_address(self, addr: str) -> str:
        """Format Ethereum address to standard 42-character format.
        
        Args:
            addr: Address string to format
            
        Returns:
            Properly formatted Ethereum address
        """
        if len(addr) != 42:
            return "0x" + "0" * (42 - len(addr)) + addr.replace("0x", "")
        return addr
    
    def is_createbin(self) -> bool:
        """Check if contract only has creation bytecode.
        
        Returns:
            True if contract is creation bytecode only
        """
        return self.createbin
    
    def get_func_sign_list(self) -> List[str]:
        """Get list of all function signatures in the contract.
        
        Returns:
            List of function signatures
        """
        return self.func_sign_list
    
    def get_external_call_in_func_sigature(self) -> List[str]:
        """Get function signatures that contain external calls.
        
        Returns:
            List of function signatures with external calls
        """
        return self.external_call_in_func_sigature

    def analyze(self) -> None:
        """Main analysis workflow for the contract.
        
        This method orchestrates the entire contract analysis process:
        1. Set up blockchain connection URL
        2. Download contract bytecode
        3. Analyze contract structure using Gigahorse
        4. Extract function signatures and external calls
        """
        logging.info(f"Analyzing contract {self.logic_addr}")
        logging.info(f"Caller: {self.caller}")
        logging.info(f"Call site: {self.call_site}")
        logging.info(f"Function signature: {self.func_sign}")
        
        self._set_blockchain_url()
        self._download_bytecode()
        
        contract_path = global_params.CONTRACT_PATH + self.logic_addr + ".hex"
        if os.path.exists(contract_path):
            self._analyze_with_gigahorse()
            self._extract_function_signatures()
            self._set_call_argument_values()
            self._set_known_argument_values()
            
            logging.info(f"Call arg values from previous contract: {self.callArgVals}")
            logging.info(f"Known arg values in current contract: {self.knownArgVals}")
            
            self._extract_external_calls()

    def _set_blockchain_url(self) -> None:
        """Set the appropriate blockchain RPC URL based on platform."""
        url_mapping = {
            "ETH": "https://eth-mainnet.g.alchemy.com/v2/6t0LpEw9cr0OlGIVTFqs92aOIkfhktMk",
            "BSC": "https://little-aged-thunder.bsc.quiknode.pro/53b86587d990e1cb9354cd2a01ebb3b16109427f/",
            "FTM": "https://practical-long-energy.fantom.discover.quiknode.pro/fc97af1ebab40f57ea698b6cf3dd67a2d24cac1a/",
            "ARB": "https://arb-mainnet.g.alchemy.com/v2/uQXNRP9T7_rg0AB1VZbjClHMf0w7OiCA",
        }
        self.url = url_mapping.get(self.platform, "")

    def _download_bytecode(self) -> None:
        """Download contract bytecode from blockchain or load from cache.
        
        This method first checks for cached bytecode, then attempts to download
        from the blockchain if needed. For contracts with no runtime code,
        it tries to find and use creation bytecode.
        """
        if not self.url:
            return
        
        bytecode_path = global_params.CONTRACT_PATH + self.logic_addr + ".hex"
        
        if os.path.exists(bytecode_path):
            self._load_cached_bytecode(bytecode_path)
        else:
            self._fetch_bytecode_from_blockchain(bytecode_path)
    
    def _load_cached_bytecode(self, bytecode_path: str) -> None:
        """Load bytecode from cached file."""
        with open(bytecode_path, "r") as f:
            bytecode = f.read()
            
        if bytecode == "0x":
            self._load_creation_bytecode(bytecode_path)
    
    def _load_creation_bytecode(self, bytecode_path: str) -> None:
        """Load creation bytecode when runtime bytecode is empty."""
        creation_path = (
            global_params.CONTRACT_PATH + "createbin/" + 
            self.logic_addr + "_createbin.hex"
        )
        
        if os.path.exists(creation_path):
            with open(creation_path, "r") as f:
                creation_bytecode = f.read()
            
            with open(bytecode_path, "w") as f:
                f.write(creation_bytecode[2:])  # Remove 0x prefix
            
            self.createbin = True
            self.func_sign = "__function_selector__"
            self.func_sign_list = ["__function_selector__"]
    
    def _fetch_bytecode_from_blockchain(self, bytecode_path: str) -> None:
        """Fetch bytecode directly from blockchain."""
        web3 = self._create_web3_instance()
        if not web3:
            return
            
        try:
            contract_address = Web3.to_checksum_address(self.logic_addr)
            bytecode = web3.eth.get_code(contract_address).hex()
            
            if bytecode != "0x":
                with open(bytecode_path, "w") as f:
                    f.write(bytecode[2:])  # Remove 0x prefix
        except Exception as e:
            logging.error(f"Failed to fetch bytecode for {self.logic_addr}: {e}")
    
    def _create_web3_instance(self) -> Optional[Web3]:
        """Create Web3 instance based on URL type."""
        try:
            if self.url.startswith("https"):
                return Web3(Web3.HTTPProvider(self.url))
            else:
                return Web3(Web3.WebsocketProvider(self.url))
        except Exception as e:
            logging.error(f"Failed to create Web3 instance: {e}")
            return None

    def _analyze_with_gigahorse(self) -> None:
        """Analyze contract using Gigahorse decompiler."""
        command = (
            "cd ./gigahorse-toolchain && ./gigahorse.py -C ./clients/leslie.dl "
            f"{global_params.CONTRACT_DIR}{self.logic_addr}.hex >/dev/null 2>&1"
        )
        os.system(command)
    
    def _extract_function_signatures(self) -> None:
        """Extract function signatures from Gigahorse analysis results."""
        signatures_path = (
            f"./gigahorse-toolchain/.temp/{self.logic_addr}/out/Leslie_FunctionSelector.csv"
        )
        
        if not (os.path.exists(signatures_path) and os.path.getsize(signatures_path) > 0):
            return
        
        try:
            df = pd.read_csv(signatures_path, header=None, sep="\t")
            df.columns = ["func", "funcSign"]
            
            if self.origin:
                self.func_sign_list = df["funcSign"].tolist()
                self.func_sign_dict = dict(zip(df["func"], df["funcSign"]))
            else:
                # For intermediate contracts, find specific function
                matching_funcs = df.loc[df["funcSign"] == self.func_sign, "func"]
                if not matching_funcs.empty:
                    self.func = matching_funcs.iloc[0]
                else:
                    # Fallback to default function
                    fallback_funcs = df.loc[df["funcSign"] == "0x00000000", "func"]
                    if not fallback_funcs.empty:
                        self.func = fallback_funcs.iloc[0]
        except Exception as e:
            logging.error(f"Failed to extract function signatures: {e}")
    
    def _set_call_argument_values(self) -> None:
        """Set call argument values (placeholder for future implementation)."""
        log.info(f"Call arg values: {self.callArgVals}")
    
    def _extract_external_calls(self) -> None:
        """Extract external calls based on contract origin status."""
        if self.origin:
            if not self.createbin and "0x0" in self.func_sign_dict:
                del self.func_sign_dict["0x0"]
            
            for func, func_sign in self.func_sign_dict.items():
                logging.info(f"Setting external calls in function {func_sign}")
                self.set_external_calls(func, func_sign)
        else:
            self.set_external_calls(self.func, self.func_sign)

    # add env var tracer (also known dynamically)
    def _set_known_argument_values(self) -> None:
        """Set known argument values from various sources.
        
        This method extracts known argument values from:
        1. Constant values identified by Gigahorse
        2. Environment variables (CALLER, ADDRESS, ORIGIN)
        3. Storage slot values (if enabled)
        4. Function argument propagation
        """
        self._extract_known_constant_args()
        
        if global_params.CALLARG_STORAGETYPE:
            self._extract_storage_based_args()
            
        self._extract_environment_based_args()
        self._propagate_function_arguments()
        
        log.info(f"Known arg values: {self.knownArgVals}")

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

    def _extract_known_constant_args(self) -> None:
        """Extract known constant argument values."""
        constants_path = (
            f"./gigahorse-toolchain/.temp/{self.logic_addr}/out/Leslie_ExternalCall_Known_Arg.csv"
        )
        
        if not (os.path.exists(constants_path) and os.path.getsize(constants_path) > 0):
            return
            
        try:
            df = pd.read_csv(constants_path, header=None, sep="\t")
            df.columns = ["func", "callStmt", "argIndex", "argVal"]
            
            for _, row in df.iterrows():
                stmt = row["callStmt"]
                arg_index = int(row["argIndex"])
                arg_value = row["argVal"]
                
                if stmt not in self.knownArgVals:
                    self.knownArgVals[stmt] = {}
                    
                self.knownArgVals[stmt][arg_index] = arg_value
                
            logging.info(f"Extracted constant args: {self.knownArgVals}")
        except Exception as e:
            logging.error(f"Failed to extract known constant args: {e}")

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
