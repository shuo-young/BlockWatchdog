// Decompiled by library.dedaub.com
// 2024.02.05 03:15 UTC
// Compiled using the solidity compiler version 0.8.24


// Data structures and variables inferred from the use of storage instructions
mapping (uint256 => struct_1155) _getRoleAdmin; // STORAGE[0x0]
uint256 stor_b; // STORAGE[0xb]
uint256 stor_11; // STORAGE[0x11]
uint256 stor_12; // STORAGE[0x12]
uint256 stor_3_0_0; // STORAGE[0x3] bytes 0 to 0
uint256 stor_1_0_19; // STORAGE[0x1] bytes 0 to 19
uint256 stor_3_1_20; // STORAGE[0x3] bytes 1 to 20
uint256 stor_4_0_19; // STORAGE[0x4] bytes 0 to 19
uint256 stor_6_0_19; // STORAGE[0x6] bytes 0 to 19
uint256 stor_7_0_19; // STORAGE[0x7] bytes 0 to 19
uint256 stor_8_0_19; // STORAGE[0x8] bytes 0 to 19
uint256 stor_9_0_19; // STORAGE[0x9] bytes 0 to 19
uint256 stor_a_0_19; // STORAGE[0xa] bytes 0 to 19
uint256 stor_c_0_19; // STORAGE[0xc] bytes 0 to 19
uint256 stor_d_0_19; // STORAGE[0xd] bytes 0 to 19
uint256 stor_e_0_19; // STORAGE[0xe] bytes 0 to 19
uint256 stor_10_0_19; // STORAGE[0x10] bytes 0 to 19


// Events
RoleGranted(bytes32, address, address);
RoleRevoked(bytes32, address, address);

function supportsInterface(bytes4 interfaceId) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 32);
    v0 = v1 = interfaceId == bytes4(0x7965db0b00000000000000000000000000000000000000000000000000000000);
    if (interfaceId != bytes4(0x7965db0b00000000000000000000000000000000000000000000000000000000)) {
        v0 = interfaceId == bytes4(0x1ffc9a700000000000000000000000000000000000000000000000000000000);
    }
    return bool(v0);
}

function 0x0c2ca43b(address varg0, uint256 varg1) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 64);
    0x2c76(varg0);
    0x2ca9(varg1);
    0x17da(msg.sender, 0);
    0x185e(varg1, varg0);
}

function 0x17da(address varg0, uint256 varg1) private { 
    if (uint8(_getRoleAdmin[varg1].field0[address(address(varg0))])) {
        return ;
    } else {
        v0 = 0x294d(uint8(20), varg0);
        v1 = 0x294d(32, varg1);
        MEM[32 + MEM[64] + 0] = 'AccessControl: account ';
        v2 = v3 = 0;
        while (v2 < v0.length) {
            MEM[32 + MEM[64] + 23 + v2] = v0[v2];
            v2 = v2 + 32;
        }
        MEM[32 + MEM[64] + 23 + v0.length] = 0;
        MEM[32 + MEM[64] + 23 + v0.length + 0] = ' is missing role ';
        v4 = v5 = 0;
        while (v4 < v1.length) {
            MEM[32 + MEM[64] + 23 + v0.length + 17 + v4] = v1[v4];
            v4 = v4 + 32;
        }
        MEM[32 + MEM[64] + 23 + v0.length + 17 + v1.length] = 0;
        v6 = new uint256[](32 + MEM[64] + 23 + v0.length + 17 + v1.length - MEM[64] - 32);
        v7 = v8 = 0;
        while (v7 < 32 + MEM[64] + 23 + v0.length + 17 + v1.length - MEM[64] - 32) {
            MEM[v6.data + v7] = MEM[MEM[64] + 32 + v7];
            v7 = v7 + 32;
        }
        MEM[v6.data + (32 + MEM[64] + 23 + v0.length + 17 + v1.length - MEM[64] - 32)] = 0;
        revert(Error(v6));
    }
}

