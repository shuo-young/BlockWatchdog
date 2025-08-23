"""Attack Identification Module

This module contains the core attack detection logic for BlockWatchdog.
It analyzes contracts and identifies various attack patterns including
reentrancy, flash loan attacks, DOS attacks, and bad randomness.
"""

import logging
from typing import Dict, List, Tuple, Any

from semantic import semantic_feature
from flow import data_flow

log = logging.getLogger(__name__)


class AttackIdentifier:
    """Main class for identifying various attack patterns in smart contracts.
    
    This class integrates semantic analysis and flow analysis to detect:
    - Reentrancy attacks
    - Flash loan/price manipulation attacks
    - Denial of Service (DoS) attacks
    - Bad randomness vulnerabilities
    
    Attributes:
        contracts: Dictionary of contract instances indexed by unique keys
        main_contract_sign_list: List of function signatures from main contract
        external_call_in_func_sigature: Function signatures containing external calls
        attack_matrix: Dictionary tracking detected attack types
        visited_contracts: List of contract addresses visited during analysis
        visited_funcs: List of function signatures visited during analysis
        semantic_analysis: Instance for semantic pattern analysis
        flow_analysis: Instance for data/token flow analysis
    """

    def __init__(
        self,
        input_contract: str,
        contracts: Dict[str, Any],
        main_contract_sign_list: List[str],
        external_call_in_func_sigature: List[str],
        visited_contracts: List[str],
        visited_funcs: List[str],
    ) -> None:
        """Initialize AttackIdentifier with contract analysis data.
        
        Args:
            input_contract: Address of the main contract being analyzed
            contracts: Dictionary of all analyzed contracts
            main_contract_sign_list: Function signatures from main contract
            external_call_in_func_sigature: Functions with external calls
            visited_contracts: Contracts visited during call graph construction
            visited_funcs: Functions visited during call graph construction
        """
        self.contracts = contracts
        self.main_contract_sign_list = main_contract_sign_list
        self.external_call_in_func_sigature = external_call_in_func_sigature
        self.input_contract = input_contract
        
        self.intra_callsigs: List[str] = []
        self.sensitive_callsigs: List[str] = []
        self.attack_matrix = {
            "br": False,
            "dos": False,
            "reentrancy": False,
            "price_manipulation": False,
        }
        
        self.visited_contracts = visited_contracts
        self.visited_funcs = visited_funcs
        self.victim_callback_info: Dict[str, List[Any]] = {}
        self.attack_reenter_info: Dict[str, List[Any]] = {}
        
        self.flow_analysis = data_flow.FlowAnalysis(input_contract, contracts)
        self.semantic_analysis = semantic_feature.AttackSemantics(contracts)

    def detect(self) -> Tuple[bool, Dict[str, bool]]:
        """Main detection method that identifies various attack patterns.
        
        Returns:
            Tuple of (is_attack, attack_matrix) where:
            - is_attack: Boolean indicating if any attack pattern was detected
            - attack_matrix: Dictionary showing which specific attacks were found
        """
        if not self._has_cross_contract_calls():
            return False, self.attack_matrix
        
        self._detect_semantic_attacks()
        self._detect_flow_based_attacks()
        self._detect_reentrancy_attacks()
        
        is_attack = any(self.attack_matrix.values())
        return is_attack, self.attack_matrix

    def _has_cross_contract_calls(self) -> bool:
        """Check if there are any cross-contract calls in the analysis."""
        return any(contract.level != 0 for contract in self.contracts.values())
    
    def _detect_semantic_attacks(self) -> None:
        """Detect attacks based on semantic patterns."""
        if self.semantic_analysis.intraprocedural_br_analysis():
            self.attack_matrix["br"] = True
        
        if self.semantic_analysis.intraprocedural_dos_analysis():
            self.attack_matrix["dos"] = True
    
    def _detect_flow_based_attacks(self) -> None:
        """Detect attacks based on flow analysis."""
        if self.flow_analysis.intraprocedural_fla_analysis():
            log.info("Intraprocedural analysis detected flashloan attack")
            self.attack_matrix["price_manipulation"] = True
        else:
            pps_near_fl_source = self.flow_analysis.get_pps_near_fl_source()
            pps_near_fl_sink = self.flow_analysis.get_pps_near_fl_sink()
            self.attack_matrix["price_manipulation"] = (
                self.flow_analysis.find_potential_price_manipulation_attack(
                    pps_near_fl_source, pps_near_fl_sink
                )
            )
        
        if self.semantic_analysis.op_externalcall_callback_analysis():
            self.attack_matrix["price_manipulation"] = True
    
    def _detect_reentrancy_attacks(self) -> bool:
        """Detect reentrancy attacks through flow and semantic analysis."""
        pps_near_source = self.flow_analysis.get_pps_near_source()
        pps_near_sink, sensitive_callsigs = self.flow_analysis.get_pps_near_sink()
        
        self.sensitive_callsigs = sensitive_callsigs
        
        reachable_sites = self._find_reachable_sites(pps_near_source, pps_near_sink)
        
        if reachable_sites:
            self._analyze_callback_reentrancy(sensitive_callsigs, reachable_sites)
        
        if self._check_semantic_reentrancy_patterns():
            self.attack_matrix["reentrancy"] = True
            return True
        
        return self.attack_matrix["reentrancy"]
    
    def _find_reachable_sites(
        self, pps_near_source: List[Dict], pps_near_sink: List[Dict]
    ) -> Dict[str, Dict[str, str]]:
        """Find program points where source can reach sink."""
        reachable_sites = {}
        
        for source_pp in pps_near_source:
            for sink_pp in pps_near_sink:
                if (
                    self.flow_analysis.is_same(source_pp, sink_pp)
                    or self.flow_analysis.is_reachable(source_pp, sink_pp)
                ):
                    func_sign = sink_pp["func_sign"]
                    reachable_sites[func_sign] = {
                        "caller": sink_pp["caller"],
                        "caller_callback_funcSign": sink_pp["caller_funcSign"],
                    }
        
        return reachable_sites
    
    def _analyze_callback_reentrancy(
        self, sensitive_callsigs: List[str], reachable_sites: Dict[str, Dict]
    ) -> None:
        """Analyze callback-based reentrancy patterns."""
        overlap = list(
            set(sensitive_callsigs).intersection(
                set(self.external_call_in_func_sigature)
            )
        )
        
        if not overlap:
            return
        
        victim_callback_info = {}
        attack_reenter_info = {}
        
        for func_sig in overlap:
            victim_callback_info[func_sig] = []
            attack_reenter_info[func_sig] = []
            
            if func_sig in reachable_sites:
                site_info = reachable_sites[func_sig]
                if site_info not in victim_callback_info[func_sig]:
                    victim_callback_info[func_sig].append(site_info)
            
            self._find_reenter_targets(func_sig, attack_reenter_info)
        
        if any(attack_reenter_info.values()):
            self.attack_matrix["reentrancy"] = True
        
        self.victim_callback_info = victim_callback_info
        self.attack_reenter_info = attack_reenter_info
    
    def _find_reenter_targets(
        self, func_sig: str, attack_reenter_info: Dict[str, List]
    ) -> None:
        """Find potential reenter targets for a given function signature."""
        for contract in self.contracts.values():
            if (
                str(contract.func_sign) == str(func_sig)
                and contract.level == 0
            ):
                for external_call in contract.external_calls:
                    target_address = external_call["logic_addr"]
                    target_func_sign = external_call["funcSign"]
                    
                    reenter_info = {
                        "reenter_target": target_address,
                        "reenter_funcSign": target_func_sign,
                    }
                    
                    if (
                        reenter_info not in attack_reenter_info[func_sig]
                        and target_address in self.visited_contracts
                        and target_func_sign in self.visited_funcs
                    ):
                        attack_reenter_info[func_sig].append(reenter_info)
    
    def _check_semantic_reentrancy_patterns(self) -> bool:
        """Check for semantic reentrancy patterns."""
        return (
            self.semantic_analysis.double_call_to_same_contract()
            or self.semantic_analysis.double_call_to_same_contract_by_storage()
            or self.semantic_analysis.preset_call_in_standard_erc20_transfer()
        )
    
    def get_reentrancy_info(self) -> Tuple[Dict[str, List], Dict[str, List]]:
        """Get reentrancy attack information.
        
        Returns:
            Tuple of (victim_callback_info, attack_reenter_info)
        """
        return self.victim_callback_info, self.attack_reenter_info
    
    def get_sensitive_signatures(self) -> List[str]:
        """Get list of sensitive function signatures.
        
        Returns:
            List of function signatures that are considered sensitive
        """
        return self.sensitive_callsigs
    
    def get_attack_matrix(self) -> Dict[str, bool]:
        """Get the attack detection matrix.
        
        Returns:
            Dictionary mapping attack types to their detection status
        """
        return self.attack_matrix
    
    # Legacy method names for backward compatibility
    def get_reen_info(self):
        """Legacy method - use get_reentrancy_info() instead."""
        return self.get_reentrancy_info()
    
    def get_sig_info(self):
        """Legacy method - use get_sensitive_signatures() instead."""
        return self.get_sensitive_signatures()
    
    def get_attack_matric(self):
        """Legacy method - use get_attack_matrix() instead."""
        return self.get_attack_matrix()
