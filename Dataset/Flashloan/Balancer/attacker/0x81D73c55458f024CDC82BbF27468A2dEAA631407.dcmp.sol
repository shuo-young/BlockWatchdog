// Decompiled by library.dedaub.com
// 2022.11.29 14:04 UTC

// Data structures and variables inferred from the use of storage instructions
uint256 stor_a; // STORAGE[0xa]
uint256 stor_c; // STORAGE[0xc]
uint256 stor_d; // STORAGE[0xd]
uint256 _firstLimit; // STORAGE[0x10]
uint256 stor_12; // STORAGE[0x12]
uint256 stor_0_0_19; // STORAGE[0x0] bytes 0 to 19
uint256 stor_1_0_19; // STORAGE[0x1] bytes 0 to 19
uint256 _withdrawAll; // STORAGE[0x2] bytes 0 to 19
uint256 stor_3_0_19; // STORAGE[0x3] bytes 0 to 19
uint256 stor_4_0_19; // STORAGE[0x4] bytes 0 to 19
uint256 stor_5_0_19; // STORAGE[0x5] bytes 0 to 19
uint256 stor_6_0_19; // STORAGE[0x6] bytes 0 to 19
uint256 stor_7_0_19; // STORAGE[0x7] bytes 0 to 19
uint256 stor_8_0_19; // STORAGE[0x8] bytes 0 to 19
uint256 stor_9_0_19; // STORAGE[0x9] bytes 0 to 19
uint256 _withdrawETH; // STORAGE[0xb] bytes 0 to 19
uint256 stor_e_0_19; // STORAGE[0xe] bytes 0 to 19
uint256 stor_f_0_19; // STORAGE[0xf] bytes 0 to 19
uint256 stor_11_0_19; // STORAGE[0x11] bytes 0 to 19
uint256 stor_13_0_19; // STORAGE[0x13] bytes 0 to 19
uint256 stor_14_0_19; // STORAGE[0x14] bytes 0 to 19
uint256 stor_15_0_19; // STORAGE[0x15] bytes 0 to 19
uint256 stor_16_0_19; // STORAGE[0x16] bytes 0 to 19


function () public payable { 
}

function 0x049e3f28() public nonPayable { 
    0x31d();
}

function 0x12c8() private { 
    if (!stor_a) {
        return ;
    } else {
        require(stor_9_0_19.code.size);
        v0, v1 = stor_9_0_19.freeUpTo(stor_a).gas(msg.gas);
        require(v0); // checks call status, propagates error data on error
        MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        0x3fd4(v1);
        return ;
    }
}

function 0x1353(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3) private { 
    v0 = address(varg1);
    v1 = address(varg3);
    require(v0.code.size);
    v2, v3 = v0.balanceOf(v1).gas(msg.gas);
    require(v2); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x3fd4(v3);
    v4 = address(varg2);
    v5 = address(varg3);
    require(v4.code.size);
    v6, v7 = v4.balanceOf(v5).gas(msg.gas);
    require(v6); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x3fd4(v7);
    while (v3 > varg0) {
        if (1 == v7) {
            v8 = v9 = 1;
        } else {
            v8 = v7 >> 1;
        }
        v10 = address(varg3);
        v11 = 0x3efe(varg2);
        v12 = 0x3efe(varg1);
        require(v10.code.size);
        v13, v14, v15 = v10.swapExactAmountIn(v11, v8, v12, 0, ~0).gas(msg.gas);
        require(v13); // checks call status, propagates error data on error
        MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 64);
        0x3fd4(v14);
        0x3fd4(v15);
        v3 = v3 - v14;
        v7 += v8;
    }
    return ;
}

function firstLimit() public nonPayable { 
    return _firstLimit;
}

