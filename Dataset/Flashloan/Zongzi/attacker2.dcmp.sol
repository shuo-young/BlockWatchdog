// Decompiled by library.dedaub.com
// 2024.03.25 10:32 UTC
// Compiled using the solidity compiler version 0.8.19


// Data structures and variables inferred from the use of storage instructions
uint256 stor_0_0_19; // STORAGE[0x0] bytes 0 to 19
uint256 stor_1_0_19; // STORAGE[0x1] bytes 0 to 19



function 0x118d(uint256 varg0, uint256 varg1) private { 
    require(varg1 - varg0 >= 64);
    require(msg.data[varg0] <= uint64.max);
    v0 = varg0 + msg.data[varg0];
    require(v0 + 31 < varg1);
    v1 = v2 = v0 + 32;
    require(msg.data[v0] <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v3 = new uint256[](msg.data[v0]);
    require(!((v3 + ((msg.data[v0] << 5) + 32 + 31 & ~0x1f) > uint64.max) | (v3 + ((msg.data[v0] << 5) + 32 + 31 & ~0x1f) < v3)), Panic(65)); // failed memory allocation (too much memory)
    v4 = v5 = v3.data;
    require(v2 + (msg.data[v0] << 5) <= varg1);
    while (v1 < v2 + (msg.data[v0] << 5)) {
        require(msg.data[v1] == address(msg.data[v1]));
        MEM[v4] = msg.data[v1];
        v4 = v4 + 32;
        v1 = v1 + 32;
    }
    require(msg.data[varg0 + 32] == address(msg.data[varg0 + 32]));
    return msg.data[varg0 + 32], v3;
}

function _SafeAdd(uint256 varg0, uint256 varg1) private { 
    require(varg0 <= varg0 + varg1, Panic(17)); // arithmetic overflow or underflow
    return varg0 + varg1;
}

function _SafeSub(uint256 varg0, uint256 varg1) private { 
    require(varg0 - varg1 <= varg0, Panic(17)); // arithmetic overflow or underflow
    return varg0 - varg1;
}

function 0x85936cac() public nonPayable { 
    v0, v1 = 0x118d(4, 4 + (msg.data.length - 4));
    0x8b(v0, v1);
}

function receive() public payable { 
}

function 0xa459cdd9(address varg0) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 32);
    v0 = v1 = address(tx.origin) == address(0xd96f54a13fcff3dce432a1ba549003294cfb4ac4);
    if (address(tx.origin) != address(0xd96f54a13fcff3dce432a1ba549003294cfb4ac4)) {
        v0 = v2 = address(tx.origin) == address(0xf2cdc3ea49c16d29b600568a062e8b58df5a593a);
    }
    if (!v0) {
        v0 = v3 = address(tx.origin) == address(0x6ea6f112566c8ced350dfa0578e5f254d7d88e44);
    }
    if (!v0) {
        v0 = v4 = address(tx.origin) == address(0x4df2e2d3117e2400139bcc8dc0e58ce45679c7e3);
    }
    if (!v0) {
        v0 = v5 = address(tx.origin) == address(0xe5c326b7595bae6894ad15c7bc1e7eb74cbdb2a6);
    }
    require(v0, Error(28535));
    stor_0_0_19 = varg0;
}

