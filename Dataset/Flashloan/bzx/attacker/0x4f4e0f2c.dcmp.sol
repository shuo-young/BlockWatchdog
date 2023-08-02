// Decompiled by library.dedaub.com
// 2022.12.16 02:45 UTC

// Data structures and variables inferred from the use of storage instructions
uint256 owner; // STORAGE[0x0]


function 0x116() private { 
    if (!address(owner)) {
        owner = tx.origin | ~0xffffffffffffffffffffffffffffffffffffffff & owner;
    }
    require(tx.origin == address(owner), Error('bad origin'));
    return ;
}

function () public payable { 
}

function 0x363a7ef7() public nonPayable { 
    0x116();
}

function 0x41fc3baf(uint256 varg0, uint256 varg1, uint256 varg2) public payable { 
    require(msg.data.length - 4 >= 96);
    require(varg0 == address(varg0));
    require(varg1 <= 0xffffffffffffffff);
    require(4 + varg1 + 31 < msg.data.length);
    require(varg1.length <= 0xffffffffffffffff);
    v0 = new bytes[](varg1.length);
    require(!((v0 + ((~0x1f & 31 + varg1.length) + 32) < v0) | (v0 + ((~0x1f & 31 + varg1.length) + 32) > 0xffffffffffffffff)));
    require(varg1.data + varg1.length <= msg.data.length);
    CALLDATACOPY(v0.data, varg1.data, varg1.length);
    v0[varg1.length] = 0;
    require(varg2 == varg2);
    0x116();
    v1 = v2 = 0;
    while (v1 < v0.length) {
        MEM[v1 + v3.data] = v0[v1];
        v1 += 32;
    }
    if (v1 > v0.length) {
        MEM[v3.data + v0.length] = 0;
    }
    v4, v5, v6 = address(varg0).call(v3.data).value(varg2).gas(msg.gas);
    if (RETURNDATASIZE() == 0) {
        v7 = v8 = 96;
    } else {
        v7 = v9 = new bytes[](RETURNDATASIZE());
        RETURNDATACOPY(v9.data, 0, RETURNDATASIZE());
    }
    v10 = new array[](MEM[v7]);
    v11 = v12 = 0;
    while (v11 < MEM[v7]) {
        v10[v11] = MEM[v11 + v6];
        v11 += 32;
    }
    if (v11 > MEM[v7]) {
        v10[MEM[v7]] = 0;
    }
    return v4, v10;
}

function 0x746a5053(uint256 varg0, uint256 varg1) public payable { 
    require(msg.data.length - 4 >= 64);
    require(varg0 == address(varg0));
    require(varg1 == varg1);
    0x116();
    v0 = create.code(MEM[64], 249).value(0);
    require(v0); // checks call status, propagates error data on error
    v1 = address(v0).call().value(varg1).gas(2300 * !varg1);
    require(v1); // checks call status, propagates error data on error
    require((address(v0)).code.size);
    v2 = address(v0).call(0xf2adf1cb, address(varg0)).gas(msg.gas);
    require(v2); // checks call status, propagates error data on error
    v3 = new array[](MEM[96]);
    v4 = v5 = 0;
    while (v4 < MEM[96]) {
        v3[v4] = MEM[v4 + 128];
        v4 += 32;
    }
    if (v4 > MEM[96]) {
        v3[MEM[96]] = 0;
    }
    return 0, v3;
}

function 0x7f5b002e(uint256 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(varg0 == address(varg0));
    return (address(varg0)).balance;
}