function 0x15e5(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5) private { 
    v0 = 0x1f92(varg1, varg3, varg4, address(varg5));
    v1 = address(varg4);
    v2 = address(varg5);
    require(v1.code.size);
    v3, v4 = v1.transfer(v2, varg2).gas(msg.gas);
    require(v3); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v4 == v4);
    if (address(varg4) >= address(varg3)) {
        v5 = address(varg5);
        v6 = new array[](0);
        v7 = address(varg0);
        require(v5.code.size);
        v8 = v5.swap(0, v0, v7, v6).gas(msg.gas);
        require(v8); // checks call status, propagates error data on error
    } else {
        v9 = address(varg5);
        v10 = new array[](0);
        v11 = address(varg0);
        require(v9.code.size);
        v12 = v9.swap(0, v0, v11, v10).gas(msg.gas);
        require(v12); // checks call status, propagates error data on error
    }
    return v0;
}

function 0x1d09d46c() public nonPayable { 
    0x445();
}

function 0x590f14ad(uint256 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    0x3fd4(varg0);
    require(msg.sender == _withdrawETH, Error('Ownable: caller is not the owner'));
    stor_a = varg0;
}

function 0x6622d1ad() public nonPayable { 
    stor_12 += 1;
    if (1 != 1 + stor_12) {
        if (2 != stor_12) {
            if (3 != stor_12) {
                if (4 == stor_12) {
                    0xac0();
                }
            } else {
                0x1353(0x470de4df820000, stor_0_0_19, stor_e_0_19, stor_11_0_19);
                0x1353(0x16345785d8a0000, stor_3_0_19, stor_e_0_19, stor_11_0_19);
                0x1353(0x2c68af0bb140000, stor_6_0_19, stor_e_0_19, stor_11_0_19);
                0x1353(0x8ac7230489e80000, stor_7_0_19, stor_e_0_19, stor_11_0_19);
                0x1353(0x470de4df820000, stor_8_0_19, stor_e_0_19, stor_11_0_19);
                0x1353(0xde0b6b3a7640000, stor_4_0_19, stor_e_0_19, stor_11_0_19);
                0x1353(0x6a94d74f430000, stor_5_0_19, stor_e_0_19, stor_11_0_19);
                0x12c8();
            }
        } else {
            0x31d();
        }
    } else {
        0xeb8(stor_c, stor_11_0_19);
        require(stor_0_0_19.code.size);
        v0 = stor_0_0_19.withdraw(0x186cc6acd4b0000).gas(msg.gas);
        require(v0); // checks call status, propagates error data on error
        require(0x929507cd3d90ab11ec4822e9eb5a48eb3a178f19.code.size);
        v1, v2 = 0x929507cd3d90ab11ec4822e9eb5a48eb3a178f19.ethToTokenSwapInput(1, block.timestamp).value(0x186cc6acd4b0000).gas(msg.gas);
        require(v1); // checks call status, propagates error data on error
        MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        0x3fd4(v2);
        0x12c8();
    }
}

function 0x77d80c66(uint256 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    0x3fd4(varg0);
    require(msg.sender == _withdrawETH, Error('Ownable: caller is not the owner'));
    _firstLimit = varg0;
}

function withdrawAll() public nonPayable { 
    v0 = new struct(8);
    v0.word0 = 7;
    MEM[(v0.data) len 224] = this.code[this.code.size len 224];
    assert(v0.word0);
    v1 = v0.data;
    v0.word1 = _withdrawAll;
    assert(1 < v0.word0);
    v0.word2 = stor_3_0_19;
    assert(2 < v0.word0);
    v0.word3 = stor_4_0_19;
    assert(3 < v0.word0);
    v0.word4 = stor_5_0_19;
    assert(4 < v0.word0);
    v0.word5 = stor_6_0_19;
    assert(5 < v0.word0);
    v0.word6 = stor_7_0_19;
    assert(6 < v0.word0);
    v0.word7 = stor_8_0_19;
    v2, v3 = 0xa8a();
    0x31d();
}

