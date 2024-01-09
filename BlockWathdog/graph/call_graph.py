import logging
from contract import Contract

log = logging.getLogger(__name__)


class CallGraph:
    output = ""
    visited_contracts = []
    visited_funcs = []
    max_level = 0

    def __init__(self, source, contracts, platform):
        self.source = source
        self.contracts = contracts
        self.output = ""
        self.visited_contracts = []
        self.visited_funcs = []
        self.max_level = 0
        self.platform = platform

    def get_contracts(self):
        return self.contracts

    def get_output(self):
        return self.output

    def construct_cross_contract_call_graph(self):
        source = self.source
        contracts = self.contracts
        pending = []
        pending.append(source)

        index = 0
        while len(pending) > 0:
            temp = pending.pop()
            temp["platform"] = self.platform
            index += 1
            if temp["level"] > self.max_level:
                self.max_level = temp["level"]

            temp_key = (
                temp["caller"]
                + "_"
                + temp["call_site"]
                + "_"
                + temp["logic_addr"]
                + "_"
                + temp["func_sign"]
                + "_"
                + temp["caller_func_sign"]
            )
            print(
                "     " * temp["level"]
                + temp["caller"]
                + "_"
                + temp["caller_func_sign"]
                + "_"
                + temp["call_site"]
                + " -> "
                + temp["logic_addr"]
                + "_"
                + temp["func_sign"]
            )
            self.output = (
                self.output
                + "     " * temp["level"]
                + temp["caller"]
                + "_"
                + temp["caller_func_sign"]
                + "_"
                + temp["call_site"]
                + " -> "
                + temp["logic_addr"]
                + "_"
                + temp["func_sign"]
                + "\n"
            )
            if temp_key in contracts.keys():
                continue

            if temp["logic_addr"] not in self.visited_contracts:
                self.visited_contracts.append(temp["logic_addr"])
            if temp["func_sign"] not in self.visited_funcs:
                self.visited_funcs.append(temp["func_sign"])

            contracts[temp_key] = Contract(
                temp["platform"],
                temp["logic_addr"],
                temp["storage_addr"],
                temp["func_sign"],
                temp["block_number"],
                temp["caller"],
                temp["call_site"],
                temp["level"],
            )
            for external_call in contracts[temp_key].external_calls:
                if (
                    external_call["logic_addr"] != ""
                    and external_call["storage_addr"] != ""
                    and external_call["funcSign"] != ""
                ):
                    pending.append(
                        {
                            "platform": temp["platform"],
                            "logic_addr": external_call["logic_addr"],
                            "storage_addr": external_call["storage_addr"],
                            "func_sign": external_call["funcSign"],
                            "block_number": temp["block_number"],
                            "caller": external_call["caller"],
                            "call_site": external_call["call_site"],
                            "level": temp["level"] + 1,
                            "caller_func_sign": temp["func_sign"],
                        }
                    )
