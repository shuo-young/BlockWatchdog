# Dataset

The dataset of attacker contracts extracted from 281 collected incidents.

## Content

### Incidents

- `collected_281reports.xlsx`: collected attack incidents.
- `attacker_contracts.xlsx`: extracted attacker contracts information from `collected_281reports.xlsx`.

### Extracted Attacker Contracts

- BadRandomness: **3**
- DoS: **4**
- Flashloan: **4**
- Others:  **4**
- ***Reentrancy: 18***

## Reentrancy Type Summary

### Reentrancy Type

1. Typical *call.value()*: related to Ether transfer.
2. ERC Hook: fixed signature of ERC hook functions, e.g. *onERC721Received()*, *onERC1155Received()*.
3. User-defined interface: e.g. *IVisor(to).f*, IVisor is a *interface* which contains user-defined function *f*.
