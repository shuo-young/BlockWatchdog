// Decompiled by library.dedaub.com
// 2022.12.03 07:34 UTC

// Data structures and variables inferred from the use of storage instructions
uint256 stor_2; // STORAGE[0x2]
uint256 stor_3; // STORAGE[0x3]
uint256 stor_0_0_19; // STORAGE[0x0] bytes 0 to 19
uint256 stor_1_0_19; // STORAGE[0x1] bytes 0 to 19
uint256 _a; // STORAGE[0x4] bytes 0 to 19
uint256 _transferFrom; // STORAGE[0x5] bytes 0 to 19
uint256 _callFunction; // STORAGE[0x6] bytes 0 to 19
uint256 stor_7_0_19; // STORAGE[0x7] bytes 0 to 19


function 0x1026(uint256 varg0, uint256 varg1) private { 
    if (varg1) {
        v0 = v1 = varg0 * varg1;
        assert(varg1);
        require(v1 / varg1 == varg0, Error('SafeMath: multiplication overflow'));
    } else {
        v0 = v2 = 0;
    }
    return v0;
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
        if (v2 <= v1.length) {
            goto 0x1957B0x1be0B0x155c0x10b4;
        } else {
            v0[v1.length] = 0;
        }
        revert(Error(v0, v4, 'SafeMath: division by zero'));
    }
}

function 0x13fa(uint256 varg0, uint256 varg1, uint256 varg2) private { 
    v0 = new uint256[](1);
    CALLDATACOPY(v0.data, msg.data.length, 32);
    assert(0 < v0.length);
    v1 = v0.data;
    v0[0] = address(varg2);
    v2 = new uint256[](1);
    CALLDATACOPY(v2.data, msg.data.length, 32);
    assert(0 < v2.length);
    v3 = v2.data;
    v2[0] = varg1;
    MEM[MEM[64]] = 0x562fa0df00000000000000000000000000000000000000000000000000000000;
    v4 = address(varg0);
    v5 = v6 = 0;
    v7 = new array[](v0.length);
    v8 = v9 = 0;
    v10 = v11 = v7.data;
    v12 = v13 = v0.data;
    while (v8 < v0.length) {
        MEM[v10] = address(MEM[v12]);
        v10 += 32;
        v12 += 32;
        v8 += 1;
    }
    v10 = new array[](v2.length);
    v14 = v15 = v2.data;
    v16 = v17 = v10.data;
    while (v5 < v2.length) {
        MEM[v16] = MEM[v14];
        v14 += 32;
        v16 += 32;
        v5 += 1;
    }
    require(_transferFrom.code.size);
    // !deposit to call back
    v18, v19 = _transferFrom.deposit(v4, v7, v10).gas(msg.gas);
    require(v18); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    return ;
}

function () public payable { 
    revert();
}

