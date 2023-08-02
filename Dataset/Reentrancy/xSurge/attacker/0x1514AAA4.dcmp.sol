// Decompiled by library.dedaub.com
// 2022.12.19 13:19 UTC

// Data structures and variables inferred from the use of storage instructions
uint256 _geUnlockTime; // STORAGE[0x2]
address _owner; // STORAGE[0x0] bytes 0 to 19
uint8 _fallback; // STORAGE[0x5] bytes 0 to 0
address _unlock; // STORAGE[0x1] bytes 0 to 19
address _pancakeCall; // STORAGE[0x3] bytes 0 to 19

// Events
OwnershipTransferred(address, address);

function 0x1d95(uint256 varg0, uint256 varg1) private { 
    if (varg1) {
        require(!(varg1 & (varg0 > 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff / varg1)), Panic(17));
        v0 = v1 = varg1 * varg0;
        require(varg1, Panic(18));
        require(v1 / varg1 == varg0, Error('SafeMath: multiplication overflow'));
    } else {
        v0 = v2 = 0;
    }
    return v0;
}

function _SafeDiv(uint256 varg0, uint256 varg1) private { 
    if (varg0) {
        require(varg0, Panic(18));
        return varg1 / varg0;
    } else {
        v0 = new array[](v1.length);
        v2 = 0;
        while (v2 < v1.length) {
            v0[v2] = v1[v2];
            v2 += 32;
        }
        if (v2 > v1.length) {
            v0[v1.length] = v2;
        }
        revert(Error(v0));
    }
}

function _SafeSub(uint256 varg0, uint256 varg1) private { 
    if (varg0 <= varg1) {
        require(varg1 >= varg0, Panic(17));
        return varg1 - varg0;
    } else {
        v0 = new array[](v1.length);
        v2 = 0;
        while (v2 < v1.length) {
            v0[v2] = v1[v2];
            v2 += 32;
        }
        if (v2 > v1.length) {
            v0[v1.length] = v2;
        }
        revert(Error(v0));
    }
}

function 0x1da0603a() public nonPayable { 
    require(msg.sender == _owner, Error('Ownable: caller is not the owner'));
    v0 = msg.sender.call().value(this.balance).gas(2300 * !this.balance);
}

function sell() public nonPayable { 
    require(msg.sender == _owner, Error('Ownable: caller is not the owner'));
    require(_pancakeCall.code.size);
    v0, v1 = _pancakeCall.balanceOf(address(this)).gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(_pancakeCall.code.size);
    v2, v3 = _pancakeCall.sell(v1).gas(msg.gas);
    require(v2); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v3 == v3);
}

function renounceOwnership() public nonPayable { 
    require(msg.sender == _owner, Error('Ownable: caller is not the owner'));
    emit OwnershipTransferred(_owner, 0);
    _owner = 0;
}

function _SafeAdd(uint256 varg0, uint256 varg1) private { 
    require(varg0 <= ~varg1, Panic(17));
    return varg0 + varg1;
}

