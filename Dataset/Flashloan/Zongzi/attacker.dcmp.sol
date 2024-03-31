// Decompiled by library.dedaub.com
// 2024.03.25 09:30 UTC
// Compiled using the solidity compiler version 0.8.19


// Data structures and variables inferred from the use of storage instructions
uint256[] _pancakeCall; // STORAGE[0x5]
uint256 stor_6; // STORAGE[0x6]
uint256 stor_9; // STORAGE[0x9]
uint256 _owner; // STORAGE[0x0] bytes 0 to 19
uint256 stor_1_0_19; // STORAGE[0x1] bytes 0 to 19
uint256 stor_2_0_19; // STORAGE[0x2] bytes 0 to 19
uint256 stor_3_0_19; // STORAGE[0x3] bytes 0 to 19
uint256 stor_4_0_19; // STORAGE[0x4] bytes 0 to 19
uint256 stor_7_0_19; // STORAGE[0x7] bytes 0 to 19
uint256 stor_8_0_19; // STORAGE[0x8] bytes 0 to 19


// Events
OwnershipTransferred(address, address);

function owner() public nonPayable { 
    return _owner;
}

function 0xdec38c99(address[] varg0, uint256 varg1) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 64);
    require(varg0 <= uint64.max);
    require(4 + varg0 + 31 < 4 + (msg.data.length - 4));
    v0 = v1 = varg0.data;
    require(varg0.length <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v2 = new address[](varg0.length);
    require(!((v2 + ((varg0.length << 5) + 32 + 31 & ~0x1f) > uint64.max) | (v2 + ((varg0.length << 5) + 32 + 31 & ~0x1f) < v2)), Panic(65)); // failed memory allocation (too much memory)
    v3 = v4 = v2.data;
    require(v1 + (varg0.length << 5) <= 4 + (msg.data.length - 4));
    while (v0 < v1 + (varg0.length << 5)) {
        0x1981(msg.data[v0]);
        MEM[v3] = msg.data[v0];
        v3 = v3 + 32;
        v0 = v0 + 32;
    }
    0x19f7(varg1);
    require(_owner == msg.sender, Error(8559));
    v5 = v6 = v2.data;
    _pancakeCall = v2.length;
    v7 = v8 = _pancakeCall.data;
    if (v2.length) {
        while (v6 + (v2.length << 5) > v5) {
            STORAGE[v7] = address(MEM[v5]) | bytes12(STORAGE[v7]);
            v5 += 32;
            v7 += 1;
        }
    }
    while (v8 + _pancakeCall.length > v7) {
        STORAGE[v7] = 0;
        v7 += 1;
    }
    stor_9 = varg1;
}

function transferOwnership(address newOwner) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 32);
    0x1981(newOwner);
    require(_owner == msg.sender, Error(8559));
    require(newOwner - address(0x0), Error(28208));
    emit OwnershipTransferred(_owner, newOwner);
    _owner = newOwner;
}

function 0x1981(address varg0) private { 
    return ;
}

function 0x19f7(uint256 varg0) private { 
    return ;
}

function _SafeMul(uint256 varg0, uint256 varg1) private { 
    require(!varg0 | (varg1 == varg0 * varg1 / varg0), Panic(17)); // arithmetic overflow or underflow
    return varg0 * varg1;
}

function _SafeDiv(uint256 varg0, uint256 varg1) private { 
    require(varg1, Panic(18)); // division by zero
    return varg0 / varg1;
}

function receive() public payable { 
}