function 0x185e(uint256 varg0, address varg1) private { 
    require(0 <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v0 = new bytes[](0);
    if (0) {
        CALLDATACOPY(v0.data, msg.data.length, 0);
        v1 = v0.data;
    }
    v2 = v3 = 0;
    while (v2 < v0.length) {
        MEM[v4.data + v2] = v0[v2];
        v2 = v2 + 32;
    }
    MEM[v4.data] = 0;
    v5, /* uint256 */ v6 = varg1.call(v4.data).value(varg0).gas(msg.gas);
    if (RETURNDATASIZE() != 0) {
        v7 = new bytes[](RETURNDATASIZE());
        v6 = v7.data;
        RETURNDATACOPY(v6, 0, RETURNDATASIZE());
    }
    require(v5, Error('TransferHelper: ETH_TRANSFER_FAILED'));
    return ;
}

function 0x1ea77497() public nonPayable { 
    0x17da(msg.sender, 0);
    stor_3_0_0 = 1;
}

function 0x1959(uint256 varg0, address varg1, address varg2) private { 
    v0 = v1 = 0;
    while (v0 < 68) {
        MEM[MEM[64] + v0] = MEM[MEM[64] + 32 + v0];
        v0 = v0 + 32;
    }
    MEM[MEM[64] + 68] = 0;
    v2 = v3, /* uint256 */ v4, /* uint256 */ v5 = varg2.transfer(varg1, varg0).gas(msg.gas);
    if (RETURNDATASIZE() == 0) {
        v6 = v7 = 96;
    } else {
        v6 = new bytes[](RETURNDATASIZE());
        RETURNDATACOPY(v6.data, 0, RETURNDATASIZE());
    }
    if (v3) {
        v2 = v8 = MEM[v6] == 0;
        if (MEM[v6] != 0) {
            require(32 + v6 + MEM[v6] - (32 + v6) >= 32);
            v2 = MEM[32 + v6 + 0];
            require(v2 == bool(v2));
        }
    }
    require(v2, Error('TransferHelper: TRANSFER_FAILED'));
    return ;
}

function getRoleAdmin(bytes32 role) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 32);
    return _getRoleAdmin[role].field1;
}

function 0x1a89(uint256 varg0) private { 
    0x17da(msg.sender, varg0);
    return ;
}

function 0x1a9d(address varg0, uint256 varg1) private { 
    if (!uint8(_getRoleAdmin[varg1].field0[address(address(varg0))])) {
        _getRoleAdmin[varg1].field0[varg0] = 0x1 | bytes31(_getRoleAdmin[varg1].field0[address(address(varg0))]);
        emit RoleGranted(varg1, varg0, msg.sender);
    }
    return ;
}

function 0x1b77(address varg0, uint256 varg1) private { 
    if (uint8(_getRoleAdmin[varg1].field0[address(address(varg0))])) {
        _getRoleAdmin[varg1].field0[varg0] = 0x0 | bytes31(_getRoleAdmin[varg1].field0[address(address(varg0))]);
        emit RoleRevoked(varg1, varg0, msg.sender);
    }
    return ;
}

