// Decompiled by library.dedaub.com
// 2024.03.27 22:18 UTC
// Compiled using the solidity compiler version 0.8.17


// Data structures and variables inferred from the use of storage instructions
uint256 owner_0_0_19; // STORAGE[0x0] bytes 0 to 19
uint256 _uniswapV3FlashCallback; // STORAGE[0x1] bytes 0 to 19



function 0x1435() private { 
    v0 = new struct(2);
    require(!((v0 + 64 < v0) | (v0 + 64 > uint64.max)), Panic(65)); // failed memory allocation (too much memory)
    return v0;
}

function 0x148f(uint256 varg0, uint256 varg1) private { 
    require(varg1 - varg0 >= 128);
    require(varg0 + 31 < varg1);
    v0 = v1 = 0x1435();
    require(varg0 + 128 <= varg1);
    while (varg0 < varg0 + 128) {
        require(varg0 + 31 < varg1);
        v2 = v3 = 0x1435();
        require(varg0 + 64 <= varg1);
        while (varg0 < varg0 + 64) {
            MEM[v2] = MEM[varg0];
            v2 += 32;
            varg0 += 32;
        }
        MEM[v0] = v3;
        v0 = v0 + 32;
        varg0 += 64;
    }
    return v1;
}

function _SafeSub(uint256 varg0, uint256 varg1) private { 
    require(varg0 - varg1 <= varg0, Panic(17)); // arithmetic overflow or underflow
    return varg0 - varg1;
}

