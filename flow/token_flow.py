# record tokens flow in the attack contract

# flashloan token A
# callback swap A to B
# callback claim token B at a higher price
# callback swap B to A'
# repay flashloan token A
# profit A'-A


# TODO
# mark current contract's token balance flow graph through swap, transfer, flashloan, etc.
class TokenFlowAnalysis:
    def __init__(self, source, contracts):
        self.source = source
        self.contracts = contracts
        flashloan_funcSigns = []
        self.flashloan = {
            "bool": False,
            "pool_address": "",
            "token_address": "",
            "amount": "",
        }
        self.extracted_tokens = {}
        self.token_flows = []

    def new_token_flow(self, token_from, token_to, amount, address):
        self.token_flows.append(
            {
                "from": token_from,
                "to": token_to,
                "amount": amount,
                "address": address,
            }
        )

    def set_token_flows(self):
        for key in self.contracts.keys():
            temp_address = key.split("_")[2]
            temp_funcSign = key.split("_")[3]
            external_calls = self.contracts[key].external_calls
            for ec in external_calls:
                if ec["transfer_target"] != "":
                    self.new_token_flow(
                        ec["caller"],
                        ec["transfer_target"],
                        "",
                        ec["logic_addr"],  # token address
                    )
        print("recovered token flows")
        print(self.token_flows)

    def analysis(self):
        for key in self.contracts.keys():
            temp_address = key.split("_")[2]
            temp_funcSign = key.split("_")[3]
            if self.contracts[key].level == 1:
                if temp_funcSign in self.flashloan_funcSigns:
                    self.flashloan["bool"] = True

            external_calls = self.contracts[key].external_calls
            for ec in external_calls:
                if ec["transfer_target"] == self.source:
                    print("transfer token to the input contract")
                    self.extracted_tokens[ec["logic_addr"]] = self.flashloan[
                        "token_address"
                    ]  # extracted token depends on the flashloaned token
                # if token's amount depends on the balanceOf() of the flashloaned token
                # the flashloan attack (price manipulation) is possible