function 0x02908e5f(uint256 varg0, uint256 varg1, uint256 varg2) public payable { 
    require(msg.data.length - 4 >= 96);
    require(varg0 <= 0xffffffffffffffff);
    require(4 + varg0 + 31 < msg.data.length);
    assert(varg0.length <= 0xffffffffffffffff);
    v0 = v1 = new bytes[](varg0.length);
    assert(!((v1 + (32 + (~0x1f & varg0.length + 31)) < v1) | (v1 + (32 + (~0x1f & varg0.length + 31)) > 0xffffffffffffffff)));
    require(4 + varg0 + varg0.length + 32 <= msg.data.length);
    CALLDATACOPY(v1.data, 4 + varg0 + 32, varg0.length);
    v1[varg0.length] = 0;
    require(varg1 == address(varg1));
    require(msg.sender == _a);
    v2 = new array[](v1.length + v2.data - MEM[64] - 32);
    v3 = v4 = 0;
    while (v3 < v1.length) {
        v2[v3] = v1[v3];
        v3 += 32;
    }
    if (v3 <= v1.length) {
        goto 0x19b4B0x128B0x9b;
    } else {
        v2[v1.length] = 0;
    }
    v5 = v6.length;
    v7 = v2.data;
    require(0x3573d3b804dc64c2723a25c489ad31d6acfd3bb89ae03e9df018bea83b2a5b54 == keccak256(v2));
    stor_0_0_19 = varg1;
    stor_3 = varg2;
    require(_transferFrom.code.size);
    v8, v9 = _transferFrom.poolTokenByProtocol(address(varg1)).gas(msg.gas);
    require(v8); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v9 == address(v9));
    stor_1_0_19 = v9;
    if (0x91d7b9a8d2314110d4018c88dbfdcf5e2ba4772e != address(varg1)) {
        v10 = v11 = 792;
        v0 = v12 = 2;
        v10 = v13 = 7736;
        require(stor_1_0_19.code.size);
        v14, v15 = stor_1_0_19.balanceOf(address(this)).gas(msg.gas);
        require(v14); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        v16 = 0x1026(0xde0b6b3a7640000, 50000);
        if (v15 <= v16) {
            v17 = v18 = v16 - v15;
            while (1) {
                goto {'0x318B0x9b', '0x1e38B0x9b'};
                if (v0) {
                    break;
                }
                if (!v0) {
                    MEM[4 + MEM[64]] = 32;
                    v19 = new array[](v20.length);
                    v21 = v22 = 0;
                    while (v21 < v20.length) {
                        v19[v21] = v20[v21];
                        v21 += 32;
                    }
                    if (v21 <= v20.length) {
                        goto 0x1957B0x1be0B0x155c0x111B0x9b;
                    } else {
                        v19[v20.length] = 0;
                    }
                    revert(Error(v19, v23, 'SafeMath: division by zero'));
                }
                assert(v0);
                v17 = v17 / v0;
            }
            stor_2 = v17;
        } else {
            MEM[4 + MEM[64]] = 32;
            v24 = new array[](v25.length);
            v26 = v27 = 0;
            while (v26 < v25.length) {
                v24[v26] = v25[v26];
                v26 += 32;
            }
            if (v26 <= v25.length) {
                goto 0x1957B0x1be0B0x1533B0x9b;
            } else {
                v24[v25.length] = 0;
            }
            revert(Error(v24, v23, 'SafeMath: subtraction overflow'));
        }
    } else {
        v28 = 0x1026(0xde0b6b3a7640000, 0xc3500);
        stor_2 = v28;
    }
    require(stor_7_0_19.code.size);
    v29, v30 = stor_7_0_19.approve(_transferFrom, ~0).gas(msg.gas);
    require(v29); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v30 == v30);
    require(stor_7_0_19.code.size);
    v31, v32 = stor_7_0_19.balanceOf(address(this)).gas(msg.gas);
    require(v31); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    if (v32 <= stor_2) {
        require(stor_7_0_19.code.size);
        v33, v34 = stor_7_0_19.approve(_callFunction, ~0).gas(msg.gas);
        require(v33); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v34 == v34);
        v35 = new uint256[](v36);
        v37 = v36 = 3;
        v38 = v39 = v35.data;
        while (1) {
            MEM[MEM[64]] = 0;
            MEM[MEM[64] + 32] = 0;
            MEM[64] = MEM[64] + 128;
            MEM[MEM[64]] = 0;
            MEM[MEM[64] + 32] = 0;
            MEM[32 + (MEM[64] + 32)] = 0;
            MEM[64 + (MEM[64] + 32)] = 0;
            MEM[MEM[64] + 64] = MEM[64];
            MEM[32 + (MEM[64] + 64)] = 0;
            MEM[64 + (MEM[64] + 64)] = 0;
            MEM[96 + (MEM[64] + 64)] = 0;
            MEM[128 + (MEM[64] + 64)] = 0;
            MEM[160 + (MEM[64] + 64)] = 96;
            MEM[v38] = MEM[64];
            v38 += 32;
            v37 = v37 - 1;
            if (v37) {
                break;
            }
            if (!v37) {
                MEM[MEM[64]] = 0;
                MEM[MEM[64] + 32] = 0;
                MEM[32 + (MEM[64] + 32)] = 0;
                MEM[64 + (MEM[64] + 32)] = stor_2;
                MEM[64] = MEM[64];
                MEM[96] = 3;
                MEM[128] = 0;
                MEM[160] = address(this);
                MEM[192] = 0;
                MEM[MEM[64]] = 0;
                MEM[224] = MEM[64];
                assert(0 < v35.length);
                v40 = v35.data;
                v35[0] = 0;
                MEM[MEM[64]] = 0;
                MEM[32 + MEM[64]] = 0;
                MEM[64 + MEM[64]] = 0;
                MEM[96 + MEM[64]] = 0;
                MEM[32 + v41.data] = MEM[64];
                MEM[64 + v41.data] = 0;
                MEM[96 + v41.data] = 0;
                MEM[128 + v41.data] = address(this);
                MEM[160 + v41.data] = 0;
                MEM[32 + MEM[64]] = 32;
                MEM[32 + MEM[64] + 32] = 0;
                MEM[MEM[64]] = 64;
                MEM[192 + v41.data] = MEM[64];
                assert(1 < v35.length);
                v35[32] = 0;
                MEM[MEM[64]] = 0;
                MEM[32 + MEM[64]] = 0;
                MEM[64 + v42.data] = 2 + stor_2;
                MEM[64 + MEM[64]] = 0;
                MEM[96 + MEM[64]] = 3;
                MEM[128 + MEM[64]] = 0;
                MEM[160 + MEM[64]] = address(this);
                MEM[192 + MEM[64]] = 0;
                MEM[MEM[64]] = 0;
                MEM[224 + MEM[64]] = MEM[64];
                assert(2 < v35.length);
                v35[64] = MEM[64];
                v43 = new uint256[](v44);
                v45 = v44 = 1;
                v46 = v47 = v43.data;
                while (1) {
                    MEM[MEM[64]] = 0;
                    MEM[MEM[64] + 32] = 0;
                    MEM[v46] = MEM[64];
                    v46 += 32;
                    v45 = v45 - 1;
                    if (v45) {
                        break;
                    }
                    if (!v45) {
                        MEM[MEM[64]] = address(this);
                        MEM[32 + MEM[64]] = 1;
                        assert(0 < v43.length);
                        v48 = v43.data;
                        v43[0] = MEM[64];
                        v49 = new array[](v43.length);
                        v50 = v51 = 0;
                        v52 = v53 = v49.data;
                        v54 = v55 = v43.data;
                        while (v50 < v43.length) {
                            MEM[v52] = address(MEM[MEM[v54]]);
                            MEM[v52 + 32] = MEM[32 + MEM[v54]];
                            v52 += 64;
                            v54 += 32;
                            v50 += 1;
                        }
                        v52 = new array[](v35.length);
                        v56 = v57 = v52.data;
                        v58 = v59 = 32 + (v52 + 96);
                        v60 = v61 = v35.data;
                        while (v50 < v35.length) {
                            MEM[v56] = v58 - v52 + ~31;
                            assert(MEM[MEM[v60]] < 9);
                            MEM[v58] = MEM[MEM[v60]];
                            MEM[v58 + 32] = MEM[32 + MEM[v60]];
                            MEM[v58 + 64] = MEM[MEM[MEM[v60] + 64]];
                            assert(MEM[MEM[MEM[v60] + 64] + 32] < 2);
                            MEM[v58 + 64 + 32] = MEM[MEM[MEM[v60] + 64] + 32];
                            assert(MEM[MEM[MEM[v60] + 64] + 64] < 2);
                            MEM[v58 + 64 + 64] = MEM[MEM[MEM[v60] + 64] + 64];
                            MEM[v58 + 64 + 96] = MEM[96 + MEM[MEM[v60] + 64]];
                            MEM[v58 + 192] = MEM[MEM[v60] + 96];
                            MEM[v58 + 224] = MEM[MEM[v60] + 128];
                            MEM[v58 + 256] = address(MEM[MEM[v60] + 160]);
                            MEM[v58 + 288] = MEM[MEM[v60] + 192];
                            MEM[v58 + 320] = 352;
                            MEM[v58 + 352] = MEM[MEM[MEM[v60] + 224]];
                            v62 = v63 = 0;
                            while (v62 < MEM[MEM[MEM[v60] + 224]]) {
                                MEM[v62 + (v58 + 352 + 32)] = MEM[v62 + (MEM[MEM[v60] + 224] + 32)];
                                v62 += 32;
                            }
                            if (v62 <= MEM[MEM[MEM[v60] + 224]]) {
                                goto 0x1957B0x1b50B0x1386B0x4dfB0x9b;
                            } else {
                                MEM[MEM[MEM[MEM[v60] + 224]] + (v58 + 352 + 32)] = 0;
                            }
                            v58 = 32 + ((~0x1f & 31 + MEM[MEM[MEM[v60] + 224]]) + (v58 + 352));
                            v56 += 32;
                            v60 += 32;
                            v50 += 1;
                        }
                        require(_callFunction.code.size);
                        v64 = _callFunction.call(0xa67a6a45, v49, v52).gas(msg.gas);
                        require(v64); // checks call status, propagates error data on error
                        require(stor_7_0_19.code.size);
                        v65, v66 = stor_7_0_19.approve(_callFunction, 0).gas(msg.gas);
                        require(v65); // checks call status, propagates error data on error
                        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
                        require(v66 == v66);
                    }
                }
            }
        }
    } else {
        v67 = v68 = 0;
        while (v67 < v0) {
            0x13fa(stor_0_0_19, 0x4c4b40, this);
            0x97d();
            v67 += 1;
        }
    }
    require(stor_7_0_19.code.size);
    v69, v70 = stor_7_0_19.approve(_transferFrom, 0).gas(msg.gas);
    require(v69); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v70 == v70);
}

