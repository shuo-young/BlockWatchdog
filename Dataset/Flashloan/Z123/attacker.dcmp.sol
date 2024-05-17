// Decompiled by library.dedaub.com
// 2024.04.22 10:09 UTC
// Compiled using the solidity compiler version 0.7.6


// Data structures and variables inferred from the use of storage instructions
mapping (uint256 => mapping (uint256 => uint256)) _balanceOf; // STORAGE[0x2]
uint256 stor_9; // STORAGE[0x9]
uint256 stor_10; // STORAGE[0x10]
uint160 stor_0_0_19; // STORAGE[0x0] bytes 0 to 19
address stor_1_0_19; // STORAGE[0x1] bytes 0 to 19
uint160 stor_3_0_19; // STORAGE[0x3] bytes 0 to 19
address stor_4_0_19; // STORAGE[0x4] bytes 0 to 19
address stor_5_0_19; // STORAGE[0x5] bytes 0 to 19
uint160 stor_7_0_19; // STORAGE[0x7] bytes 0 to 19
address stor_a_0_19; // STORAGE[0xa] bytes 0 to 19
address stor_c_0_19; // STORAGE[0xc] bytes 0 to 19
uint160 _underlying; // STORAGE[0xd] bytes 0 to 19
uint160 _controller; // STORAGE[0xe] bytes 0 to 19
address stor_11_0_19; // STORAGE[0x11] bytes 0 to 19
address stor_12_0_19; // STORAGE[0x12] bytes 0 to 19
uint160 stor_13_0_19; // STORAGE[0x13] bytes 0 to 19



function 0x101e(uint256 varg0, uint256 varg1) private { 
    require(2 <= uint64.max);
    v0 = new address[](2);
    if (2) {
        CALLDATACOPY(v0.data, msg.data.length, 64);
    }
    assert(0 < v0.length);
    v1 = v0.data;
    v0[0] = address(0xb000f121a173d7dd638bb080fee669a2f3af9760);
    assert(1 < v0.length);
    v0[1] = address(0x55d398326f99059ff775485246999027b3197955);
    require(bool((address(0xb000f121a173d7dd638bb080fee669a2f3af9760)).code.size));
    v2, /* bool */ v3 = address(0xb000f121a173d7dd638bb080fee669a2f3af9760).approve(address(0x6125c643a2d4a927acd63c1185c6be902efd5dc8), 10 ** 38).gas(msg.gas);
    require(bool(v2), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v3 == bool(v3));
    v4 = v5 = 0;
    while (v4 < varg0) {
        v6 = new address[](v0.length);
        v7 = v8 = v6.data;
        v9 = v10 = v0.data;
        v11 = v12 = 0;
        while (v11 < v0.length) {
            MEM[v7] = address(MEM[v9]);
            v7 = v7 + 32;
            v9 = v9 + 32;
            v11 = v11 + 1;
        }
        require(bool((address(0x6125c643a2d4a927acd63c1185c6be902efd5dc8)).code.size));
        v13 = address(0x6125c643a2d4a927acd63c1185c6be902efd5dc8).swapExactTokensForTokensSupportingFeeOnTransferTokens(varg1, 1, v6, address(this), 0x3d9dc07059b, v14, address(0xb000f121a173d7dd638bb080fee669a2f3af9760)).gas(msg.gas);
        require(bool(v13), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        v4 += 1;
    }
    return ;
}

function 0x22f04aad(uint256 varg0) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 32);
    0x30b7(varg0);
    require(msg.sender == address(0x3026c464d3bd6ef0ced0d49e80f171b58176ce32));
    v0 = address(0x3026c464d3bd6ef0ced0d49e80f171b58176ce32).call().value(varg0).gas(!varg0 * 2300);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
}