function 0x1d84(uint256 varg0, uint256 varg1, address varg2, uint256 varg3, uint256 varg4) private { 
    v0 = v1 = 0;
    if (varg0) {
        v2 = v3 = 0;
        while (v2 < MEM[varg3]) {
            v4 = _SafeSub(MEM[varg3], v2);
            v5 = _SafeSub(v4, 1);
            require(v5 < MEM[varg3], Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
            v6 = MEM[32 + (v5 << 5) + varg3];
            v7, /* uint112 */ v8, /* uint112 */ v9, /* uint32 */ v10 = address(v6).getReserves().gas(msg.gas);
            if (bool(v7)) {
                require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 96);
                require(v8 == uint112(v8));
                require(v9 == uint112(v9));
                require(v10 == uint32(v10));
                v11 = v12 = uint112(v9);
                v11 = v13 = uint112(v8);
                v14, /* address */ v15 = address(v6).token0().gas(msg.gas);
                if (bool(v14)) {
                    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
                    0x2c76(v15);
                    if (address(varg4) != address(v15)) {
                    }
                    v16, /* uint256 */ v17 = address(varg4).balanceOf(address(v6)).gas(msg.gas);
                    if (bool(v16)) {
                        MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
                        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
                        0x2ca9(v17);
                        v18 = _SafeSub(v17, v11);
                        v19, /* uint256 */ v0 = varg2.getAmountOut(v18, v11, v11).gas(msg.gas);
                        if (bool(v19)) {
                            MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
                            require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
                            0x2ca9(v0);
                            v20, /* address */ v21 = address(v6).token0().gas(msg.gas);
                            if (bool(v20)) {
                                require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
                                0x2c76(v21);
                                if (address(varg4) == address(v21)) {
                                    v0 = v22 = 0;
                                } else {
                                    v0 = v23 = 0;
                                }
                                if (v5 > 0) {
                                    v24 = _SafeSub(v5, 1);
                                    require(v24 < MEM[varg3], Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
                                    varg1 = v25 = MEM[32 + (v24 << 5) + varg3];
                                }
                                require(0 <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
                                v26 = new bytes[](0);
                                if (0) {
                                    CALLDATACOPY(v26.data, msg.data.length, 0);
                                    v27 = v26.data;
                                }
                                v28 = new bytes[](v26.length);
                                MEM[4 + MEM[64] + 0] = v0;
                                v29 = v30 = 0;
                                while (v29 < v26.length) {
                                    v28[v29] = v26[v29];
                                    v29 = v29 + 32;
                                }
                                v31 = v28.data;
                                v28[v26.length] = 0;
                                require(bool((address(v6)).code.size));
                                v32 = address(v6).swap(v0, v0, address(varg1), v28).gas(msg.gas);
                                if (bool(v32)) {
                                    v33, /* address */ v34 = address(v6).token0().gas(msg.gas);
                                    if (bool(v33)) {
                                        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
                                        0x2c76(v34);
                                        if (address(varg4) == address(v34)) {
                                            v35 = address(v6).token1().gas(msg.gas);
                                            if (bool(v35)) {
                                                require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
                                                varg4 = v36 = MEM[MEM[64] + 0];
                                                0x2c76(v36);
                                            } else {
                                                RETURNDATACOPY(0, 0, RETURNDATASIZE());
                                                revert(0, RETURNDATASIZE());
                                            }
                                        } else {
                                            v37 = address(v6).token0().gas(msg.gas);
                                            if (bool(v37)) {
                                                require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
                                                varg4 = v38 = MEM[MEM[64] + 0];
                                                0x2c76(v38);
                                            } else {
                                                RETURNDATACOPY(0, 0, RETURNDATASIZE());
                                                revert(0, RETURNDATASIZE());
                                            }
                                        }
                                        v2 += 1;
                                    } else {
                                        RETURNDATACOPY(0, 0, RETURNDATASIZE());
                                        revert(0, RETURNDATASIZE());
                                    }
                                } else {
                                    RETURNDATACOPY(0, 0, RETURNDATASIZE());
                                    revert(0, RETURNDATASIZE());
                                }
                            } else {
                                RETURNDATACOPY(0, 0, RETURNDATASIZE());
                                revert(0, RETURNDATASIZE());
                            }
                        } else {
                            RETURNDATACOPY(0, 0, RETURNDATASIZE());
                            revert(0, RETURNDATASIZE());
                        }
                    } else {
                        RETURNDATACOPY(0, 0, RETURNDATASIZE());
                        revert(0, RETURNDATASIZE());
                    }
                } else {
                    RETURNDATACOPY(0, 0, RETURNDATASIZE());
                    revert(0, RETURNDATASIZE());
                }
            } else {
                RETURNDATACOPY(0, 0, RETURNDATASIZE());
                revert(0, RETURNDATASIZE());
            }
        }
    } else {
        v39 = v40 = 0;
        while (v39 < MEM[varg3]) {
            require(v39 < MEM[varg3], Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
            v41 = MEM[32 + (v39 << 5) + varg3];
            v42, /* uint112 */ v43, /* uint112 */ v44, /* uint32 */ v45 = address(v41).getReserves().gas(msg.gas);
            if (bool(v42)) {
                require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 96);
                require(v43 == uint112(v43));
                require(v44 == uint112(v44));
                require(v45 == uint32(v45));
                v46 = v47 = uint112(v44);
                v46 = v48 = uint112(v43);
                v49, /* address */ v50 = address(v41).token0().gas(msg.gas);
                if (bool(v49)) {
                    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
                    0x2c76(v50);
                    if (address(varg4) != address(v50)) {
                    }
                    v51, /* uint256 */ v52 = address(varg4).balanceOf(address(v41)).gas(msg.gas);
                    if (bool(v51)) {
                        MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
                        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
                        0x2ca9(v52);
                        v53 = _SafeSub(v52, v46);
                        v54, /* uint256 */ v0 = varg2.getAmountOut(v53, v46, v46).gas(msg.gas);
                        if (bool(v54)) {
                            MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
                            require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
                            0x2ca9(v0);
                            v55, /* address */ v56 = address(v41).token0().gas(msg.gas);
                            if (bool(v55)) {
                                require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
                                0x2c76(v56);
                                if (address(varg4) == address(v56)) {
                                    v0 = v57 = 0;
                                } else {
                                    v0 = v58 = 0;
                                }
                                v59 = _SafeSub(MEM[varg3], 1);
                                if (v39 < v59) {
                                    v60 = _SafeAdd(v39, 1);
                                    require(v60 < MEM[varg3], Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
                                    varg1 = v61 = MEM[32 + (v60 << 5) + varg3];
                                }
                                require(0 <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
                                v62 = new bytes[](0);
                                if (0) {
                                    CALLDATACOPY(v62.data, msg.data.length, 0);
                                    v63 = v62.data;
                                }
                                v64 = new bytes[](v62.length);
                                MEM[4 + MEM[64] + 0] = v0;
                                v65 = v66 = 0;
                                while (v65 < v62.length) {
                                    v64[v65] = v62[v65];
                                    v65 = v65 + 32;
                                }
                                v67 = v64.data;
                                v64[v62.length] = 0;
                                require(bool((address(v41)).code.size));
                                v68 = address(v41).swap(v0, v0, address(varg1), v64).gas(msg.gas);
                                if (bool(v68)) {
                                    v69, /* address */ v70 = address(v41).token0().gas(msg.gas);
                                    if (bool(v69)) {
                                        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
                                        0x2c76(v70);
                                        if (address(varg4) == address(v70)) {
                                            v71 = address(v41).token1().gas(msg.gas);
                                            if (bool(v71)) {
                                                require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
                                                varg4 = v72 = MEM[MEM[64] + 0];
                                                0x2c76(v72);
                                            } else {
                                                RETURNDATACOPY(0, 0, RETURNDATASIZE());
                                                revert(0, RETURNDATASIZE());
                                            }
                                        } else {
                                            v73 = address(v41).token0().gas(msg.gas);
                                            if (bool(v73)) {
                                                require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
                                                varg4 = v74 = MEM[MEM[64] + 0];
                                                0x2c76(v74);
                                            } else {
                                                RETURNDATACOPY(0, 0, RETURNDATASIZE());
                                                revert(0, RETURNDATASIZE());
                                            }
                                        }
                                        v39 += 1;
                                    } else {
                                        RETURNDATACOPY(0, 0, RETURNDATASIZE());
                                        revert(0, RETURNDATASIZE());
                                    }
                                } else {
                                    RETURNDATACOPY(0, 0, RETURNDATASIZE());
                                    revert(0, RETURNDATASIZE());
                                }
                            } else {
                                RETURNDATACOPY(0, 0, RETURNDATASIZE());
                                revert(0, RETURNDATASIZE());
                            }
                        } else {
                            RETURNDATACOPY(0, 0, RETURNDATASIZE());
                            revert(0, RETURNDATASIZE());
                        }
                    } else {
                        RETURNDATACOPY(0, 0, RETURNDATASIZE());
                        revert(0, RETURNDATASIZE());
                    }
                } else {
                    RETURNDATACOPY(0, 0, RETURNDATASIZE());
                    revert(0, RETURNDATASIZE());
                }
            } else {
                RETURNDATACOPY(0, 0, RETURNDATASIZE());
                revert(0, RETURNDATASIZE());
            }
        }
    }
    return varg4, v0;
}

function 0x25c12b21(uint256 varg0) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 32);
    require(varg0 <= uint64.max);
    require(4 + varg0 + 31 < 4 + (msg.data.length - 4));
    require(varg0.length <= uint64.max);
    require(varg0.data + (varg0.length << 5) <= 4 + (msg.data.length - 4));
    0x17da(msg.sender, 0);
    v0 = v1 = 0;
    while (v0 < varg0.length) {
        require(v0 < varg0.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        require((v0 << 5) + varg0.data + 32 - ((v0 << 5) + varg0.data) >= 32);
        0x2c76(varg0[v0]);
        0x1a89(_getRoleAdmin[0xe649c55666657418b565fa9b85feb1dd33edc8cb201864cac59e46a75497e833].field1);
        0x1a9d(varg0[v0], 0xe649c55666657418b565fa9b85feb1dd33edc8cb201864cac59e46a75497e833);
        v0 += 1;
    }
}

function 0x29c2ea86(address varg0, address varg1, uint256 varg2) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 96);
    0x2c76(varg0);
    0x2c76(varg1);
    0x2ca9(varg2);
    0x17da(msg.sender, 0);
    0x1959(varg2, varg1, varg0);
}

function grantRole(bytes32 role, address account) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 64);
    0x2c76(account);
    0x5de(account, role);
}