function callFunction(address varg0, (address varg1, uint256) varg2, bytes varg3) public nonPayable { 
    require(msg.data.length - 4 >= 128);
    require(varg0 == varg0);
    require(msg.data.length - 36 >= 64);
    v0 = new struct(2);
    require(!((v0 + 64 < v0) | (v0 + 64 > 0xffffffffffffffff)));
    require(varg1 == address(varg1));
    v0.word0 = varg1;
    require(varg2 == varg2);
    v0.word1 = varg2;
    require(varg3 <= 0xffffffffffffffff);
    require(4 + varg3 + 31 < msg.data.length);
    require(varg3.length <= 0xffffffffffffffff);
    v1 = new bytes[](varg3.length);
    require(!((v1 + ((~0x1f & 31 + varg3.length) + 32) < v1) | (v1 + ((~0x1f & 31 + varg3.length) + 32) > 0xffffffffffffffff)));
    require(varg3.data + varg3.length <= msg.data.length);
    CALLDATACOPY(v1.data, varg3.data, varg3.length);
    v1[varg3.length] = 0;
    0x116();
    v2 = v3 = 0;
    while (v2 < v1.length) {
        MEM[v2 + v4.data] = v1[v2];
        v2 += 32;
    }
    if (v2 > v1.length) {
        MEM[v4.data + v1.length] = 0;
    }
    v5, v6, v7 = address(this).call(v4.data).gas(msg.gas);
    if (RETURNDATASIZE() == 0) {
        v8 = v9 = 96;
    } else {
        v8 = v10 = new bytes[](RETURNDATASIZE());
        RETURNDATACOPY(v10.data, 0, RETURNDATASIZE());
    }
    v11 = new array[](MEM[v8]);
    v12 = v13 = 0;
    while (v12 < MEM[v8]) {
        v11[v12] = MEM[v12 + v7];
        v12 += 32;
    }
    if (v12 > MEM[v8]) {
        v11[MEM[v8]] = 0;
    }
    return v5, v11;
}