function 0x1294(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3) private { 
    require(2 <= uint64.max);
    v0 = new address[](2);
    if (2) {
        CALLDATACOPY(v0.data, msg.data.length, 64);
    }
    assert(0 < v0.length);
    v1 = v0.data;
    v0[0] = stor_3_0_19;
    assert(1 < v0.length);
    v0[1] = stor_0_0_19;
    require(2 <= uint64.max);
    v2 = new address[](2);
    if (2) {
        CALLDATACOPY(v2.data, msg.data.length, 64);
    }
    assert(0 < v2.length);
    v3 = v2.data;
    v2[0] = stor_0_0_19;
    assert(1 < v2.length);
    v2[1] = stor_3_0_19;
    require(bool(stor_12_0_19.code.size));
    v4, /* uint256 */ v5 = stor_12_0_19.balanceOf(address(this)).gas(msg.gas);
    require(bool(v4), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x30b7(v5);
    require(bool(stor_12_0_19.code.size));
    v6, /* bool */ v7 = stor_12_0_19.approve(stor_c_0_19, 10 ** 30).gas(msg.gas);
    require(bool(v6), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v7 == bool(v7));
    v8 = new address[](v0.length);
    v9 = v10 = v8.data;
    v11 = v12 = v0.data;
    v13 = v14 = 0;
    while (v13 < v0.length) {
        MEM[v9] = address(MEM[v11]);
        v9 = v9 + 32;
        v11 = v11 + 32;
        v13 = v13 + 1;
    }
    require(bool(stor_c_0_19.code.size));
    v15 = stor_c_0_19.swapExactTokensForTokensSupportingFeeOnTransferTokens(v5, 1, v8, address(this), 0x77b2bae01, v16, stor_3_0_19).gas(msg.gas);
    require(bool(v15), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(bool(stor_11_0_19.code.size));
    v17, /* bool */ v18 = stor_11_0_19.approve(address(0x6125c643a2d4a927acd63c1185c6be902efd5dc8), 10 ** 33).gas(msg.gas);
    require(bool(v17), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v18 == bool(v18));
    require(bool(stor_11_0_19.code.size));
    v19, /* uint256 */ v20 = stor_11_0_19.balanceOf(address(this)).gas(msg.gas);
    require(bool(v19), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x30b7(v20);
    v21 = v22 = 0;
    while (v21 < stor_10) {
        v23 = new address[](v2.length);
        v24 = v25 = v23.data;
        v26 = v27 = v2.data;
        v28 = v29 = 0;
        while (v28 < v2.length) {
            MEM[v24] = address(MEM[v26]);
            v24 = v24 + 32;
            v26 = v26 + 32;
            v28 = v28 + 1;
        }
        require(bool((address(0x6125c643a2d4a927acd63c1185c6be902efd5dc8)).code.size));
        v30 = address(0x6125c643a2d4a927acd63c1185c6be902efd5dc8).swapExactTokensForTokensSupportingFeeOnTransferTokens(stor_9, 1, v23, address(this), 0x3d9dc07059b, v16, stor_0_0_19).gas(msg.gas);
        require(bool(v30), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        v21 += 1;
    }
    assert(0x186a0);
    require(bool(stor_12_0_19.code.size));
    v31, /* bool */ v32 = stor_12_0_19.transfer(address(0x36696169c63e42cd08ce11f5deebbcebae652050), v5 * 0x186d3 / 0x186a0).gas(msg.gas);
    require(bool(v31), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v32 == bool(v32));
    require(bool(stor_12_0_19.code.size));
    v33, /* uint256 */ v34 = stor_12_0_19.balanceOf(address(this)).gas(msg.gas);
    require(bool(v33), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x30b7(v34);
    require(bool(stor_12_0_19.code.size));
    v35, /* bool */ v36 = stor_12_0_19.transfer(address(0x3026c464d3bd6ef0ced0d49e80f171b58176ce32), v34).gas(msg.gas);
    require(bool(v35), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v36 == bool(v36));
    return ;
}

function 0x26bf5c42(uint256 varg0, address varg1, uint256 varg2) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 96);
    0x30b7(varg0);
    0x3072(varg1);
    0x30b7(varg2);
    0x62b(varg2, varg1, varg0);
}

function 0x6c630edb(address varg0, uint256 varg1, address varg2, uint256 varg3, uint256 varg4) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 160);
    0x3072(varg0);
    0x30b7(varg1);
    0x3072(varg2);
    0x30b7(varg3);
    0x30b7(varg4);
    0xba9(varg4, varg3, varg2, varg1, varg0);
}

function underlying() public nonPayable { 
    return _underlying;
}

function DPPFlashLoanCall(address sender, uint256 baseAmount, uint256 quoteAmount, bytes data) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 128);
    0x3072(sender);
    0x30b7(baseAmount);
    0x30b7(quoteAmount);
    require(data <= uint64.max);
    require(4 + data + 31 < 4 + (msg.data.length - 4));
    require(data.length <= uint64.max);
    require(data.data + data.length <= 4 + (msg.data.length - 4));
    0x1d0d(data.length, data.data, quoteAmount, baseAmount, sender);
}