function 0x35f07a4f(address varg0) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 32);
    0x2c76(varg0);
    0x17da(msg.sender, 0);
    0x8fc(varg0, 0);
    0x5de(varg0, 0xe649c55666657418b565fa9b85feb1dd33edc8cb201864cac59e46a75497e833);
}

function renounceRole(bytes32 role, address account) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 64);
    0x2c76(account);
    require(account == msg.sender, Error('AccessControl: can only renounce roles for self'));
    0x1b77(account, role);
}

function 0x294d(uint256 varg0, uint256 varg1) private { 
    v0 = _SafeMul(2, varg0);
    v1 = _SafeAdd(v0, 2);
    require(v1 <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v2 = new bytes[](v1);
    if (v1) {
        CALLDATACOPY(v2.data, msg.data.length, v1);
    }
    require(0 < v2.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    MEM8[v2.data] = (byte(bytes1(0x3000000000000000000000000000000000000000000000000000000000000000), 0x0)) & 0xFF;
    require(1 < v2.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    MEM8[33 + v2] = (byte(bytes1(0x7800000000000000000000000000000000000000000000000000000000000000), 0x0)) & 0xFF;
    v3 = _SafeMul(2, varg0);
    v4 = v5 = _SafeAdd(v3, 1);
    while (v4 > 1) {
        require(bool(varg1) < 16, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        require(v4 < v2.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        MEM8[32 + v4 + v2] = (byte(bytes1((byte('0123456789abcdef', bool(varg1))) << 248), 0x0)) & 0xFF;
        varg1 = varg1 >> 4;
        require(v4 - 0, Panic(17)); // arithmetic overflow or underflow
        v4 = v4 - 1;
    }
    require(varg1 == 0, Error('Strings: hex length insufficient'));
    return v2;
}

function 0x40d8b279() public nonPayable { 
    0x17da(msg.sender, 0);
    stor_3_0_0 = 0;
}

function 0x6970a553(address varg0) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 32);
    0x2c76(varg0);
    0x17da(msg.sender, 0);
    0x5de(varg0, 0);
    0x5de(varg0, 0xe649c55666657418b565fa9b85feb1dd33edc8cb201864cac59e46a75497e833);
}

function 0x2c76(address varg0) private { 
    return ;
}

function 0x2ca9(uint256 varg0) private { 
    return ;
}

function 0x6b77c74c(uint256 varg0) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 32);
    require(varg0 <= uint64.max);
    require(4 + varg0 + 31 < 4 + (msg.data.length - 4));
    require(varg0.length <= uint64.max);
    require(varg0.data + (varg0.length << 5) <= 4 + (msg.data.length - 4));
    0x17da(msg.sender, 0);
    v0 = v1 = 0;
    while (v0 < varg0.length) {
        require(v0 < varg0.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        require((v0 << 5) + varg0.data + 32 - ((v0 << 5) + varg0.data) >= 32);
        0x2c76(varg0[v0]);
        0x1a89(_getRoleAdmin[0xe649c55666657418b565fa9b85feb1dd33edc8cb201864cac59e46a75497e833].field1);
        0x1b77(varg0[v0], 0xe649c55666657418b565fa9b85feb1dd33edc8cb201864cac59e46a75497e833);
        v0 += 1;
    }
}

function 0x6e7b0681(address varg0) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 32);
    0x2c76(varg0);
    0x17da(msg.sender, 0);
    stor_1_0_19 = varg0;
}

