// Decompiled by library.dedaub.com
// 2023.01.13 03:57 UTC

// Data structures and variables inferred from the use of storage instructions
address stor_0_0_19; // STORAGE[0x0] bytes 0 to 19


function onERC721Received(address varg0, address varg1, uint256 varg2, bytes varg3) public nonPayable { 
    require(msg.data.length - 4 >= 128);
    require(varg0 == varg0);
    require(varg1 == varg1);
    require(varg3 <= 0xffffffffffffffff);
    require(4 + varg3 + 31 < msg.data.length);
    require(varg3.length <= 0xffffffffffffffff);
    v0 = varg3.data;
    require(4 + varg3 + varg3.length + 32 <= msg.data.length);
    return 0x150b7a0200000000000000000000000000000000000000000000000000000000;
}

function 0x3e4cdd45(uint256 varg0, uint256 varg1, uint256 varg2) public nonPayable { 
    require(msg.data.length - 4 >= 96);
    require(varg0 == address(varg0));
    require(varg1 <= 0xffffffffffffffff);
    require(4 + varg1 + 31 < msg.data.length);
    require(varg1.length <= 0xffffffffffffffff, Panic(65));
    v0 = new bytes[](varg1.length);
    require(!((v0 + (~0x1f & 32 + (~0x1f & varg1.length + 31) + 31) < v0) | (v0 + (~0x1f & 32 + (~0x1f & varg1.length + 31) + 31) > 0xffffffffffffffff)), Panic(65));
    require(4 + varg1 + varg1.length + 32 <= msg.data.length);
    CALLDATACOPY(v0.data, varg1.data, varg1.length);
    v0[varg1.length] = 0;
    v1 = v2 = 0;
    while (v1 < varg2) {
        v3 = new array[](v0.length);
        v4 = v5 = 0;
        while (v4 < v0.length) {
            v3[v4] = v0[v4];
            v4 += 32;
        }
        if (v4 > v0.length) {
            v3[v0.length] = 0;
            goto 0x1184B0x1370B0x3cdB0x18a;
        }
        require(0x76e2cfc1f5fa8f6a5b3fc4c8f4788f0116861f9b.code.size);
        v6 = 0x76e2cfc1f5fa8f6a5b3fc4c8f4788f0116861f9b.createProxy(address(varg0), v3).gas(msg.gas);
        require(v6); // checks call status, propagates error data on error
        require(v1 != ~0, Panic(17));
        v1 += 1;
    }
}

function () public payable { 
}

function createProxy() public nonPayable { 
    v0 = new array[](0);
    require(0x76e2cfc1f5fa8f6a5b3fc4c8f4788f0116861f9b.code.size);
    v1 = 0x76e2cfc1f5fa8f6a5b3fc4c8f4788f0116861f9b.createProxy(0xe7145dd6287ae53326347f3a6694fcf2954bcd8a, v0).gas(msg.gas);
    require(v1); // checks call status, propagates error data on error
}

function self() public nonPayable { 
    return 0xe7145dd6287ae53326347f3a6694fcf2954bcd8a;
}

function owner() public nonPayable { 
    return 0x8bcfe4f1358e50a1db10025d731c8b3b17f04dbb;
}