function 0x97d() private { 
    require(stor_0_0_19.code.size);
    v0, v1 = stor_0_0_19.normalizedBalance().gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(stor_1_0_19.code.size);
    v2, v1 = stor_1_0_19.balanceOf(address(this)).gas(msg.gas);
    require(v2); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    if (v1 <= v1) {
    }
    v3 = 0x1026(99, v1);
    v4 = _SafeDiv(100, v3);
    require(_transferFrom.code.size);
    v5, v6 = _transferFrom.withdraw(stor_0_0_19, stor_7_0_19, v4, 0).gas(msg.gas);
    require(v5); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    return ;
}

function a() public payable { 
    require(msg.sender == _a);
    require(stor_7_0_19.code.size);
    v0, v1 = stor_7_0_19.approve(_transferFrom, ~0).gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v1 == v1);
    0x13fa(0x7967ada2a32a633d5c055e2e075a83023b632b4e, 0x1bc16d674ec80000, stor_7_0_19);
    require(_transferFrom.code.size);
    v2, v3 = _transferFrom.fullExit(0x7967ada2a32a633d5c055e2e075a83023b632b4e, stor_7_0_19, 0xde0b6b3a7640000, 0).gas(msg.gas);
    require(v2); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(stor_7_0_19.code.size);
    v4, v5 = stor_7_0_19.approve(_transferFrom, 0).gas(msg.gas);
    require(v4); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v5 == v5);
}