function 0x6ed74cf9(address varg0, address varg1, address varg2, uint256 varg3) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 128);
    0x2c76(varg0);
    0x2c76(varg1);
    0x2c76(varg2);
    0x2ca9(varg3);
    0x17da(msg.sender, 0);
    v0 = v1 = 0;
    while (v0 < 100) {
        MEM[MEM[64] + v0] = MEM[MEM[64] + 32 + v0];
        v0 = v0 + 32;
    }
    MEM[MEM[64] + 100] = 0;
    v2 = v3, /* uint256 */ v4, /* uint256 */ v5 = varg0.transferFrom(varg1, varg2, varg3).gas(msg.gas);
    if (RETURNDATASIZE() == 0) {
        v6 = v7 = 96;
    } else {
        v6 = v8 = new bytes[](RETURNDATASIZE());
        RETURNDATACOPY(v8.data, 0, RETURNDATASIZE());
    }
    if (v3) {
        v2 = v9 = MEM[v6] == 0;
        if (MEM[v6] != 0) {
            require(v5 + MEM[v6] - v5 >= 32);
            v2 = MEM[v5 + 0];
            require(v2 == bool(v2));
        }
    }
    require(v2, Error('TransferHelper: TRANSFER_FROM_FAILED'));
}

function 0x33f1(uint256 varg0, uint256 varg1) private { 
    require(varg1 - varg0 >= 32);
    require(MEM[varg0 + 0] <= uint64.max);
    v0 = varg0 + MEM[varg0 + 0];
    require(v0 + 31 < varg1);
    v1 = v2 = v0 + 32;
    require(MEM[v0] <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v3 = new uint256[](MEM[v0]);
    require(!((v3 + ((MEM[v0] << 5) + 32 + 31 & ~0x1f) > uint64.max) | (v3 + ((MEM[v0] << 5) + 32 + 31 & ~0x1f) < v3)), Panic(65)); // failed memory allocation (too much memory)
    v4 = v5 = v3.data;
    require(v2 + (MEM[v0] << 5) <= varg1);
    while (v1 < v2 + (MEM[v0] << 5)) {
        0x2ca9(MEM[v1]);
        MEM[v4] = MEM[v1];
        v4 = v4 + 32;
        v1 = v1 + 32;
    }
    return v3;
}

function hasRole(bytes32 role, address account) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 64);
    0x2c76(account);
    return bool(_getRoleAdmin[role].field0[address(address(account))]);
}

