// Decompiled by library.dedaub.com
// 2022.12.01 09:57 UTC

// Data structures and variables inferred from the use of storage instructions
uint256 _owner; // STORAGE[0x0] bytes 0 to 19

// Events
LogWithdraw(address, address, uint256);
OwnershipTransferred(address, address);

function () public payable {
}

function withdraw(address varg0) public nonPayable {
    require(msg.data.length - 4 >= 32);
    require(msg.sender == _owner, Error('Ownable: caller is not the owner'));
    if (varg0) {
        require(varg0.code.size);
        v0, v1 = varg0.balanceOf(this).gas(msg.gas);
        require(v0); // checks call status, propagates error data on error
        require(RETURNDATASIZE() >= 32);
        v2 = v3 = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 != EXTCODEHASH(varg0);
        if (0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 != EXTCODEHASH(varg0)) {
            v2 = EXTCODEHASH(varg0);
        }
        require(v2, Error('SafeERC20: call to non-contract'));
        v4 = v5 = MEM[64];
        v6 = v7 = 32 + MEM[64];
        while (v8 >= 32) {
            MEM[v4] = MEM[v6];
            v8 = v8 + ~31;
            v4 += 32;
            v6 += 32;
        }
        MEM[v4] = MEM[v6] & ~(256 ** (32 - v8) - 1) | MEM[v4] & 256 ** (32 - v8) - 1;
        v9, v10, v11 = varg0.transfer(msg.sender, v1).gas(msg.gas);
        if (RETURNDATASIZE() == 0) {
            v12 = v13 = 96;
        } else {
            v12 = v14 = new bytes[](RETURNDATASIZE());
            RETURNDATACOPY(v14.data, 0, RETURNDATASIZE());
        }
        require(v9, Error('SafeERC20: low-level call failed'));
        if (MEM[v12]) {
            require(MEM[v12] >= 32);
            require(MEM[v11], Error('SafeERC20: ERC20 operation did not succeed'));
            goto 0xe2fB0x830;
        }
        goto 0x848;
    } else {
        v1 = v15 = this.balance;
        v16 = msg.sender.call().value(v15).gas(2300 * !v15);
        require(v16); // checks call status, propagates error data on error
    }
    emit LogWithdraw(msg.sender, varg0, v1);
}

function renounceOwnership() public nonPayable {
    require(msg.sender == _owner, Error('Ownable: caller is not the owner'));
    emit OwnershipTransferred(_owner, 0);
    _owner = 0;
}

function owner() public nonPayable {
    return _owner;
}

function executeOperation(address[] varg0, uint256[] varg1, uint256[] varg2, address varg3, bytes varg4) public nonPayable {
    require(msg.data.length - 4 >= 160);
    require(varg0 <= 0x100000000);
    require(4 + varg0 + 32 <= 4 + (msg.data.length - 4));
    require(!((varg0.length > 0x100000000) | (36 + varg0 + (varg0.length << 5) > 4 + (msg.data.length - 4))));
    require(varg1 <= 0x100000000);
    require(4 + varg1 + 32 <= 4 + (msg.data.length - 4));
    require(!((varg1.length > 0x100000000) | (36 + varg1 + (varg1.length << 5) > 4 + (msg.data.length - 4))));
    require(varg2 <= 0x100000000);
    require(4 + varg2 + 32 <= 4 + (msg.data.length - 4));
    require(!((varg2.length > 0x100000000) | (36 + varg2 + (varg2.length << 5) > 4 + (msg.data.length - 4))));
    require(varg4 <= 0x100000000);
    require(4 + varg4 + 32 <= 4 + (msg.data.length - 4));
    require(!((varg4.length > 0x100000000) | (36 + varg4 + varg4.length > 4 + (msg.data.length - 4))));
    assert(0 < varg1.length);
    assert(0 < varg0.length);
    require(varg4.length >= 160);
    require((address(varg0[0x0])).code.size);
    v0 = address(varg0[0x0]).approve(address(msg.data[36 + varg4]), varg1[0]).gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
    require((address(msg.data[36 + varg4])).code.size);
    v1 = address(msg.data[36 + varg4]).call(0x61bd21b200000000000000000000000000000000000000000000000000000000, address(varg4[0x20]), address(varg4[0x40]), address(varg4[0x60]), varg4[128], varg1[0]).gas(msg.gas);
    require(v1); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
    assert(varg2.length);
    require(varg2[0] + varg1[0] >= varg1[0], Error('SafeMath: addition overflow'));
    require((address(varg0[0x0])).code.size);
    v2 = address(varg0[0x0]).approve(0x7d2768de32b0b80b7a3454c06bdac94a69ddc7a9, varg2[0] + varg1[0]).gas(msg.gas);
    require(v2); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
    require((address(varg0[0x0])).code.size);
    v3, v4 = address(varg0[0x0]).balanceOf(address(this)).gas(msg.gas);
    require(v3); // checks call status, propagates error data on error
    v5 = 'SafeMath: subtraction overflow';
    require(RETURNDATASIZE() >= 32);
    v4 = v5.length;
    if (varg2[0] + varg1[0] <= v4) {
        require((address(varg0[0x0])).code.size);
        v6 = address(varg0[0x0]).transfer(_owner, v4 - (varg2[0] + varg1[0])).gas(msg.gas);
        require(v6); // checks call status, propagates error data on error
        require(RETURNDATASIZE() >= 32);
        return 1;
    } else {
        v7 = new array[](v8.length);
        v9 = v10 = 0;
        while (v9 < v8.length) {
            v7[v9] = v5[v9];
            v9 += 32;
        }
        if (30) {
            MEM[v7.data] = ~0xffff & 'SafeMath: subtraction overflow';
        }
        revert(Error(v7, v11, varg2[0] + varg1[0]));
    }
}