function callFunction(address varg0, (address varg1, uint256) varg2, bytes varg3) public nonPayable { 
    require(msg.data.length - 4 >= 128);
    require(varg0 == varg0);
    require(msg.data.length - 36 >= 64);
    v0 = new struct(2);
    require(!((v0 + 64 < v0) | (v0 + 64 > 0xffffffffffffffff)));
    require(varg1 == address(varg1));
    v0.word0 = varg1;
    0x3fd4(varg2);
    v0.word1 = varg2;
    require(varg3 <= 0xffffffffffffffff);
    require(4 + varg3 + 31 < msg.data.length);
    require(varg3.length <= 0xffffffffffffffff);
    v1 = new bytes[](varg3.length);
    require(!((v1 + ((~0x1f & 31 + varg3.length) + 32) < v1) | (v1 + ((~0x1f & 31 + varg3.length) + 32) > 0xffffffffffffffff)));
    require(4 + varg3 + 32 + varg3.length <= msg.data.length);
    CALLDATACOPY(v1.data, 4 + varg3 + 32, varg3.length);
    v1[varg3.length] = 0;
    require(v1.data + v1.length - v1.data >= 64);
    0x3fcb(MEM[v1.data]);
    0x3fd4(v1[32]);
    require(v1[32] <= 2, Error(0x4500000000000000000000000000000000000000000000000000000000000000));
    v2 = v3 = new struct(3);
    v4 = v5 = 3;
    do {
        MEM[v2] = 13631;
        v2 += 32;
        v4 = v4 - 1;
    } while (!v4);
    MEM[64] += 96;
    MEM[MEM[64]] = 1288;
    MEM[32 + MEM[64]] = 6915;
    MEM[64 + MEM[64]] = 7214;
    assert(v1[32] < 3);
}

function _SafeMul(uint256 varg0, uint256 varg1) private { 
    if (varg1) {
        v0 = varg0 * varg1;
        assert(varg1);
        require(v0 / varg1 == varg0, Error('SafeMath: multiplication overflow'));
        return v0;
    } else {
        return 0;
    }
}

function _SafeDiv(uint256 varg0, uint256 varg1) private { 
    if (varg0) {
        assert(varg0);
        return varg1 / varg0;
    } else {
        v0 = new array[](v1.length);
        v2 = v3 = 0;
        while (v2 < v1.length) {
            v0[v2] = v1[v2];
            v2 += 32;
        }
        if (v2 > v1.length) {
            v0[v1.length] = 0;
            goto 0x3992B0x3dc1B0x2f13B0x1f0e;
        }
        revert(Error(v0, v4, 'SafeMath: division by zero'));
    }
}

function _SafeSub(uint256 varg0, uint256 varg1) private { 
    if (varg0 <= varg1) {
        return varg1 - varg0;
    } else {
        v0 = new array[](v1.length);
        v2 = v3 = 0;
        while (v2 < v1.length) {
            v0[v2] = v1[v2];
            v2 += 32;
        }
        if (v2 > v1.length) {
            v0[v1.length] = 0;
            goto 0x3992B0x3dc1B0x2f4d;
        }
        revert(Error(v0, v4, 'SafeMath: subtraction overflow'));
    }
}

function 0x1f92(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3) private { 
    v0 = address(varg2);
    v1 = address(varg3);
    require(v0.code.size);
    v2, v3 = v0.balanceOf(v1).gas(msg.gas);
    require(v2); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x3fd4(v3);
    v4 = address(varg1);
    v5 = address(varg3);
    require(v4.code.size);
    v6, v7 = v4.balanceOf(v5).gas(msg.gas);
    require(v6); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x3fd4(v7);
    v8 = _SafeMul(997, varg0);
    v9 = _SafeMul(v7, v8);
    v10 = _SafeMul(1000, v3);
    v11 = _SafeAdd(v8, v10);
    if (!v11) {
        v12 = v13 = 0;
    } else {
        v12 = v14 = _SafeDiv(v11, v9);
    }
    return v12;
}

function owner() public nonPayable { 
    return _withdrawETH;
}

function 0x92d7c940() public nonPayable { 
    0xc6f();
    0x445();
}