function pancakeCall(address varg0, uint256 varg1, uint256 varg2, bytes varg3) public nonPayable { 
    require(msg.data.length - 4 >= 128);
    require(varg0 == varg0);
    require(varg3 <= 0xffffffffffffffff);
    require(4 + varg3 + 31 < msg.data.length);
    v0 = v1 = varg3.length;
    require(v1 <= 0xffffffffffffffff);
    require(4 + varg3 + v1 + 32 <= msg.data.length);
    v0 = v2 = varg3.data;
    v0 = v3 = new struct(3);
    v3.word0 = 2;
    CALLDATACOPY(v3.data, msg.data.length, 64);
    require(msg.sender.code.size);
    v4, v0 = msg.sender.token0().gas(msg.gas);
    require(v4); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v0 == address(v0));
    require(msg.sender.code.size);
    v5, v0 = msg.sender.token1().gas(msg.gas);
    require(v5); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v0 == address(v0));
    require(0 < v3.word0, Panic(50));
    v6 = v3.data;
    v3.word1 = address(v0);
    require(1 < v3.word0, Panic(50));
    v3.word2 = address(v0);
    if (varg1) {
    }
    v7 = v8 = !varg1;
    if (varg1) {
        v7 = !varg2;
    }
    require(v7, Error('Flash failed'));
    require(msg.sender == 0xed7e52944161450477ee417de9cd3a859b14fd0);
    require(0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c.code.size);
    v9 = 0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c.withdraw(v0).gas(msg.gas);
    require(v9); // checks call status, propagates error data on error
    _fallback = 1;
    while (!_pancakeCall.code.size) {
        v10, v11 = _pancakeCall.calculatePrice().gas(msg.gas);
        if (v10) {
            break;
        }
        require(v10); // checks call status, propagates error data on error
        if (MEM[64] + RETURNDATASIZE() - MEM[64] >= 32) {
            break;
        }
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        if (v11 <= 10000) {
            break;
        }
        if (v11 <= 10000) {
            _fallback = 0;
            require(_pancakeCall.code.size);
            v12, v0 = _pancakeCall.balanceOf(address(this)).gas(msg.gas);
            require(v12); // checks call status, propagates error data on error
            require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
            require(_pancakeCall.code.size);
            v13, v14 = _pancakeCall.sell(v0).gas(msg.gas);
            require(v13); // checks call status, propagates error data on error
            require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
            require(v14 == v14);
            v0 = v15 = 0xc097ce7bc90715b34b9f1000000000;
            v0 = v16 = 0;
            v0 = v17 = 3488;
            v0 = v18 = 3481;
            v0 = v19 = 3469;
            v0 = v20 = 997;
            v0 = v21 = 3475;
            v0 = v22 = 1000;
            v23 = v24 = 0x1d95(v15, v0);
            while (1) {
                v25 = _SafeDiv(v0, v23);
                v23 = 0x1d95(v0, v25);
                v23 = _SafeSub(v25, v0);
            }
            require(0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c.code.size);
            v26 = 0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c.deposit().value(this.balance).gas(msg.gas);
            require(v26); // checks call status, propagates error data on error
            v27 = _SafeAdd(v0, v23);
            require(v27 >= v0, Error('SafeMath: addition overflow'));
            require(0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c.code.size);
            v28, v29 = 0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c.transfer(0xed7e52944161450477ee417de9cd3a859b14fd0, v27).gas(msg.gas);
            require(v28); // checks call status, propagates error data on error
            require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
            require(v29 == v29);
            require(0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c.code.size);
            v30, v31 = 0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c.balanceOf(address(this)).gas(msg.gas);
            require(v30); // checks call status, propagates error data on error
            require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
            require(0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c.code.size);
            v32 = 0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c.withdraw(v31).gas(msg.gas);
            require(v32); // checks call status, propagates error data on error
            v33 = _owner.call().value(this.balance).gas(!this.balance * 2300);
            exit;
        }
        v34 = _pancakeCall.call().value(this.balance).gas(msg.gas);
        if (RETURNDATASIZE() != 0) {
            v35 = new bytes[](RETURNDATASIZE());
            RETURNDATACOPY(v35.data, 0, RETURNDATASIZE());
        }
        MEM[MEM[64]] = 0x70a0823100000000000000000000000000000000000000000000000000000000;
        MEM[4 + MEM[64]] = address(this);
        require(_pancakeCall.code.size);
        v36 = _pancakeCall.staticcall(MEM[(MEM[64]) len (36 + MEM[64] - MEM[64])], MEM[(MEM[64]) len 32]).gas(msg.gas);
        require(v36); // checks call status, propagates error data on error
        MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        MEM[MEM[64]] = 0xe4849b3200000000000000000000000000000000000000000000000000000000;
        MEM[4 + MEM[64]] = MEM[MEM[64]];
        require(_pancakeCall.code.size);
        v37 = _pancakeCall.call(MEM[(MEM[64]) len (36 + MEM[64] - MEM[64])], MEM[(MEM[64]) len 32]).gas(msg.gas);
        require(v37); // checks call status, propagates error data on error
        MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(MEM[MEM[64]] == MEM[MEM[64]]);
    }
    revert();
}

