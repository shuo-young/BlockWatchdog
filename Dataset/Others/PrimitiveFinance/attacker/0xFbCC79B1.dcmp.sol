// Decompiled by library.dedaub.com
// 2022.12.01 10:00 UTC

// Data structures and variables inferred from the use of storage instructions
uint256 _owner; // STORAGE[0x0] bytes 0 to 19
uint256 _executeOperation; // STORAGE[0x1] bytes 0 to 19
uint256 stor_2_0_19; // STORAGE[0x2] bytes 0 to 19

// Events
LogWithdraw(address, address, uint256);
OwnershipTransferred(address, address);

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
            goto 0x1632B0xa33;
        }
        goto 0xa4b;
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

function () public payable { 
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
    v0 = new uint256[](2);
    if (2) {
        CALLDATACOPY(v0.data, msg.data.length, 64);
    }
    require(varg4.length >= 160);
    require((address(varg0[0x0])).code.size);
    v1 = address(varg0[0x0]).approve(_executeOperation, varg1[0]).gas(msg.gas);
    require(v1); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
    assert(v0.length);
    v2 = v0.data;
    v0[0] = address(varg0[0x0]);
    assert(1 < v0.length);
    v0[32] = stor_2_0_19;
    require(1800 + block.timestamp >= block.timestamp, Error('SafeMath: addition overflow'));
    v3 = new array[](v0.length);
    v4 = v5 = 0;
    while (v4 < 64) {
        v3[v4] = v0[v4];
        v4 += 32;
    }
    require(_executeOperation.code.size);
    v6, v7 = _executeOperation.swapExactTokensForTokens(varg1[0], 0, v3, address(this), 1800 + block.timestamp, v8, address(varg0[0x0]), stor_2_0_19).gas(msg.gas);
    require(v6); // checks call status, propagates error data on error
    RETURNDATACOPY(v7, 0, RETURNDATASIZE());
    MEM[64] = v7 + (~0x1f & RETURNDATASIZE() + 31);
    require(RETURNDATASIZE() >= 32);
    require(MEM[v7] <= 0x100000000);
    require(v7 + MEM[v7] + 32 <= v7 + RETURNDATASIZE());
    require(!((MEM[v7 + MEM[v7]] > 0x100000000) | (v7 + MEM[v7] + 32 + (MEM[v7 + MEM[v7]] << 5) > v7 + RETURNDATASIZE())));
    MEM[MEM[64]] = MEM[v7 + MEM[v7]];
    v9 = v10 = 0;
    while (v9 < MEM[v7 + MEM[v7]] << 5) {
        MEM[v9 + (32 + MEM[64])] = MEM[v9 + (32 + (v7 + MEM[v7]))];
        v9 += 32;
    }
    v11 = (MEM[v7 + MEM[v7]] << 5) + (32 + MEM[64]);
    MEM[v11] = 0x70a0823100000000000000000000000000000000000000000000000000000000;
    MEM[v11 + 4] = this;
    require(stor_2_0_19.code.size);
    v12, v13 = stor_2_0_19.staticcall(MEM[(MEM[64]) len (v11 - MEM[64] + 36)], MEM[(MEM[64]) len 32]).gas(msg.gas);
    require(v12); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
    require(stor_2_0_19.code.size);
    v14 = stor_2_0_19.approve(address(msg.data[36 + varg4]), v13).gas(msg.gas);
    require(v14); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
    require((address(msg.data[36 + varg4])).code.size);
    v15 = address(msg.data[36 + varg4]).call(0x61bd21b200000000000000000000000000000000000000000000000000000000, address(varg4[0x20]), address(varg4[0x40]), address(varg4[0x60]), varg4[128], v13).gas(msg.gas);
    require(v15); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
    assert(v0.length);
    v16 = v0.data;
    v0[0] = stor_2_0_19;
    assert(1 < v0.length);
    v0[32] = address(varg0[0x0]);
    require(stor_2_0_19.code.size);
    v17, v18 = stor_2_0_19.balanceOf(this).gas(msg.gas);
    require(v17); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
    require(stor_2_0_19.code.size);
    v19 = stor_2_0_19.approve(_executeOperation, v18).gas(msg.gas);
    require(v19); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
    require(1800 + block.timestamp >= block.timestamp, Error('SafeMath: addition overflow'));
    v20 = new array[](v0.length);
    v21 = v22 = 0;
    while (v21 < 64) {
        v20[v21] = v0[v21];
        v21 += 32;
    }
    require(_executeOperation.code.size);
    v23, v24 = _executeOperation.swapExactTokensForTokens(v18, 0, v20, address(this), 1800 + block.timestamp, v8, stor_2_0_19, address(varg0[0x0])).gas(msg.gas);
    require(v23); // checks call status, propagates error data on error
    RETURNDATACOPY(v24, 0, RETURNDATASIZE());
    MEM[64] = v24 + (~0x1f & RETURNDATASIZE() + 31);
    require(RETURNDATASIZE() >= 32);
    require(MEM[v24] <= 0x100000000);
    require(v24 + MEM[v24] + 32 <= v24 + RETURNDATASIZE());
    require(!((MEM[v24 + MEM[v24]] > 0x100000000) | (v24 + MEM[v24] + 32 + (MEM[v24 + MEM[v24]] << 5) > v24 + RETURNDATASIZE())));
    MEM[MEM[64]] = MEM[v24 + MEM[v24]];
    v25 = v26 = 0;
    while (v25 < MEM[v24 + MEM[v24]] << 5) {
        MEM[v25 + (32 + MEM[64])] = MEM[v25 + (32 + (v24 + MEM[v24]))];
        v25 += 32;
    }
    MEM[64] = (MEM[v24 + MEM[v24]] << 5) + (32 + MEM[64]);
    assert(0 < varg2.length);
    assert(0 < varg1.length);
    require((?)[0] + (?)[0] >= (?)[0], Error('SafeMath: addition overflow'));
    require((address(varg0[0x0])).code.size);
    v27 = address(varg0[0x0]).approve(0x7d2768de32b0b80b7a3454c06bdac94a69ddc7a9, (?)[0] + (?)[0]).gas(msg.gas);
    require(v27); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
    require((address(varg0[0x0])).code.size);
    v28, v29 = address(varg0[0x0]).balanceOf(address(this)).gas(msg.gas);
    require(v28); // checks call status, propagates error data on error
    v30 = 0x536166654d6174683a207375627472616374696f6e206f766572666c6f7700008c379a000000000000000000000000000000000000000000000000000000000;
    require(RETURNDATASIZE() >= 32);
    v29 = v30.length;
    if ((?)[0] + (?)[0] <= v29) {
        MEM[4 + MEM[64]] = _owner;
        require((address(varg0[0x0])).code.size);
        v31 = address(varg0[0x0]).transfer(_owner, v29 - ((?)[0] + (?)[0])).gas(msg.gas);
        require(v31); // checks call status, propagates error data on error
        require(RETURNDATASIZE() >= 32);
        MEM[MEM[64]] = 1;
        return 1;
    } else {
        v32 = new array[](v33.length);
        MEM[4 + MEM[64]] = 32;
        v34 = v35 = 0;
        while (v34 < v33.length) {
            v32[v34] = v30[v34];
            v34 += 32;
        }
        if (30) {
            MEM[v32.data] = ~0xffff & 'SafeMath: subtraction overflow';
        }
        revert(Error(v32, v8, (?)[0] + (?)[0]));
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
    v1 = new uint256[](2);
    CALLDATACOPY(v1.data, msg.data.length, 64);
    assert(0 < v1.length);
    v2 = v1.data;
    v1[0] = address(varg1);
    assert(1 < v1.length);
    v1[32] = stor_2_0_19;
    v3 = new array[](v1.length);
    v4 = v5 = 0;
    while (v4 < 64) {
        v3[v4] = v1[v4];
        v4 += 32;
    }
    require(_executeOperation.code.size);
    v6, v7 = _executeOperation.fullExit(varg0, v3, v8, address(varg1), stor_2_0_19).gas(msg.gas);
    require(v6); // checks call status, propagates error data on error
    RETURNDATACOPY(v7, 0, RETURNDATASIZE());
    MEM[64] = v7 + (~0x1f & RETURNDATASIZE() + 31);
    require(RETURNDATASIZE() >= 32);
    require(MEM[v7] <= 0x100000000);
    require(v7 + MEM[v7] + 32 <= v7 + RETURNDATASIZE());
    require(!((MEM[v7 + MEM[v7]] > 0x100000000) | (v7 + MEM[v7] + 32 + (MEM[v7 + MEM[v7]] << 5) > v7 + RETURNDATASIZE())));
    v9 = v10 = 0;
    while (v9 < MEM[v7 + MEM[v7]] << 5) {
        MEM[v9 + (32 + MEM[64])] = MEM[v9 + (32 + (v7 + MEM[v7]))];
        v9 += 32;
    }
    assert(0 < MEM[v7 + MEM[v7]]);
    v11 = new uint256[](1);
    if (1) {
        CALLDATACOPY(v11.data, msg.data.length, 32);
    }
    assert(0 < v11.length);
    v12 = v11.data;
    v11[0] = address(varg1);
    v13 = new uint256[](1);
    CALLDATACOPY(v13.data, msg.data.length, 32);
    assert(0 < v13.length);
    v14 = v13.data;
    v13[0] = MEM[32 + MEM[64]];
    require(v11.length <= 0xffffffffffffffff);
    v15 = new uint256[](v11.length);
    if (v11.length) {
    }
    v16 = v17 = 0;
    while (v16 < v11.length) {
        assert(v16 < v15.length);
        v15[v16] = 0;
        v16 += 1;
    }
    MEM[MEM[64]] = 0xab9c4b5d00000000000000000000000000000000000000000000000000000000;
    v18 = new array[](v11.length);
    v19 = v20 = 0;
    while (v19 < 32) {
        v18[v19] = v11[v19];
        v19 += 32;
    }
    v21 = new array[](v13.length);
    v18[32] = v13.length;
    v22 = v23 = 0;
    while (v22 < 32) {
        v21[v22] = v13[v22];
        v22 += 32;
    }
    v24 = new array[](v15.length);
    v21[32] = v15.length;
    v25 = v26 = 0;
    while (v25 < 32) {
        v24[v25] = v15[v25];
        v25 += 32;
    }
    v27 = new array[](v0.length);
    v24[32] = v0.length;
    v28 = v29 = 0;
    while (v28 < v0.length) {
        v27[v28] = v0[v28];
        v28 += 32;
    }
    v30 = v31 = v0.length + v27.data;
    if (0x1f & v0.length) {
        MEM[v31 - (0x1f & v0.length)] = ~(256 ** (32 - (0x1f & v0.length)) - 1) & MEM[v31 - (0x1f & v0.length)];
    }
    require(0x7d2768de32b0b80b7a3454c06bdac94a69ddc7a9.code.size);
    v32 = 0x7d2768de32b0b80b7a3454c06bdac94a69ddc7a9.flashLoan(address(this), v18, v21, v24, address(this), v27, 0, v8, address(varg1), v8, MEM[32 + MEM[64]]).gas(msg.gas);
    require(v32); // checks call status, propagates error data on error
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