function 0xa270ef06(uint256 varg0, uint256 varg1, uint256 varg2) public payable { 
    require(msg.data.length - 4 >= 96);
    require(varg0 <= 0xffffffffffffffff);
    require(4 + varg0 + 31 < msg.data.length);
    require(varg0.length <= 0xffffffffffffffff);
    v0 = new uint256[](varg0.length);
    require(!((v0 + ((varg0.length << 5) + 32) < v0) | (v0 + ((varg0.length << 5) + 32) > 0xffffffffffffffff)));
    v1 = v2 = varg0.data;
    v3 = v4 = v0.data;
    require(v2 + (varg0.length << 5) <= msg.data.length);
    v5 = v6 = 0;
    while (v5 < varg0.length) {
        require(msg.data[v1] == address(msg.data[v1]));
        MEM[v3] = msg.data[v1];
        v3 += 32;
        v1 += 32;
        v5 += 1;
    }
    require(varg1 <= 0xffffffffffffffff);
    require(4 + varg1 + 31 < msg.data.length);
    require(varg1.length <= 0xffffffffffffffff);
    v7 = new uint256[](varg1.length);
    require(!((v7 + ((varg1.length << 5) + 32) < v7) | (v7 + ((varg1.length << 5) + 32) > 0xffffffffffffffff)));
    v8 = v9 = varg1.data;
    v10 = v11 = v7.data;
    v12 = v13 = 0;
    while (v12 < varg1.length) {
        require(v9 + msg.data[v8] + 31 < msg.data.length);
        require(varg1[msg.data[v8]] <= 0xffffffffffffffff);
        v14 = new bytes[](varg1[msg.data[v8]]);
        require(!((v14 + ((~0x1f & 31 + varg1[msg.data[v8]]) + 32) < v14) | (v14 + ((~0x1f & 31 + varg1[msg.data[v8]]) + 32) > 0xffffffffffffffff)));
        require(v9 + msg.data[v8] + 32 + varg1[msg.data[v8]] <= msg.data.length);
        CALLDATACOPY(v14.data, v9 + msg.data[v8] + 32, varg1[msg.data[v8]]);
        v14[varg1[msg.data[v8]]] = 0;
        MEM[v10] = v14;
        v10 += 32;
        v8 += 32;
        v12 += 1;
    }
    require(varg2 <= 0xffffffffffffffff);
    require(4 + varg2 + 31 < msg.data.length);
    require(varg2.length <= 0xffffffffffffffff);
    v15 = new uint256[](varg2.length);
    require(!((v15 + ((varg2.length << 5) + 32) < v15) | (v15 + ((varg2.length << 5) + 32) > 0xffffffffffffffff)));
    v16 = v17 = varg2.data;
    v18 = v19 = v15.data;
    require(v17 + (varg2.length << 5) <= msg.data.length);
    v20 = v21 = 0;
    while (v20 < varg2.length) {
        require(msg.data[v16] == msg.data[v16]);
        MEM[v18] = msg.data[v16];
        v18 += 32;
        v16 += 32;
        v20 += 1;
    }
    0x116();
    v22 = v23 = v0.length;
    v24 = new uint256[](v23);
    if (v23) {
        v25 = v24.data;
        do {
            MEM[MEM[64]] = 0;
            MEM[MEM[64] + 32] = 96;
            MEM[v25] = MEM[64];
            v25 += 32;
            v22 = v22 - 1;
        } while (!v22);
    }
    v26 = v27 = 0;
    while (v26 < v0.length) {
        assert(v26 < v0.length);
        assert(v26 < v7.length);
        assert(v26 < v15.length);
        0x116();
        v28 = v29 = 0;
        while (v28 < MEM[v7[v26]]) {
            MEM[v28 + MEM[64]] = MEM[v28 + (v7[v26] + 32)];
            v28 += 32;
        }
        if (v28 > MEM[v7[v26]]) {
            MEM[MEM[64] + MEM[v7[v26]]] = 0;
        }
        v30, v31 = address(v0[v26]).call(MEM[(MEM[64]) len (MEM[v7[v26]] + MEM[64] - MEM[64])], MEM[(MEM[64]) len 0]).value(v15[v26]).gas(msg.gas);
        if (RETURNDATASIZE() == 0) {
            v32 = 96;
        } else {
            v32 = v33 = new bytes[](RETURNDATASIZE());
            RETURNDATACOPY(v33.data, 0, RETURNDATASIZE());
        }
        assert(v26 < v24.length);
        assert(v26 < v24.length);
        MEM[v24[v26] + 32] = v32;
        MEM[0 + v24[v26]] = v30;
        v26 += 1;
    }
    v34 = new array[](v24.length);
    v35 = v34.data;
    v36 = v37 = v35 + (v24.length << 5);
    v38 = v39 = v24.data;
    v40 = v41 = 0;
    while (v40 < v24.length) {
        MEM[v35] = v36 - v35;
        MEM[v36] = MEM[MEM[v38]];
        MEM[v36 + 32] = v36 + 64 - v36;
        v42 = MEM[MEM[MEM[v38] + 32]];
        MEM[v36 + 64] = v42;
        v43 = v44 = 0;
        while (v43 < v42) {
            MEM[v43 + (32 + (v36 + 64))] = MEM[v43 + (MEM[MEM[v38] + 32] + 32)];
            v43 += 32;
        }
        if (v43 > v42) {
            MEM[32 + (v36 + 64) + v42] = 0;
        }
        v36 = 32 + (v36 + 64) + (~0x1f & 31 + v42);
        v38 += 32;
        v35 += 32;
        v40 += 1;
    }
    return v34;
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__(bytes4 function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length >= 4) {
        if (0x363a7ef7 == function_selector >> 224) {
            0x363a7ef7();
        } else if (0x41fc3baf == function_selector >> 224) {
            0x41fc3baf();
        } else if (0x746a5053 == function_selector >> 224) {
            0x746a5053();
        } else if (0x7f5b002e == function_selector >> 224) {
            0x7f5b002e();
        } else if (0x8b418713 == function_selector >> 224) {
            callFunction(address,(address,uint256),bytes);
        } else if (0xa270ef06 == function_selector >> 224) {
            0xa270ef06();
        }
    }
    ();
}