function exec(address[] varg0, bytes[] varg1, uint256[] varg2) public payable { 
    require(msg.data.length - 4 >= 96);
    require(varg0 <= 0xffffffffffffffff);
    require(4 + varg0 + 31 < msg.data.length);
    v0 = 0xecb(varg0.length);
    require(!((MEM[64] + (~0x1f & v0 + 31) < MEM[64]) | (MEM[64] + (~0x1f & v0 + 31) > 0xffffffffffffffff)), Panic(65));
    v1 = v2 = MEM[64] + 32;
    require(32 + (4 + varg0 + (varg0.length << 5)) <= msg.data.length);
    v3 = v4 = varg0.data;
    while (v3 < 32 + (4 + varg0 + (varg0.length << 5))) {
        require(msg.data[v3] == address(msg.data[v3]));
        MEM[v1] = msg.data[v3];
        v3 += 32;
        v1 += 32;
    }
    require(varg1 <= 0xffffffffffffffff);
    require(4 + varg1 + 31 < msg.data.length);
    v5 = 0xecb(varg1.length);
    require(!((MEM[64] + (~0x1f & v5 + 31) < MEM[64]) | (MEM[64] + (~0x1f & v5 + 31) > 0xffffffffffffffff)), Panic(65));
    v6 = v7 = MEM[64] + 32;
    require(32 + (4 + varg1 + (varg1.length << 5)) <= msg.data.length);
    v8 = v9 = varg1.data;
    while (v8 < 32 + (4 + varg1 + (varg1.length << 5))) {
        if (msg.data[v8] <= 0xffffffffffffffff) {
            break;
        }
        require(msg.data[v8] <= 0xffffffffffffffff);
        if (4 + varg1 + msg.data[v8] + 32 + 31 < msg.data.length) {
            break;
        }
        require(4 + varg1 + msg.data[v8] + 32 + 31 < msg.data.length);
        require(msg.data[4 + varg1 + msg.data[v8] + 32] <= 0xffffffffffffffff, Panic(65));
        v10 = new bytes[](msg.data[4 + varg1 + msg.data[v8] + 32]);
        require(!((v10 + (~0x1f & 32 + (~0x1f & msg.data[4 + varg1 + msg.data[v8] + 32] + 31) + 31) < v10) | (v10 + (~0x1f & 32 + (~0x1f & msg.data[4 + varg1 + msg.data[v8] + 32] + 31) + 31) > 0xffffffffffffffff)), Panic(65));
        require(4 + varg1 + msg.data[v8] + 32 + msg.data[4 + varg1 + msg.data[v8] + 32] + 32 <= msg.data.length);
        CALLDATACOPY(v10.data, 4 + varg1 + msg.data[v8] + 32 + 32, msg.data[4 + varg1 + msg.data[v8] + 32]);
        v10[msg.data[4 + varg1 + msg.data[v8] + 32]] = 0;
        MEM[v6] = v10;
        v6 += 32;
        v8 += 32;
    }
    require(varg2 <= 0xffffffffffffffff);
    require(4 + varg2 + 31 < msg.data.length);
    v11 = 0xecb(varg2.length);
    require(!((MEM[64] + (~0x1f & v11 + 31) < MEM[64]) | (MEM[64] + (~0x1f & v11 + 31) > 0xffffffffffffffff)), Panic(65));
    v12 = v13 = MEM[64] + 32;
    require(32 + (4 + varg2 + (varg2.length << 5)) <= msg.data.length);
    v14 = v15 = varg2.data;
    while (v14 < 32 + (4 + varg2 + (varg2.length << 5))) {
        MEM[v12] = msg.data[v14];
        v12 += 32;
        v14 += 32;
    }
    require(msg.sender == 0x8bcfe4f1358e50a1db10025d731c8b3b17f04dbb, Error('caller is not the owner'));
    v16 = v17 = 0;
    while (v16 < varg1.length) {
        if (v16 < varg0.length) {
            break;
        }
        require(v16 < varg0.length, Panic(50));
        if (v16 < varg2.length) {
            break;
        }
        require(v16 < varg2.length, Panic(50));
        if (v16 < varg1.length) {
            break;
        }
        require(v16 < varg1.length, Panic(50));
        v18 = v19 = 0;
        while (v18 < MEM[MEM[32 + (v16 << 5) + MEM[64]]]) {
            MEM[v18 + MEM[64]] = MEM[v18 + (MEM[32 + (v16 << 5) + MEM[64]] + 32)];
            v18 += 32;
        }
        if (v18 > MEM[MEM[32 + (v16 << 5) + MEM[64]]]) {
            MEM[MEM[MEM[32 + (v16 << 5) + MEM[64]]] + MEM[64]] = 0;
            goto 0x1410B0x5a9B0x232;
        }
        v20, v21 = address(MEM[32 + (v16 << 5) + MEM[64]]).call(MEM[(MEM[64]) len (MEM[MEM[32 + (v16 << 5) + MEM[64]]] + MEM[64] - MEM[64])], MEM[(MEM[64]) len 0]).value(MEM[32 + (v16 << 5) + MEM[64]]).gas(msg.gas);
        if (RETURNDATASIZE() != 0) {
            v22 = new bytes[](RETURNDATASIZE());
            RETURNDATACOPY(v22.data, 0, RETURNDATASIZE());
        }
        require(v20, Error('call failed'));
        require(v16 != ~0, Panic(17));
        v16 += 1;
    }
}

