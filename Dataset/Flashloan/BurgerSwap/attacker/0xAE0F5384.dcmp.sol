// Decompiled by library.dedaub.com
// 2023.01.13 06:13 UTC

// Data structures and variables inferred from the use of storage instructions
address stor_0_0_19; // STORAGE[0x0] bytes 0 to 19
address stor_2_0_19; // STORAGE[0x2] bytes 0 to 19
uint160 stor_3_0_19; // STORAGE[0x3] bytes 0 to 19
uint160 stor_4_0_19; // STORAGE[0x4] bytes 0 to 19
uint160 stor_5_0_19; // STORAGE[0x5] bytes 0 to 19
uint160 ___function_selector__; // STORAGE[0x6] bytes 0 to 19


// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__() public nonPayable { 
    stor_0_0_19 = msg.sender;
    stor_2_0_19 = 0xae9269f27437f0fcbc232d39ec814844a51d6b8f;
    stor_3_0_19 = 0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c;
    stor_5_0_19 = 0xbf6527834dbb89cdc97a79fcd62e6c08b19f8ec0;
    ___function_selector__ = 0xd0dd735851c1ca61d0324291ccd3959d2153a88d;
    stor_4_0_19 = 0xca143ce32fe78f1f7019d7d551a6402fc5350c73;
    require(0xae9269f27437f0fcbc232d39ec814844a51d6b8f.code.size);
    v0, v1 = 0xae9269f27437f0fcbc232d39ec814844a51d6b8f.approve(0xbf6527834dbb89cdc97a79fcd62e6c08b19f8ec0, 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff).gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v1 == v1);
    require(stor_2_0_19.code.size);
    v2, v3 = stor_2_0_19.approve(___function_selector__, 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff).gas(msg.gas);
    require(v2); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v3 == v3);
    return MEM[0 len 12527];
}
