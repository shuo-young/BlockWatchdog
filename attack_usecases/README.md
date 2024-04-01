# Record Real-World Attack Cases to Test BlockWatchdog's Functionality

## From DeFiHackLabs

1. Zongzi: Price Manipulation
   
   [PoC](https://github.com/SunWeb3Sec/DeFiHackLabs/blob/main/src/test/ZongZi_exp.sol)

   Tx trace： https://phalcon.blocksec.com/explorer/tx/bsc/0x247f4b3dbde9d8ab95c9766588d80f8dae835129225775ebd05a6dd2c69cd79f

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

2. Woofi: Price Manipulation

   [PoC](https://github.com/SunWeb3Sec/DeFiHackLabs/blob/main/src/test/Woofi_exp.sol)

   Tx trace: https://arbiscan.io/tx/0x57e555328b7def90e1fc2a0f7aa6df8d601a8f15803800a5aaf0a20382f21fbd
   
   
3. EDG Finance: Price Manipulation

   [PoC](https://github.com/SunWeb3Sec/DeFiHackLabs/tree/main/academy/onchain_debug/03_write_your_own_poc/)

   Tx trace: https://phalcon.blocksec.com/explorer/tx/bsc/0x50da0b1b6e34bce59769157df769eb45fa11efc7d0e292900d6b0a86ae66a2b3

   Reentrancy call to `swap()` and `swapExactTokensForTokensSupportingFeeOnTransferTokens()` in the `pancakeCall()` covered by BlockWatchdog.

   block: `20245540`, platform: `BSC`

4. Citadel Finance: Price Manipulation

   [PoC](https://github.com/SunWeb3Sec/DeFiHackLabs/blob/main/src/test/CitadelFinance_exp.sol)

   Tx trace: https://phalcon.blocksec.com/explorer/tx/arbitrum/0xf52a681bc76df1e3a61d9266e3a66c7388ef579d62373feb4fd0991d36006855
   
5. BurnsDefi: Price Manipulation

   [PoC](https://github.com/SunWeb3Sec/DeFiHackLabs/blob/main/src/test/BurnsDefi_exp.sol)

   Tx trace: https://phalcon.blocksec.com/explorer/tx/bsc/0x1d0af3a963682748493f21bf9e955ce3a950bee5817401bf2486db7a0af104b4