function 0x1b9a(uint256 varg0, address varg1) private { 
    require(msg.sender == address(0x3026c464d3bd6ef0ced0d49e80f171b58176ce32), Error(78));
    require(bool((address(varg1)).code.size));
    v0, /* bool */ v1 = varg1.transfer(address(0x3026c464d3bd6ef0ced0d49e80f171b58176ce32), varg0).gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v1 == bool(v1));
    return ;
}

function 0x1d0d(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4) private { 
    require(varg1 + varg0 - varg1 >= 96);
    require(msg.data[varg1] == address(msg.data[varg1]));
    require(msg.data[varg1 + 32] == address(msg.data[varg1 + 32]));
    0x30b7(msg.data[varg1 + 64]);
    require(2 <= uint64.max);
    v0 = new uint256[](2);
    if (2) {
        CALLDATACOPY(v0.data, msg.data.length, 64);
    }
    assert(0 < v0.length);
    v1 = v0.data;
    v0[0] = stor_a_0_19;
    assert(1 < v0.length);
    v0[1] = stor_7_0_19;
    require(2 <= uint64.max);
    v2 = new address[](2);
    if (2) {
        CALLDATACOPY(v2.data, msg.data.length, 64);
    }
    assert(0 < v2.length);
    v3 = v2.data;
    v2[0] = stor_1_0_19;
    assert(1 < v2.length);
    v2[1] = stor_a_0_19;
    v4 = new address[](v2.length);
    v5 = v6 = v4.data;
    v7 = v8 = v2.data;
    v9 = v10 = 0;
    while (v9 < v2.length) {
        MEM[v5] = address(MEM[v7]);
        v5 = v5 + 32;
        v7 = v7 + 32;
        v9 = v9 + 1;
    }
    require(bool(stor_4_0_19.code.size));
    v11, /* uint256 */ v12 = stor_4_0_19.swapExactBNBForTokens(1, v4, address(this), 0x621e231bfe, v13, stor_1_0_19).value(stor_10).gas(msg.gas);
    require(bool(v11), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    RETURNDATACOPY(v12, 0, RETURNDATASIZE());
    MEM[64] = v12 + (RETURNDATASIZE() + 31 & ~0x1f);
    require(v12 + RETURNDATASIZE() - v12 >= 32);
    require(MEM[v12] <= uint64.max);
    require(v12 + MEM[v12] + 31 < v12 + RETURNDATASIZE());
    v14 = MEM[v12 + MEM[v12]];
    if (v14 <= uint64.max) {
        v15 = new bytes[](v14);
        if (!((v15 + ((v14 + 31 & ~0x1f) + 32) > uint64.max) | (v15 + ((v14 + 31 & ~0x1f) + 32) < v15))) {
            require(v12 + MEM[v12] + 32 + v14 <= v12 + RETURNDATASIZE());
            v16 = v17 = 0;
            while (v16 < v14) {
                v15[v16] = MEM[v12 + MEM[v12] + 32 + v16];
                v16 = v16 + 32;
            }
            if (v16 > v14) {
                v15[v14] = 0;
            }
            require(bool(stor_a_0_19.code.size));
            v18, /* bool */ v19 = stor_a_0_19.approve(stor_c_0_19, 10 ** 36).gas(msg.gas);
            require(bool(v18), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
            MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
            require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
            require(v19 == bool(v19));
            require(bool((address(msg.data[varg1 + 32])).code.size));
            v20, /* bool */ v21 = address(msg.data[varg1 + 32]).transfer(address(msg.data[varg1]), msg.data[varg1 + 64]).gas(msg.gas);
            require(bool(v20), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
            MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
            require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
            require(v21 == bool(v21));
            require(bool(stor_1_0_19.code.size));
            v22, /* uint256 */ v23 = stor_1_0_19.balanceOf(address(this)).gas(msg.gas);
            require(bool(v22), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
            MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
            require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
            0x30b7(v23);
            require(bool((address(msg.data[varg1 + 32])).code.size));
            v24, /* bool */ v25 = address(msg.data[varg1 + 32]).transfer(address(0x704a07411504fe90d14416f194b1a3cec9f36ad), v23).gas(msg.gas);
            require(bool(v24), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
            MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
            require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
            require(v25 == bool(v25));
            return ;
        }
    }
    throw();
}

function pancakeCall(address _sender, uint256 _amount0, uint256 _amount1, bytes _data) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 128);
    0x3072(_sender);
    0x30b7(_amount0);
    0x30b7(_amount1);
    require(_data <= uint64.max);
    require(4 + _data + 31 < 4 + (msg.data.length - 4));
    require(_data.length <= uint64.max);
    require(_data.data + _data.length <= 4 + (msg.data.length - 4));
    0xca9(_data.length, _data.data, _amount1, _amount0, _sender);
}

function 0x98310034(uint256 varg0, uint256 varg1) public payable { 
    require(4 + (msg.data.length - 4) - 4 >= 64);
    0x30b7(varg0);
    0x30b7(varg1);
    0x101e(varg1, varg0);
}

function 0xa1d48336(uint256 varg0, uint256 varg1, bytes varg2) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 96);
    0x30b7(varg0);
    0x30b7(varg1);
    require(varg2 <= uint64.max);
    require(4 + varg2 + 31 < 4 + (msg.data.length - 4));
    require(varg2.length <= uint64.max);
    require(varg2.data + varg2.length <= 4 + (msg.data.length - 4));
    0x1294(varg2.length, varg2.data, varg1, varg0);
}

function DSPFlashLoanCall(address sender, uint256 baseAmount, uint256 quoteAmount, bytes data) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 128);
    0x3072(sender);
    0x30b7(baseAmount);
    0x30b7(quoteAmount);
    require(data <= uint64.max);
    require(4 + data + 31 < 4 + (msg.data.length - 4));
    require(data.length <= uint64.max);
    require(data.data + data.length <= 4 + (msg.data.length - 4));
    0x1d0d(data.length, data.data, quoteAmount, baseAmount, sender);
}

