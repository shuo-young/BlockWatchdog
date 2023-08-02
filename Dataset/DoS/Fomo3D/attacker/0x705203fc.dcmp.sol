// Decompiled by library.dedaub.com
// 2023.03.03 03:32 UTC
// Compiled using the solidity compiler version 0.4.7<=v<0.5.9



// !这个严格来说不算攻击

function () public payable { 
    revert();
}

function play() public nonPayable { 
    require(0xa62142888aba8370742be823c1782d17a0389da1.code.size);
    v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14 = 0xa62142888aba8370742be823c1782d17a0389da1.getCurrentRoundInfo().gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 448);
    assert(0x18a0451ea56fd4ff58f59837e9ec30f346ffdca5 != address(v8));
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__(bytes4 function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length >= 4) {
        if (uint32(function_selector >> 224) == 0x93e84cd9) {
            play();
        }
    }
    ();
}