function owner() public nonPayable { 
    return _owner;
}

function unlock() public nonPayable { 
    require(msg.sender == _unlock, Error("You don't have permission to unlock"));
    require(block.timestamp > _geUnlockTime, Error('Contract is locked'));
    emit OwnershipTransferred(_owner, _unlock);
    _owner = _unlock;
}

function 0xabd6d2fa() public nonPayable { 
    require(msg.sender == _owner, Error('Ownable: caller is not the owner'));
    v0 = new array[](v1.length);
    v2 = 0;
    while (v2 < v1.length) {
        v0[v2] = v1[v2];
        v2 += 32;
    }
    if (v2 > v1.length) {
        v0[v1.length] = v2;
    }
    require(0xed7e52944161450477ee417de9cd3a859b14fd0.code.size);
    v3 = 0xed7e52944161450477ee417de9cd3a859b14fd0.swap(0, 0x21e19e0c9bab2400000, address(this), v0).gas(msg.gas);
    require(v3); // checks call status, propagates error data on error
}

function 0xaceb1d1c() public nonPayable { 
    require(msg.sender == _owner, Error('Ownable: caller is not the owner'));
    _fallback = 1;
    while (!_pancakeCall.code.size) {
        v0, v1 = _pancakeCall.calculatePrice().gas(msg.gas);
        if (v0) {
            break;
        }
        require(v0); // checks call status, propagates error data on error
        if (MEM[64] + RETURNDATASIZE() - MEM[64] >= 32) {
            break;
        }
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        if (v1 <= 0) {
            break;
        }
        if (v1 <= 0) {
            v2 = v3 = 0;
            while (v2 < 20) {
                if (_pancakeCall.code.size) {
                    break;
                }
                require(_pancakeCall.code.size);
                v4, v5 = _pancakeCall.calculatePrice().gas(msg.gas);
                if (v4) {
                    break;
                }
                require(v4); // checks call status, propagates error data on error
                if (MEM[64] + RETURNDATASIZE() - MEM[64] >= 32) {
                    break;
                }
                require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
                if (v5 >= 3000) {
                    break;
                }
                if (v5 < 3000) {
                    require(_pancakeCall.code.size);
                    v6, v7 = _pancakeCall.balanceOf(address(this)).gas(msg.gas);
                    require(v6); // checks call status, propagates error data on error
                    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
                    require(_pancakeCall.code.size);
                    v8, v9 = _pancakeCall.sell(v7).gas(msg.gas);
                    require(v8); // checks call status, propagates error data on error
                    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
                    require(v9 == v9);
                }
                v10 = _pancakeCall.call().value(this.balance).gas(msg.gas);
                if (RETURNDATASIZE() != 0) {
                    v11 = new bytes[](RETURNDATASIZE());
                    RETURNDATACOPY(v11.data, 0, RETURNDATASIZE());
                }
                MEM[MEM[64]] = 0x70a0823100000000000000000000000000000000000000000000000000000000;
                MEM[4 + MEM[64]] = address(this);
                require(_pancakeCall.code.size);
                v12 = _pancakeCall.staticcall(MEM[(MEM[64]) len (36 + MEM[64] - MEM[64])], MEM[(MEM[64]) len 32]).gas(msg.gas);
                require(v12); // checks call status, propagates error data on error
                MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
                require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
                MEM[MEM[64]] = 0xe4849b3200000000000000000000000000000000000000000000000000000000;
                MEM[4 + MEM[64]] = MEM[MEM[64]];
                require(_pancakeCall.code.size);
                v13 = _pancakeCall.call(MEM[(MEM[64]) len (36 + MEM[64] - MEM[64])], MEM[(MEM[64]) len 32]).gas(msg.gas);
                require(v13); // checks call status, propagates error data on error
                MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
                require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
                require(MEM[MEM[64]] == MEM[MEM[64]]);
                require(v2 != 0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, Panic(17));
                v2 += 1;
            }
            _fallback = 0;
            exit;
        }
        v14 = _pancakeCall.call().value(this.balance).gas(msg.gas);
        if (RETURNDATASIZE() != 0) {
            v15 = new bytes[](RETURNDATASIZE());
            RETURNDATACOPY(v15.data, 0, RETURNDATASIZE());
        }
        MEM[MEM[64]] = 0x70a0823100000000000000000000000000000000000000000000000000000000;
        MEM[4 + MEM[64]] = address(this);
        require(_pancakeCall.code.size);
        v16 = _pancakeCall.staticcall(MEM[(MEM[64]) len (36 + MEM[64] - MEM[64])], MEM[(MEM[64]) len 32]).gas(msg.gas);
        require(v16); // checks call status, propagates error data on error
        MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        MEM[MEM[64]] = 0xe4849b3200000000000000000000000000000000000000000000000000000000;
        MEM[4 + MEM[64]] = MEM[MEM[64]];
        require(_pancakeCall.code.size);
        v17 = _pancakeCall.call(MEM[(MEM[64]) len (36 + MEM[64] - MEM[64])], MEM[(MEM[64]) len 32]).gas(msg.gas);
        require(v17); // checks call status, propagates error data on error
        MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(MEM[MEM[64]] == MEM[MEM[64]]);
    }
    revert();
}

