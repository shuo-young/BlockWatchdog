// Decompiled by library.dedaub.com
// 2024.01.09 12:21 UTC
// Compiled using the solidity compiler version 0.8.18


// Data structures and variables inferred from the use of storage instructions
uint256 stor_5; // STORAGE[0x5]
uint256 stor_0_0_19; // STORAGE[0x0] bytes 0 to 19
uint256 stor_4_0_19; // STORAGE[0x4] bytes 0 to 19



function 0x114e(address varg0) private { 
    return ;
}

function 0x1184(uint256 varg0) private { 
    return ;
}

function _SafeSub(uint256 varg0, uint256 varg1) private { 
    require(varg0 - varg1 <= varg0, Panic(17)); // arithmetic overflow or underflow
    return varg0 - varg1;
}

function _SafeAdd(uint256 varg0, uint256 varg1) private { 
    require(varg0 <= varg0 + varg1, Panic(17)); // arithmetic overflow or underflow
    return varg0 + varg1;
}

function receive() public payable { 
}

function 0x43c(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3) private { 
    require(address(tx.origin) == address(0xbbcc139933d1580e7c40442e09263e90e6f1d66d));
    require(varg1 + varg0 - varg1 >= 64);
    0x1184(msg.data[varg1 + 0]);
    0x1184(msg.data[varg1 + 32]);
    v0 = _SafeSub(4, 1);
    require(v0 < 4, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v1 = v2 = msg.sender == address(STORAGE[v0 + 0]);
    if (msg.sender != address(STORAGE[v0 + 0])) {
        v3, /* uint256 */ v4 = address(0xe9e7cea3dedca5984780bafc599bd69add087d56).balanceOf(address(this)).gas(msg.gas);
        require(bool(v3), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        0x1184(v4);
        v1 = v5 = v4 >= stor_5;
    }
    if (!v1) {
        v6 = _SafeAdd(msg.data[varg1 + 0], 1);
        require(v6 < 4, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        v7, /* address */ v8 = address(STORAGE[v6 + 0]).token0().gas(msg.gas);
        require(bool(v7), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        0x114e(v8);
        v9, /* uint256 */ v10 = address(0xe9e7cea3dedca5984780bafc599bd69add087d56).balanceOf(address(STORAGE[v6 + 0])).gas(msg.gas);
        require(bool(v9), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        0x1184(v10);
        v11, /* uint256 */ v12 = address(0xe9e7cea3dedca5984780bafc599bd69add087d56).balanceOf(address(this)).gas(msg.gas);
        require(bool(v11), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        0x1184(v12);
        v10 = v13 = _SafeSub(stor_5, v12);
        if (address(v8) - address(0xe9e7cea3dedca5984780bafc599bd69add087d56)) {
            v14 = new uint256[](64);
            v15 = v16 = 0;
            while (v15 < 64) {
                MEM[v14.data + v15] = MEM[MEM[64] + 32 + v15];
                v15 = v15 + 32;
            }
            MEM[v14.data + 64] = 0;
            require(bool((address(address(STORAGE[v6 + 0]))).code.size));
            v17 = address(STORAGE[v6 + 0]).flash(address(this), 0, v10, v14, v18, v6, v10).gas(msg.gas);
            require(bool(v17), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        } else {
            v19 = new uint256[](64);
            v20 = v21 = 0;
            while (v20 < 64) {
                MEM[v19.data + v20] = MEM[MEM[64] + 32 + v20];
                v20 = v20 + 32;
            }
            MEM[v19.data + 64] = 0;
            require(bool((address(address(STORAGE[v6 + 0]))).code.size));
            v22 = address(STORAGE[v6 + 0]).flash(address(this), v10, 0, v19, v18, v6, v10).gas(msg.gas);
            require(bool(v22), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        }
    } else {
        v23, /* uint256 */ v24 = address(0xe9e7cea3dedca5984780bafc599bd69add087d56).balanceOf(address(this)).gas(msg.gas);
        require(bool(v23), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        0x1184(v24);
        v25, /* bool */ v26 = address(0xe9e7cea3dedca5984780bafc599bd69add087d56).approve(address(0x10ed43c718714eb63d5aa57b78b54704e256024e), uint256.max).gas(msg.gas);
        require(bool(v25), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v26 == bool(v26));
        require(2 <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
        if (2) {
            CALLDATACOPY(v27.data, msg.data.length, 64);
        }
        require(0 < v27.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        require(1 < v27.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        v28 = new address[](v27.length);
        v29 = v30 = v28.data;
        v31 = v32 = v27.data;
        v33 = v34 = 0;
        while (v33 < v27.length) {
            MEM[v29] = address(MEM[v31]);
            v29 = v29 + 32;
            v31 = v31 + 32;
            v33 = v33 + 1;
        }
        v35, /* uint256 */ v36 = address(0x10ed43c718714eb63d5aa57b78b54704e256024e).swapExactTokensForTokens(v24, 0, v28, address(this), block.timestamp, v18, address(0xe9e7cea3dedca5984780bafc599bd69add087d56)).gas(msg.gas);
        require(bool(v35), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        RETURNDATACOPY(v36, 0, RETURNDATASIZE());
        MEM[64] = v36 + (RETURNDATASIZE() + 31 & ~0x1f);
        require(v36 + RETURNDATASIZE() - v36 >= 32);
        require(MEM[v36 + 0] <= uint64.max);
        require(v36 + MEM[v36 + 0] + 31 < v36 + RETURNDATASIZE());
        v37 = v38 = v36 + MEM[v36 + 0] + 32;
        require(MEM[v36 + MEM[v36 + 0]] <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
        v39 = new uint256[](MEM[v36 + MEM[v36 + 0]]);
        require(!((v39 + ((MEM[v36 + MEM[v36 + 0]] << 5) + 32 + 31 & ~0x1f) > uint64.max) | (v39 + ((MEM[v36 + MEM[v36 + 0]] << 5) + 32 + 31 & ~0x1f) < v39)), Panic(65)); // failed memory allocation (too much memory)
        v40 = v41 = v39.data;
        require(v38 + (MEM[v36 + MEM[v36 + 0]] << 5) <= v36 + RETURNDATASIZE());
        while (v37 < v38 + (MEM[v36 + MEM[v36 + 0]] << 5)) {
            0x1184(MEM[v37]);
            MEM[v40] = MEM[v37];
            v40 = v40 + 32;
            v37 = v37 + 32;
        }
        require(bool(stor_4_0_19.code.size));
        v42 = stor_4_0_19.sweep().gas(msg.gas);
        require(bool(v42), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        v43, /* uint256 */ v44 = address(0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c).balanceOf(address(this)).gas(msg.gas);
        require(bool(v43), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        0x1184(v44);
        v45, /* bool */ v46 = address(0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c).approve(address(0x10ed43c718714eb63d5aa57b78b54704e256024e), uint256.max).gas(msg.gas);
        require(bool(v45), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v46 == bool(v46));
        require(2 <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
        if (2) {
            CALLDATACOPY(v47.data, msg.data.length, 64);
        }
        require(0 < v47.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        require(1 < v47.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        v48 = new address[](v47.length);
        v49 = v50 = v48.data;
        v51 = v52 = v47.data;
        v53 = v54 = 0;
        while (v53 < v47.length) {
            MEM[v49] = address(MEM[v51]);
            v49 = v49 + 32;
            v51 = v51 + 32;
            v53 = v53 + 1;
        }
        require(bool((address(0x10ed43c718714eb63d5aa57b78b54704e256024e)).code.size));
        v55 = address(0x10ed43c718714eb63d5aa57b78b54704e256024e).swapExactTokensForTokensSupportingFeeOnTransferTokens(v44, 0, v48, address(this), block.timestamp, v18, address(0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c)).gas(msg.gas);
        require(bool(v55), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    }
    if (varg3 == 0) {
        v56 = v57 = _SafeAdd(msg.data[varg1 + 32], varg2);
    } else {
        v56 = v58 = _SafeAdd(msg.data[varg1 + 32], varg3);
    }
    v59, /* uint256 */ v60 = address(0xe9e7cea3dedca5984780bafc599bd69add087d56).balanceOf(address(this)).gas(msg.gas);
    require(bool(v59), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x1184(v60);
    v61, /* bool */ v62 = address(0xe9e7cea3dedca5984780bafc599bd69add087d56).transfer(msg.sender, v56).gas(msg.gas);
    require(bool(v61), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v62 == bool(v62));
    return ;
}

function 0x418aa4f1(address varg0, uint256 varg1) public payable { 
    require(4 + (msg.data.length - 4) - 4 >= 64);
    0x114e(varg0);
    0x1184(varg1);
    require(address(tx.origin) == address(0xbbcc139933d1580e7c40442e09263e90e6f1d66d));
    stor_4_0_19 = varg0;
    stor_5 = varg1;
    require(0 < 4, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v0, /* address */ v1 = stor_0_0_19.token0().gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x114e(v1);
    v2, /* uint256 */ v3 = address(0xe9e7cea3dedca5984780bafc599bd69add087d56).balanceOf(stor_0_0_19).gas(msg.gas);
    require(bool(v2), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x1184(v3);
    v4, /* uint256 */ v5 = address(0xe9e7cea3dedca5984780bafc599bd69add087d56).balanceOf(address(this)).gas(msg.gas);
    require(bool(v4), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x1184(v5);
    v3 = v6 = _SafeSub(stor_5, v5);
    if (address(v1) - address(0xe9e7cea3dedca5984780bafc599bd69add087d56)) {
        v7 = new uint256[](64);
        v8 = v9 = 0;
        while (v8 < 64) {
            MEM[v7.data + v8] = MEM[MEM[64] + 32 + v8];
            v8 = v8 + 32;
        }
        MEM[v7.data + 64] = 0;
        require(bool(stor_0_0_19.code.size));
        v10 = stor_0_0_19.flash(address(this), 0, v3, v7, v11, 0, v3).gas(msg.gas);
        require(bool(v10), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    } else {
        v12 = new uint256[](64);
        v13 = v14 = 0;
        while (v13 < 64) {
            MEM[v12.data + v13] = MEM[MEM[64] + 32 + v13];
            v13 = v13 + 32;
        }
        MEM[v12.data + 64] = 0;
        require(bool(stor_0_0_19.code.size));
        v15 = stor_0_0_19.flash(address(this), v3, 0, v12, v11, 0, v3).gas(msg.gas);
        require(bool(v15), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    }
    v16, /* uint256 */ v17 = address(0xe9e7cea3dedca5984780bafc599bd69add087d56).balanceOf(address(this)).gas(msg.gas);
    require(bool(v16), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x1184(v17);
    v18, /* bool */ v19 = address(0xe9e7cea3dedca5984780bafc599bd69add087d56).transfer(msg.sender, v17).gas(msg.gas);
    require(bool(v18), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v19 == bool(v19));
}

function withdraw(address _asset) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 32);
    0x114e(_asset);
    require(address(tx.origin) == address(0xbbcc139933d1580e7c40442e09263e90e6f1d66d));
    if (_asset - address(0x0)) {
        v0, /* uint256 */ v1 = _asset.balanceOf(address(this)).gas(msg.gas);
        require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        0x1184(v1);
        v2, /* bool */ v3 = _asset.transfer(msg.sender, v1).gas(msg.gas);
        require(bool(v2), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v3 == bool(v3));
    } else {
        v4 = msg.sender.call().value(this.balance).gas(!this.balance * 2300);
        require(bool(v4), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    }
}

function 0xa1d48336(uint256 varg0, uint256 varg1, bytes varg2) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 96);
    0x1184(varg0);
    0x1184(varg1);
    require(varg2 <= uint64.max);
    require(4 + varg2 + 31 < 4 + (msg.data.length - 4));
    require(varg2.length <= uint64.max);
    require(varg2.data + varg2.length <= 4 + (msg.data.length - 4));
    0x43c(varg2.length, varg2.data, varg1, varg0);
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function function_selector( function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length < 4) {
        require(!msg.data.length);
        receive();
    } else if (0x418aa4f1 == function_selector >> 224) {
        0x418aa4f1();
    } else if (0x51cff8d9 == function_selector >> 224) {
        withdraw(address);
    } else {
        require(0xa1d48336 == function_selector >> 224);
        0xa1d48336();
    }
}