function 0xadcd4469() public nonPayable { 
    v0 = 0x3efe(this);
    require(stor_e_0_19.code.size);
    v1, v2 = stor_e_0_19.balanceOf(v0).gas(msg.gas);
    require(v1); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x3fd4(v2);
    if (1 != v2) {
        v3 = _SafeAdd(320, v2);
        v4 = _SafeSub(1, v3);
        v5 = _SafeDiv(320, v4);
        v6 = _SafeMul(320, v5);
        v7 = _SafeMul(100, v6);
        v8 = _SafeDiv(32000, v7);
        v2 = v9 = _SafeSub(v8, v2);
    }
    v10 = 0x15e5(this, v2, v2, stor_0_0_19, stor_e_0_19, stor_f_0_19);
    0x31d();
}

function 0xb11513fe() public nonPayable { 
    return stor_a;
}

function 0xbb3becf3(uint256 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    0x3fd4(varg0);
    require(msg.sender == _withdrawETH, Error('Ownable: caller is not the owner'));
    stor_12 = varg0;
}

function withdraw(address[] varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(varg0 <= 0xffffffffffffffff);
    require(4 + varg0 + 31 < msg.data.length);
    require(varg0.length <= 0xffffffffffffffff);
    v0 = new uint256[](varg0.length);
    require(!((v0 + ((varg0.length << 5) + 32) < v0) | (v0 + ((varg0.length << 5) + 32) > 0xffffffffffffffff)));
    v1 = v2 = 4 + varg0 + 32;
    v3 = v4 = v0.data;
    require(v2 + (varg0.length << 5) <= msg.data.length);
    v5 = v6 = 0;
    while (v5 < varg0.length) {
        0x3fcb(msg.data[v1]);
        MEM[v3] = msg.data[v1];
        v3 += 32;
        v1 += 32;
        v5 += 1;
    }
    v7, v8 = 0xa8a();
}

function 0xc01dc1bc() public nonPayable { 
    return stor_12;
}

function 0xc89e9591() public nonPayable { 
    0xac0();
}

function 0xcecaa9d9() public payable { 
    require(stor_0_0_19.code.size);
    v0 = stor_0_0_19.deposit().value(msg.value).gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
}

function withdrawETH() public nonPayable { 
    if (this.balance) {
        v0 = _withdrawETH.call().value(this.balance).gas(2300 * !this.balance);
        require(v0); // checks call status, propagates error data on error
        goto 0x11f0x2d3;
    }
}

function 0xf9f8e07b() public nonPayable { 
    0xc6f();
}

function _SafeAdd(uint256 varg0, uint256 varg1) private { 
    v0 = varg0 + varg1;
    require(v0 >= varg1, Error('SafeMath: addition overflow'));
    return v0;
}

function 0xfa845f47(uint256 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    0x3fcb(varg0);
    v0 = 0x3efe(this);
    require((address(varg0)).code.size);
    v1, v2 = address(varg0).balanceOf(v0).gas(msg.gas);
    require(v1); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x3fd4(v2);
    if (v2) {
        v3 = 0x3efe(_withdrawETH);
        require((address(varg0)).code.size);
        v4, v5 = address(varg0).transfer(v3, v2).gas(msg.gas);
        require(v4); // checks call status, propagates error data on error
        MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v5 == v5);
        goto 0x11f0x2fd;
    }
}

function 0x31d() private { 
    v0 = 0x3efe(this);
    require(stor_0_0_19.code.size);
    v1, v2 = stor_0_0_19.balanceOf(v0).gas(msg.gas);
    require(v1); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x3fd4(v2);
    require(stor_0_0_19.code.size);
    v3 = stor_0_0_19.withdraw(v2).gas(msg.gas);
    require(v3); // checks call status, propagates error data on error
    v4 = _withdrawETH.call().value(v2).gas(2300 * !v2);
    require(v4); // checks call status, propagates error data on error
    return ;
}