function 0x14696961() public nonPayable { 
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
        v0 = address(tx.origin) == address(0xe5c326b7595bae6894ad15c7bc1e7eb74cbdb2a6);
    }
    require(v0, Error(28535));
    require(1 < _pancakeCall.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v5, /* bool */ v6 = address(_pancakeCall[1]).launch().gas(msg.gas);
    require(bool(v5), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v6 == bool(v6));
    require(v6, Error(0x6e6f6c));
    require(1 < _pancakeCall.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    require((address(_pancakeCall[1])).balance > 10 ** 20, Error(25208));
    v7, /* address */ v8 = stor_3_0_19.factory().gas(msg.gas);
    require(bool(v7), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x1981(v8);
    require(0 < _pancakeCall.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    require(0 < _pancakeCall.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    require(1 < _pancakeCall.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v9, /* address */ v10 = address(v8).getPair(address(_pancakeCall[0]), address(_pancakeCall[1])).gas(msg.gas);
    require(bool(v9), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x1981(v10);
    v11, /* uint256 */ v12 = address(_pancakeCall[0]).balanceOf(address(v10)).gas(msg.gas);
    require(bool(v11), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x19f7(v12);
    require(1 < _pancakeCall.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v13 = _SafeMul(v12, 100);
    v14 = _SafeDiv(v13, (address(_pancakeCall[1])).balance);
    v15 = _SafeMul(v12, stor_9);
    v16 = _SafeDiv(v15, v14);
    stor_6 = v16;
    v17, /* address */ v18 = address(v8).getPair(stor_1_0_19, stor_2_0_19).gas(msg.gas);
    require(bool(v17), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x1981(v18);
    stor_4_0_19 = v18;
    require(0 < _pancakeCall.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v19, /* address */ v20 = stor_4_0_19.token0().gas(msg.gas);
    require(bool(v19), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x1981(v20);
    if (address(v20) - address(_pancakeCall[0])) {
        v21 = new uint256[](32);
        v22 = v23 = 0;
        while (v22 < 32) {
            MEM[v21.data + v22] = MEM[MEM[64] + 32 + v22];
            v22 = v22 + 32;
        }
        MEM[v21.data + 32] = 0;
        require(bool(stor_4_0_19.code.size));
        v24 = stor_4_0_19.swap(0, stor_6, address(this), v21, v25, uint8(1)).gas(msg.gas);
        require(bool(v24), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    } else {
        v26 = new uint256[](32);
        v27 = v28 = 0;
        while (v27 < 32) {
            MEM[v26.data + v27] = MEM[MEM[64] + 32 + v27];
            v27 = v27 + 32;
        }
        MEM[v26.data + 32] = 0;
        require(bool(stor_4_0_19.code.size));
        v29 = stor_4_0_19.swap(stor_6, 0, address(this), v26, v25, uint8(1)).gas(msg.gas);
        require(bool(v29), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    }
}

function 0x51588209(address varg0, address varg1) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 64);
    0x1981(varg0);
    0x1981(varg1);
    require(_owner == msg.sender, Error(8559));
    stor_7_0_19 = varg0;
    stor_8_0_19 = varg1;
}

function renounceOwnership() public nonPayable { 
    require(_owner == msg.sender, Error(8559));
    emit OwnershipTransferred(_owner, address(0x0));
    _owner = 0;
}

function pancakeCall(address _sender, uint256 _amount0, uint256 _amount1, bytes _data) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 128);
    0x1981(_sender);
    0x19f7(_amount0);
    0x19f7(_amount1);
    require(_data <= uint64.max);
    require(4 + _data + 31 < 4 + (msg.data.length - 4));
    require(_data.length <= uint64.max);
    require(_data.data + _data.length <= 4 + (msg.data.length - 4));
    require(0 < _pancakeCall.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    require(0 < _pancakeCall.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v0, /* uint256 */ v1 = address(_pancakeCall[0]).balanceOf(address(this)).gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x19f7(v1);
    v2, /* bool */ v3 = address(_pancakeCall[0]).transfer(stor_7_0_19, v1).gas(msg.gas);
    require(bool(v2), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v3 == bool(v3));
    v4 = new uint256[](_pancakeCall.length);
    v5 = v6 = v4.data;
    v7 = v8 = _pancakeCall.data;
    v9 = v10 = 0;
    while (v9 < _pancakeCall.length) {
        MEM[v5] = address(STORAGE[v7]);
        v5 = v5 + 32;
        v7 = v7 + 1;
        v9 = v9 + 1;
    }
    require(bool(stor_7_0_19.code.size));
    v11 = stor_7_0_19.call(uint32(0x85936cac), v4, address(this)).gas(msg.gas);
    require(bool(v11), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(1 < _pancakeCall.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v12, /* bool */ v13 = address(_pancakeCall[1]).approve(stor_3_0_19, 10 ** 64).gas(msg.gas);
    require(bool(v12), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v13 == bool(v13));
    require(2 <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v14 = new address[](2);
    if (2) {
        CALLDATACOPY(v14.data, msg.data.length, 64);
    }
    require(1 < _pancakeCall.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    require(0 < _pancakeCall.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    require(0 < v14.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v15 = v14.data;
    require(1 < v14.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v14[1] = address(_pancakeCall[0]);
    v14[0] = address(_pancakeCall[1]);
    require(1 < _pancakeCall.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v16, /* uint256 */ v17 = address(_pancakeCall[1]).balanceOf(address(this)).gas(msg.gas);
    require(bool(v16), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x19f7(v17);
    require(block.timestamp <= block.timestamp + 0x15180, Panic(17)); // arithmetic overflow or underflow
    v18 = new address[](v14.length);
    v19 = v20 = v18.data;
    v21 = v22 = v14.data;
    v23 = v24 = 0;
    while (v23 < v14.length) {
        MEM[v19] = address(MEM[v21]);
        v19 = v19 + 32;
        v21 = v21 + 32;
        v23 = v23 + 1;
    }
    require(bool(stor_3_0_19.code.size));
    v25 = stor_3_0_19.swapExactTokensForTokensSupportingFeeOnTransferTokens(v17, 0, v18, address(this), block.timestamp + 0x15180, v26, address(_pancakeCall[1])).gas(msg.gas);
    require(bool(v25), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(0 < _pancakeCall.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    require(0 < _pancakeCall.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v27, /* uint256 */ v28 = address(_pancakeCall[0]).balanceOf(address(this)).gas(msg.gas);
    require(bool(v27), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x19f7(v28);
    v29, /* bool */ v30 = address(_pancakeCall[0]).transfer(stor_8_0_19, v28).gas(msg.gas);
    require(bool(v29), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v30 == bool(v30));
    require(0 < _pancakeCall.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v31 = _SafeMul(stor_6, 10026);
    v32 = _SafeDiv(v31, 10000);
    require(bool(stor_8_0_19.code.size));
    v33 = stor_8_0_19.call(uint32(0x96f6e2ca), address(_pancakeCall[0]), stor_4_0_19, v32).gas(msg.gas);
    require(bool(v33), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function function_selector( function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length < 4) {
        require(!msg.data.length);
        receive();
    } else if (0x84800812 > function_selector >> 224) {
        if (0x14696961 == function_selector >> 224) {
            0x14696961();
        } else if (0x51588209 == function_selector >> 224) {
            0x51588209();
        } else {
            require(0x715018a6 == function_selector >> 224);
            renounceOwnership();
        }
    } else if (0x84800812 == function_selector >> 224) {
        pancakeCall(address,uint256,uint256,bytes);
    } else if (0x8da5cb5b == function_selector >> 224) {
        owner();
    } else if (0xdec38c99 == function_selector >> 224) {
        0xdec38c99();
    } else {
        require(0xf2fde38b == function_selector >> 224);
        transferOwnership(address);
    }
}