function 0x1b82e3a7(uint256 varg0, uint256 varg1) public payable { 
    require(msg.data.length - 4 >= 64);
    require(varg0 <= 0xffffffffffffffff);
    require(4 + varg0 + 31 < msg.data.length);
    assert(varg0.length <= 0xffffffffffffffff);
    v0 = new bytes[](varg0.length);
    assert(!((v0 + (32 + (~0x1f & varg0.length + 31)) < v0) | (v0 + (32 + (~0x1f & varg0.length + 31)) > 0xffffffffffffffff)));
    require(4 + varg0 + varg0.length + 32 <= msg.data.length);
    CALLDATACOPY(v0.data, 4 + varg0 + 32, varg0.length);
    v0[varg0.length] = 0;
    require(varg1 == address(varg1));
    require(msg.sender == _a);
    v1 = new array[](v0.length + v1.data - MEM[64] - 32);
    v2 = v3 = 0;
    while (v2 < v0.length) {
        v1[v2] = v0[v2];
        v2 += 32;
    }
    if (v2 <= v0.length) {
        goto 0x19b4B0x829B0xb8;
    } else {
        v1[v0.length] = 0;
    }
    v4 = v5.length;
    v6 = v1.data;
    require(0x8f3d1e5f3b763269e6cd5f8ad2a5e09b083339ea82ac3e7cf28a910d56253404 == keccak256(v1));
    require((address(varg1)).code.size);
    v7, v8 = address(varg1).balanceOf(address(this)).gas(msg.gas);
    require(v7); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require((address(varg1)).code.size);
    v9, v10 = address(varg1).transfer(_a, v8).gas(msg.gas);
    require(v9); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v10 == v10);
}