function () public payable { 
    if (!_fallback) {
        exit;
    } else {
        require(_pancakeCall.code.size);
        v0, v1 = _pancakeCall.balanceOf(address(this)).gas(msg.gas);
        require(v0); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        v2, v3 = _pancakeCall.call().value(msg.value).gas(msg.gas);
        if (RETURNDATASIZE() != 0) {
            v4 = new bytes[](RETURNDATASIZE());
            v3 = v4.data;
            RETURNDATACOPY(v3, 0, RETURNDATASIZE());
        }
        exit;
    }
}

function geUnlockTime() public nonPayable { 
    return _geUnlockTime;
}

function 0xd812f6b8() public nonPayable { 
    require(msg.sender == _owner, Error('Ownable: caller is not the owner'));
    require(0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c.code.size);
    v0, v1 = 0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c.balanceOf(address(this)).gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c.code.size);
    v2, v3 = 0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c.transfer(msg.sender, v1).gas(msg.gas);
    require(v2); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v3 == v3);
}

function lock(uint256 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(msg.sender == _owner, Error('Ownable: caller is not the owner'));
    _unlock = _owner;
    _owner = 0;
    v0 = _SafeAdd(block.timestamp, varg0);
    _geUnlockTime = v0;
    emit OwnershipTransferred(_owner, 0);
}

function transferOwnership(address varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(varg0 == varg0);
    require(msg.sender == _owner, Error('Ownable: caller is not the owner'));
    require(varg0, Error('Ownable: new owner is the zero address'));
    emit OwnershipTransferred(_owner, varg0);
    _owner = varg0;
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__(bytes4 function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length < 4) {
        require(!msg.data.length);
        ();
    } else if (0xabd6d2fa > function_selector >> 224) {
        if (0x84800812 > function_selector >> 224) {
            if (0x1da0603a == function_selector >> 224) {
                0x1da0603a();
            } else if (0x45710074 == function_selector >> 224) {
                sell();
            } else {
                require(0x715018a6 == function_selector >> 224);
                renounceOwnership();
            }
        } else if (0x84800812 == function_selector >> 224) {
            pancakeCall(address,uint256,uint256,bytes);
        } else if (0x8da5cb5b == function_selector >> 224) {
            owner();
        } else {
            require(0xa69df4b5 == function_selector >> 224);
            unlock();
        }
    } else if (0xd812f6b8 > function_selector >> 224) {
        if (0xabd6d2fa == function_selector >> 224) {
            0xabd6d2fa();
        } else if (0xaceb1d1c == function_selector >> 224) {
            0xaceb1d1c();
        } else {
            require(0xb6c52324 == function_selector >> 224);
            geUnlockTime();
        }
    } else if (0xd812f6b8 == function_selector >> 224) {
        0xd812f6b8();
    } else if (0xdd467064 == function_selector >> 224) {
        lock(uint256);
    } else {
        require(0xf2fde38b == function_selector >> 224);
        transferOwnership(address);
    }
}
