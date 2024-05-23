import logging
from semantic import semantic_feature
from flow import data_flow, token_flow

log = logging.getLogger(__name__)


class AttackIdentifier:

    def __init__(
        self,
        input_contract,
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
        self.attack_matrix = {
            "br": False,
            "dos": False,
            "reentrancy": False,
            "price_manipulation": False,
        }
        self.visited_contracts = visited_contracts
        self.visited_funcs = visited_funcs
        self.victim_callback_info = {}
        self.attack_reenter_info = {}
        self.input_contract = input_contract
        self.flow_analysis = data_flow.FlowAnalysis(input_contract, contracts)

        self.semantic_analysis = semantic_feature.AttackSemantics(contracts)

    def detect(self):
        cross_contract = False
        for key in self.contracts.keys():
            if self.contracts[key].level != 0:
                cross_contract = True

        if not cross_contract:
            return False, self.attack_matrix

        result = False

        # br and dos detection
        if self.semantic_analysis.intraprocedural_br_analysis():
            self.attack_matrix["br"] = True

        if self.semantic_analysis.intraprocedural_dos_analysis():
            self.attack_matrix["dos"] = True

        if self.flow_analysis.intraprocedural_fla_analysis():
            log.info("intraprocedural analysis true of flashloan attack")
            print("intraprocedural analysis true of flashloan attack")
            self.attack_matrix["price_manipulation"] = True
        else:
            # define the vulnerable trace
            pps_near_fl_source = self.flow_analysis.get_pps_near_fl_source()
            pps_near_fl_sink = self.flow_analysis.get_pps_near_fl_sink()
            self.attack_matrix["price_manipulation"] = (
                self.flow_analysis.find_potential_price_manipulation_attack(
                    pps_near_fl_source, pps_near_fl_sink
                )
            )

        if self.semantic_analysis.op_externalcall_callback_analysis():
            self.attack_matrix["price_manipulation"] = True

        # so how to define the tainted source
        # !the tainted source should only be from the analyzed contracts (i.e., input contract)
        pps_near_source = self.flow_analysis.get_pps_near_source()
        # and how to define the sentive sink
        pps_near_sink, sensitive_callsigs = self.flow_analysis.get_pps_near_sink()

        # set call sigs in the sink site
        self.sensitive_callsigs = sensitive_callsigs

        reachable = False
        reachable_site = {}

        # for every source, find whether one sink can be reached
        for pp1 in pps_near_source:
            for pp2 in pps_near_sink:
                if self.flow_analysis.is_same(pp1, pp2):
                    reachable = True
                    caller = pp2["caller"]
                    caller_funcSign = pp2["caller_funcSign"]
                    reachable_site[pp2["func_sign"]] = {
                        "caller": caller,
                        "caller_callback_funcSign": caller_funcSign,
                    }
                elif self.flow_analysis.is_reachable(pp1, pp2):
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
            # judge whether the attacker contract implements the sensitive functions (called by victims)
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
                                    "reenter_target": temp_target_address,
                                    "reenter_funcSign": temp_funcSign,
                                }
                                if (
                                    res not in attack_reenter_info[i]
                                    and temp_target_address in self.visited_contracts
                                    and temp_funcSign in self.visited_funcs
                                ):
                                    attack_reenter_info[i].append(res)
                            result = True
                            self.attack_matrix["reentrancy"] = True
        if (
            self.semantic_analysis.double_call_to_same_contract()
            or self.semantic_analysis.double_call_to_same_contract_by_storage()
            or self.semantic_analysis.preset_call_in_standard_erc20_transfer()
        ):
            self.attack_matrix["reentrancy"] = True
            result = True
        self.victim_callback_info = victim_callback_info
        self.attack_reenter_info = attack_reenter_info
        return result, self.attack_matrix

    def get_reen_info(self):
        return self.victim_callback_info, self.attack_reenter_info

    def get_sig_info(self):
        return self.sensitive_callsigs

    def get_attack_matric(self):
        return self.attack_matrix
