// Decompiled by library.dedaub.com
// 2022.12.05 13:38 UTC

// Data structures and variables inferred from the use of storage instructions
uint256 stor_2; // STORAGE[0x2]
uint256 stor_3; // STORAGE[0x3]
uint256 stor_4; // STORAGE[0x4]
uint256 _owner; // STORAGE[0x0] bytes 0 to 19
uint256 _tokensToSend; // STORAGE[0x1] bytes 0 to 19

// Events
OwnershipTransferred(address, address);

function withdrawBalance() public nonPayable { 
    require(msg.sender == _owner);
    v0 = msg.sender.call().value(this.balance).gas(!this.balance * 2300);
    require(v0); // checks call status, propagates error data on error
}

function renounceOwnership() public nonPayable { 
    require(msg.sender == _owner);
    emit OwnershipTransferred(_owner, 0);
    _owner = 0;
}

function tokensToSend(address varg0, address varg1, address varg2, uint256 varg3, bytes varg4, bytes varg5) public nonPayable { 
    require(msg.data.length - 4 >= 192);
    require(varg4 <= 0x100000000);
    require(4 + varg4 + 32 <= 4 + (msg.data.length - 4));
    require(!((varg4.length > 0x100000000) | (36 + varg4 + varg4.length > 4 + (msg.data.length - 4))));
    require(varg5 <= 0x100000000);
    require(4 + varg5 + 32 <= 4 + (msg.data.length - 4));
    require(!((varg5.length > 0x100000000) | (36 + varg5 + varg5.length > 4 + (msg.data.length - 4))));
    require(msg.sender == _tokensToSend, Error('Only DhD'));
    if (stor_3 < stor_2) {
        stor_3 = stor_3 + 1;
        require(0xc0a47dfe034b400b47bdad5fecda2621de6c4d95.code.size);
        v0, v1 = 0xc0a47dfe034b400b47bdad5fecda2621de6c4d95.getExchange(_tokensToSend).gas(msg.gas);
        require(v0); // checks call status, propagates error data on error
        require(RETURNDATASIZE() >= 32);
        require((address(v1)).code.size);
        v2, v3 = address(v1).tokenToEthSwapInput(stor_4, 1, ~0).gas(msg.gas);
        require(v2); // checks call status, propagates error data on error
        require(RETURNDATASIZE() >= 32);
    }
}

function owner() public nonPayable { 
    return _owner;
}

function isOwner() public nonPayable { 
    return msg.sender == _owner;
}

function transferERC20(address varg0, address varg1, uint256 varg2) public nonPayable { 
    require(msg.data.length - 4 >= 96);
    require(msg.sender == _owner);
    require(varg0.code.size);
    v0, v1 = varg0.transfer(varg1, varg2).gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
}

function approveERC20(address varg0, address varg1, uint256 varg2) public nonPayable { 
    require(msg.data.length - 4 >= 96);
    require(msg.sender == _owner);
    require(varg0.code.size);
    v0, v1 = varg0.approve(varg1, varg2).gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
}

function 0xdaf8be1f(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3) public payable { 
    require(msg.data.length - 4 >= 128);
    require(msg.sender == _owner);
    require(0xb3f879cb30fe243b4dfee438691c04.code.size);
    v0, v1 = 0xb3f879cb30fe243b4dfee438691c04.freeFromUpTo(0xc64d18bd6231083e7aa682ec1318b0986f0e96b3, varg3).gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
    require(0xe7bb30cbfbc84b1be7f2c552d41428554db84243.code.size);
    v2, v3 = 0xe7bb30cbfbc84b1be7f2c552d41428554db84243.withdrawAll().gas(msg.gas);
    require(v2); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
    v4 = v5 = this.balance;
    require(0xc0a47dfe034b400b47bdad5fecda2621de6c4d95.code.size);
    v6, v7 = 0xc0a47dfe034b400b47bdad5fecda2621de6c4d95.getExchange(address(varg0)).gas(msg.gas);
    require(v6); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
    require((address(v7)).code.size);
    v8, v9 = address(v7).ethToTokenSwapInput(1, ~0).value(v4).gas(msg.gas);
    require(v8); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
    stor_2 = varg1;
    stor_3 = 1;
    assert(varg1);
    stor_4 = v9 / varg1;
    _tokensToSend = address(varg0);
    require((address(varg0)).code.size);
    v10, v11 = address(varg0).approve(address(v7), ~0).gas(msg.gas);
    require(v10); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
    require((address(v7)).code.size);
    v12, v13 = address(v7).tokenToEthSwapInput(stor_4, 1, ~0).gas(msg.gas);
    require(v12); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
    require(this.balance > v3, Error('insufficient bv funds'));
    v14 = 0xe7bb30cbfbc84b1be7f2c552d41428554db84243.call().value(v3).gas(!v3 * 2300);
    require(v14); // checks call status, propagates error data on error
    require(this.balance > this.balance, Error('you would have lost money on this trade, reverting'));
    v15 = msg.sender.call().value(this.balance).gas(!this.balance * 2300);
    require(v15); // checks call status, propagates error data on error
    return this.balance - this.balance;
}

function transferOwnership(address varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(msg.sender == _owner);
    require(varg0 != 0);
    emit OwnershipTransferred(_owner, varg0);
    _owner = varg0;
}

function () public payable { 
}

function tokensReceived(address varg0, address varg1, address varg2, uint256 varg3, bytes varg4, bytes varg5) public nonPayable { 
    require(msg.data.length - 4 >= 192);
    require(varg4 <= 0x100000000);
    require(4 + varg4 + 32 <= 4 + (msg.data.length - 4));
    require(!((varg4.length > 0x100000000) | (36 + varg4 + varg4.length > 4 + (msg.data.length - 4))));
    require(varg5 <= 0x100000000);
    require(4 + varg5 + 32 <= 4 + (msg.data.length - 4));
    require(!((varg5.length > 0x100000000) | (36 + varg5 + varg5.length > 4 + (msg.data.length - 4))));
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__(bytes4 function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length >= 4) {
        if (0x8f32d59b > function_selector >> 224) {
            if (0x23de29 == function_selector >> 224) {
                tokensReceived(address,address,address,uint256,bytes,bytes);
            } else if (0x5fd8c710 == function_selector >> 224) {
                withdrawBalance();
            } else if (0x715018a6 == function_selector >> 224) {
                renounceOwnership();
            } else if (0x75ab9782 == function_selector >> 224) {
                tokensToSend(address,address,address,uint256,bytes,bytes);
            } else if (0x8da5cb5b == function_selector >> 224) {
                owner();
            }
        } else if (0x8f32d59b == function_selector >> 224) {
            isOwner();
        } else if (0x9db5dbe4 == function_selector >> 224) {
            transferERC20(address,address,uint256);
        } else if (0xa8e5e4aa == function_selector >> 224) {
            approveERC20(address,address,uint256);
        } else if (0xdaf8be1f == function_selector >> 224) {
            0xdaf8be1f();
        } else if (0xf2fde38b == function_selector >> 224) {
            transferOwnership(address);
        }
    }
    ();
}