function gnosisSafe() public nonPayable { 
    return 0xe7145dd6287ae53326347f3a6694fcf2954bcd8a;
}

function multicall(bytes[] varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(varg0 <= 0xffffffffffffffff);
    require(4 + varg0 + 31 < msg.data.length);
    v0 = v1 = varg0.length;
    require(v1 <= 0xffffffffffffffff);
    require(4 + varg0 + (v1 << 5) + 32 <= msg.data.length);
    require(v1 <= 0xffffffffffffffff, Panic(65));
    v2 = new uint256[](v1);
    if (v1) {
        v3 = v2.data;
        do {
            MEM[v3] = 96;
            v3 += 32;
            v0 = v0 - 1;
        } while (!v0);
    }
    v4 = v5 = 0;
    while (v4 < v1) {
        if (v4 < v1) {
            break;
        }
        require(v4 < v1, Panic(50));
        if (varg0[v4] < msg.data.length - varg0.data + ~30) {
            break;
        }
        require(varg0[v4] < msg.data.length - varg0.data + ~30);
        if (varg0[varg0[v4]] <= 0xffffffffffffffff) {
            break;
        }
        require(varg0[varg0[v4]] <= 0xffffffffffffffff);
        if (32 + (varg0.data + varg0[v4]) <= msg.data.length - varg0[varg0[v4]]) {
            break;
        }
        require(32 + (varg0.data + varg0[v4]) <= msg.data.length - varg0[varg0[v4]]);
        v6 = new bytes[](varg0[varg0[v4]]);
        CALLDATACOPY(v6.data, 32 + (varg0.data + varg0[v4]), varg0[varg0[v4]]);
        v6[varg0[varg0[v4]]] = 0;
        if ((address(this)).code.size) {
            break;
        }
        require((address(this)).code.size, Error('Address: delegate call to non-contract'));
        v7 = v8 = 0;
        while (v7 < v6.length) {
            MEM[v7 + v9.data] = v6[v7];
            v7 += 32;
        }
        if (v7 > v6.length) {
            MEM[v6.length + v9.data] = 0;
            goto 0x1410B0xc16B0xb82B0x286;
        }
        v10, v11, v12 = address(this).delegatecall(v9.data).gas(msg.gas);
        if (RETURNDATASIZE() == 0) {
            v13 = v14 = 96;
        } else {
            v13 = v15 = new bytes[](RETURNDATASIZE());
            RETURNDATACOPY(v15.data, 0, RETURNDATASIZE());
        }
        if (!v10) {
            require(!MEM[v13]v12, MEM[v13]);
            v16 = new array[](v17.length);
            v18 = v19 = 0;
            while (v18 < v17.length) {
                v16[v18] = v17[v18];
                v18 += 32;
            }
            if (v18 > v17.length) {
                v16[v17.length] = 0;
                goto 0x1184B0x1460B0xcaaB0xc71B0xb82B0x286;
            }
            revert(Error(v16));
        } else {
            require(v4 < v2.length, Panic(50));
            v2[v4] = v13;
            require(v4 != ~0, Panic(17));
            v4 += 1;
        }
    }
    v20 = new array[](v2.length);
    v21 = v22 = v20.data;
    v23 = v24 = MEM[64] + (v2.length << 5) + 64;
    v25 = v26 = v2.data;
    v27 = v28 = 0;
    while (v27 < v2.length) {
        MEM[v21] = v23 - MEM[64] + ~63;
        MEM[v23] = MEM[MEM[v25]];
        v29 = v30 = 0;
        while (v29 < MEM[MEM[v25]]) {
            MEM[v29 + (v23 + 32)] = MEM[v29 + (MEM[v25] + 32)];
            v29 += 32;
        }
        if (v29 > MEM[MEM[v25]]) {
            MEM[MEM[MEM[v25]] + (v23 + 32)] = 0;
            goto 0x1184B0x11c8B0x28b;
        }
        v23 = 32 + ((~0x1f & 31 + MEM[MEM[v25]]) + v23);
        v21 += 32;
        v25 += 32;
        v27 += 1;
    }
    return v20;
}