function LENDING_POOL() public nonPayable {
    return 0x7d2768de32b0b80b7a3454c06bdac94a69ddc7a9;
}

function transferOwnership(address varg0) public nonPayable {
    require(msg.data.length - 4 >= 32);
    require(msg.sender == _owner, Error('Ownable: caller is not the owner'));
    require(varg0, Error('Ownable: new owner is the zero address'));
    emit OwnershipTransferred(_owner, varg0);
    _owner = varg0;
}

function ADDRESSES_PROVIDER() public nonPayable {
    return 0xb53c1a33016b2dc2ff3653530bff1848a515c8c5;
}

function 0x4c16ef34(uint256 varg0, uint256 varg1, uint256 varg2) public nonPayable {
    require(msg.data.length - 4 >= 96);
    require(varg2 <= 0x100000000);
    require(4 + varg2 + 32 <= 4 + (msg.data.length - 4));
    require(!((varg2.length > 0x100000000) | (36 + varg2 + varg2.length > 4 + (msg.data.length - 4))));
    v0 = new bytes[](varg2.length);
    CALLDATACOPY(v0.data, 36 + varg2, varg2.length);
    v0[varg2.length] = 0;
    require(msg.sender == _owner, Error('Ownable: caller is not the owner'));
    v1 = new uint256[](1);
    CALLDATACOPY(v1.data, msg.data.length, 32);
    assert(0 < v1.length);
    v2 = v1.data;
    v1[0] = address(varg1);
    v3 = new uint256[](1);
    CALLDATACOPY(v3.data, msg.data.length, 32);
    assert(0 < v3.length);
    v4 = v3.data;
    v3[0] = varg0;
    require(v1.length <= 0xffffffffffffffff);
    v5 = new uint256[](v1.length);
    if (v1.length) {
    }
    v6 = v7 = 0;
    while (v6 < v1.length) {
        assert(v6 < v5.length);
        v5[v6] = 0;
        v6 += 1;
    }
    MEM[MEM[64]] = 0xab9c4b5d00000000000000000000000000000000000000000000000000000000;
    v8 = new array[](v1.length);
    v9 = v10 = 0;
    while (v9 < 32) {
        v8[v9] = v1[v9];
        v9 += 32;
    }
    v11 = new array[](v3.length);
    v8[32] = v3.length;
    v12 = v13 = 0;
    while (v12 < 32) {
        v11[v12] = v3[v12];
        v12 += 32;
    }
    v14 = new array[](v5.length);
    v11[32] = v5.length;
    v15 = v16 = 0;
    while (v15 < 32) {
        v14[v15] = v5[v15];
        v15 += 32;
    }
    v17 = new array[](v0.length);
    v14[32] = v0.length;
    v18 = v19 = 0;
    while (v18 < v0.length) {
        v17[v18] = v0[v18];
        v18 += 32;
    }
    v20 = v21 = v0.length + v17.data;
    if (0x1f & v0.length) {
        MEM[v21 - (0x1f & v0.length)] = ~(256 ** (32 - (0x1f & v0.length)) - 1) & MEM[v21 - (0x1f & v0.length)];
    }
    require(0x7d2768de32b0b80b7a3454c06bdac94a69ddc7a9.code.size);
    v22 = 0x7d2768de32b0b80b7a3454c06bdac94a69ddc7a9.flashLoan(address(this), v8, v11, v14, address(this), v17, 0, v23, address(varg1), v23, varg0).gas(msg.gas);
    require(v22); // checks call status, propagates error data on error
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__(bytes4 function_selector) public payable {
    MEM[64] = 128;
    if (msg.data.length < 4) {
        require(!msg.data.length);
        ();
    } else if (0x8da5cb5b > function_selector >> 224) {
        if (0x542975c == function_selector >> 224) {
            ADDRESSES_PROVIDER();
        } else if (0x4c16ef34 == function_selector >> 224) {
            0x4c16ef34();
        } else if (0x51cff8d9 == function_selector >> 224) {
            withdraw(address);
        } else {
            require(0x715018a6 == function_selector >> 224);
            renounceOwnership();
        }
    } else if (0x8da5cb5b == function_selector >> 224) {
        owner();
    } else if (0x920f5c84 == function_selector >> 224) {
        executeOperation(address[],uint256[],uint256[],address,bytes);
    } else if (0xb4dcfc77 == function_selector >> 224) {
        LENDING_POOL();
    } else {
        require(0xf2fde38b == function_selector >> 224);
        transferOwnership(address);
    }
}
