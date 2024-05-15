# Record Real-World Attack Cases to Test BlockWatchdog's Functionality

## From DeFiHackLabs (Updated on 05-11)

| **Name**            | **Time**   | **Detectable** | **Tags** | **PoC**                                                                                      | **Tx**                                                                                                                |
| ------------------- | ---------- | -------------- | -------- | -------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| **Saturn**          | 2024.5.7   | No             | analyzed | https://github.com/SunWeb3Sec/DeFiHackLabs/blob/main/src/test/2024-05/SATURN_exp.sol         | https://app.blocksec.com/explorer/tx/bsc/0x948132f219c0a1adbffbee5d9dc63bec676dd69341a6eca23790632cb9475312           |
| **Z123**            | 2024.4.22  | Maybe          | analyzed | https://github.com/SunWeb3Sec/DeFiHackLabs/blob/main/src/test/Z123_exp.sol                   | https://app.blocksec.com/explorer/tx/bsc/0xc0c4e99a76da80a4cf43d3110364840151226c0a197c1728bb60dc3f1b3a6a27           |
| **FIL314**          | 2024.4.12  | No             | analyzed | https://github.com/SunWeb3Sec/DeFiHackLabs/blob/main/src/test/2024-04/FIL314_exp.sol         | https://app.blocksec.com/explorer/tx/bsc/0x9f2eb13417190e5139d57821422fc99bced025f24452a8b31f7d68133c9b0a6c           |
| **WSM**             | 2024.4.4   | Maybe          | analyzed | https://github.com/SunWeb3Sec/DeFiHackLabs/blob/main/src/test/2024-04/WSM_exp.sol            | https://app.blocksec.com/explorer/tx/bsc/0x5a475a73343519f899527fdb9850f68f8fc73168073c72a3cff8c0c7b8a1e520           |
| **Zongzi**          | 2024.3.25  | No             | analyzed | https://github.com/SunWeb3Sec/DeFiHackLabs/blob/main/src/test/2024-03/ZongZi_exp.sol         | https://app.blocksec.com/explorer/tx/bsc/0x247f4b3dbde9d8ab95c9766588d80f8dae835129225775ebd05a6dd2c69cd79f           |
| **Woofi**           | 2024.3.5   | No             | analyzed | https://github.com/SunWeb3Sec/DeFiHackLabs/blob/main/src/test/2024-03/Woofi_exp.sol          | https://app.blocksec.com/explorer/tx/arbitrum/0x57e555328b7def90e1fc2a0f7aa6df8d601a8f15803800a5aaf0a20382f21fbd      |
| **BurnsDefi**       | 2024.2.5   | Yes            | analyzed | https://github.com/SunWeb3Sec/DeFiHackLabs/blob/main/src/test/2024-02/BurnsDefi_exp.sol      | https://app.blocksec.com/explorer/tx/bsc/0x1d0af3a963682748493f21bf9e955ce3a950bee5817401bf2486db7a0af104b4           |
| **CitadelFinance**  | 2024.1.27  | Yes            | analyzed | https://github.com/SunWeb3Sec/DeFiHackLabs/blob/main/src/test/2024-01/CitadelFinance_exp.sol | https://app.blocksec.com/explorer/tx/arbitrum/0xf52a681bc76df1e3a61d9266e3a66c7388ef579d62373feb4fd0991d36006855      |
| **Gamma**           | 2024.1.4   | No             | analyzed | https://github.com/SunWeb3Sec/DeFiHackLabs/blob/main/src/test/2024-01/Gamma_exp.sol          | https://app.blocksec.com/explorer/tx/arbitrum/0x025cf2858723369d606ee3abbc4ec01eab064a97cc9ec578bf91c6908679be75      |
| **ElephantStatus`** | 2023.12.6  | Yes            | analyzed | https://github.com/SunWeb3Sec/DeFiHackLabs/blob/main/src/test/others/ElephantStatus_exp.sol  | https://app.blocksec.com/explorer/tx/bsc/0xd423ae0e95e9d6c8a89dcfed243573867e4aad29ee99a9055728cbbe0a523439           |
| **Token8633_9419**  | 2023.11.17 | Yes            | analyzed | https://github.com/SunWeb3Sec/DeFiHackLabs/blob/main/src/test/others/Token8633_9419_exp.sol  | https://app.blocksec.com/explorer/tx/bsc/0xf6ec3c22b718c3da17746416992bac7b65a4ef42ccf5b43cf0716c82bffc2844           |
| **MicDao**          | 2023.10.18 | Yes            | analyzed | https://github.com/SunWeb3Sec/DeFiHackLabs/blob/main/src/test/others/MicDao_exp.sol          | https://app.blocksec.com/explorer/tx/bsc/0x24a2fbb27d433d91372525954f0d7d1af7509547b9ada29cc6c078e732c6d075?line=3843 |
| **BelugaDex**       | 2023.10.13 | Yes            | analyzed | https://github.com/SunWeb3Sec/DeFiHackLabs/blob/main/src/test/others/BelugaDex_exp.sol       | https://app.blocksec.com/explorer/tx/arbitrum/0x57c96e320a3b885fabd95dd476d43c0d0fb10500d940d9594d4a458471a87abe      |

## Some Quick Notes

### Z123: Price Manipulation

   getAmount()'s price calculation logic is vulnerable and attacker contract exploited by setting the address(this) to obtain the Z123 token transfer to itself.

   Although the interacted flashloan pool's address was conveyed from the tx input, the bad behavior in the flashloan callback is also identified by BlockWatchdog to label it as malicious.

### Zongzi: Price Manipulation

   Reentrancy attack feature covered by BlockWatchdog.

   Attack path:
   
   1. flashloan WBNB `swap()`
   2. control call flow in `pancakeCall()`
      1. call helper contract to exploit
      2. swap WBNB to ZZ
      3. swap ZZ to WBNB
      4. swap WBNB to ZZ
      5. swap ZZ to WBNB
      6. calculate amountOut through `getAmountsIn()`
      7. burn ZZ with calculated amountOut which calls `getAmountOut()` (manipulate price)
      8. claim reward with higher ZZ price
      9. swap ZZ to WBNB (much more than loaned)
      10. payback loaned WBNB and withdrawl attack reward

### Woofi: Price Manipulation

   Price oracle issues in the postPrice function. However, the attacker contract created a contract to launch the attack and makes it difficult to detect without tx info.

   
### EDG Finance: Price Manipulation

   Reentrancy call to `swap()` and `swapExactTokensForTokensSupportingFeeOnTransferTokens()` in the `pancakeCall()` covered by BlockWatchdog.

   block: `20245540`, platform: `BSC`

### Citadel Finance and BurnsDefi: Price Manipulation

   getAmount bad price oracle and the attacker contract self destructed after the attack.