function DVMFlashLoanCall(address sender, uint256 baseAmount, uint256 quoteAmount, bytes data) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 128);
    0x3072(sender);
    0x30b7(baseAmount);
    0x30b7(quoteAmount);
    require(data <= uint64.max);
    require(4 + data + 31 < 4 + (msg.data.length - 4));
    require(data.length <= uint64.max);
    require(data.data + data.length <= 4 + (msg.data.length - 4));
    0x1d0d(data.length, data.data, quoteAmount, baseAmount, sender);
}

function withdraw(address _user, uint256 _withdrawAmount) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 64);
    0x3072(_user);
    0x30b7(_withdrawAmount);
    0x1b9a(_withdrawAmount, _user);
}

function controller() public nonPayable { 
    return _controller;
}

function balanceOf(address token, address user) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 64);
    0x3072(token);
    0x3072(user);
    return _balanceOf[token][user];
}

function 0x3072(address varg0) private { 
    return ;
}

function 0x30b7(uint256 varg0) private { 
    return ;
}

function receive() public payable { 
}

function 0x326(address varg0, uint256 varg1, address varg2, address varg3, uint256 varg4, address varg5) private { 
    stor_c_0_19 = varg0;
    stor_10 = varg1;
    stor_a_0_19 = varg2;
    require(bool((address(varg5)).code.size));
    v0, /* address */ v1 = varg5._BASE_TOKEN_().gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x3072(v1);
    if (address(v1) != varg3) {
        v2 = new uint256[](96);
        v3 = v4 = 0;
        while (v3 < 96) {
            MEM[v2.data + v3] = MEM[MEM[64] + 32 + v3];
            v3 = v3 + 32;
        }
        if (v3 > 96) {
            MEM[v2.data + 96] = 0;
        }
        require(bool((address(varg5)).code.size));
        v5 = varg5.flashLoan(0, varg4, address(this), v2, v6, varg5, varg3, varg4).gas(msg.gas);
        require(bool(v5), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    } else {
        v7 = new uint256[](96);
        v8 = v9 = 0;
        while (v8 < 96) {
            MEM[v7.data + v8] = MEM[MEM[64] + 32 + v8];
            v8 = v8 + 32;
        }
        if (v8 > 96) {
            MEM[v7.data + 96] = 0;
        }
        require(bool((address(varg5)).code.size));
        v10 = varg5.flashLoan(varg4, 0, address(this), v7, v6, varg5, varg3, varg4).gas(msg.gas);
        require(bool(v10), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    }
    return ;
}

function 0x62b(uint256 varg0, address varg1, uint256 varg2) private { 
    require(2 <= uint64.max);
    v0 = new address[](2);
    if (2) {
        CALLDATACOPY(v0.data, msg.data.length, 64);
    }
    assert(0 < v0.length);
    v1 = v0.data;
    v0[0] = stor_1_0_19;
    assert(1 < v0.length);
    v0[1] = varg1;
    require(2 <= uint64.max);
    v2 = new address[](2);
    if (2) {
        CALLDATACOPY(v2.data, msg.data.length, 64);
    }
    assert(0 < v2.length);
    v3 = v2.data;
    v2[0] = varg1;
    assert(1 < v2.length);
    v2[1] = stor_1_0_19;
    require(bool(stor_1_0_19.code.size));
    v4, /* bool */ v5 = stor_1_0_19.approve(stor_5_0_19, 10 ** 38).gas(msg.gas);
    require(bool(v4), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v5 == bool(v5));
    require(bool((address(varg1)).code.size));
    v6, /* bool */ v7 = varg1.approve(stor_5_0_19, 10 ** 38).gas(msg.gas);
    require(bool(v6), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v7 == bool(v7));
    v8 = v9 = 0;
    while (v8 < varg2) {
        v10 = new address[](v0.length);
        v11 = v12 = v10.data;
        v13 = v14 = v0.data;
        v15 = v16 = 0;
        while (v15 < v0.length) {
            MEM[v11] = address(MEM[v13]);
            v11 = v11 + 32;
            v13 = v13 + 32;
            v15 = v15 + 1;
        }
        require(bool(stor_5_0_19.code.size));
        v17 = stor_5_0_19.swapExactTokensForTokensSupportingFeeOnTransferTokens(varg0, 1, v10, address(this), 0x3eed5cf5404, v18, stor_1_0_19).gas(msg.gas);
        require(bool(v17), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        require(bool((address(varg1)).code.size));
        v19, /* uint256 */ v20 = varg1.balanceOf(address(this)).gas(msg.gas);
        require(bool(v19), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        0x30b7(v20);
        v21 = new address[](v2.length);
        v22 = v23 = v21.data;
        v24 = v25 = v2.data;
        v26 = v27 = 0;
        while (v26 < v2.length) {
            MEM[v22] = address(MEM[v24]);
            v22 = v22 + 32;
            v24 = v24 + 32;
            v26 = v26 + 1;
        }
        require(bool(stor_5_0_19.code.size));
        v28 = stor_5_0_19.swapExactTokensForTokensSupportingFeeOnTransferTokens(v20, 1, v21, address(this), 0x3eed5cf5404, v18, varg1).gas(msg.gas);
        require(bool(v28), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        v8 += 1;
    }
    return ;
}

function 0xba9(uint256 varg0, uint256 varg1, address varg2, uint256 varg3, address varg4) private { 
    stor_10 = varg1;
    stor_9 = varg0;
    stor_c_0_19 = varg2;
    v0 = new uint256[](0);
    v1 = v0.data;
    require(bool((address(varg4)).code.size));
    v2 = varg4.flash(address(this), varg3, 0, v0).gas(msg.gas);
    require(bool(v2), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    return ;
}

function 0xca9(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4) private { 
    require(bool(stor_a_0_19.code.size));
    v0, /* bool */ v1 = stor_a_0_19.approve(stor_4_0_19, 10 ** 30).gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v1 == bool(v1));
    require(2 <= uint64.max);
    v2 = new uint256[](2);
    if (2) {
        CALLDATACOPY(v2.data, msg.data.length, 64);
    }
    assert(0 < v2.length);
    v3 = v2.data;
    v2[0] = stor_a_0_19;
    assert(1 < v2.length);
    v2[1] = stor_13_0_19;
    require(bool(stor_a_0_19.code.size));
    v4, /* uint256 */ v5 = stor_a_0_19.balanceOf(address(this)).gas(msg.gas);
    require(bool(v4), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x30b7(v5);
    require(bool(stor_a_0_19.code.size));
    v6, /* bool */ v7 = stor_a_0_19.transfer(address(0x2b82bc0c540b8940a9b3eb08556819c11b284fae), v5).gas(msg.gas);
    require(bool(v6), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v7 == bool(v7));
    return ;
}

function 0x0c96fa62(address varg0, uint256 varg1, address varg2, address varg3, uint256 varg4, address varg5) public payable { 
    require(4 + (msg.data.length - 4) - 4 >= 192);
    0x3072(varg0);
    0x30b7(varg1);
    0x3072(varg2);
    0x3072(varg3);
    0x30b7(varg4);
    0x3072(varg5);
    0x326(varg5, varg4, varg3, varg2, varg1, varg0);
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function function_selector( function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length < 4) {
        if (!msg.data.length) {
            receive();
        }
    } else if (0x98310034 > function_selector >> 224) {
        if (0x6c630edb > function_selector >> 224) {
            if (0xc96fa62 == function_selector >> 224) {
                0x0c96fa62();
            } else if (0x22f04aad == function_selector >> 224) {
                0x22f04aad();
            } else if (0x26bf5c42 == function_selector >> 224) {
                0x26bf5c42();
            }
        } else if (0x6c630edb == function_selector >> 224) {
            0x6c630edb();
        } else if (0x6f307dc3 == function_selector >> 224) {
            underlying();
        } else if (0x7ed1f1dd == function_selector >> 224) {
            DPPFlashLoanCall(address,uint256,uint256,bytes);
        } else if (0x84800812 == function_selector >> 224) {
            pancakeCall(address,uint256,uint256,bytes);
        }
    } else if (0xeb2021c3 > function_selector >> 224) {
        if (0x98310034 == function_selector >> 224) {
            0x98310034();
        } else if (0xa1d48336 == function_selector >> 224) {
            0xa1d48336();
        } else if (0xd5b99797 == function_selector >> 224) {
            0xd5b99797();
        }
    } else if (0xeb2021c3 == function_selector >> 224) {
        DVMFlashLoanCall(address,uint256,uint256,bytes);
    } else if (0xf3fef3a3 == function_selector >> 224) {
        withdraw(address,uint256);
    } else if (0xf77c4791 == function_selector >> 224) {
        controller();
    } else if (0xf7888aec == function_selector >> 224) {
        balanceOf(address,address);
    }
}