function w() public payable { 
    0x97d();
}

function transferFrom(address varg0, address varg1, uint256 varg2) public payable { 
    require(msg.data.length - 4 >= 96);
    require(varg0 == varg0);
    require(varg1 == varg1);
    require(msg.sender == _transferFrom);
    v0 = 0x1026(99, stor_2);
    v1 = _SafeDiv(100, v0);
    0x13fa(stor_0_0_19, v1, stor_7_0_19);
    require(stor_7_0_19.code.size);
    v2, v3 = stor_7_0_19.transfer(stor_0_0_19, 0xde0b6b3a7640000).gas(msg.gas);
    require(v2); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v3 == v3);
    return 1;
}

function b() public payable { 
    require(msg.sender == _a);
    require(stor_7_0_19.code.size);
    v0, v1 = stor_7_0_19.approve(_transferFrom, ~0).gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v1 == v1);
    0x13fa(0x91d7b9a8d2314110d4018c88dbfdcf5e2ba4772e, 0x1bc16d674ec80000, stor_7_0_19);
    require(_transferFrom.code.size);
    v2, v3 = _transferFrom.fullExit(0x91d7b9a8d2314110d4018c88dbfdcf5e2ba4772e, stor_7_0_19, 0xde0b6b3a7640000, 0).gas(msg.gas);
    require(v2); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(stor_7_0_19.code.size);
    v4, v5 = stor_7_0_19.approve(_transferFrom, 0).gas(msg.gas);
    require(v4); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v5 == v5);
}