function 0x3803(uint256 varg0, uint256 varg1) private { 
    v0 = MEM[varg0];
    v1 = varg1 + 352;
    assert(v0 < 9);
    MEM[varg1] = v0;
    v2 = MEM[varg0 + 32];
    v3 = varg1 + 32;
    MEM[v3] = v2;
    v4 = MEM[varg0 + 64];
    v5 = varg1 + 64;
    MEM[v5] = MEM[v4];
    assert(MEM[v4 + 32] < 2);
    MEM[v5 + 32] = MEM[v4 + 32];
    assert(MEM[v4 + 64] < 2);
    MEM[v5 + 64] = MEM[v4 + 64];
    MEM[v5 + 96] = MEM[v4 + 96];
    v6 = MEM[varg0 + 96];
    v7 = varg1 + 192;
    MEM[v7] = v6;
    v8 = MEM[varg0 + 128];
    v9 = varg1 + 224;
    MEM[v9] = v8;
    v10 = MEM[varg0 + 160];
    v11 = varg1 + 256;
    MEM[v11] = address(v10);
    v12 = MEM[varg0 + 192];
    v13 = varg1 + 288;
    MEM[v13] = v12;
    v14 = MEM[varg0 + 224];
    MEM[varg1 + 320] = v1 - varg1;
    MEM[v1] = MEM[v14];
    v15 = v16 = 0;
    while (v15 < MEM[v14]) {
        MEM[v15 + (32 + v1)] = MEM[v15 + (v14 + 32)];
        v15 += 32;
    }
    if (v15 > MEM[v14]) {
        MEM[MEM[v14] + (32 + v1)] = 0;
        goto 0x3992B0x3b4fB0x3803;
    }
    return 32 + v1 + (~0x1f & 31 + MEM[v14]);
}

function 0x384f(uint256 varg0, uint256 varg1) private { 
    MEM[varg1] = varg0.length;
    v0 = 32 + varg1;
    v1 = v2 = v0 + (varg0.length << 5);
    v3 = v4 = varg0.data;
    v5 = v6 = 0;
    while (v5 < varg0.length) {
        MEM[v0] = v1 - v0;
        v1 = 0x3803(MEM[v3], v1);
        v3 += 32;
        v0 += 32;
        v5 += 1;
    }
    return v1;
}

function 0x3c2f(uint256 varg0, uint256 varg1, uint256 varg2) private { 
    MEM[varg0] = 64;
    v0 = varg0 + 64;
    v1 = v2 = 15424;
    v3 = varg2.word0;
    MEM[v0] = v3;
    v1 = v4 = 32 + v0;
    v1 = v5 = varg2.data;
    v6 = v7 = 0;
    while (v6 < v3) {
        v3 = v8 = 14581;
        MEM[v9] = address(MEM[MEM[v1]]);
        MEM[v9 + 32] = MEM[MEM[v1] + 32];
        v1 = 64 + MEM[v1];
        v1 = v10 = 32 + MEM[v1];
        v6 = v11 = 1;
    }
    MEM[varg0 + 32] = v1 - varg0;
    v12 = 0x384f(varg1, v1);
    return v12;
}

function 0x3efe(uint256 varg0) private { 
    return address(varg0);
}

function 0x3fcb(uint256 varg0) private { 
    v0 = 0x3efe(varg0);
    require(varg0 == v0);
    return ;
}

function 0x3fd4(uint256 varg0) private { 
    require(varg0 == varg0);
    return ;
}

function 0x445() private { 
    v0 = new struct(4);
    v0.word0 = 3;
    MEM[(v0.data) len 96] = this.code[this.code.size len 96];
    assert(v0.word0);
    v1 = v0.data;
    v0.word1 = _withdrawAll;
    assert(1 < v0.word0);
    v0.word2 = stor_3_0_19;
    assert(2 < v0.word0);
    v0.word3 = stor_4_0_19;
    v2, v3 = 0xa8a();
    0x31d();
    return ;
}

function 0xa8a() private { 
    if (0 < v0.word0) {
        assert(0 < v0.word0);
        v1 = v0.data;
        v2 = 0x3efe(this);
        require((address(v0.word1)).code.size);
        v3, v4 = address(v0.word1).balanceOf(v2).gas(msg.gas);
        require(v3); // checks call status, propagates error data on error
        MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        0x3fd4(v4);
        if (v4) {
            v5 = 0x3efe(_withdrawETH);
            require((address(v0.word1)).code.size);
            v6, v7 = address(v0.word1).transfer(v5, v4).gas(msg.gas);
            require(v6); // checks call status, propagates error data on error
            MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
            require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
            require(v7 == v7);
            return 0, v0;
        }
    }
    return 0, v0;
}

