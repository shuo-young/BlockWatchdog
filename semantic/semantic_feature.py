"""Semantic Analysis Module

This module provides semantic analysis capabilities for identifying
attack patterns through static analysis of smart contract opcodes
and structural patterns.
"""

import global_params
import os
import pandas as pd
import logging
from typing import Dict, List, Any

log = logging.getLogger(__name__)


class AttackSemantics:
    """Semantic analysis for detecting attack patterns in smart contracts.
    
    This class analyzes contracts for semantic indicators of attacks including:
    - Multiple contract creation in loops
    - Self-destruct operations
    - Bad randomness patterns
    - External calls in hooks and fallback functions
    - Double calls to the same contract
    
    Attributes:
        contracts: Dictionary of contract instances to analyze
    """
    
    def __init__(self, contracts: Dict[str, Any]) -> None:
        """Initialize AttackSemantics with contract data.
        
        Args:
            contracts: Dictionary of contract instances indexed by unique keys
        """
        self.contracts = contracts

    def op_externalcall_callback_analysis(self) -> bool:
        """Analyze external calls within callback functions.
        
        This method checks for external calls in flash loan callback functions
        and controlled flash calls, which can indicate price manipulation attacks.
        
        Returns:
            True if suspicious external calls in callbacks are detected
        """
        flashcallback_signatures = ["0xa1d48336"]
        flashcall_signatures = ["0x490e6cbc"]
        
        log.info("Analyzing external calls in callbacks")
        
        for contract_key, contract in self.contracts.items():
            if contract.level != 0:
                continue
                
            contract_addr = contract_key.split("_")[2]
            func_signature = contract_key.split("_")[3]
            
            if "__function_selector__" in contract_key:
                func_signature = "__function_selector__"
            
            if self._check_external_call_in_loop(contract_addr, func_signature, 
                                                 flashcallback_signatures, flashcall_signatures):
                return True
                
            if self._check_controlled_flash_call(contract_addr, func_signature,
                                                flashcallback_signatures, flashcall_signatures):
                return True
        
        return False
    
    def _check_external_call_in_loop(
        self, contract_addr: str, func_signature: str, 
        callback_sigs: List[str], call_sigs: List[str]
    ) -> bool:
        """Check for external calls in loops within callback functions."""
        analysis_path = (
            f"{global_params.OUTPUT_PATH}.temp/{contract_addr}/out/Leslie_Op_ExternalCallInLoop.csv"
        )
        
        return self._analyze_csv_for_signatures(
            analysis_path, callback_sigs, call_sigs
        )
    
    def _check_controlled_flash_call(
        self, contract_addr: str, func_signature: str,
        callback_sigs: List[str], call_sigs: List[str]
    ) -> bool:
        """Check for controlled flash calls in callback functions."""
        analysis_path = (
            f"{global_params.OUTPUT_PATH}.temp/{contract_addr}/out/Leslie_Op_ControlledFlashCall.csv"
        )
        
        return self._analyze_csv_for_signatures(
            analysis_path, callback_sigs, call_sigs
        )
    
    def _analyze_csv_for_signatures(
        self, file_path: str, callback_sigs: List[str], call_sigs: List[str]
    ) -> bool:
        """Analyze CSV file for matching function signatures."""
        if not (os.path.exists(file_path) and os.path.getsize(file_path) > 0):
            return False
            
        try:
            df = pd.read_csv(file_path, header=None, sep="\t")
            df.columns = ["funcSign", "stmt", "tarFuncSign"]
            
            for _, row in df.iterrows():
                if (row["funcSign"] in callback_sigs and 
                    row["tarFuncSign"] in call_sigs):
                    return True
        except Exception as e:
            log.error(f"Error analyzing CSV {file_path}: {e}")
            
        return False

    def op_multicreate_analysis(self) -> bool:
        """Analyze for multiple contract creation operations.
        
        This method checks for CREATE opcodes within loops, which can
        indicate attacks that create multiple contracts for manipulation.
        
        Returns:
            True if multiple contract creation pattern is detected
        """
        for contract_key, contract in self.contracts.items():
            if contract.level != 0:
                continue
                
            contract_addr = contract_key.split("_")[2]
            func_signature = contract_key.split("_")[3]
            
            if "__function_selector__" in contract_key:
                func_signature = "__function_selector__"
            
            analysis_path = (
                f"{global_params.OUTPUT_PATH}.temp/{contract_addr}/out/Leslie_Op_CreateInLoop.csv"
            )
            
            if not (os.path.exists(analysis_path) and os.path.getsize(analysis_path) > 0):
                continue
                
            try:
                df = pd.read_csv(analysis_path, header=None, sep="\t")
                df.columns = ["funcSign", "stmt"]
                
                # Filter by current function signature
                matching_rows = df.loc[df["funcSign"] == func_signature]
                if not matching_rows.empty:
                    return True
            except Exception as e:
                log.error(f"Error analyzing CREATE operations: {e}")
                
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