function r() public payable { 
    require(msg.sender == _a);
    require(stor_7_0_19.code.size);
    v0, v1 = stor_7_0_19.approve(0x7a250d5630b4cf539739df2c5dacb4c659f2488d, 0x21e19e0c9bab2400000).gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v1 == v1);
    v2 = new uint256[](2);
    CALLDATACOPY(v2.data, msg.data.length, 64);
    assert(v2.length);
    v3 = v2.data;
    v2[0] = stor_7_0_19;
    assert(1 < v2.length);
    v2[32] = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2;
    v4 = new array[](v2.length);
    v5 = v6 = 0;
    v7 = v8 = v4.data;
    v9 = v10 = v2.data;
    while (v5 < v2.length) {
        MEM[v7] = address(MEM[v9]);
        v7 += 32;
        v9 += 32;
        v5 += 1;
    }
    require(0x7a250d5630b4cf539739df2c5dacb4c659f2488d.code.size);
    v11, v12 = 0x7a250d5630b4cf539739df2c5dacb4c659f2488d.swapExactTokensForETH(0x21e19e0c9bab2400000, 0, v4, _a, block.timestamp).gas(msg.gas);
    require(v11); // checks call status, propagates error data on error
    RETURNDATACOPY(v12, 0, RETURNDATASIZE());
    MEM[64] = v12 + (~0x1f & RETURNDATASIZE() + 31);
    v13 = v14 = 0;
    require(v12 + RETURNDATASIZE() - v12 >= 32v14, v14);
    require(MEM[v12] <= 0xffffffffffffffffv14, v14);
    require(v12 + MEM[v12] + 31 < v12 + RETURNDATASIZE()v14, v14);
    assert(MEM[v12 + MEM[v12]] <= 0xffffffffffffffff);
    v15 = new uint256[](MEM[v12 + MEM[v12]]);
    assert(!((v15 + ((MEM[v12 + MEM[v12]] << 5) + 32) < v15) | (v15 + ((MEM[v12 + MEM[v12]] << 5) + 32) > 0xffffffffffffffff)));
    v16 = v17 = v15.data;
    v18 = v19 = 32 + (v12 + MEM[v12]);
    require(v12 + RETURNDATASIZE() >= 32 + (v12 + MEM[v12] + (MEM[v12 + MEM[v12]] << 5))v14, v14);
    while (v13 < MEM[v12 + MEM[v12]]) {
        MEM[v16] = MEM[v18];
        v13 += 1;
        v16 += 32;
        v18 += 32;
    }
    require(stor_7_0_19.code.size);
    v20, v21 = stor_7_0_19.approve(0x7a250d5630b4cf539739df2c5dacb4c659f2488d, 0).gas(msg.gas);
    require(v20); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v21 == v21);
}

function callFunction(address varg0, (address varg1, uint256) varg2, bytes varg3) public payable { 
    require(msg.data.length - 4 >= 128);
    require(varg0 == varg0);
    require(msg.data.length - 4 + ~31 >= 64);
    v0 = new struct(2);
    assert(!((v0 + 64 > 0xffffffffffffffff) | (v0 + 64 < v0)));
    require(varg1 == address(varg1));
    v0.word0 = varg1;
    v0.word1 = varg2;
    require(varg3 <= 0xffffffffffffffff);
    require(4 + varg3 + 31 < msg.data.length);
    assert(varg3.length <= 0xffffffffffffffff);
    v1 = new bytes[](varg3.length);
    assert(!((v1 + (32 + (~0x1f & varg3.length + 31)) < v1) | (v1 + (32 + (~0x1f & varg3.length + 31)) > 0xffffffffffffffff)));
    require(4 + varg3 + varg3.length + 32 <= msg.data.length);
    CALLDATACOPY(v1.data, 4 + varg3 + 32, varg3.length);
    v1[varg3.length] = 0;
    require(msg.sender == _callFunction);
    v2 = v3 = 0;
    while (v2 < stor_3) {
        0x13fa(stor_0_0_19, 0x4c4b40, this);
        0x97d();
        v2 += 1;
    }
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__(bytes4 function_selector) public payable { 
    MEM[64] = 128;
    require(!msg.value);
    if (msg.data.length < 4) {
        ();
    } else if (0x23b872dd > function_selector >> 224) {
        if (0x2908e5f == function_selector >> 224) {
            0x02908e5f();
        } else if (0xdbe671f == function_selector >> 224) {
            a();
        } else if (0x1b82e3a7 == function_selector >> 224) {
            0x1b82e3a7();
        } else {
            require(0x205c9cc7 == function_selector >> 224);
            w();
        }
    } else if (0x23b872dd == function_selector >> 224) {
        transferFrom(address,address,uint256);
    } else if (0x4df7e3d0 == function_selector >> 224) {
        b();
    } else if (0x6c8ae38c == function_selector >> 224) {
        r();
    } else {
        require(0x8b418713 == function_selector >> 224);
        callFunction(address,(address,uint256),bytes);
    }
}