function DEFAULT_ADMIN_ROLE() public nonPayable { 
    return 0;
}

function _SafeSub(uint256 varg0, uint256 varg1) private { 
    require(varg0 - varg1 <= varg0, Panic(17)); // arithmetic overflow or underflow
    return varg0 - varg1;
}

function _SafeAdd(uint256 varg0, uint256 varg1) private { 
    require(varg0 <= varg0 + varg1, Panic(17)); // arithmetic overflow or underflow
    return varg0 + varg1;
}

function 0xc3f563b2() public nonPayable { 
    0x17da(msg.sender, 0);
    selfdestruct(stor_1_0_19);
}

function _SafeMul(uint256 varg0, uint256 varg1) private { 
    require(!varg0 | (varg1 == varg0 * varg1 / varg0), Panic(17)); // arithmetic overflow or underflow
    return varg0 * varg1;
}

function revokeRole(bytes32 role, address account) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 64);
    0x2c76(account);
    0x8fc(account, role);
}

function DSPFlashLoanCall(address sender, uint256 baseAmount, uint256 quoteAmount, bytes data) public nonPayable { 
    v0 = v1 = 1065;
    require(4 + (msg.data.length - 4) - 4 >= 128);
    0x2c76(sender);
    0x2ca9(baseAmount);
    0x2ca9(quoteAmount);
    require(data <= uint64.max);
    require(4 + data + 31 < 4 + (msg.data.length - 4));
    v0 = v2 = data.length;
    require(v2 <= uint64.max);
    v0 = v3 = data.data;
    require(v3 + v2 <= 4 + (msg.data.length - 4));
    require(sender == address(this));
    require(stor_3_0_0);
    require(2 <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v0 = v4 = new uint256[](2);
    if (2) {
        CALLDATACOPY(v4.data, msg.data.length, 64);
    }
    require(0 < v4.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v5 = v4.data;
    v4[0] = stor_9_0_19;
    require(1 < v4.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v4[1] = stor_c_0_19;
    v6 = v7 = 2783;
    v8 = v9 = stor_6_0_19;
    require(0 < v4.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v10 = v4.data;
    v11 = v12 = v4[0];
    v0 = v13 = stor_11;
    while (1) {
        v14 = v15 = 0;
        while (v14 < 68) {
            MEM[MEM[64] + v14] = MEM[MEM[64] + 32 + v14];
            v14 = v14 + 32;
        }
        MEM[MEM[64] + 68] = 0;
        v16 = v17 = address(v8).transfer(address(v11), v0).gas(msg.gas);
        if (RETURNDATASIZE() == 0) {
            v18 = 96;
        } else {
            v18 = v19 = MEM[64];
            MEM[64] = v19 + (RETURNDATASIZE() + 63 & ~0x1f);
            MEM[v19] = RETURNDATASIZE();
            RETURNDATACOPY(v19 + 32, 0, RETURNDATASIZE());
        }
        if (v17) {
            v16 = v20 = MEM[v18] == 0;
            if (MEM[v18] != 0) {
                require(32 + v18 + MEM[v18] - (32 + v18) >= 32);
                v16 = MEM[32 + v18 + 0];
                require(v16 == bool(v16));
            }
        }
        require(v16, Error('TransferHelper: TRANSFER_FAILED'));
        // Unknown jump to Block {'0xadfB0x424', '0x1102B0x424', '0x1315B0x424'}. Refer to 3-address code (TAC);
        v21, v22 = 0x1d84(0, this, stor_8_0_19, v0, stor_6_0_19);
        require(0 < MEM[v0], Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        MEM[32 + v0] = stor_d_0_19;
        require(1 < MEM[v0], Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        MEM[64 + v0] = stor_a_0_19;
        MEM[MEM[64]] = 0x1f00ca7400000000000000000000000000000000000000000000000000000000;
        MEM[4 + MEM[64] + 0] = stor_12;
        MEM[4 + MEM[64] + 32] = 64;
        MEM[4 + MEM[64] + 64] = MEM[v0];
        v23 = v24 = 4 + MEM[64] + 64 + 32;
        v25 = v26 = v0 + 32;
        v27 = v28 = 0;
        while (v27 < MEM[v0]) {
            MEM[v23] = address(MEM[v25]);
            v23 = v23 + 32;
            v25 = v25 + 32;
            v27 = v27 + 1;
        }
        v29 = stor_8_0_19.staticcall(MEM[(MEM[64]) len (v23 - MEM[64])], MEM[(MEM[64]) len 0]).gas(msg.gas);
        if (bool(v29)) {
            RETURNDATACOPY(MEM[64], 0, RETURNDATASIZE());
            v30 = 0x33f1(MEM[64], MEM[64] + RETURNDATASIZE());
            require(0 < v30.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
            v31 = v30.data;
            MEM[MEM[64]] = 0xac00377300000000000000000000000000000000000000000000000000000000;
            MEM[4 + MEM[64] + 0] = v30[0];
            MEM[4 + MEM[64] + 32] = stor_1_0_19;
            require(bool(stor_10_0_19.code.size));
            v32 = stor_10_0_19.call(MEM[(MEM[64]) len (4 + MEM[64] + 64 - MEM[64])], MEM[(MEM[64]) len 0]).gas(msg.gas);
            if (bool(v32)) {
                MEM[MEM[64]] = 0x1f00ca7400000000000000000000000000000000000000000000000000000000;
                MEM[4 + MEM[64] + 0] = stor_d_0_19.balance;
                MEM[4 + MEM[64] + 32] = 64;
                MEM[4 + MEM[64] + 64] = MEM[v0];
                v33 = v34 = 4 + MEM[64] + 64 + 32;
                v35 = v36 = v0 + 32;
                v37 = v38 = 0;
                while (v37 < MEM[v0]) {
                    MEM[v33] = address(MEM[v35]);
                    v33 = v33 + 32;
                    v35 = v35 + 32;
                    v37 = v37 + 1;
                }
                v39 = stor_8_0_19.staticcall(MEM[(MEM[64]) len (v33 - MEM[64])], MEM[(MEM[64]) len 0]).gas(msg.gas);
                if (bool(v39)) {
                    RETURNDATACOPY(MEM[64], 0, RETURNDATASIZE());
                    v40 = 0x33f1(MEM[64], MEM[64] + RETURNDATASIZE());
                    require(0 < v40.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
                    v41 = v40.data;
                    v0 = v42 = v40[0];
                    MEM[MEM[64]] = 0xac00377300000000000000000000000000000000000000000000000000000000;
                    MEM[4 + MEM[64] + 0] = v42;
                    MEM[4 + MEM[64] + 32] = stor_1_0_19;
                    require(bool(stor_10_0_19.code.size));
                    v43 = stor_10_0_19.call(MEM[(MEM[64]) len (4 + MEM[64] + 64 - MEM[64])], MEM[(MEM[64]) len 0]).gas(msg.gas);
                    if (bool(v43)) {
                        MEM[MEM[64]] = 0x991a747600000000000000000000000000000000000000000000000000000000;
                        MEM[4 + MEM[64] + 0] = stor_e_0_19;
                        require(bool(stor_10_0_19.code.size));
                        v44 = stor_10_0_19.call(MEM[(MEM[64]) len (4 + MEM[64] + 32 - MEM[64])], MEM[(MEM[64]) len 0]).gas(msg.gas);
                        if (bool(v44)) {
                            v0 = v45 = (address(this)).balance;
                            0x185e(v45, stor_a_0_19);
                            require(1 <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
                            v0 = v46 = new uint256[](1);
                            if (1) {
                                CALLDATACOPY(v46.data, msg.data.length, 32);
                            }
                            require(0 < v46.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
                            v47 = v46.data;
                            v46[0] = stor_9_0_19;
                            v6 = v48 = 4354;
                            v8 = v49 = stor_a_0_19;
                            require(0 < v46.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
                            v50 = v46.data;
                            v11 = v51 = v46[0];
                        } else {
                            RETURNDATACOPY(0, 0, RETURNDATASIZE());
                            revert(0, RETURNDATASIZE());
                        }
                    } else {
                        RETURNDATACOPY(0, 0, RETURNDATASIZE());
                        revert(0, RETURNDATASIZE());
                    }
                } else {
                    RETURNDATACOPY(0, 0, RETURNDATASIZE());
                    revert(0, RETURNDATASIZE());
                }
            } else {
                RETURNDATACOPY(0, 0, RETURNDATASIZE());
                revert(0, RETURNDATASIZE());
            }
        } else {
            RETURNDATACOPY(0, 0, RETURNDATASIZE());
            revert(0, RETURNDATASIZE());
        }
        v52, v53 = 0x1d84(0, this, stor_8_0_19, v0, stor_a_0_19);
        MEM[MEM[64]] = 0x70a0823100000000000000000000000000000000000000000000000000000000;
        MEM[4 + MEM[64] + 0] = address(this);
        v54 = stor_d_0_19.staticcall(MEM[(MEM[64]) len (4 + MEM[64] + 32 - MEM[64])], MEM[(MEM[64]) len 32]).gas(msg.gas);
        if (bool(v54)) {
            MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
            require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
            v0 = v55 = MEM[MEM[64] + 0];
            0x2ca9(v55);
            require(0 < MEM[v0], Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
            MEM[32 + v0] = stor_9_0_19;
            require(1 < MEM[v0], Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
            MEM[64 + v0] = stor_c_0_19;
            v6 = v56 = 4885;
            v8 = v57 = stor_d_0_19;
            require(1 < MEM[v0], Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
            v11 = v58 = MEM[64 + v0];
        } else {
            RETURNDATACOPY(0, 0, RETURNDATASIZE());
            revert(0, RETURNDATASIZE());
        }
        v59, v60 = 0x1d84(1, this, stor_8_0_19, v0, stor_d_0_19);
        0x1959(v0, stor_3_1_20, stor_6_0_19);
        v61, /* uint256 */ v62 = stor_7_0_19.balanceOf(address(this)).gas(msg.gas);
        require(bool(v61), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        0x2ca9(v62);
        require(v62 >= stor_b, Error(120));
        0x1959(v62, stor_1_0_19, stor_6_0_19);
        exit;
    }
}

function 0xe71396ec(address varg0, address varg1, address varg2, address varg3, uint256 varg4, uint256 varg5, uint256 varg6) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 224);
    0x2c76(varg0);
    0x2c76(varg1);
    0x2c76(varg2);
    0x2c76(varg3);
    0x2ca9(varg4);
    0x2ca9(varg5);
    0x2ca9(varg6);
    0x17da(msg.sender, 0);
    stor_b = varg6;
    stor_3_1_20 = varg0;
    stor_4_0_19 = stor_3_1_20;
    stor_e_0_19 = this;
    stor_11 = varg4;
    stor_12 = varg5;
    stor_c_0_19 = varg2;
    stor_d_0_19 = varg1;
    stor_10_0_19 = varg3;
    require(bool(stor_4_0_19.code.size));
    v0 = stor_4_0_19.flashLoan(stor_11, 0, address(this), 49).gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    stor_3_0_0 = 0;
}

function receive() public payable { 
}

function 0x5de(uint256 varg0, uint256 varg1) private { 
    0x1a89(_getRoleAdmin[varg1].field1);
    0x1a9d(varg0, varg1);
    return ;
}

function 0x8fc(uint256 varg0, uint256 varg1) private { 
    0x1a89(_getRoleAdmin[varg1].field1);
    0x1b77(varg0, varg1);
    return ;
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function function_selector( function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length < 4) {
        if (!msg.data.length) {
            receive();
        }
    } else if (0x6970a553 > function_selector >> 224) {
        if (0x29c2ea86 > function_selector >> 224) {
            if (0x1ffc9a7 == function_selector >> 224) {
                supportsInterface(bytes4);
            } else if (0xc2ca43b == function_selector >> 224) {
                0x0c2ca43b();
            } else if (0x1ea77497 == function_selector >> 224) {
                0x1ea77497();
            } else if (0x248a9ca3 == function_selector >> 224) {
                getRoleAdmin(bytes32);
            } else if (0x25c12b21 == function_selector >> 224) {
                0x25c12b21();
            }
        } else if (0x29c2ea86 == function_selector >> 224) {
            0x29c2ea86();
        } else if (0x2f2ff15d == function_selector >> 224) {
            grantRole(bytes32,address);
        } else if (0x35f07a4f == function_selector >> 224) {
            0x35f07a4f();
        } else if (0x36568abe == function_selector >> 224) {
            renounceRole(bytes32,address);
        } else if (0x40d8b279 == function_selector >> 224) {
            0x40d8b279();
        }
    } else if (0xa217fddf > function_selector >> 224) {
        if (0x6970a553 == function_selector >> 224) {
            0x6970a553();
        } else if (0x6b77c74c == function_selector >> 224) {
            0x6b77c74c();
        } else if (0x6e7b0681 == function_selector >> 224) {
            0x6e7b0681();
        } else if (0x6ed74cf9 == function_selector >> 224) {
            0x6ed74cf9();
        } else if (0x91d14854 == function_selector >> 224) {
            hasRole(bytes32,address);
        }
    } else if (0xa217fddf == function_selector >> 224) {
        DEFAULT_ADMIN_ROLE();
    } else if (0xc3f563b2 == function_selector >> 224) {
        0xc3f563b2();
    } else if (0xd547741f == function_selector >> 224) {
        revokeRole(bytes32,address);
    } else if (0xd5b99797 == function_selector >> 224) {
        0xd5b99797(function_selector >> 224);
    } else if (0xe71396ec == function_selector >> 224) {
        0xe71396ec();
    }
}