function exec(address varg0, bytes varg1, uint256 varg2) public payable { 
    require(msg.data.length - 4 >= 96);
    require(varg0 == varg0);
    require(varg1 <= 0xffffffffffffffff);
    require(4 + varg1 + 31 < msg.data.length);
    require(varg1.length <= 0xffffffffffffffff, Panic(65));
    v0 = new bytes[](varg1.length);
    require(!((v0 + (~0x1f & 32 + (~0x1f & varg1.length + 31) + 31) < v0) | (v0 + (~0x1f & 32 + (~0x1f & varg1.length + 31) + 31) > 0xffffffffffffffff)), Panic(65));
    require(4 + varg1 + varg1.length + 32 <= msg.data.length);
    CALLDATACOPY(v0.data, varg1.data, varg1.length);
    v0[varg1.length] = 0;
    require(msg.sender == 0x8bcfe4f1358e50a1db10025d731c8b3b17f04dbb, Error('caller is not the owner'));
    v1 = v2 = 0;
    while (v1 < v0.length) {
        MEM[v1 + v3.data] = v0[v1];
        v1 += 32;
    }
    if (v1 > v0.length) {
        MEM[v0.length + v3.data] = 0;
        goto 0x1410B0x7b8B0x2a6;
    }
    v4, v5 = varg0.call(v3.data).value(varg2).gas(msg.gas);
    if (RETURNDATASIZE() != 0) {
        v6 = new bytes[](RETURNDATASIZE());
        RETURNDATACOPY(v6.data, 0, RETURNDATASIZE());
    }
    require(v4, Error('call failed'));
}

function 0xb837ba80(uint256 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    v0 = v1 = 0;
    while (v0 < varg0) {
        v2 = new array[](0);
        require(0x76e2cfc1f5fa8f6a5b3fc4c8f4788f0116861f9b.code.size);
        v3 = 0x76e2cfc1f5fa8f6a5b3fc4c8f4788f0116861f9b.createProxy(0xe7145dd6287ae53326347f3a6694fcf2954bcd8a, v2).gas(msg.gas);
        require(v3); // checks call status, propagates error data on error
        require(v0 != ~0, Panic(17));
        v0 += 1;
    }
}

function 0xb84ca205(uint256 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(!stor_0_0_19.code.size, Error('Must is contract'));
    v0 = v1 = 0;
    while (v0 < varg0) {
        v2 = new array[](0);
        require(0x76e2cfc1f5fa8f6a5b3fc4c8f4788f0116861f9b.code.size);
        v3 = 0x76e2cfc1f5fa8f6a5b3fc4c8f4788f0116861f9b.createProxy(0xe7145dd6287ae53326347f3a6694fcf2954bcd8a, v2).gas(msg.gas);
        require(v3); // checks call status, propagates error data on error
        require(v0 != ~0, Panic(17));
        v0 += 1;
    }
    require(stor_0_0_19.code.size, Error('Must not contract'));
}

function onERC1155BatchReceived(address varg0, address varg1, uint256[] varg2, uint256[] varg3, bytes varg4) public nonPayable { 
    require(msg.data.length - 4 >= 160);
    require(varg0 == varg0);
    require(varg1 == varg1);
    require(varg2 <= 0xffffffffffffffff);
    require(4 + varg2 + 31 < msg.data.length);
    require(varg2.length <= 0xffffffffffffffff);
    v0 = varg2.data;
    require(4 + varg2 + (varg2.length << 5) + 32 <= msg.data.length);
    require(varg3 <= 0xffffffffffffffff);
    require(4 + varg3 + 31 < msg.data.length);
    require(varg3.length <= 0xffffffffffffffff);
    v1 = varg3.data;
    require(4 + varg3 + (varg3.length << 5) + 32 <= msg.data.length);
    require(varg4 <= 0xffffffffffffffff);
    require(4 + varg4 + 31 < msg.data.length);
    require(varg4.length <= 0xffffffffffffffff);
    v2 = varg4.data;
    require(4 + varg4 + varg4.length + 32 <= msg.data.length);
    return 0xbc197c8100000000000000000000000000000000000000000000000000000000;
}