function 0x2d0358a6(bool varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(msg.sender == owner_0_0_19, Error(49));
    v0, /* uint256 */ v1 = 0x5e93c07a22111b327ee0eaec64028064448ae848.staticcall(0x95d1665, this, 1, 0x43cf1856606df2cb22aedba1a3e23725f1594e81).gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    if (v1) {
        require(bool(0x5e93c07a22111b327ee0eaec64028064448ae848.code.size));
        v2 = 0x5e93c07a22111b327ee0eaec64028064448ae848.withdraw(0x43cf1856606df2cb22aedba1a3e23725f1594e81, v1, 1).gas(msg.gas);
        require(bool(v2), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    }
    if (varg0) {
        v3, /* uint256 */ v4 = 0x43cf1856606df2cb22aedba1a3e23725f1594e81.balanceOf(this).gas(msg.gas);
        require(bool(v3), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        if (v4) {
            v5, /* bool */ v6 = 0x43cf1856606df2cb22aedba1a3e23725f1594e81.transfer(msg.sender, v4).gas(msg.gas);
            require(bool(v5), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
            require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
            require(v6 == bool(v6));
        }
    }
}

function receive() public payable { 
}

function 0x6f0a7d37() public nonPayable { 
    require(msg.sender == owner_0_0_19, Error(49));
    v0, /* uint256 */ v1 = 0x43cf1856606df2cb22aedba1a3e23725f1594e81.balanceOf(this).gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    if (v1) {
        v2, /* bool */ v3 = 0x43cf1856606df2cb22aedba1a3e23725f1594e81.transfer(msg.sender, v1).gas(msg.gas);
        require(bool(v2), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v3 == bool(v3));
    }
    v4, /* uint256 */ v5 = 0x82af49447d8a07e3bd95bd0d56f35241523fbab1.balanceOf(this).gas(msg.gas);
    require(bool(v4), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    if (v5) {
        v6, /* bool */ v7 = 0x82af49447d8a07e3bd95bd0d56f35241523fbab1.transfer(msg.sender, v5).gas(msg.gas);
        require(bool(v6), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v7 == bool(v7));
    }
    selfdestruct(msg.sender);
}

function 0x74066d6b(uint256 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(msg.sender == owner_0_0_19, Error(49));
    v0, /* bool */ v1 = 0x43cf1856606df2cb22aedba1a3e23725f1594e81.transferFrom(msg.sender, this, varg0).gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v1 == bool(v1));
    v2, /* uint256 */ v3 = 0x43cf1856606df2cb22aedba1a3e23725f1594e81.balanceOf(this).gas(msg.gas);
    require(bool(v2), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    v4, /* bool */ v5 = 0x43cf1856606df2cb22aedba1a3e23725f1594e81.approve(0x5e93c07a22111b327ee0eaec64028064448ae848, v3).gas(msg.gas);
    require(bool(v4), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v5 == bool(v5));
    require(bool(0x5e93c07a22111b327ee0eaec64028064448ae848.code.size));
    v6 = 0x5e93c07a22111b327ee0eaec64028064448ae848.deposit(0x43cf1856606df2cb22aedba1a3e23725f1594e81, v3, 1).gas(msg.gas);
    require(bool(v6), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
}

function 0xdb2cd78d(uint256 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(msg.sender == owner_0_0_19, Error(49));
    v0 = 0x5e93c07a22111b327ee0eaec64028064448ae848.staticcall(0x4ed92469, this).gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    v1 = 0x148f(MEM[64], MEM[64] + RETURNDATASIZE());
    require(MEM[32 + v1.word0] > 10 ** 18, Error(50));
    if (0x34b666992fcce34669940ab6b017fe11e5750799.balance > 10 ** 17) {
        require(bool(0x34b666992fcce34669940ab6b017fe11e5750799.code.size));
        v2 = 0x34b666992fcce34669940ab6b017fe11e5750799.call(0xb83f1e3d, 1, 0, 10 ** 18, 1).gas(msg.gas);
        require(bool(v2), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        v3 = _SafeSub(MEM[32 + v1.word0], 10 ** 18);
        require(v3 > 0, Error(50));
    }
    MEM[32 + MEM[64]] = varg0;
    v4 = v5 = 0;
    while (v4 < 32) {
        MEM[160 + (v4 + (4 + MEM[64]))] = MEM[32 + (v4 + MEM[64])];
        v4 += 32;
    }
    MEM[4 + MEM[64] + 32 + 160] = 0;
    require(bool((address(0xc31e54c7a869b9fcbecc14363cf510d1c41fa443)).code.size));
    v6 = address(0xc31e54c7a869b9fcbecc14363cf510d1c41fa443).flash(address(this), varg0, 0, 128, 32).gas(msg.gas);
    require(bool(v6), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
}

function uniswapV3FlashCallback(uint256 fee0, uint256 fee1, bytes data) public nonPayable { 
    require(msg.data.length - 4 >= 96);
    require(data <= uint64.max);
    require(4 + data + 31 < msg.data.length);
    require(msg.data[4 + data] <= uint64.max);
    v0 = data.word0;
    require(v0.data <= msg.data.length);
    require(0xc31e54c7a869b9fcbecc14363cf510d1c41fa443 == msg.sender, Error(51));
    require(36 + data + msg.data[4 + data] - (36 + data) >= 32);
    v1, /* bool */ v2 = 0x82af49447d8a07e3bd95bd0d56f35241523fbab1.approve(_uniswapV3FlashCallback, data.word1).gas(msg.gas);
    require(bool(v1), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v2 == bool(v2));
    v3 = new address[](2);
    CALLDATACOPY(v3.data, msg.data.length, 64);
    require(0 < v3.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v4 = v3.data;
    v3[0] = address(0x82af49447d8a07e3bd95bd0d56f35241523fbab1);
    require(1 < v3.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v3[1] = address(0xff970a61a04b1ca14834a43f5de4533ebddb5cc8);
    v5 = new address[](v3.length);
    v6 = v7 = v5.data;
    v8 = v9 = v3.data;
    v10 = v11 = 0;
    while (v10 < v3.length) {
        MEM[v6] = address(MEM[v8]);
        v6 += 32;
        v8 += 32;
        v10 += 1;
    }
    require(bool(_uniswapV3FlashCallback.code.size));
    v12 = _uniswapV3FlashCallback.swapExactTokensForTokensSupportingFeeOnTransferTokens(data.word1, 0, v5, address(this), address(0x0), block.timestamp, v13, address(0x82af49447d8a07e3bd95bd0d56f35241523fbab1)).gas(msg.gas);
    require(bool(v12), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    v14, /* uint256 */ v15 = 0x82af49447d8a07e3bd95bd0d56f35241523fbab1.balanceOf(0x5ed32847e33844155c18944ae84459404e432620).gas(msg.gas);
    require(bool(v14), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v15 > 0, Error(52));
    require(0 < v3.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v16 = v3.data;
    v3[0] = address(0x82af49447d8a07e3bd95bd0d56f35241523fbab1);
    require(1 < v3.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v3[1] = address(0xff970a61a04b1ca14834a43f5de4533ebddb5cc8);
    v17 = new address[](v3.length);
    v18 = v19 = v17.data;
    v20 = v21 = v3.data;
    v22 = v23 = 0;
    while (v22 < v3.length) {
        MEM[v18] = address(MEM[v20]);
        v18 += 32;
        v20 += 32;
        v22 += 1;
    }
    v24, /* uint256 */ v25 = _uniswapV3FlashCallback.getAmountsOut(v15, v17, v13, address(0x82af49447d8a07e3bd95bd0d56f35241523fbab1)).gas(msg.gas);
    require(bool(v24), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    RETURNDATACOPY(v25, 0, RETURNDATASIZE());
    MEM[64] = v25 + (~0x1f & RETURNDATASIZE() + 31);
    require(v25 + RETURNDATASIZE() - v25 >= 32);
    require(MEM[v25] <= uint64.max);
    require(v25 + MEM[v25] + 31 < v25 + RETURNDATASIZE());
    require(MEM[v25 + MEM[v25]] <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v26 = new uint256[](MEM[v25 + MEM[v25]]);
    require(!((v26 + (~0x1f & (MEM[v25 + MEM[v25]] << 5) + 32 + 31) < v26) | (v26 + (~0x1f & (MEM[v25 + MEM[v25]] << 5) + 32 + 31) > uint64.max)), Panic(65)); // failed memory allocation (too much memory)
    v27 = v28 = v26.data;
    require(32 + (v25 + MEM[v25] + (MEM[v25 + MEM[v25]] << 5)) <= v25 + RETURNDATASIZE());
    v29 = v30 = 32 + (v25 + MEM[v25]);
    while (v29 < 32 + (v25 + MEM[v25] + (MEM[v25 + MEM[v25]] << 5))) {
        MEM[v27] = MEM[v29];
        v29 += 32;
        v27 += 32;
    }
    v31 = 0x5e93c07a22111b327ee0eaec64028064448ae848.staticcall(0x4ed92469, this).gas(msg.gas);
    require(bool(v31), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    v32 = 0x148f(MEM[64], MEM[64] + RETURNDATASIZE());
    v33 = v34 = MEM[32 + v32.word0];
    v35, /* uint256 */ v36 = 0x5e93c07a22111b327ee0eaec64028064448ae848.staticcall(0xf32f3b83, this, v34).gas(msg.gas);
    require(bool(v35), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(10 ** 12, Panic(18)); // division by zero
    require(1 < v26.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    if (v26[1] < v36 / 10 ** 12) {
        require(3, Panic(18)); // division by zero
        v33 = v34 / 3;
    }
    require(bool(0x34b666992fcce34669940ab6b017fe11e5750799.code.size));
    v37 = 0x34b666992fcce34669940ab6b017fe11e5750799.call(0xb83f1e3d, 1, 0, v33, 1).gas(msg.gas);
    require(bool(v37), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    v38, /* uint256 */ v39 = 0xff970a61a04b1ca14834a43f5de4533ebddb5cc8.balanceOf(this).gas(msg.gas);
    require(bool(v38), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    v40, /* bool */ v41 = 0xff970a61a04b1ca14834a43f5de4533ebddb5cc8.approve(_uniswapV3FlashCallback, v39).gas(msg.gas);
    require(bool(v40), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v41 == bool(v41));
    require(1 < v3.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v3[1] = address(0x82af49447d8a07e3bd95bd0d56f35241523fbab1);
    require(0 < v3.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v42 = v3.data;
    v3[0] = address(0xff970a61a04b1ca14834a43f5de4533ebddb5cc8);
    v43 = new address[](v3.length);
    v44 = v45 = v43.data;
    v46 = v47 = v3.data;
    v48 = v49 = 0;
    while (v48 < v3.length) {
        MEM[v44] = address(MEM[v46]);
        v44 += 32;
        v46 += 32;
        v48 += 1;
    }
    require(bool(_uniswapV3FlashCallback.code.size));
    v50 = _uniswapV3FlashCallback.swapExactTokensForTokensSupportingFeeOnTransferTokens(v39, 0, v43, address(this), address(0x0), block.timestamp, v13, address(0xff970a61a04b1ca14834a43f5de4533ebddb5cc8)).gas(msg.gas);
    require(bool(v50), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    v51, /* uint256 */ v52 = 0x82af49447d8a07e3bd95bd0d56f35241523fbab1.balanceOf(this).gas(msg.gas);
    require(bool(v51), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    v53 = _SafeSub(v52, data.word1);
    v54 = _SafeSub(v53, fee0);
    require(data.word1 <= fee0 + data.word1, Panic(17)); // arithmetic overflow or underflow
    v55, /* bool */ v56 = address(0x82af49447d8a07e3bd95bd0d56f35241523fbab1).transfer(msg.sender, fee0 + data.word1).gas(msg.gas);
    require(bool(v55), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v56 == bool(v56));
    v57, /* bool */ v58 = 0x82af49447d8a07e3bd95bd0d56f35241523fbab1.transfer(owner_0_0_19, v54).gas(msg.gas);
    require(bool(v57), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v58 == bool(v58));
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function function_selector( function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length < 4) {
        require(!msg.data.length);
        receive();
    } else if (0x2d0358a6 == function_selector >> 224) {
        0x2d0358a6();
    } else if (0x6f0a7d37 == function_selector >> 224) {
        0x6f0a7d37();
    } else if (0x74066d6b == function_selector >> 224) {
        0x74066d6b();
    } else if (0xdb2cd78d == function_selector >> 224) {
        0xdb2cd78d();
    } else {
        require(0xe9cbafb0 == function_selector >> 224);
        uniswapV3FlashCallback(uint256,uint256,bytes);
    }
}