function 0xac0() private { 
    v0 = new struct(7);
    v0.word0 = 6;
    MEM[(v0.data) len 192] = this.code[this.code.size len 192];
    assert(1 < v0.word0);
    v0.word2 = stor_3_0_19;
    assert(2 < v0.word0);
    v0.word3 = stor_4_0_19;
    assert(3 < v0.word0);
    v0.word4 = stor_5_0_19;
    assert(4 < v0.word0);
    v0.word5 = stor_6_0_19;
    assert(5 < v0.word0);
    v0.word6 = stor_7_0_19;
    assert(v0.word0);
    v1 = v0.data;
    v0.word1 = stor_8_0_19;
    v2, v3 = 0xa8a();
    0x31d();
    return ;
}

function 0xc6f() private { 
    require(stor_0_0_19.code.size);
    v0, v1 = stor_0_0_19.approve(stor_15_0_19, ~0).gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v1 == v1);
    require(stor_16_0_19.code.size);
    v2, v3 = stor_16_0_19.approve(stor_15_0_19, ~0).gas(msg.gas);
    require(v2); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v3 == v3);
    0xeb8(stor_d, stor_15_0_19);
    require(stor_16_0_19.code.size);
    v4, v5 = stor_16_0_19.balanceOf(stor_13_0_19).gas(msg.gas);
    require(v4); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x3fd4(v5);
    v6 = 0x3efe(this);
    require(stor_15_0_19.code.size);
    v7, v8 = stor_15_0_19.balanceOf(v6).gas(msg.gas);
    require(v7); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x3fd4(v8);
    require(stor_15_0_19.code.size);
    v9, v10 = stor_15_0_19.totalSupply().gas(msg.gas);
    require(v9); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x3fd4(v10);
    v11 = 0x3efe(stor_16_0_19);
    v12 = 0x3efe(stor_0_0_19);
    require(stor_15_0_19.code.size);
    v13, v14, v15 = stor_15_0_19.swapExactAmountIn(v11, 1, v12, 0, ~0).gas(msg.gas);
    require(v13); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 64);
    0x3fd4(v14);
    0x3fd4(v15);
    v16 = 0x3efe(stor_16_0_19);
    v17 = 0x3efe(stor_0_0_19);
    require(stor_15_0_19.code.size);
    v18, v19, v20 = stor_15_0_19.swapExactAmountIn(v16, 1, v17, 0, ~0).gas(msg.gas);
    require(v18); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 64);
    0x3fd4(v19);
    0x3fd4(v20);
    v21 = v22 = 3;
    v23 = v24 = 0;
    while (v23 < 10) {
        v25 = 0x3efe(stor_16_0_19);
        require(stor_15_0_19.code.size);
        v26, v27 = stor_15_0_19.joinswapExternAmountIn(v25, (v21 & 0x1) + (v21 >> 1), 0).gas(msg.gas);
        require(v26); // checks call status, propagates error data on error
        MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        0x3fd4(v27);
        v8 += v27;
        v10 += v27;
        v21 += (v21 & 0x1) + (v21 >> 1);
        v23 += 1;
    }
    v28 = 0x15e5(stor_13_0_19, v8, v8, stor_16_0_19, stor_15_0_19, stor_14_0_19);
    v29 = 0x3efe(this);
    require(stor_16_0_19.code.size);
    v30, v31 = stor_16_0_19.balanceOf(v29).gas(msg.gas);
    require(v30); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x3fd4(v31);
    require(stor_16_0_19.code.size);
    v32, v33 = stor_16_0_19.transfer(stor_13_0_19, v31).gas(msg.gas);
    require(v32); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v33 == v33);
    require(stor_16_0_19.code.size);
    v34, v35 = stor_16_0_19.balanceOf(stor_13_0_19).gas(msg.gas);
    require(v34); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x3fd4(v35);
    v36 = 0x1f92(v35 - v5, stor_0_0_19, stor_16_0_19, stor_13_0_19);
    if (stor_16_0_19 >= stor_0_0_19) {
        v37 = new array[](0);
        v38 = 0x3efe(this);
        require(stor_13_0_19.code.size);
        v39 = stor_13_0_19.swap(v36, 0, v38, v37).gas(msg.gas);
        require(v39); // checks call status, propagates error data on error
    } else {
        v40 = new array[](0);
        v41 = 0x3efe(this);
        require(stor_13_0_19.code.size);
        v42 = stor_13_0_19.swap(0, v36, v41, v40).gas(msg.gas);
        require(v42); // checks call status, propagates error data on error
    }
    return ;
}