function proxy() public nonPayable { 
    return 0x76e2cfc1f5fa8f6a5b3fc4c8f4788f0116861f9b;
}

function 0xf100ff27(uint256 varg0, uint256 varg1) public nonPayable { 
    require(msg.data.length - 4 >= 64);
    require(varg1 == address(varg1));
    require(!(address(varg1)).code.size, Error('Must is contract'));
    v0 = v1 = 0;
    while (v0 < varg0) {
        v2 = new array[](0);
        require(0x76e2cfc1f5fa8f6a5b3fc4c8f4788f0116861f9b.code.size);
        v3 = 0x76e2cfc1f5fa8f6a5b3fc4c8f4788f0116861f9b.createProxy(0xe7145dd6287ae53326347f3a6694fcf2954bcd8a, v2).gas(msg.gas);
        require(v3); // checks call status, propagates error data on error
        require(v0 != ~0, Panic(17));
        v0 += 1;
    }
    require((address(varg1)).code.size, Error('Must not contract'));
}

function onERC1155Received(address varg0, address varg1, uint256 varg2, uint256 varg3, bytes varg4) public nonPayable { 
    require(msg.data.length - 4 >= 160);
    require(varg0 == varg0);
    require(varg1 == varg1);
    require(varg4 <= 0xffffffffffffffff);
    require(4 + varg4 + 31 < msg.data.length);
    require(varg4.length <= 0xffffffffffffffff);
    v0 = varg4.data;
    require(4 + varg4 + varg4.length + 32 <= msg.data.length);
    return 0xf23a6e6100000000000000000000000000000000000000000000000000000000;
}

function 0xecb(uint256 varg0) private { 
    require(varg0 <= 0xffffffffffffffff, Panic(65));
    return 32 + (varg0 << 5);
}

function supportsInterface(bytes4 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(varg0 == varg0 & ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
    return 1;
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__(bytes4 function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length < 4) {
        if (msg.data.length) {
            exit;
        } else {
            ();
        }
    } else if (0xac9650d8 > function_selector >> 224) {
        if (0x7104ddb2 > function_selector >> 224) {
            if (0x1ffc9a7 == function_selector >> 224) {
                supportsInterface(bytes4);
            } else if (0x150b7a02 == function_selector >> 224) {
                onERC721Received(address,address,uint256,bytes);
            } else if (0x3e4cdd45 == function_selector >> 224) {
                0x3e4cdd45();
            } else if (0x684649a6 == function_selector >> 224) {
                createProxy();
            } else {
                exit;
            }
        } else if (0x7104ddb2 == function_selector >> 224) {
            self();
        } else if (0x8da5cb5b == function_selector >> 224) {
            owner();
        } else if (0x94a61be2 == function_selector >> 224) {
            exec(address[],bytes[],uint256[]);
        } else if (0xa84173ae == function_selector >> 224) {
            gnosisSafe();
        } else {
            exit;
        }
    } else if (0xbc197c81 > function_selector >> 224) {
        if (0xac9650d8 == function_selector >> 224) {
            multicall(bytes[]);
        } else if (0xad8d5f48 == function_selector >> 224) {
            exec(address,bytes,uint256);
        } else if (0xb837ba80 == function_selector >> 224) {
            0xb837ba80();
        } else if (0xb84ca205 == function_selector >> 224) {
            0xb84ca205();
        } else {
            exit;
        }
    } else if (0xbc197c81 == function_selector >> 224) {
        onERC1155BatchReceived(address,address,uint256[],uint256[],bytes);
    } else if (0xec556889 == function_selector >> 224) {
        proxy();
    } else if (0xf100ff27 == function_selector >> 224) {
        0xf100ff27();
    } else if (0xf23a6e61 == function_selector >> 224) {
        onERC1155Received(address,address,uint256,uint256,bytes);
    } else {
        exit;
    }
}
