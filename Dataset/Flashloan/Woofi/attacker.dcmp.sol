// Decompiled by library.dedaub.com
// 2024.03.30 05:42 UTC
// Compiled using the solidity compiler version 0.8.18


// Data structures and variables inferred from the use of storage instructions
uint256 stor_0_0_19; // STORAGE[0x0] bytes 0 to 19
uint256 stor_1_0_19; // STORAGE[0x1] bytes 0 to 19
uint256 stor_2_0_19; // STORAGE[0x2] bytes 0 to 19
uint256 stor_3_0_19; // STORAGE[0x3] bytes 0 to 19
uint256 stor_4_0_19; // STORAGE[0x4] bytes 0 to 19
uint256 stor_5_0_19; // STORAGE[0x5] bytes 0 to 19
uint256 stor_6_0_19; // STORAGE[0x6] bytes 0 to 19
uint256 stor_7_0_19; // STORAGE[0x7] bytes 0 to 19
uint256 _uniswapV3SwapCallback; // STORAGE[0x8] bytes 0 to 19



function uniswapV3SwapCallback(int256 amount0Delta, int256 amount1Delta, bytes data) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 96);
    require(data <= uint64.max);
    require(4 + data + 31 < 4 + (msg.data.length - 4));
    require(data.length <= uint64.max);
    require(data.data + data.length <= 4 + (msg.data.length - 4));
    require(address(tx.origin) == _uniswapV3SwapCallback);
    if (amount0Delta > 0) {
        v0, /* address */ v1 = msg.sender.token0().gas(msg.gas);
        require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        0x2bbd(v1);
        require(bool((address(v1)).code.size));
        v2 = address(v1).transfer(msg.sender, amount0Delta).gas(msg.gas);
        require(bool(v2), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    }
    if (amount1Delta > 0) {
        v3, /* address */ v4 = msg.sender.token1().gas(msg.gas);
        require(bool(v3), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        0x2bbd(v4);
        require(bool((address(v4)).code.size));
        v5 = address(v4).transfer(msg.sender, amount1Delta).gas(msg.gas);
        require(bool(v5), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    }
}

function 0x21d7() private { 
    v0 = stor_4_0_19.state(stor_0_0_19).gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    v1 = 0x3555(MEM[64], MEM[64] + RETURNDATASIZE());
    v2, /* uint256 */ v3 = stor_0_0_19.balanceOf(address(this)).gas(msg.gas);
    require(bool(v2), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x2da5(v3);
    v4 = 0x3582(0x6f05b59d3b20000, v1.word2);
    v5 = 0x35b3(v4, 10 ** 8);
    v6 = 0x35f0(uint64(v5), v1.word0);
    v7 = 0x3621(v6, 10 ** 18);
    v8 = 0x365e(v7, 0x2c68af0bb140000);
    if (uint128(v8) > v3) {
        v9 = _SafeSub(uint128(v8), v3);
        v10 = _SafeDiv(v9, 10 ** 12);
        v11 = _SafeMul(v10, 6);
        v12 = _SafeDiv(v11, 10);
        if (v12 <= 10 ** 11) {
            require(bool(stor_1_0_19.code.size));
            v13 = stor_1_0_19.transfer(stor_3_0_19, v12).gas(msg.gas);
            require(bool(v13), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
            v14, /* uint256 */ v15 = stor_3_0_19.swap(stor_1_0_19, stor_0_0_19, v12, 0, address(this), address(this)).gas(msg.gas);
            require(bool(v14), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
            MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
            require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
            0x2da5(v15);
        } else {
            require(bool(stor_1_0_19.code.size));
            v16 = stor_1_0_19.transfer(stor_3_0_19, 10 ** 11).gas(msg.gas);
            require(bool(v16), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
            v17, /* uint256 */ v18 = stor_3_0_19.swap(stor_1_0_19, stor_0_0_19, 10 ** 11, 0, address(this), address(this)).gas(msg.gas);
            require(bool(v17), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
            MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
            require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
            0x2da5(v18);
        }
    }
    return ;
}

function 0x2bbd(address varg0) private { 
    return ;
}

function 0x2da5(uint256 varg0) private { 
    return ;
}

function 0x2f4b(uint128 varg0) private { 
    return ;
}

function _SafeMul(uint256 varg0, uint256 varg1) private { 
    require(!varg0 | (varg1 == varg0 * varg1 / varg0), Panic(17)); // arithmetic overflow or underflow
    return varg0 * varg1;
}

function _SafeDiv(uint256 varg0, uint256 varg1) private { 
    require(varg1, Panic(18)); // division by zero
    return varg0 / varg1;
}

function _SafeAdd(uint256 varg0, uint256 varg1) private { 
    require(varg0 <= varg0 + varg1, Panic(17)); // arithmetic overflow or underflow
    return varg0 + varg1;
}

function 0x3555(uint256 varg0, uint256 varg1) private { 
    require(varg1 - varg0 >= 128);
    require(varg1 - varg0 >= 128);
    v0 = new struct(4);
    require(!((v0 + 128 > uint64.max) | (v0 + 128 < v0)), Panic(65)); // failed memory allocation (too much memory)
    0x2f4b(MEM[varg0]);
    v0.word0 = MEM[varg0];
    require(MEM[varg0 + 32] == uint64(MEM[varg0 + 32]));
    v0.word1 = MEM[varg0 + 32];
    require(MEM[varg0 + 64] == uint64(MEM[varg0 + 64]));
    v0.word2 = MEM[varg0 + 64];
    require(MEM[varg0 + 96] == bool(MEM[varg0 + 96]));
    v0.word3 = MEM[varg0 + 96];
    return v0;
}

function 0x3582(uint64 varg0, uint64 varg1) private { 
    require(varg1, Panic(18)); // division by zero
    return varg0 / varg1;
}

function 0x35b3(uint64 varg0, uint64 varg1) private { 
    require(uint64(varg0 * varg1) == varg0 * varg1, Panic(17)); // arithmetic overflow or underflow
    return uint64(varg0 * varg1);
}

function 0x35f0(uint128 varg0, uint128 varg1) private { 
    require(varg1, Panic(18)); // division by zero
    return varg0 / varg1;
}

function 0x3621(uint128 varg0, uint128 varg1) private { 
    require(uint128(varg0 * varg1) == varg0 * varg1, Panic(17)); // arithmetic overflow or underflow
    return uint128(varg0 * varg1);
}

function 0x365e(uint128 varg0, uint128 varg1) private { 
    require(varg0 - varg1 <= uint128.max, Panic(17)); // arithmetic overflow or underflow
    return varg0 - varg1;
}

function _SafeSub(uint256 varg0, uint256 varg1) private { 
    require(varg0 - varg1 <= varg0, Panic(17)); // arithmetic overflow or underflow
    return varg0 - varg1;
}

function 0x3b49(address varg0, address varg1) private { 
    require(!varg0 | (varg1 == address(address(varg0) * address(varg1)) / varg0), Panic(17)); // arithmetic overflow or underflow
    return address(address(varg0) * address(varg1));
}

function 0x3b8b(address varg0, address varg1) private { 
    require(varg1, Panic(18)); // division by zero
    return varg0 / varg1;
}

function 0x3c58(uint256 varg0) private { 
    require(varg0 - int256.min, Panic(17)); // arithmetic overflow or underflow
    return 0 - varg0;
}

function 0x1faa6b87(address varg0, address varg1, address varg2, uint256 varg3, uint256 varg4, bytes varg5) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 192);
    0x2bbd(varg0);
    require(varg5 <= uint64.max);
    require(4 + varg5 + 31 < 4 + (msg.data.length - 4));
    require(varg5.length <= uint64.max);
    require(varg5.data + varg5.length <= 4 + (msg.data.length - 4));
    require(address(tx.origin) == _uniswapV3SwapCallback);
    require(varg5.data + varg5.length - varg5.data >= 64);
    0x2f4b(varg5[0]);
    0x2f4b(varg5[32][32]);
    v0, /* uint256 */ v1, /* uint256 */ v2 = stor_5_0_19.deposit(stor_1_0_19, 0x65dd0837000, True).gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 64);
    0x2da5(v1);
    0x2da5(v2);
    v3, /* uint256 */ v4 = stor_5_0_19.liquidity(stor_0_0_19).gas(msg.gas);
    require(bool(v3), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x2da5(v4);
    v5, /* uint256 */ v6, /* uint256 */ v7 = stor_5_0_19.borrow(stor_0_0_19, v4).gas(msg.gas);
    require(bool(v5), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 64);
    0x2da5(v6);
    0x2da5(v7);
    require(bool(stor_1_0_19.code.size));
    v8 = stor_1_0_19.transfer(stor_3_0_19, 0x1d1a94a2000).gas(msg.gas);
    require(bool(v8), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    v9, /* uint256 */ v10 = stor_3_0_19.swap(stor_1_0_19, stor_2_0_19, 0x1d1a94a2000, 0, address(this), address(this)).gas(msg.gas);
    require(bool(v9), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x2da5(v10);
    0x21d7();
    0x21d7();
    0x21d7();
    0x21d7();
    v11 = stor_4_0_19.state(stor_0_0_19).gas(msg.gas);
    require(bool(v11), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    v12 = 0x3555(MEM[64], MEM[64] + RETURNDATASIZE());
    v13 = 0x3582(0x6f05b59d3b20000, v12.word2);
    v14 = 0x35b3(v13, 10 ** 8);
    v15 = 0x35f0(uint64(v14), v12.word0);
    v16 = 0x3621(v15, 10 ** 18);
    v17 = 0x365e(v16, 0x2c68af0bb140000);
    v18, /* uint256 */ v19 = stor_0_0_19.balanceOf(address(this)).gas(msg.gas);
    require(bool(v18), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x2da5(v19);
    require(bool(stor_0_0_19.code.size));
    v20 = stor_0_0_19.transfer(stor_3_0_19, uint128(v17)).gas(msg.gas);
    require(bool(v20), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    v21, /* uint256 */ v22 = stor_3_0_19.swap(stor_0_0_19, stor_1_0_19, uint128(v17), 0, address(this), address(this)).gas(msg.gas);
    require(bool(v21), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x2da5(v22);
    v23 = stor_4_0_19.state(stor_0_0_19).gas(msg.gas);
    require(bool(v23), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    v24 = 0x3555(MEM[64], MEM[64] + RETURNDATASIZE());
    v25, /* uint256 */ v26 = stor_3_0_19.poolSize(stor_0_0_19).gas(msg.gas);
    require(bool(v25), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x2da5(v26);
    require(uint64(10 ** 18) - uint64(v24.word1) <= uint64.max, Panic(17)); // arithmetic overflow or underflow
    v27 = _SafeMul(v26, uint128(v24.word0));
    v28 = _SafeDiv(v27, uint64(uint64(10 ** 18) - uint64(v24.word1)));
    v29 = _SafeDiv(v28, 100);
    require(bool(stor_1_0_19.code.size));
    v30 = stor_1_0_19.transfer(stor_3_0_19, v29).gas(msg.gas);
    require(bool(v30), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    v31, /* uint256 */ v32 = stor_3_0_19.swap(stor_1_0_19, stor_0_0_19, v29, 0, address(this), address(this)).gas(msg.gas);
    require(bool(v31), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x2da5(v32);
    v33, /* uint256 */ v34, /* uint256 */ v35 = stor_5_0_19.repay(stor_0_0_19, uint256.max).gas(msg.gas);
    require(bool(v33), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 64);
    0x2da5(v34);
    0x2da5(v35);
    v36, /* uint256 */ v37, /* uint256 */ v38 = stor_5_0_19.withdraw(stor_1_0_19, uint256.max, True).gas(msg.gas);
    require(bool(v36), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 64);
    0x2da5(v37);
    0x2da5(v38);
    v39 = _SafeMul(uint128(varg5[0]), 0xf4245);
    v40 = _SafeDiv(v39, 10 ** 6);
    v41 = _SafeAdd(v40, 1);
    require(bool(stor_0_0_19.code.size));
    v42 = stor_0_0_19.transfer(msg.sender, v41).gas(msg.gas);
    require(bool(v42), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    return 0xab5c473bce5960a8292e9c8db82f9272504caab4e9ef09553fc112f82b62a3c2;
}

function receive() public payable { 
}

function 0xa2f09eeb() public nonPayable { 
    require(bool(stor_0_0_19.code.size));
    v0 = stor_0_0_19.approve(stor_3_0_19, uint256.max).gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(bool(stor_0_0_19.code.size));
    v1 = stor_0_0_19.approve(stor_5_0_19, uint256.max).gas(msg.gas);
    require(bool(v1), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(bool(stor_1_0_19.code.size));
    v2 = stor_1_0_19.approve(stor_3_0_19, uint256.max).gas(msg.gas);
    require(bool(v2), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(bool(stor_1_0_19.code.size));
    v3 = stor_1_0_19.approve(stor_5_0_19, uint256.max).gas(msg.gas);
    require(bool(v3), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    v4, /* uint256 */ v5 = stor_1_0_19.balanceOf(stor_7_0_19).gas(msg.gas);
    require(bool(v4), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x2da5(v5);
    v6 = _SafeSub(v5, 10 ** 10);
    v7 = new uint256[](32);
    v8 = v9 = 0;
    while (v8 < 32) {
        MEM[v7.data + v8] = MEM[MEM[64] + 32 + v8];
        v8 = v8 + 32;
    }
    MEM[v7.data + 32] = 0;
    require(bool(stor_7_0_19.code.size));
    v10 = stor_7_0_19.flash(address(this), 0, v6, v7, v11, uint8(1)).gas(msg.gas);
    require(bool(v10), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    v12, /* uint256 */ v13 = stor_0_0_19.balanceOf(address(this)).gas(msg.gas);
    require(bool(v12), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x2da5(v13);
    v14, /* uint256 */ v15 = stor_1_0_19.balanceOf(address(this)).gas(msg.gas);
    require(bool(v14), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x2da5(v15);
    v16, /* uint256 */ v17 = stor_2_0_19.balanceOf(address(this)).gas(msg.gas);
    require(bool(v16), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x2da5(v17);
    v18, /* uint256 */ v19 = stor_1_0_19.balanceOf(address(this)).gas(msg.gas);
    require(bool(v18), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x2da5(v19);
    v20, /* address */ v21 = stor_7_0_19.token0().gas(msg.gas);
    require(bool(v20), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x2bbd(v21);
    v22, /* address */ v23 = stor_7_0_19.token1().gas(msg.gas);
    require(bool(v22), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x2bbd(v23);
    v24, /* address */ v25, /* int24 */ v26, /* uint16 */ v27, /* uint16 */ v28, /* uint16 */ v29, /* uint8 */ v30, /* bool */ v31 = stor_7_0_19.slot0().gas(msg.gas);
    require(bool(v24), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 224);
    require(v25 == address(v25));
    require(v26 == int24(v26));
    require(v27 == uint16(v27));
    require(v28 == uint16(v28));
    require(v29 == uint16(v29));
    require(v30 == uint8(v30));
    require(v31 == bool(v31));
    if (0) {
        if (stor_1_0_19 - address(v21)) {
            v32 = 0x3c58(v19);
            v33 = 0x3b49(v25, 100);
            v34 = 0x3b8b(v33, 95);
            v35 = new uint256[](0);
            require(bool(stor_7_0_19.code.size));
            v36 = stor_7_0_19.swap(address(this), False, v32, address(v34), v35).gas(msg.gas);
            require(bool(v36), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        } else {
            v37 = 0x3c58(v19);
            v38 = 0x3b49(v25, 95);
            v39 = 0x3b8b(v38, 100);
            v40 = new uint256[](0);
            require(bool(stor_7_0_19.code.size));
            v41 = stor_7_0_19.swap(address(this), True, v37, address(v39), v40).gas(msg.gas);
            require(bool(v41), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        }
    } else if (stor_1_0_19 - address(v21)) {
        v42 = 0x3b49(v25, 100);
        v43 = 0x3b8b(v42, 95);
        v44 = new uint256[](0);
        require(bool(stor_7_0_19.code.size));
        v45 = stor_7_0_19.swap(address(this), False, v19, address(v43), v44).gas(msg.gas);
        require(bool(v45), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    } else {
        v46 = 0x3b49(v25, 95);
        v47 = 0x3b8b(v46, 100);
        v48 = new uint256[](0);
        require(bool(stor_7_0_19.code.size));
        v49 = stor_7_0_19.swap(address(this), True, v19, address(v47), v48).gas(msg.gas);
        require(bool(v49), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    }
    v50, /* uint256 */ v51 = stor_2_0_19.balanceOf(address(this)).gas(msg.gas);
    require(bool(v50), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x2da5(v51);
    require(bool(stor_2_0_19.code.size));
    v52 = stor_2_0_19.withdraw(v51).gas(msg.gas);
    require(bool(v52), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    v53 = _uniswapV3SwapCallback.call().value(this.balance).gas(!this.balance * 2300);
    require(bool(v53), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    v54, /* uint256 */ v55 = stor_0_0_19.balanceOf(address(this)).gas(msg.gas);
    require(bool(v54), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x2da5(v55);
    require(bool(stor_0_0_19.code.size));
    v56 = stor_0_0_19.transfer(_uniswapV3SwapCallback, v55).gas(msg.gas);
    require(bool(v56), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
}

function 0xd75d7ccf(address varg0, uint256 varg1) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 64);
    0x2bbd(varg0);
    0x2da5(varg1);
    require(address(tx.origin) == _uniswapV3SwapCallback);
    require(bool((address(varg0)).code.size));
    v0 = varg0.transfer(msg.sender, varg1).gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
}

function uniswapV3FlashCallback(uint256 fee0, uint256 fee1, bytes data) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 96);
    0x2da5(fee0);
    0x2da5(fee1);
    require(data <= uint64.max);
    require(4 + data + 31 < 4 + (msg.data.length - 4));
    require(data.length <= uint64.max);
    require(data.data + data.length <= 4 + (msg.data.length - 4));
    require(address(tx.origin) == _uniswapV3SwapCallback);
    v0, /* address */ v1 = msg.sender.token0().gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x2bbd(v1);
    v2, /* address */ v3 = msg.sender.token1().gas(msg.gas);
    require(bool(v2), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x2bbd(v3);
    v4, /* uint256 */ v5 = address(v1).balanceOf(address(this)).gas(msg.gas);
    require(bool(v4), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x2da5(v5);
    v6, /* uint256 */ v7 = address(v3).balanceOf(address(this)).gas(msg.gas);
    require(bool(v6), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x2da5(v7);
    v8, /* uint256 */ v9 = stor_0_0_19.balanceOf(stor_6_0_19).gas(msg.gas);
    require(bool(v8), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x2da5(v9);
    v10 = _SafeSub(v9, 100);
    v11 = new uint256[](64);
    v12 = v13 = 0;
    while (v12 < 64) {
        MEM[v11.data + v12] = MEM[MEM[64] + 32 + v12];
        v12 = v12 + 32;
    }
    MEM[v11.data + 64] = 0;
    require(bool(stor_6_0_19.code.size));
    v14 = stor_6_0_19.flashLoan(address(this), uint128(v10), v11, v15, uint128(v10), uint128(0)).gas(msg.gas);
    require(bool(v14), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    if (v5 > 0) {
        v16 = _SafeAdd(v5, fee0);
        require(bool((address(v1)).code.size));
        v17 = address(v1).transfer(msg.sender, v16).gas(msg.gas);
        require(bool(v17), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    }
    if (v7 > 0) {
        v18 = _SafeAdd(v7, fee1);
        require(bool((address(v3)).code.size));
        v19 = address(v3).transfer(msg.sender, v18).gas(msg.gas);
        require(bool(v19), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    }
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function function_selector( function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length < 4) {
        require(!msg.data.length);
        receive();
    } else if (0x1faa6b87 == function_selector >> 224) {
        0x1faa6b87();
    } else if (0xa2f09eeb == function_selector >> 224) {
        0xa2f09eeb();
    } else if (0xd75d7ccf == function_selector >> 224) {
        0xd75d7ccf();
    } else if (0xe9cbafb0 == function_selector >> 224) {
        uniswapV3FlashCallback(uint256,uint256,bytes);
    } else {
        require(0xfa461e33 == function_selector >> 224);
        uniswapV3SwapCallback(int256,int256,bytes);
    }
}