function 0xeb8(uint256 varg0, uint256 varg1) private { 
    require(stor_0_0_19.code.size);
    v0, v1 = stor_0_0_19.balanceOf(stor_1_0_19).gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x3fd4(v1);
    require(v1 > 0x152d02c7e14af6800000, Error(0x5341000000000000000000000000000000000000000000000000000000000000));
    require(stor_0_0_19.code.size);
    v2, v3 = stor_0_0_19.approve(stor_1_0_19, ~0).gas(msg.gas);
    require(v2); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v3 == v3);
    v4 = new struct(4);
    v4.word0 = 0;
    v4.word1 = 0;
    v4.word2 = 0;
    v4.word3 = 0;
    MEM[MEM[64]] = 0;
    MEM[MEM[64] + 32] = 0;
    MEM[MEM[64] + 64] = 0;
    MEM[MEM[64] + 96] = v1 + ~9;
    v5 = new struct(8);
    v5.word0 = 0;
    v5.word1 = 0;
    v6 = new struct(4);
    v6.word0 = 0;
    v6.word1 = 0;
    v6.word2 = 0;
    v6.word3 = 0;
    v5.word2 = v6;
    v5.word3 = 0;
    v5.word4 = 0;
    v5.word5 = 0;
    v5.word6 = 0;
    v5.word7 = 96;
    MEM[32 + v7.data] = MEM[64];
    MEM[64 + v7.data] = 0;
    MEM[96 + v7.data] = 0;
    MEM[128 + v7.data] = address(this);
    MEM[160 + v7.data] = 0;
    MEM[MEM[64]] = 0;
    MEM[192 + v7.data] = MEM[64];
    v8 = new struct(8);
    v8.word0 = 0;
    v8.word1 = 0;
    v9 = new struct(4);
    v9.word0 = 0;
    v9.word1 = 0;
    v9.word2 = 0;
    v9.word3 = 0;
    v8.word2 = v9;
    v8.word3 = 0;
    v8.word4 = 0;
    v8.word5 = 0;
    v8.word6 = 0;
    v8.word7 = 96;
    MEM[32 + v10.data] = MEM[64];
    MEM[64 + v10.data] = 0;
    MEM[96 + v10.data] = 0;
    MEM[128 + v10.data] = address(this);
    MEM[160 + v10.data] = 0;
    v11 = new struct(3);
    v12 = 0x3efe(varg1);
    v11.word1 = v12;
    v11.word2 = varg0;
    v11.word0 = 64;
    MEM[192 + v10.data] = MEM[64];
    v13 = new struct(8);
    v13.word0 = 0;
    v13.word1 = 0;
    v14 = new struct(4);
    v14.word0 = 0;
    v14.word1 = 0;
    v14.word2 = 0;
    v14.word3 = 0;
    v13.word2 = v14;
    v13.word3 = 0;
    v13.word4 = 0;
    v13.word5 = 0;
    v13.word6 = 0;
    v13.word7 = 96;
    MEM[MEM[64]] = 0;
    MEM[MEM[64] + 32] = 0;
    MEM[96] = v1 + 1;
    MEM[64 + MEM[64]] = 0;
    MEM[MEM[64] + 96] = 0;
    MEM[MEM[64] + 128] = 0;
    MEM[MEM[64] + 160] = this;
    MEM[MEM[64] + 192] = 0;
    MEM[MEM[64]] = 0;
    MEM[MEM[64] + 224] = MEM[64];
    v15 = new struct(4);
    v16 = v17 = 3;
    v15.word0 = v17;
    v18 = v19 = v15.data;
    while (1) {
        v20 = new struct(8);
        v20.word0 = 0;
        v20.word1 = 0;
        v21 = new struct(4);
        v21.word0 = 0;
        v21.word1 = 0;
        v21.word2 = 0;
        v21.word3 = 0;
        v20.word2 = v21;
        v20.word3 = 0;
        v20.word4 = 0;
        v20.word5 = 0;
        v20.word6 = 0;
        v20.word7 = 96;
        MEM[v18] = v20;
        v18 += 32;
        v16 = v16 - 1;
        if (v16) {
            break;
        }
        if (!v16) {
            assert(0 < v15.word0);
            v22 = v15.data;
            v15.word1 = 0;
            assert(1 < v15.word0);
            v15.word2 = 0;
            assert(2 < v15.word0);
            v15.word3 = MEM[64];
            v23 = new struct(2);
            v24 = v25 = 1;
            v23.word0 = v25;
            v26 = v27 = v23.data;
            while (1) {
                MEM[MEM[64]] = 0;
                MEM[MEM[64] + 32] = 0;
                MEM[v26] = MEM[64];
                v26 += 32;
                v24 = v24 - 1;
                if (v24) {
                    break;
                }
                if (!v24) {
                    MEM[MEM[64]] = address(this);
                    MEM[32 + MEM[64]] = 0;
                    assert(0 < v23.word0);
                    v28 = v23.data;
                    v23.word1 = MEM[64];
                    v29 = 0x3c2f(4 + MEM[64], v15, v23);
                    require(stor_1_0_19.code.size);
                    v30 = stor_1_0_19.call(0xa67a6a4500000000000000000000000000000000000000000000000000000000).gas(msg.gas);
                    require(v30); // checks call status, propagates error data on error
                    return ;
                }
            }
        }
    }
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__(bytes4 function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length >= 4) {
        if (0xadcd4469 > function_selector >> 224) {
            if (0x77d80c66 > function_selector >> 224) {
                if (0x49e3f28 == function_selector >> 224) {
                    0x049e3f28();
                } else if (0x1160bdd3 == function_selector >> 224) {
                    firstLimit();
                } else if (0x1d09d46c == function_selector >> 224) {
                    0x1d09d46c();
                } else if (0x590f14ad == function_selector >> 224) {
                    0x590f14ad();
                } else if (0x6622d1ad == function_selector >> 224) {
                    0x6622d1ad();
                }
            } else if (0x77d80c66 == function_selector >> 224) {
                0x77d80c66();
            } else if (0x853828b6 == function_selector >> 224) {
                withdrawAll();
            } else if (0x8b418713 == function_selector >> 224) {
                callFunction(address,(address,uint256),bytes);
            } else if (0x8da5cb5b == function_selector >> 224) {
                owner();
            } else if (0x92d7c940 == function_selector >> 224) {
                0x92d7c940();
            }
        } else if (0xc89e9591 > function_selector >> 224) {
            if (0xadcd4469 == function_selector >> 224) {
                0xadcd4469();
            } else if (0xb11513fe == function_selector >> 224) {
                0xb11513fe();
            } else if (0xbb3becf3 == function_selector >> 224) {
                0xbb3becf3();
            } else if (0xbd5dec98 == function_selector >> 224) {
                withdraw(address[]);
            } else if (0xc01dc1bc == function_selector >> 224) {
                0xc01dc1bc();
            }
        } else if (0xc89e9591 == function_selector >> 224) {
            0xc89e9591();
        } else if (0xcecaa9d9 == function_selector >> 224) {
            0xcecaa9d9();
        } else if (0xe086e5ec == function_selector >> 224) {
            withdrawETH();
        } else if (0xf9f8e07b == function_selector >> 224) {
            0xf9f8e07b();
        } else if (0xfa845f47 == function_selector >> 224) {
            0xfa845f47();
        }
    }
    ();
}