function 0x8b(address varg0, address[] varg1) private { 
    v0 = v1 = address(tx.origin) == address(0xd96f54a13fcff3dce432a1ba549003294cfb4ac4);
    if (address(tx.origin) != address(0xd96f54a13fcff3dce432a1ba549003294cfb4ac4)) {
        v0 = v2 = address(tx.origin) == address(0xf2cdc3ea49c16d29b600568a062e8b58df5a593a);
    }
    if (!v0) {
        v0 = v3 = address(tx.origin) == address(0x2c42824ef89d6efa7847d3997266b62599560a26);
    }
    if (!v0) {
        v0 = v4 = address(tx.origin) == address(0x4df2e2d3117e2400139bcc8dc0e58ce45679c7e3);
    }
    if (!v0) {
        v0 = v5 = address(tx.origin) == address(0xe5c326b7595bae6894ad15c7bc1e7eb74cbdb2a6);
    }
    require(v0, Error(28535));
    require(0 < varg1.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v6 = varg1.data;
    v7, /* uint256 */ v8 = address(varg1[0x0]).balanceOf(address(this)).gas(msg.gas);
    require(bool(v7), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(0 < varg1.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v9 = varg1.data;
    v10, /* bool */ v11 = address(varg1[0x0]).approve(stor_1_0_19, 10 ** 60).gas(msg.gas);
    require(bool(v10), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v11 == bool(v11));
    require(1 < varg1.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v12, /* bool */ v13 = address(varg1[0x1]).approve(stor_1_0_19, 10 ** 60).gas(msg.gas);
    require(bool(v12), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v13 == bool(v13));
    require(2 <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v14 = new address[](2);
    if (2) {
        CALLDATACOPY(v14.data, msg.data.length, 64);
    }
    require(1 < varg1.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    require(0 < varg1.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v15 = varg1.data;
    require(0 < v14.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v16 = v14.data;
    require(1 < v14.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v14[1] = address(varg1[0x0]);
    v14[0] = address(varg1[0x1]);
    v17 = _SafeAdd(block.timestamp, 0x15180);
    v18 = new address[](varg1.length);
    v19 = v20 = v18.data;
    v21 = v22 = varg1.data;
    v23 = v24 = 0;
    while (v23 < varg1.length) {
        MEM[v19] = address(MEM[v21]);
        v19 = v19 + 32;
        v21 = v21 + 32;
        v23 = v23 + 1;
    }
    require(bool(stor_1_0_19.code.size));
    v25 = stor_1_0_19.swapExactTokensForTokensSupportingFeeOnTransferTokens(10 ** 17, 0, v18, address(this), v17).gas(msg.gas);
    require(bool(v25), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(1 < varg1.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v26, /* uint256 */ v27 = address(varg1[0x1]).balanceOf(address(this)).gas(msg.gas);
    require(bool(v26), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    v28 = _SafeAdd(block.timestamp, 0x15180);
    v29 = new address[](v14.length);
    v30 = v31 = v29.data;
    v32 = v33 = v14.data;
    v34 = v35 = 0;
    while (v34 < v14.length) {
        MEM[v30] = address(MEM[v32]);
        v30 = v30 + 32;
        v32 = v32 + 32;
        v34 = v34 + 1;
    }
    require(bool(stor_1_0_19.code.size));
    v36 = stor_1_0_19.swapExactTokensForTokensSupportingFeeOnTransferTokens(v27, 0, v29, address(this), v28, v37, address(this)).gas(msg.gas);
    require(bool(v36), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    v38 = _SafeSub(v8, 10 ** 17);
    v39 = _SafeAdd(block.timestamp, 0x15180);
    v40 = new address[](varg1.length);
    v41 = v42 = v40.data;
    v43 = v44 = varg1.data;
    v45 = v46 = 0;
    while (v45 < varg1.length) {
        MEM[v41] = address(MEM[v43]);
        v41 = v41 + 32;
        v43 = v43 + 32;
        v45 = v45 + 1;
    }
    require(bool(stor_1_0_19.code.size));
    v47 = stor_1_0_19.swapExactTokensForTokensSupportingFeeOnTransferTokens(v38, 0, v40, address(this), v39, v37, address(this)).gas(msg.gas);
    require(bool(v47), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(1 < varg1.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v48 = _SafeSub((address(varg1[0x1])).balance, 10 ** 9);
    v49 = new address[](v14.length);
    v50 = v51 = v49.data;
    v52 = v53 = v14.data;
    v54 = v55 = 0;
    while (v54 < v14.length) {
        MEM[v50] = address(MEM[v52]);
        v50 = v50 + 32;
        v52 = v52 + 32;
        v54 = v54 + 1;
    }
    v56, /* uint256 */ v57 = stor_1_0_19.getAmountsIn(v48, v49, v37, address(this), v37, v37, address(this)).gas(msg.gas);
    require(bool(v56), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    RETURNDATACOPY(v57, 0, RETURNDATASIZE());
    MEM[64] = v57 + (RETURNDATASIZE() + 31 & ~0x1f);
    require(v57 + RETURNDATASIZE() - v57 >= 32);
    require(MEM[v57] <= uint64.max);
    require(v57 + MEM[v57] + 31 < v57 + RETURNDATASIZE());
    v58 = v59 = v57 + MEM[v57] + 32;
    require(MEM[v57 + MEM[v57]] <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v60 = new uint256[](MEM[v57 + MEM[v57]]);
    require(!((v60 + ((MEM[v57 + MEM[v57]] << 5) + 32 + 31 & ~0x1f) > uint64.max) | (v60 + ((MEM[v57 + MEM[v57]] << 5) + 32 + 31 & ~0x1f) < v60)), Panic(65)); // failed memory allocation (too much memory)
    v61 = v62 = v60.data;
    require(v59 + (MEM[v57 + MEM[v57]] << 5) <= v57 + RETURNDATASIZE());
    while (v58 < v59 + (MEM[v57 + MEM[v57]] << 5)) {
        require(MEM[v58] == MEM[v58]);
        MEM[v61] = MEM[v58];
        v61 = v61 + 32;
        v58 = v58 + 32;
    }
    require(0 < v60.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v63 = v60.data;
    require(bool(stor_0_0_19.code.size));
    v64 = stor_0_0_19.call(uint32(0xac003773), v60[0], varg0).gas(msg.gas);
    require(bool(v64), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    v65, /* uint256 */ v66 = stor_0_0_19.balanceOf(address(this)).gas(msg.gas);
    require(bool(v65), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(bool(stor_0_0_19.code.size));
    v67 = stor_0_0_19.call(uint32(0x991a7476), address(this)).gas(msg.gas);
    require(bool(v67), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(1 < varg1.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v68, /* uint256 */ v69 = address(varg1[0x1]).balanceOf(address(this)).gas(msg.gas);
    require(bool(v68), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    v70 = _SafeAdd(block.timestamp, 0x15180);
    v71 = new address[](v14.length);
    v72 = v73 = v71.data;
    v74 = v75 = v14.data;
    v76 = v77 = 0;
    while (v76 < v14.length) {
        MEM[v72] = address(MEM[v74]);
        v72 = v72 + 32;
        v74 = v74 + 32;
        v76 = v76 + 1;
    }
    require(bool(stor_1_0_19.code.size));
    v78 = stor_1_0_19.swapExactTokensForTokensSupportingFeeOnTransferTokens(v69, 0, v71, address(this), v70).gas(msg.gas);
    require(bool(v78), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(0 < varg1.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v79 = varg1.data;
    require(bool((address(varg1[0x0])).code.size));
    v80 = address(varg1[0x0]).deposit().value(this.balance).gas(msg.gas);
    require(bool(v80), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(0 < varg1.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v81 = varg1.data;
    require(0 < varg1.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v82 = varg1.data;
    v83, /* uint256 */ v84 = address(varg1[0x0]).balanceOf(address(this)).gas(msg.gas);
    require(bool(v83), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    v85, /* bool */ v86 = address(varg1[0x0]).transfer(msg.sender, v84).gas(msg.gas);
    require(bool(v85), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v86 == bool(v86));
    return ;
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function function_selector( function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length < 4) {
        require(!msg.data.length);
        receive();
    } else if (0x85936cac == function_selector >> 224) {
        0x85936cac();
    } else {
        require(0xa459cdd9 == function_selector >> 224);
        0xa459cdd9();
    }
}
