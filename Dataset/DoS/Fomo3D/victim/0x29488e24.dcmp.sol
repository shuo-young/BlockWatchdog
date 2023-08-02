// Decompiled by library.dedaub.com
// 2022.12.05 13:58 UTC

// Data structures and variables inferred from the use of storage instructions
uint256 stor_1; // STORAGE[0x1]
uint256 _getTimeLeft; // STORAGE[0x2]
uint256 _airDropPot_; // STORAGE[0x3]
uint256 _airDropTracker_; // STORAGE[0x4]
uint256 _rID_; // STORAGE[0x5]
mapping (uint256 => [uint256]) _pIDxAddr_; // STORAGE[0x6]
mapping (uint256 => [uint256]) _pIDxName_; // STORAGE[0x7]
mapping (uint256 => [uint256]) _plyr_; // STORAGE[0x8]
mapping (uint256 => [uint256]) _plyrRnds_; // STORAGE[0x9]
mapping (uint256 => [uint256]) _plyrNames_; // STORAGE[0xa]
mapping (uint256 => [uint256]) _round_; // STORAGE[0xb]
mapping (uint256 => [uint256]) _rndTmEth_; // STORAGE[0xc]
mapping (uint256 => [uint256]) _fees_; // STORAGE[0xd]
mapping (uint256 => [uint256]) _potSplit_; // STORAGE[0xe]
uint256 _activate; // STORAGE[0x0] bytes 0 to 19
uint256 _activated_; // STORAGE[0xf] bytes 0 to 0
uint256 stor_72c6bfb7988af3a1efa6568f02a999bc52252641c659d85961ca3d372b57d5d1; // STORAGE[0x72c6bfb7988af3a1efa6568f02a999bc52252641c659d85961ca3d372b57d5d1]
uint256 stor_72c6bfb7988af3a1efa6568f02a999bc52252641c659d85961ca3d372b57d5d3; // STORAGE[0x72c6bfb7988af3a1efa6568f02a999bc52252641c659d85961ca3d372b57d5d3]

// Events
onBuyAndDistribute(address, bytes32, uint256, uint256, uint256, address, bytes32, uint256, uint256, uint256, uint256);
onWithdraw(uint256, address, bytes32, uint256, uint256);
onNewName(uint256, address, bytes32, bool, uint256, address, bytes32, uint256, uint256);
onPotSwapDeposit(uint256, uint256);
onReLoadAndDistribute(address, bytes32, uint256, uint256, address, bytes32, uint256, uint256, uint256, uint256);
onEndTx(uint256, uint256, bytes32, address, uint256, uint256, address, bytes32, uint256, uint256, uint256, uint256, uint256, uint256);

function () public payable { 
    v0 = new struct(9);
    v0.word0 = 0;
    v0.word1 = 0;
    v0.word2 = 0;
    v0.word3 = 0;
    v0.word4 = 0;
    v0.word5 = 0;
    v0.word6 = 0;
    v0.word7 = 0;
    v0.word8 = 0;
    require(1 == _activated_, Error('its not ready yet.  check ?eta in discord'));
    require(!msg.sender.code.size, Error('sorry humans only'));
    require(msg.value >= 0x3b9aca00, Error('pocket lint: not a valid currency'));
    require(msg.value <= 0x152d02c7e14af6800000, Error('no vitalik, no'));
    v1 = new struct(9);
    v1.word0 = 0;
    v1.word1 = 0;
    v1.word2 = 0;
    v1.word3 = 0;
    v1.word4 = 0;
    v1.word5 = 0;
    v1.word6 = 0;
    v1.word7 = 0;
    v1.word8 = 0;
    if (!_pIDxAddr_[msg.sender]) {
        require(0xb838c100eb1a1d08b215fbbcc06698e9c181358c.code.size);
        v2, v3 = 0xb838c100eb1a1d08b215fbbcc06698e9c181358c.getPlayerID(msg.sender).gas(msg.gas);
        require(v2); // checks call status, propagates error data on error
        require(RETURNDATASIZE() >= 32);
        require(0xb838c100eb1a1d08b215fbbcc06698e9c181358c.code.size);
        v4, v5 = 0xb838c100eb1a1d08b215fbbcc06698e9c181358c.getPlayerName(v3).gas(msg.gas);
        require(v4); // checks call status, propagates error data on error
        require(RETURNDATASIZE() >= 32);
        require(0xb838c100eb1a1d08b215fbbcc06698e9c181358c.code.size);
        v6, v7 = 0xb838c100eb1a1d08b215fbbcc06698e9c181358c.getPlayerLAff(v3).gas(msg.gas);
        require(v6); // checks call status, propagates error data on error
        require(RETURNDATASIZE() >= 32);
        _pIDxAddr_[msg.sender] = v3;
        _pIDxAddr_[msg.sender] = msg.sender | ~0xffffffffffffffffffffffffffffffffffffffff & _pIDxAddr_[msg.sender];
        if (v5) {
            _pIDxName_[v5] = v3;
            _plyr_[v5][1] = v5;
            _plyrNames_[v5] = 0x1 | ~0xff & _plyrNames_[v5];
        }
        v8 = v9 = v7;
        if (v7) {
            v8 = v7 != v3;
        }
        if (v8) {
            _plyr_[v3][6] = v7;
        }
        v0.word0 += 1;
    }
    v10 = _pIDxAddr_[_pIDxAddr_[msg.sender]][6];
    0xc69();
}

function 0x2ee8(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4) private { 
    varg1 = v0 = 0;
    if (!_plyrRnds_[v1][1]) {
        varg1 = v2 = 12059;
        v3 = new struct(9);
        v3.word0 = 0;
        v3.word1 = 0;
        v3.word2 = 0;
        v3.word3 = 0;
        v3.word4 = 0;
        v3.word5 = 0;
        v3.word6 = 0;
        v3.word7 = 0;
        v3.word8 = 0;
        if (_plyr_[varg4][5]) {
            v4, varg1 = v5, varg1 = v6 = 0x4e0d(_plyr_[varg4][5]);
        }
        _plyr_[varg1][5] = _rID_;
        MEM[v7] += 10;
    }
    v8 = v9 = 0x56bc75e2d63100000 > _round_[varg1][6];
    if (v9) {
        v10 = _SafeAdd(varg1, _plyrRnds_[varg1]);
        v8 = v11 = v10 > 0xde0b6b3a7640000;
    }
    if (v8) {
        varg1 = v12 = _SafeSub(_plyrRnds_[varg1], 0xde0b6b3a7640000);
        varg1 = v13 = _SafeSub(v12, varg1);
        v14 = _SafeAdd(v13, _plyr_[varg1][3]);
        _plyr_[varg1][3] = v14;
    }
    if (varg1 > 0x3b9aca00) {
        varg1 = v15 = 12333;
        v16 = v17, v18 = v19, v20, v21 = v22, varg1 = v23, varg1 = v24, varg1 = v25 = 0x4587(varg1);
        if (v17 >= 0xde0b6b3a7640000) {
            v18 = v26, v16 = v27, v21 = v28 = 0x46ec(varg1, v17, 12360, v19, v17, v22, v23, v24, v25, v15, varg1);
            if (varg1 != _round_[varg1]) {
                _round_[varg1] = varg1;
            }
            if (varg1 != _round_[varg1][1]) {
                _round_[varg1][1] = varg1;
            }
            MEM[varg1] += 100;
        }
        if (varg1 >= 0x16345785d8a0000) {
            _airDropTracker_ += 1;
            v29, v30 = v31, v16 = v32, v33, v34, varg1 = v35, varg1 = v36 = 0x47c8(12484, v18, v16, v21, varg1);
            if (1 == v29) {
                if (varg1 < 0x8ac7230489e80000) {
                    v37 = v38 = varg1 >= 0xde0b6b3a7640000;
                    if (v38) {
                        v37 = v39 = varg1 < 0x8ac7230489e80000;
                    }
                    if (!v37) {
                        v40 = v41 = varg1 >= 0x16345785d8a0000;
                        if (v41) {
                            v40 = v42 = varg1 < 0xde0b6b3a7640000;
                        }
                        if (v40) {
                            v43 = 0x4385(25, _airDropPot_);
                            assert(100);
                            v30 = v44 = v43 / 100;
                            v45 = _SafeAdd(v44, _plyr_[varg1][2]);
                            _plyr_[varg1][2] = v45;
                            v46 = _SafeSub(v44, _airDropPot_);
                            _airDropPot_ = v46;
                            MEM[v35] += 0xeca8847c4129106ce8300000000;
                        }
                    } else {
                        v47 = 0x4385(50, _airDropPot_);
                        assert(100);
                        v30 = v48 = v47 / 100;
                        v49 = _SafeAdd(v48, _plyr_[varg1][2]);
                        _plyr_[varg1][2] = v49;
                        v50 = _SafeSub(v48, _airDropPot_);
                        _airDropPot_ = v50;
                        MEM[v35] += 0x9dc5ada82b70b59df0200000000;
                    }
                } else {
                    v51 = 0x4385(75, _airDropPot_);
                    assert(100);
                    v30 = v52 = v51 / 100;
                    v53 = _SafeAdd(v52, _plyr_[varg1][2]);
                    _plyr_[varg1][2] = v53;
                    v54 = _SafeSub(v52, _airDropPot_);
                    _airDropPot_ = v54;
                    MEM[v35] += 0xeca8847c4129106ce8300000000;
                }
                MEM[v35] = 0x7e37be2022c0914b2680000000 + (v30 * 0x314dc6448d9338c15b0a00000000 + MEM[v35]);
                _airDropTracker_ = 0;
            }
        }
        MEM[varg1] += _airDropTracker_ * 1000;
        v55 = _SafeAdd(_plyrRnds_[varg1][1], v16);
        _plyrRnds_[varg1][1] = v55;
        v56 = _SafeAdd(_plyrRnds_[varg1], varg1);
        _plyrRnds_[varg1] = v56;
        v57 = _SafeAdd(_round_[varg1][5], v16);
        _round_[varg1][5] = v57;
        v58 = _SafeAdd(_round_[varg1][6], varg1);
        _round_[varg1][6] = v58;
        v59 = _SafeAdd(_rndTmEth_[varg1], varg1);
        _rndTmEth_[varg1] = v59;
        v60, v61, v62, v63, v64, v65, v66, v67, v68, varg1 = v69, v70, v71 = 0x49df(varg1, varg1, varg1, varg1);
        v72 = new struct(9);
        v72.word0 = 0;
        v72.word1 = 0;
        v72.word2 = 0;
        v72.word3 = 0;
        v72.word4 = 0;
        v72.word5 = 0;
        v72.word6 = 0;
        v72.word7 = 0;
        v72.word8 = 0;
        v73 = 0x4385(_fees_[v66], v68);
        assert(100);
        v74 = _SafeAdd(v68 / 50, _airDropPot_);
        _airDropPot_ = v74;
        v75 = 0x4385(_fees_[v66][1], v68);
        assert(100);
        v76 = 0x4385(20, v68);
        assert(100);
        require(v75 / 100 + v76 / 100 >= v76 / 100, Error('SafeMath add failed'));
        MEM[0 + (v75 / 100 + v76 / 100)] = MEM[0 + (v75 / 100 + v76 / 100)] + 0xde0b6b3a7640000 * block.timestamp + 0x1431e0fae6d7217caa0000000 * v72;
        MEM[32 + (v75 / 100 + v76 / 100)] = MEM[32 + (v75 / 100 + v76 / 100)] + v66 + 0x1aba4714957d300d0e549208b31adb10000000000000 * _rID_;
        emit onEndTx(MEM[0 + (v75 / 100 + v76 / 100)], MEM[32 + (v75 / 100 + v76 / 100)], ~0x0 & (~0x0 & _plyr_[v66][0x1]), msg.sender, v62, 0, address(MEM[64 + (v75 / 100 + v76 / 100)]), ~0x0 & (~0x0 & MEM[96 + (v75 / 100 + v76 / 100)]), MEM[128 + (v75 / 100 + v76 / 100)], MEM[160 + (v75 / 100 + v76 / 100)], MEM[192 + (v75 / 100 + v76 / 100)], MEM[224 + (v75 / 100 + v76 / 100)], MEM[256 + (v75 / 100 + v76 / 100)], _airDropPot_);
    }
    return ;
}

function 0x3439() private { 
    v0 = new struct(9);
    v0.word0 = 0;
    v0.word1 = 0;
    v0.word2 = 0;
    v0.word3 = 0;
    v0.word4 = 0;
    v0.word5 = 0;
    v0.word6 = 0;
    v0.word7 = 0;
    v0.word8 = 0;
    v0 = v1 = _rID_;
    v0 = v2 = 0;
    v0 = v3 = _round_[v1];
    v0 = v4 = _round_[v1][1];
    v0 = v5 = _round_[v1][7];
    v6 = 0x4385(48, v5);
    assert(100);
    v0 = v7 = v6 / 100;
    v0 = v8 = v5 / 50;
    v9 = 0x4385(_potSplit_[v4], v5);
    assert(100);
    v0 = v10 = v9 / 100;
    v11 = 0x4385(_potSplit_[v4][1], v5);
    assert(100);
    v0 = v12 = v11 / 100;
    v0 = v13 = 13577;
    v0 = v14 = 7626;
    v15 = v16 = _SafeSub(v7, v5);
    while (1) {
        v15 = _SafeSub(v0, v15);
    }
    v17 = 0x4385(0xde0b6b3a7640000, v0);
    assert(_round_[v0][5]);
    v18 = 0x4385(_round_[v0][5], v17 / _round_[v0][5]);
    assert(0xde0b6b3a7640000);
    require(v18 / 0xde0b6b3a7640000 <= v0, Error('SafeMath sub failed'));
    return v0 - v18 / 0xde0b6b3a7640000, v0, v17 / _round_[v0][5], v15, v0, v0, v0, v0, v0, v0, v0;
    assert(v0);
    return v15 / v0, v0, v0, v0, v0, v0, v0, v0, v0, v0, v0;
}

function 0x357e(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5, uint256 varg6) private { 
    v0 = varg0 / varg1;
    require(v0 <= v1, Error('SafeMath sub failed'));
    return v1 - v0, varg3, varg4, varg5, varg6, v1;
}

function getBuyPrice() public nonPayable { 
    v0 = v1 = block.timestamp > _round_[_rID_][4] + _getTimeLeft;
    if (v1) {
        v0 = v2 = block.timestamp <= _round_[_rID_][2];
        if (block.timestamp > _round_[_rID_][2]) {
            v0 = v3 = block.timestamp > _round_[_rID_][2];
            if (v3) {
                v0 = !_round_[_rID_];
            }
        }
    }
    if (!v0) {
        v4 = v5 = 0x44364c5bb000;
    } else {
        v6 = _SafeAdd(0xde0b6b3a7640000, _round_[_rID_][5]);
        v4 = v7, v8, v9, v10, v11, v12, v13, v14 = 0x387d(0xde0b6b3a7640000);
        goto 0xf630xea3B0x36b;
    }
    return v4;
}

function _SafeAdd(uint256 varg0, uint256 varg1) private { 
    v0 = varg0 + varg1;
    require(v0 >= varg1, Error('SafeMath add failed'));
    return v0;
}

function symbol() public nonPayable { 
    v0 = new array[](v1.length);
    v2 = v3 = 0;
    while (v2 < v1.length) {
        v0[v2] = v1[v2];
        v2 += 32;
    }
    if (9) {
        MEM[v0.data] = ~0xffffffffffffffffffffffffffffffffffffffffffffff & 'SuperCard';
    }
    return v0;
}

function 0x387d(uint256 varg0) private { 
    v0 = _SafeSub(varg0, v1);
    v2, v3, v4, v5 = 0x4620();
    v6, v7, v8, v9 = 0x4620();
    v10 = _SafeSub(v7, v6);
    return v10, v4, v5, 14490, 14499, 0, varg0, v1;
}

function 0x38aa(uint256 varg0) private { 
    v0 = v1 = varg0 < 0;
    if (varg0 >= 0) {
        v0 = v2 = varg0 > 3;
    }
    if (v0) {
        varg0 = v3 = 2;
    }
    return varg0;
}

function 0x38cf(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3) private { 
    v0 = v1 = block.timestamp > _getTimeLeft + _round_[_rID_][4];
    if (v1) {
        v0 = v2 = block.timestamp <= _round_[_rID_][2];
        if (block.timestamp > _round_[_rID_][2]) {
            v0 = v3 = block.timestamp > _round_[_rID_][2];
            if (v3) {
                v0 = v4 = !_round_[_rID_];
            }
        }
    }
    if (!v0) {
        v5 = v6 = block.timestamp > _round_[_rID_][2];
        if (v6) {
            v5 = v7 = !(0xff & _round_[_rID_][0x3]);
        }
        if (v5) {
            _round_[_rID_][3] = 0x1 | ~0xff & _round_[_rID_][0x3];
            v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24 = 0x3439();
            MEM[0 + v8] = MEM[0 + v8] + 0xde0b6b3a7640000 * v9;
            MEM[32 + v8] = MEM[32 + v8] + v15;
            emit onReLoadAndDistribute(msg.sender, ~0x0 & (~0x0 & _plyr_[v15][0x1]), MEM[0 + v8], MEM[32 + v8], address(MEM[64 + v8]), ~0x0 & (~0x0 & MEM[96 + v8]), MEM[128 + v8], MEM[160 + v8], MEM[192 + v8], MEM[224 + v8]);
            return v17, v18, v19, v20, v21, v22, v23, v24, varg0;
        }
    } else {
        v25, v26, v27, v28 = 0x3aeb(v29, 7626, varg1, 14668, block.timestamp, _rID_, varg0);
        v30 = _SafeSub(v26, v25);
        STORAGE[3 + keccak256(_rID_, 8)] = v30;
        0x2ee8(varg3, v31, v31, v29, v31);
        goto 0x19020x38cf;
        assert(v28);
        return v30 / v28;
    }
    return;
}

function 0x3aeb(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5, uint256 varg6) private { 
    v0, v1, v2 = 0x4e0d(_plyr_[varg0][5]);
    v3 = _SafeAdd(_plyr_[v2][3], _plyr_[v2][2]);
    v4 = _SafeAdd(_plyr_[v2][4], v3);
    _round_[varg4][2] = v4;
    _round_[varg4][7] = v2;
    if (v4 > 0) {
        _plyr_[v2][2] = 0;
        _plyr_[v2][3] = 0;
        _plyr_[v2][4] = 0;
    }
    return v4, 0, 0, varg0;
}

function 0x3b72(uint256 varg0) private { 
    v0 = v1 = 0;
    v2 = v3 = varg0.length <= 32;
    if (varg0.length <= 32) {
        v2 = v4 = varg0.length > 0;
    }
    require(v2, Error('string must be between 1 and 32 characters'));
    assert(0 < varg0.length);
    v5 = v6 = 0x2000000000000000000000000000000000000000000000000000000000000000 != ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff & varg0[0] >> 248 << 248;
    if (v6) {
        assert(varg0.length - 1 < varg0.length);
        v5 = v7 = 0x2000000000000000000000000000000000000000000000000000000000000000 != ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff & varg0[varg0.length - 1] >> 248 << 248;
    }
    require(v5, Error('string cannot start or end with space'));
    assert(0 < varg0.length);
    if (0x3000000000000000000000000000000000000000000000000000000000000000 == ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff & varg0[0] >> 248 << 248) {
        assert(1 < varg0.length);
        require(0x7800000000000000000000000000000000000000000000000000000000000000 != ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff & varg0[1] >> 248 << 248, Error('string cannot start with 0x'));
        assert(1 < varg0.length);
        require(0x5800000000000000000000000000000000000000000000000000000000000000 != ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff & varg0[1] >> 248 << 248, Error('string cannot start with 0X'));
    }
    v8 = v9 = 0;
    while (v8 < varg0.length) {
        if (v8 < varg0.length) {
            break;
        }
        assert(v8 < varg0.length);
        v10 = v11 = ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff & varg0[v8] >> 248 << 248 > 0x4000000000000000000000000000000000000000000000000000000000000000;
        if (v11) {
            assert(v8 < varg0.length);
            v10 = v12 = ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff & varg0[v8] >> 248 << 248 < 0x5b00000000000000000000000000000000000000000000000000000000000000;
        }
        if (!v10) {
            assert(v8 < varg0.length);
            v13 = v14 = 0x2000000000000000000000000000000000000000000000000000000000000000 == ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff & varg0[v8] >> 248 << 248;
            if (0x2000000000000000000000000000000000000000000000000000000000000000 != ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff & varg0[v8] >> 248 << 248) {
                assert(v8 < varg0.length);
                v13 = v15 = ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff & varg0[v8] >> 248 << 248 > 0x6000000000000000000000000000000000000000000000000000000000000000;
                if (v15) {
                    assert(v8 < varg0.length);
                    v13 = v16 = ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff & varg0[v8] >> 248 << 248 < 0x7b00000000000000000000000000000000000000000000000000000000000000;
                }
            }
            if (!v13) {
                assert(v8 < varg0.length);
                v13 = v17 = ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff & varg0[v8] >> 248 << 248 > 0x2f00000000000000000000000000000000000000000000000000000000000000;
                if (v17) {
                    assert(v8 < varg0.length);
                    v13 = v18 = ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff & varg0[v8] >> 248 << 248 < 0x3a00000000000000000000000000000000000000000000000000000000000000;
                }
            }
            require(v13, Error('string contains invalid characters'));
            assert(v8 < varg0.length);
            if (0x2000000000000000000000000000000000000000000000000000000000000000 == ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff & varg0[v8] >> 248 << 248) {
                assert(1 + v8 < varg0.length);
                require(0x2000000000000000000000000000000000000000000000000000000000000000 != ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff & varg0[1 + v8] >> 248 << 248, Error('string cannot contain consecutive spaces'));
            }
            v19 = v20 = !v0;
            if (v20) {
                assert(v8 < varg0.length);
                v19 = v21 = ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff & varg0[v8] >> 248 << 248 < 0x3000000000000000000000000000000000000000000000000000000000000000;
                if (~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff & varg0[v8] >> 248 << 248 >= 0x3000000000000000000000000000000000000000000000000000000000000000) {
                    assert(v8 < varg0.length);
                    v19 = v22 = ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff & varg0[v8] >> 248 << 248 > 0x3900000000000000000000000000000000000000000000000000000000000000;
                }
            }
            if (v19) {
                v0 = v23 = 1;
            }
        } else {
            assert(v8 < varg0.length);
            assert(v8 < varg0.length);
            MEM8[varg0.data + v8] = (byte(~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff & 32 + (varg0[v8] >> 248 << 248 >> 248) << 248, 0x0)) & 0xFF;
            if (!v0) {
                v0 = v24 = 1;
            }
        }
        v8 = v8 + 1;
    }
    require(v0 == 1, Error('string cannot be only numbers'));
    return MEM[varg0.data];
}

function reLoadXname(bytes32 varg0, uint256 varg1, uint256 varg2) public nonPayable { 
    v0 = new struct(9);
    v0.word0 = 0;
    v0.word1 = 0;
    v0.word2 = 0;
    v0.word3 = 0;
    v0.word4 = 0;
    v0.word5 = 0;
    v0.word6 = 0;
    v0.word7 = 0;
    v0.word8 = 0;
    require(1 == _activated_, Error('its not ready yet.  check ?eta in discord'));
    require(!msg.sender.code.size, Error('sorry humans only'));
    require(varg2 >= 0x3b9aca00, Error('pocket lint: not a valid currency'));
    require(varg2 <= 0x152d02c7e14af6800000, Error('no vitalik, no'));
    v1 = v2 = !varg0;
    if (varg0) {
        v1 = varg0 == _plyr_[_pIDxAddr_[msg.sender]][1];
    }
    if (!v1) {
        v3 = v4 = _pIDxName_[varg0];
        if (v4 != _plyr_[_pIDxAddr_[msg.sender]][6]) {
            _plyr_[_pIDxAddr_[msg.sender]][6] = v4;
        }
    } else {
        v3 = v5 = _plyr_[_pIDxAddr_[msg.sender]][6];
    }
    v6 = 0x38aa(varg1);
    v7, v8, v9, v10, v11, v12, v13, v14, v15 = 0x38cf(v0, varg2, v6, v3);
}

function activate() public nonPayable { 
    require(msg.sender == _activate, Error('only admin can activate'));
    require(!_activated_, Error('SuperCard already activated'));
    _activated_ = 1;
    _rID_ = 1;
    MEM[0] = 1;
    MEM[32] = 11;
    stor_72c6bfb7988af3a1efa6568f02a999bc52252641c659d85961ca3d372b57d5d3 = stor_1 + block.timestamp - _getTimeLeft;
    stor_72c6bfb7988af3a1efa6568f02a999bc52252641c659d85961ca3d372b57d5d1 = 4637 + (stor_1 + block.timestamp);
}

function 0x4385(uint256 varg0, uint256 varg1) private { 
    if (varg1) {
        v0 = varg0 * varg1;
        assert(varg1);
        require(v0 / varg1 == varg0, Error('SafeMath mul failed'));
    } else {
        v0 = v1 = 0;
    }
    return v0;
}

function 0x43fc(uint256 varg0) private { 
    v0 = v1 = 0;
    varg0 = v2 = _plyrRnds_[v0][1];
    varg0 = v3 = _round_[v0][5];
    v4 = _round_[v0][1];
    MEM[v1] = varg0;
    MEM[32] = 11;
    varg0 = v5 = 0xde0b6b3a7640000;
    v0 = v6 = 17593;
    v0 = v7 = 17581;
    v0 = v8 = 17540;
    v9 = 0x4385(_round_[v0], _round_[v0][7]);
    assert(100);
    v10 = v11 = v9 / 100;
    while (1) {
        if (v10) {
            goto 0x43960x43fc;
        }
        v10 = v12 = 0;
        while (1) {
            goto {'0x4484', '0x44ad0x43fc', '0x44b9'};
            if (varg0) {
                break;
            }
            assert(varg0);
            v13 = _round_[varg0][8];
            v10 = v10 / varg0 + v13;
            require(v10 >= v13, Error('SafeMath add failed'));
        }
        continue;
        v10 *= varg0;
        assert(v10);
        require(v10 / v10 == varg0, Error('SafeMath mul failed'));
    }
    assert(varg0);
    return v10 / varg0, v0, varg0, v0;
}

function pIDxAddr_(address varg0) public nonPayable { 
    return _pIDxAddr_[varg0];
}

function 0x4477(uint256 varg0, uint256 varg1, uint256 varg2) private { 
    v0 = varg0 / varg1;
    if (v0) {
        v1 = varg2 * v0;
        assert(v0);
        require(v1 / v0 == varg2, Error('SafeMath mul failed'));
    } else {
        v1 = v2 = 0;
    }
    return v1;
}

function _SafeSub(uint256 varg0, uint256 varg1) private { 
    require(varg0 <= varg1, Error('SafeMath sub failed'));
    return varg1 - varg0;
}

function 0x452a(uint256 varg0) private { 
    v0 = _plyrRnds_[varg0][2];
    v1 = 0x4385(_plyrRnds_[varg0][1], _round_[varg0][8]);
    assert(0xde0b6b3a7640000);
    require(v0 <= v1 / 0xde0b6b3a7640000, Error('SafeMath sub failed'));
    return v1 / 0xde0b6b3a7640000 - v0, 0, varg0, v2;
}

function 0x4587(uint256 varg0) private { 
    v0, v1, v2, v3, v4 = 0x45a8(v5, 17813, 14499, 0, varg0, v5);
    require(v3 + v4 >= v4, Error('SafeMath add failed'));
    return v3 + v4, 7626, v0, v1, v2, v3, v4;
}

function 0x45a8(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5, uint256 varg6, uint256 varg7) private { 
    varg6 = v0 = 0;
    varg6 = v1 = 0x9502f90;
    varg6 = v2 = 17936;
    varg6 = v3 = 0x3b2a1d15167e7c5699bfde00000;
    varg6 = v4 = 7626;
    varg6 = v5 = 17931;
    v6 = v7 = 0xdac7055469777a6122ee4310dd6c14410500f2904840000000000;
    v8 = 0x4385(0xde0b6b3a7640000, varg0);
    varg6 = v9 = 0x4385(0x1027e72f1f1281308800000, v8);
    v6 = v10 = _SafeAdd(v7, v9);
    _round_[varg6][2] = v6;
    _round_[varg6][7] = varg6;
    return varg6, varg7, v11;
    require(v6 + varg6 >= varg6, Error('SafeMath add failed'));
    return v6 + varg6, varg6, varg6, varg6, varg6;
    varg6 = v12, varg6 = v13, varg6 = v14, varg6 = v15, varg6 = v16 = 0x4ea4(v6);
    varg6 = v17 = _SafeSub(varg6, varg6);
    require(varg6 <= varg6, Error('SafeMath sub failed'));
    return varg6 - varg6, varg6, varg6, varg6, varg6;
    assert(varg6);
    return varg6 / varg6, varg6, varg6, varg6, varg6;
    0x476c(v6, varg6, varg6, varg6);
    v18 = _SafeAdd(varg6, 10800);
    if (v6 >= v18) {
        v19 = _SafeAdd(varg6, 10800);
        _round_[varg6][2] = v19;
        return varg6, varg6, varg6, varg6, varg6;
    } else {
        _round_[varg6][2] = v6;
        return varg6, varg6, varg6, varg6, varg6;
    }
    _round_[varg6][7] = v6;
    v20 = _SafeAdd(MEM[varg6 + 224], varg6);
    MEM[varg6 + 224] = v20;
    MEM[varg6 + 256] = varg6;
    return varg6, varg6, varg6, varg7, v11;
}

function 0x4620() private { 
    v0 = 0x4ef7(0xde0b6b3a7640000);
    v1 = 0x4385(0xde0b6b3a7640000, v2);
    v3 = 0x4385(v1, 0x886c8f673070);
    assert(2);
    v4 = 0x4ef7(v2);
    v5 = 0x4385(v4, 0x4a817c8);
    require((v3 >> 1) + v5 >= v5, Error('SafeMath add failed'));
    return (v3 >> 1) + v5, v0, 0, v2;
}

function airDropTracker_() public nonPayable { 
    return _airDropTracker_;
}

function 0x46ec(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5, uint256 varg6, uint256 varg7, uint256 varg8, uint256 varg9, uint256 varg10) private { 
    varg7 = v0 = 0;
    varg7 = v1 = block.timestamp;
    v2 = v3 = v1 > _round_[varg0][2];
    if (v3) {
        v2 = v4 = !_round_[varg0];
    }
    if (!v2) {
        varg7 = v5 = _round_[varg0][2];
        varg7 = v6 = 18281;
        varg7 = v7 = 0x4477(varg1, 0xde0b6b3a7640000, 15);
    } else {
        varg7 = v8 = 18232;
        varg7 = v9 = 0x4477(varg1, 0xde0b6b3a7640000, 15);
    }
    varg7 = v10 = _SafeAdd(varg7, varg7);
    _round_[varg7][2] = varg7;
    _round_[varg7][7] = varg7;
    return varg7, varg10, v11;
    require(varg7 + varg7 >= varg7, Error('SafeMath add failed'));
    return varg7 + varg7, varg7, varg7;
    varg7 = v12, varg7 = v13, varg7 = v14, varg7 = v15, v16 = 0x4ea4(varg7);
    v17 = _SafeSub(varg7, varg7);
    assert(varg7);
    return v17 / varg7, varg7, varg7;
    0x476c(varg7, varg7, varg7, varg7);
    v18 = _SafeAdd(varg7, 10800);
    if (varg7 >= v18) {
        v19 = _SafeAdd(varg7, 10800);
        _round_[varg7][2] = v19;
        return varg7, varg7, varg7;
    } else {
        _round_[varg7][2] = varg7;
        return varg7, varg7, varg7;
    }
    _round_[varg7][7] = varg7;
    v20 = _SafeAdd(MEM[varg7 + 224], varg7);
    MEM[varg7 + 224] = v20;
    MEM[varg7 + 256] = varg7;
    return varg7, varg7, varg7;
}

function 0x476c(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3) private { 
    v0 = _SafeAdd(varg1, 10800);
    if (varg0 >= v0) {
        v1 = _SafeAdd(varg1, 10800);
        _round_[varg2][2] = v1;
        return ;
    } else {
        _round_[varg2][2] = varg0;
        return ;
    }
}

function round_(uint256 varg0) public nonPayable { 
    return _round_[varg0], _round_[varg0][1], _round_[varg0][2], _round_[varg0][0x3] & 0xff, _round_[varg0][4], _round_[varg0][5], _round_[varg0][6], _round_[varg0][7], _round_[varg0][8], _round_[varg0][9], _round_[varg0][10], _round_[varg0][11];
}

function 0x47c8(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4) private { 
    v0 = v1 = 0;
    v0 = v2 = 18745;
    v0 = v3 = block.number;
    v0 = v4 = 14305;
    v5 = v6 = v6.data;
    v7 = v8 = 32 + MEM[64];
    while (v9 >= 32) {
        MEM[v5] = MEM[v7];
        v9 = v9 + ~31;
        v5 += 32;
        v7 += 32;
    }
    MEM[v5] = MEM[v5] & ~0 + 256 ** (32 - v9) | MEM[v7] & ~(~0 + 256 ** (32 - v9));
    assert(block.timestamp);
    v0 = v10 = keccak256(msg.sender) / block.timestamp;
    v0 = v11 = 14305;
    v0 = v12 = block.gaslimit;
    v0 = v13 = 14305;
    v14 = v15 = v15.data;
    v16 = v17 = 32 + MEM[64];
    while (v18 >= 32) {
        MEM[v14] = MEM[v16];
        v18 = v18 + ~31;
        v14 += 32;
        v16 += 32;
    }
    MEM[v14] = MEM[v14] & ~0 + 256 ** (32 - v18) | MEM[v16] & ~(~0 + 256 ** (32 - v18));
    assert(block.timestamp);
    v19 = v20 = keccak256(address(block.coinbase)) / block.timestamp;
    v0 = v21 = _SafeAdd(block.difficulty, block.timestamp);
    v19 = v22 = _SafeAdd(v20, v21);
    _round_[v0][2] = v19;
    _round_[v0][7] = v0;
    return v0, varg4, v0;
    require(v19 + v0 >= v0, Error('SafeMath add failed'));
    return v19 + v0, v0, v0, v0, v0, v0, v0;
    v0 = v23, v0 = v24, v0 = v25, v0 = v26, v27 = 0x4ea4(v19);
    v28 = _SafeSub(v0, v0);
    assert(v0);
    return v28 / v0, v0, v0, v0, v0, v0, v0;
    0x476c(v19, v0, v0, v0);
    v29 = _SafeAdd(v0, 10800);
    if (v19 >= v29) {
        v30 = _SafeAdd(v0, 10800);
        _round_[v0][2] = v30;
        return v0, v0, v0, v0, v0, v0, v0;
    } else {
        _round_[v0][2] = v19;
        return v0, v0, v0, v0, v0, v0, v0;
    }
    _round_[v0][7] = v19;
    v31 = _SafeAdd(MEM[v0 + 224], v0);
    MEM[v0 + 224] = v31;
    MEM[v0 + 256] = v0;
    return v0, v0, v0, varg4, v0;
}

function 0x49df(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3) private { 
    v0 = new struct(9);
    v0.word0 = 0;
    v0.word1 = 0;
    v0.word2 = 0;
    v0.word3 = 0;
    v0.word4 = 0;
    v0.word5 = 0;
    v0.word6 = 0;
    v0.word7 = 0;
    v0.word8 = 0;
    v1 = varg3 / 50;
    v2 = v3 = 0;
    v2 = v4 = _SafeAdd(v1, v1);
    v5 = _activate.call().value(v4).gas(msg.gas);
    if (!v5) {
        v2 = v6 = 0;
    }
    v7 = v8 = 0;
    v9 = _plyr_[varg2][6];
    v10 = _plyr_[varg2][6];
    v11 = varg3 / 10;
    v12 = varg3 * 3 / 100;
    v13 = varg3 / 100;
    v14 = varg2 == v15;
    v16 = v17 = varg2 != v15;
    if (varg2 != v15) {
        v16 = _plyr_[varg2][1];
    }
    if (!v16) {
        v7 = v18 = _SafeAdd(v11, v8);
    } else {
        v19 = _SafeAdd(_plyr_[varg2][4], v11);
        _plyr_[varg2][4] = v19;
    }
    v20 = v21 = v9 != v15;
    if (v21) {
        v20 = v22 = v9 != varg2;
    }
    if (v20) {
        v20 = _plyr_[v9][1];
    }
    if (!v20) {
        v7 = v23 = _SafeAdd(v12, v7);
    } else {
        v24 = _SafeAdd(_plyr_[v9][4], v12);
        _plyr_[v9][4] = v24;
    }
    v25 = v26 = v10 != v15;
    if (v26) {
        v25 = v27 = v10 != varg2;
    }
    if (v25) {
        v25 = _plyr_[v10][1];
    }
    if (!v25) {
        v7 = v28 = _SafeAdd(v13, v7);
    } else {
        v29 = _SafeAdd(_plyr_[v10][4], v13);
        _plyr_[v10][4] = v29;
    }
    v30 = _SafeAdd(v7, v2);
    v31 = 0x4385(_fees_[varg1][1], varg3);
    assert(100);
    require(v31 / 100 + v30 >= v30, Error('SafeMath add failed'));
    return v31 / 100 + v30, v3, v7, v30, v2, v1, v0, varg0, varg1, varg2, varg3;
}

function 0x4e0d(uint256 varg0) private { 
    v0, v1, v2, v3 = 0x452a(varg0);
    if (v0 > 0) {
        v4 = _SafeAdd(_plyr_[v3][3], v0);
        _plyr_[v3][3] = v4;
        v5 = _SafeAdd(_plyrRnds_[v3][2], v0);
        _plyrRnds_[v3][2] = v5;
    }
    return 0, varg0, v6;
}

function 0x4ea4(uint256 varg0) private { 
    v0 = _SafeAdd(1, varg0);
    assert(2);
    if (v0 >> 1 >= varg0) {
        return varg0;
    } else {
        assert(v0 >> 1);
        v1 = varg0 / (v0 >> 1);
        require((v0 >> 1) + v1 >= v1, Error('SafeMath add failed'));
        return (v0 >> 1) + v1, 2, v0 >> 1, v0 >> 1, varg0;
    }
}

function 0x4ef7(uint256 varg0) private { 
    v0 = 0x4385(varg0, varg0);
    return v0;
}

function plyrNames_(uint256 varg0, bytes32 varg1) public nonPayable { 
    return 0xff & _plyrNames_[varg1];
}

function 0x50b5(uint256 varg0, uint256 varg1, uint256 varg2) private { 
    v0 = _round_[v1][5];
    v2 = 0x4385(0xde0b6b3a7640000, varg1);
    assert(v0);
    v3 = _SafeAdd(_round_[v1][8], v2 / v0);
    _round_[v1][8] = v3;
    v4 = 0x4385(varg0, v2 / v0);
    assert(0xde0b6b3a7640000);
    v5 = 0x4385(varg0, _round_[varg2][8]);
    assert(0xde0b6b3a7640000);
    require(v4 / 0xde0b6b3a7640000 <= v5 / 0xde0b6b3a7640000, Error('SafeMath sub failed'));
    return v5 / 0xde0b6b3a7640000 - v4 / 0xde0b6b3a7640000, _plyrRnds_[varg2][2], 20891, v4 / 0xde0b6b3a7640000, v2 / v0, 0, varg0, varg1, varg2, v1;
}

function fees_(uint256 varg0) public nonPayable { 
    return _fees_[varg0], _fees_[varg0][1];
}

function pIDxName_(bytes32 varg0) public nonPayable { 
    return _pIDxName_[varg0];
}

function reLoadXid(uint256 varg0, uint256 varg1, uint256 varg2) public nonPayable { 
    v0 = new struct(9);
    v0.word0 = 0;
    v0.word1 = 0;
    v0.word2 = 0;
    v0.word3 = 0;
    v0.word4 = 0;
    v0.word5 = 0;
    v0.word6 = 0;
    v0.word7 = 0;
    v0.word8 = 0;
    require(1 == _activated_, Error('its not ready yet.  check ?eta in discord'));
    require(!msg.sender.code.size, Error('sorry humans only'));
    require(varg2 >= 0x3b9aca00, Error('pocket lint: not a valid currency'));
    require(varg2 <= 0x152d02c7e14af6800000, Error('no vitalik, no'));
    v1 = v2 = !varg0;
    if (varg0) {
        v1 = varg0 == _pIDxAddr_[msg.sender];
    }
    if (!v1) {
        if (varg0 != _plyr_[_pIDxAddr_[msg.sender]][6]) {
            _plyr_[_pIDxAddr_[msg.sender]][6] = varg0;
        }
    } else {
        v3 = v4 = _plyr_[_pIDxAddr_[msg.sender]][6];
    }
    v5 = 0x38aa(varg1);
    v6, v7, v8, v9, v10, v11, v12, v13, v14 = 0x38cf(v0, varg2, v5, v3);
}

function withdraw() public nonPayable { 
    v0 = new struct(9);
    v0.word0 = 0;
    v0.word1 = 0;
    v0.word2 = 0;
    v0.word3 = 0;
    v0.word4 = 0;
    v0.word5 = 0;
    v0.word6 = 0;
    v0.word7 = 0;
    v0.word8 = 0;
    require(1 == _activated_, Error('its not ready yet.  check ?eta in discord'));
    require(!msg.sender.code.size, Error('sorry humans only'));
    v1 = v2 = block.timestamp > _round_[msg.sender][2];
    if (v2) {
        v1 = v3 = !(0xff & _round_[_rID_][0x3]);
    }
    if (v1) {
        v1 = _round_[_rID_];
    }
    if (!v1) {
        v4, v5, v6, v7 = 0x3aeb(_pIDxAddr_[msg.sender], 6229, msg.sender.code.size, msg.sender, v0, 0, _pIDxAddr_[msg.sender]);
        if (v4 > 0) {
            v8 = address(STORAGE[keccak256(_rID_, 0x8)]).call().value(v4).gas(2300 * !v4);
            require(v8); // checks call status, propagates error data on error
        }
        emit onWithdraw(v9, msg.sender, STORAGE[1 + keccak256(_rID_, 8)], v4);
    } else {
        _round_[_rID_][3] = 0x1 | ~0xff & _round_[_rID_][0x3];
        v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26 = 0x3439();
        v27, v28, v29, v30 = 0x3aeb(v15, 5851, v11, v12, v10, v14, v15);
        if (v27 > 0) {
            v31 = address(_plyr_[v18]).call().value(v27).gas(2300 * !v27);
            require(v31); // checks call status, propagates error data on error
        }
        MEM[0 + v30] = MEM[0 + v30] + 0xde0b6b3a7640000 * v19;
        MEM[32 + v30] = MEM[32 + v30] + v18;
        emit 0xbd0dba8ab932212fa78150cdb7b0275da72e255875967b5cad11464cf71bedc(msg.sender, ~0x0 & (~0x0 & _plyr_[v18][0x1]), v27, MEM[0 + v30], MEM[32 + v30], address(MEM[64 + v30]), ~0x0 & (~0x0 & MEM[96 + v30]), MEM[128 + v30], MEM[160 + v30], MEM[192 + v30], MEM[224 + v30]);
    }
}

function registerNameXaddr(string varg0, address varg1, bool varg2) public payable { 
    v0 = new bytes[](varg0.length);
    v1 = msg.data.length;
    CALLDATACOPY(v0.data, 36 + varg0, varg0.length);
    require(!msg.sender.code.size, Error('sorry humans only'));
    v2 = 0x3b72(v0);
    require(0xb838c100eb1a1d08b215fbbcc06698e9c181358c.code.size);
    v3, v4, v5 = 0xb838c100eb1a1d08b215fbbcc06698e9c181358c.registerNameXaddrFromDapp(msg.sender, v2, varg1, varg2).value(msg.value).gas(msg.gas);
    require(v3); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 64);
    emit onNewName(_pIDxAddr_[msg.sender], msg.sender, v2, v4, v5, address(_pIDxAddr_[v5]), _pIDxAddr_[v5][1], msg.value, block.timestamp);
}

function receivePlayerInfo(uint256 varg0, address varg1, bytes32 varg2, uint256 varg3) public nonPayable { 
    require(0xb838c100eb1a1d08b215fbbcc06698e9c181358c == msg.sender, Error('your not playerNames contract... hmmm..'));
    if (varg0 != _pIDxAddr_[varg1]) {
        _pIDxAddr_[varg1] = varg0;
    }
    if (varg0 != _pIDxName_[varg2]) {
        _pIDxName_[varg2] = varg0;
    }
    if (address(_plyr_[varg0]) != varg1) {
        _plyr_[varg0] = varg1 | ~0xffffffffffffffffffffffffffffffffffffffff & _plyr_[varg0];
    }
    if (varg2 != _plyr_[varg0][1]) {
        _plyr_[varg0][1] = varg2;
    }
    if (varg3 != _plyr_[varg0][6]) {
        _plyr_[varg0][6] = varg3;
    }
    if (!(0xff & _plyrNames_[varg2])) {
        _plyrNames_[varg2] = 0x1 | ~0xff & _plyrNames_[varg2];
    }
}

function rndTmEth_(uint256 varg0, uint256 varg1) public nonPayable { 
    return _rndTmEth_[varg1];
}

function rID_() public nonPayable { 
    return _rID_;
}

function getPlayerVaults(uint256 varg0) public nonPayable { 
    v0 = v1 = block.timestamp > _round_[_rID_][2];
    if (v1) {
        v0 = v2 = !(0xff & _round_[_rID_][0x3]);
    }
    if (v0) {
        v0 = _round_[_rID_];
    }
    if (!v0) {
        v3 = _plyr_[varg0][2];
        v4 = v5, v6 = v7, v8 = v9, v10 = 0x452a(_plyr_[varg0][5]);
    } else {
        if (varg0 != _round_[_rID_]) {
            v11 = _plyr_[varg0][2];
            v12 = _plyrRnds_[_rID_][2];
            v8 = v13 = 7626;
            v14 = v15, v16 = v17, v18 = v19, v6 = v20 = 0x43fc(_rID_);
        } else {
            v21 = 0x4385(48, _round_[_rID_][7]);
            assert(100);
            require(v21 / 100 + _plyr_[varg0][2] >= _plyr_[varg0][2], Error('SafeMath add failed'));
            v22 = _plyrRnds_[_rID_][2];
            v8 = v23 = 7626;
            v14 = v24, v16 = v25, v18 = v26, v6 = v27 = 0x43fc(_rID_);
        }
        v4 = _SafeSub(v16, v14);
    }
    v28 = _SafeAdd(v4, _plyr_[_rID_][3]);
    return v8, v28, _plyr_[_rID_][4];
}

function registerNameXname(string varg0, bytes32 varg1, bool varg2) public payable { 
    v0 = new bytes[](varg0.length);
    v1 = msg.data.length;
    CALLDATACOPY(v0.data, 36 + varg0, varg0.length);
    require(!msg.sender.code.size, Error('sorry humans only'));
    v2 = 0x3b72(v0);
    require(0xb838c100eb1a1d08b215fbbcc06698e9c181358c.code.size);
    v3, v4, v5 = 0xb838c100eb1a1d08b215fbbcc06698e9c181358c.registerNameXnameFromDapp(msg.sender, v2, varg1, varg2).value(msg.value).gas(msg.gas);
    require(v3); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 64);
    emit onNewName(_pIDxAddr_[msg.sender], msg.sender, v2, v4, v5, address(_pIDxAddr_[v5]), _pIDxAddr_[v5][1], msg.value, block.timestamp);
}

function getCurrentRoundInfo() public nonPayable { 
    v0 = _rID_;
    return _round_[v0][9], v0, _round_[v0][5], _round_[v0][2], _round_[v0][4], _round_[v0][7], _round_[v0][1] + 10 * _round_[v0][0], address(_round_[_round_[v0][0]][0]), _round_[_round_[_round_[v0][0]][0]][1], _rndTmEth_[0], _rndTmEth_[1], _rndTmEth_[2], _rndTmEth_[3], _airDropTracker_ + 1000 * _airDropPot_;
}

function reLoadXaddr(address varg0, uint256 varg1, uint256 varg2) public nonPayable { 
    v0 = new struct(9);
    v0.word0 = 0;
    v0.word1 = 0;
    v0.word2 = 0;
    v0.word3 = 0;
    v0.word4 = 0;
    v0.word5 = 0;
    v0.word6 = 0;
    v0.word7 = 0;
    v0.word8 = 0;
    require(1 == _activated_, Error('its not ready yet.  check ?eta in discord'));
    require(!msg.sender.code.size, Error('sorry humans only'));
    require(varg2 >= 0x3b9aca00, Error('pocket lint: not a valid currency'));
    require(varg2 <= 0x152d02c7e14af6800000, Error('no vitalik, no'));
    v1 = v2 = !varg0;
    if (varg0) {
        v1 = msg.sender == varg0;
    }
    if (!v1) {
        v3 = v4 = _pIDxAddr_[varg0];
        if (v4 != _pIDxAddr_[varg0][6]) {
            _plyr_[_pIDxAddr_[msg.sender]][6] = v4;
            v5 = v6 = 0x38aa(varg1);
        }
    } else {
        v3 = v7 = _plyr_[_pIDxAddr_[msg.sender]][6];
    }
    v5 = v8 = 0x38aa(varg1);
    v9, v10, v11, v12, v13, v14, v15, v16, v17 = 0x38cf(v0, varg2, v5, v3);
}

function buyXid(uint256 varg0, uint256 varg1) public payable { 
    v0 = new struct(9);
    v0.word0 = 0;
    v0.word1 = 0;
    v0.word2 = 0;
    v0.word3 = 0;
    v0.word4 = 0;
    v0.word5 = 0;
    v0.word6 = 0;
    v0.word7 = 0;
    v0.word8 = 0;
    require(1 == _activated_, Error('its not ready yet.  check ?eta in discord'));
    require(!msg.sender.code.size, Error('sorry humans only'));
    require(msg.value >= 0x3b9aca00, Error('pocket lint: not a valid currency'));
    require(msg.value <= 0x152d02c7e14af6800000, Error('no vitalik, no'));
    v1 = new struct(9);
    v1.word0 = 0;
    v1.word1 = 0;
    v1.word2 = 0;
    v1.word3 = 0;
    v1.word4 = 0;
    v1.word5 = 0;
    v1.word6 = 0;
    v1.word7 = 0;
    v1.word8 = 0;
    if (!_pIDxAddr_[msg.sender]) {
        require(0xb838c100eb1a1d08b215fbbcc06698e9c181358c.code.size);
        v2, v3 = 0xb838c100eb1a1d08b215fbbcc06698e9c181358c.getPlayerID(msg.sender).gas(msg.gas);
        require(v2); // checks call status, propagates error data on error
        require(RETURNDATASIZE() >= 32);
        require(0xb838c100eb1a1d08b215fbbcc06698e9c181358c.code.size);
        v4, v5 = 0xb838c100eb1a1d08b215fbbcc06698e9c181358c.getPlayerName(v3).gas(msg.gas);
        require(v4); // checks call status, propagates error data on error
        require(RETURNDATASIZE() >= 32);
        require(0xb838c100eb1a1d08b215fbbcc06698e9c181358c.code.size);
        v6, v7 = 0xb838c100eb1a1d08b215fbbcc06698e9c181358c.getPlayerLAff(v3).gas(msg.gas);
        require(v6); // checks call status, propagates error data on error
        require(RETURNDATASIZE() >= 32);
        _pIDxAddr_[msg.sender] = v3;
        _pIDxAddr_[msg.sender] = msg.sender | ~0xffffffffffffffffffffffffffffffffffffffff & _pIDxAddr_[msg.sender];
        if (v5) {
            _pIDxName_[v5] = v3;
            _plyr_[v5][1] = v5;
            _plyrNames_[v5] = 0x1 | ~0xff & _plyrNames_[v5];
        }
        v8 = v9 = v7;
        if (v7) {
            v8 = v7 != v3;
        }
        if (v8) {
            _plyr_[v3][6] = v7;
        }
        v0.word0 += 1;
    }
    v10 = v11 = !varg0;
    if (varg0) {
        v10 = varg0 == _pIDxAddr_[msg.sender];
    }
    if (!v10) {
        if (varg0 != _plyr_[_pIDxAddr_[msg.sender]][6]) {
            _plyr_[_pIDxAddr_[msg.sender]][6] = varg0;
        }
    } else {
        v12 = _plyr_[_pIDxAddr_[msg.sender]][6];
    }
    v13 = 0x38aa(varg1);
    0xc69();
}

function receivePlayerNameList(uint256 varg0, bytes32 varg1) public nonPayable { 
    require(0xb838c100eb1a1d08b215fbbcc06698e9c181358c == msg.sender, Error('your not playerNames contract... hmmm..'));
    if (!(0xff & _plyrNames_[varg1])) {
        _plyrNames_[varg1] = 0x1 | ~0xff & _plyrNames_[varg1];
    }
}

function registerNameXID(string varg0, uint256 varg1, bool varg2) public payable { 
    v0 = new bytes[](varg0.length);
    v1 = msg.data.length;
    CALLDATACOPY(v0.data, 36 + varg0, varg0.length);
    require(!msg.sender.code.size, Error('sorry humans only'));
    v2 = 0x3b72(v0);
    require(0xb838c100eb1a1d08b215fbbcc06698e9c181358c.code.size);
    v3, v4, v5 = 0xb838c100eb1a1d08b215fbbcc06698e9c181358c.registerNameXIDFromDapp(msg.sender, v2, varg1, varg2).value(msg.value).gas(msg.gas);
    require(v3); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 64);
    emit onNewName(_pIDxAddr_[msg.sender], msg.sender, v2, v4, v5, address(_pIDxAddr_[v5]), _pIDxAddr_[v5][1], msg.value, block.timestamp);
}

function buyXaddr(address varg0, uint256 varg1) public payable { 
    v0 = new struct(9);
    v0.word0 = 0;
    v0.word1 = 0;
    v0.word2 = 0;
    v0.word3 = 0;
    v0.word4 = 0;
    v0.word5 = 0;
    v0.word6 = 0;
    v0.word7 = 0;
    v0.word8 = 0;
    require(1 == _activated_, Error('its not ready yet.  check ?eta in discord'));
    require(!msg.sender.code.size, Error('sorry humans only'));
    require(msg.value >= 0x3b9aca00, Error('pocket lint: not a valid currency'));
    require(msg.value <= 0x152d02c7e14af6800000, Error('no vitalik, no'));
    v1 = new struct(9);
    v1.word0 = 0;
    v1.word1 = 0;
    v1.word2 = 0;
    v1.word3 = 0;
    v1.word4 = 0;
    v1.word5 = 0;
    v1.word6 = 0;
    v1.word7 = 0;
    v1.word8 = 0;
    if (!_pIDxAddr_[msg.sender]) {
        require(0xb838c100eb1a1d08b215fbbcc06698e9c181358c.code.size);
        v2, v3 = 0xb838c100eb1a1d08b215fbbcc06698e9c181358c.getPlayerID(msg.sender).gas(msg.gas);
        require(v2); // checks call status, propagates error data on error
        require(RETURNDATASIZE() >= 32);
        require(0xb838c100eb1a1d08b215fbbcc06698e9c181358c.code.size);
        v4, v5 = 0xb838c100eb1a1d08b215fbbcc06698e9c181358c.getPlayerName(v3).gas(msg.gas);
        require(v4); // checks call status, propagates error data on error
        require(RETURNDATASIZE() >= 32);
        require(0xb838c100eb1a1d08b215fbbcc06698e9c181358c.code.size);
        v6, v7 = 0xb838c100eb1a1d08b215fbbcc06698e9c181358c.getPlayerLAff(v3).gas(msg.gas);
        require(v6); // checks call status, propagates error data on error
        require(RETURNDATASIZE() >= 32);
        _pIDxAddr_[msg.sender] = v3;
        _pIDxAddr_[msg.sender] = msg.sender | ~0xffffffffffffffffffffffffffffffffffffffff & _pIDxAddr_[msg.sender];
        if (v5) {
            _pIDxName_[v5] = v3;
            _plyr_[v5][1] = v5;
            _plyrNames_[v5] = 0x1 | ~0xff & _plyrNames_[v5];
        }
        v8 = v9 = v7;
        if (v7) {
            v8 = v7 != v3;
        }
        if (v8) {
            _plyr_[v3][6] = v7;
        }
        v0.word0 += 1;
    }
    v10 = v11 = !varg0;
    if (varg0) {
        v10 = msg.sender == varg0;
    }
    if (!v10) {
        if (_pIDxAddr_[varg0] != _pIDxAddr_[varg0][6]) {
            _plyr_[_pIDxAddr_[msg.sender]][6] = _pIDxAddr_[varg0];
        }
    } else {
        v12 = _plyr_[_pIDxAddr_[msg.sender]][6];
    }
    v13 = 0x38aa(varg1);
    0xc69();
}

function plyrRnds_(uint256 varg0, uint256 varg1) public nonPayable { 
    return _plyrRnds_[varg1], _plyrRnds_[varg1][1], _plyrRnds_[varg1][2], _plyrRnds_[varg1][3];
}

function buyXname(bytes32 varg0, uint256 varg1) public payable { 
    v0 = new struct(9);
    v0.word0 = 0;
    v0.word1 = 0;
    v0.word2 = 0;
    v0.word3 = 0;
    v0.word4 = 0;
    v0.word5 = 0;
    v0.word6 = 0;
    v0.word7 = 0;
    v0.word8 = 0;
    require(1 == _activated_, Error('its not ready yet.  check ?eta in discord'));
    require(!msg.sender.code.size, Error('sorry humans only'));
    require(msg.value >= 0x3b9aca00, Error('pocket lint: not a valid currency'));
    require(msg.value <= 0x152d02c7e14af6800000, Error('no vitalik, no'));
    v1 = new struct(9);
    v1.word0 = 0;
    v1.word1 = 0;
    v1.word2 = 0;
    v1.word3 = 0;
    v1.word4 = 0;
    v1.word5 = 0;
    v1.word6 = 0;
    v1.word7 = 0;
    v1.word8 = 0;
    if (!_pIDxAddr_[msg.sender]) {
        require(0xb838c100eb1a1d08b215fbbcc06698e9c181358c.code.size);
        v2, v3 = 0xb838c100eb1a1d08b215fbbcc06698e9c181358c.getPlayerID(msg.sender).gas(msg.gas);
        require(v2); // checks call status, propagates error data on error
        require(RETURNDATASIZE() >= 32);
        require(0xb838c100eb1a1d08b215fbbcc06698e9c181358c.code.size);
        v4, v5 = 0xb838c100eb1a1d08b215fbbcc06698e9c181358c.getPlayerName(v3).gas(msg.gas);
        require(v4); // checks call status, propagates error data on error
        require(RETURNDATASIZE() >= 32);
        require(0xb838c100eb1a1d08b215fbbcc06698e9c181358c.code.size);
        v6, v7 = 0xb838c100eb1a1d08b215fbbcc06698e9c181358c.getPlayerLAff(v3).gas(msg.gas);
        require(v6); // checks call status, propagates error data on error
        require(RETURNDATASIZE() >= 32);
        _pIDxAddr_[msg.sender] = v3;
        _pIDxAddr_[msg.sender] = msg.sender | ~0xffffffffffffffffffffffffffffffffffffffff & _pIDxAddr_[msg.sender];
        if (v5) {
            _pIDxName_[v5] = v3;
            _plyr_[v5][1] = v5;
            _plyrNames_[v5] = 0x1 | ~0xff & _plyrNames_[v5];
        }
        v8 = v9 = v7;
        if (v7) {
            v8 = v7 != v3;
        }
        if (v8) {
            _plyr_[v3][6] = v7;
        }
        v0.word0 += 1;
    }
    v10 = v11 = !varg0;
    if (varg0) {
        v10 = varg0 == _plyr_[_pIDxAddr_[msg.sender]][1];
    }
    if (!v10) {
        if (_pIDxName_[varg0] != _plyr_[_pIDxAddr_[msg.sender]][6]) {
            _plyr_[_pIDxAddr_[msg.sender]][6] = _pIDxName_[varg0];
            v12 = 0x38aa(varg1);
        }
    } else {
        v13 = _plyr_[_pIDxAddr_[msg.sender]][6];
    }
    v14 = 0x38aa(varg1);
    0xc69();
}

function potSplit_(uint256 varg0) public nonPayable { 
    return _potSplit_[varg0], _potSplit_[varg0][1];
}

function getTimeLeft() public nonPayable { 
    if (block.timestamp >= _round_[_rID_][2]) {
        v0 = v1 = 0;
    } else {
        if (block.timestamp <= _round_[_rID_][4] + _getTimeLeft) {
            v0 = v2 = _SafeSub(block.timestamp, _getTimeLeft + _round_[_rID_][4]);
        } else {
            v0 = v3 = _SafeSub(block.timestamp, _round_[_rID_][2]);
        }
        goto 0xf630x2b57B0x894;
    }
    return v0;
}

function calcKeysReceived(uint256 varg0, uint256 varg1) public nonPayable { 
    v0 = v1 = block.timestamp > _round_[varg0][4] + _getTimeLeft;
    if (v1) {
        v0 = v2 = block.timestamp <= _round_[varg0][2];
        if (block.timestamp > _round_[varg0][2]) {
            v0 = v3 = block.timestamp > _round_[varg0][2];
            if (v3) {
                v0 = !_round_[varg0];
            }
        }
    }
    if (!v0) {
        v4 = v5, v6, v7, v8, v9 = 0x45a8(varg1, 11383, block.timestamp, 0, varg1, varg0);
    } else {
        v4 = v10, v11, v12, v13, v14, v15, v16 = 0x4587(varg1);
    }
    return v4;
}

function iWantXKeys(uint256 varg0) public nonPayable { 
    v0 = v1 = _rID_;
    v2 = v3 = 0;
    v4 = v5 = block.timestamp;
    v6 = v7 = v5 > _round_[v1][4] + _getTimeLeft;
    if (v7) {
        v6 = v8 = v5 <= _round_[v1][2];
        if (v5 > _round_[v1][2]) {
            v6 = v9 = v5 > _round_[v1][2];
            if (v9) {
                v6 = !_round_[v1];
            }
        }
    }
    if (!v6) {
        v10 = v11, v12, v13, v14 = 0x4620();
    } else {
        v15 = _SafeAdd(varg0, _round_[v1][5]);
        v10 = v16, v17, v18, v19, v20, v4 = v21, v0 = v22, v2 = v23 = 0x387d(varg0);
    }
    return v10;
}

function activated_() public nonPayable { 
    return _activated_;
}

function airDropPot_() public nonPayable { 
    return _airDropPot_;
}

function plyr_(uint256 varg0) public nonPayable { 
    return address(_plyr_[varg0]), _plyr_[varg0][1], _plyr_[varg0][2], _plyr_[varg0][3], _plyr_[varg0][4], _plyr_[varg0][5], _plyr_[varg0][6];
}

function potSwap() public payable { 
    v0 = _SafeAdd(msg.value, _round_[1 + _rID_][7]);
    _round_[1 + _rID_][7] = v0;
    emit onPotSwapDeposit(1 + _rID_, msg.value);
}

function getPlayerInfoByAddress(address varg0) public nonPayable { 
    v0 = _pIDxAddr_[varg0];
    v1 = _pIDxAddr_[v0][1];
    MEM[0] = v0;
    MEM[32] = 8;
    v2, v3, v4, v5 = 0x452a(_pIDxAddr_[v0][5]);
    v6 = _SafeAdd(v2, _plyr_[_pIDxAddr_[v0][2]][3]);
    return 11945, 11915, v5, v4, v6, _plyr_[_pIDxAddr_[v0][2]][4], _plyrRnds_[_pIDxAddr_[v0][2]];
}

function 0xc69() private { 
    v0 = v1 = block.timestamp > _getTimeLeft + _round_[_rID_][4];
    if (v1) {
        v0 = v2 = block.timestamp <= _round_[_rID_][2];
        if (block.timestamp > _round_[_rID_][2]) {
            v0 = v3 = block.timestamp > _round_[_rID_][2];
            if (v3) {
                v0 = v4 = !_round_[_rID_];
            }
        }
    }
    if (!v0) {
        v5 = v6 = block.timestamp > _round_[_rID_][2];
        if (v6) {
            v5 = v7 = !(0xff & _round_[_rID_][0x3]);
        }
        if (v5) {
            _round_[_rID_][3] = 0x1 | ~0xff & _round_[_rID_][0x3];
            v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24 = 0x3439();
            MEM[0 + v8] = MEM[0 + v8] + 0xde0b6b3a7640000 * v9;
            MEM[32 + v8] = MEM[32 + v8] + v14;
            emit onBuyAndDistribute(msg.sender, ~0x0 & (~0x0 & _plyr_[v14][0x1]), msg.value, MEM[0 + v8], MEM[32 + v8], address(MEM[64 + v8]), ~0x0 & (~0x0 & MEM[96 + v8]), MEM[128 + v8], MEM[160 + v8], MEM[192 + v8], MEM[224 + v8]);
        }
        v25 = _SafeAdd(msg.value, _plyr_[v14][3]);
        _plyr_[v14][3] = v25;
    } else {
        0x2ee8(v26, v27, v27, msg.value, v27);
    }
    return ;
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__(bytes4 function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length >= 4) {
        v0 = uint32(function_selector >> 224);
        if (v0 == 0x18a25e8) {
            getBuyPrice();
        } else {
            if (0x6fdde03 != v0) {
                if (0x79ce327 == v0) {
                    reLoadXname(bytes32,uint256,uint256);
                } else if (0xf15f4c0 == v0) {
                    activate();
                } else if (0x10f01eba == v0) {
                    pIDxAddr_(address);
                } else if (0x11a09ae7 == v0) {
                    airDropTracker_();
                } else if (0x24c33d33 == v0) {
                    round_(uint256);
                } else if (0x2660316e == v0) {
                    plyrNames_(uint256,bytes32);
                } else if (0x2ce21999 == v0) {
                    fees_(uint256);
                } else if (0x2e19ebdc == v0) {
                    pIDxName_(bytes32);
                } else if (0x349cdcac == v0) {
                    reLoadXid(uint256,uint256,uint256);
                } else if (0x3ccfd60b == v0) {
                    withdraw();
                } else if (0x3ddd4698 == v0) {
                    registerNameXaddr(string,address,bool);
                } else if (0x49cc635d == v0) {
                    receivePlayerInfo(uint256,address,bytes32,uint256);
                } else if (0x5893d481 == v0) {
                    rndTmEth_(uint256,uint256);
                } else if (0x624ae5c0 == v0) {
                    rID_();
                } else if (0x63066434 == v0) {
                    getPlayerVaults(uint256);
                } else if (0x685ffd83 == v0) {
                    registerNameXname(string,bytes32,bool);
                } else if (0x747dff42 == v0) {
                    getCurrentRoundInfo();
                } else if (0x82bfc739 == v0) {
                    reLoadXaddr(address,uint256,uint256);
                } else if (0x8f38f309 == v0) {
                    buyXid(uint256,uint256);
                } else if (0x8f7140ea == v0) {
                    receivePlayerNameList(uint256,bytes32);
                } else if (0x921dec21 == v0) {
                    registerNameXID(string,uint256,bool);
                } else if (0x95d89b41 != v0) {
                    if (0x98a0871d == v0) {
                        buyXaddr(address,uint256);
                    } else if (0xa2bccae9 == v0) {
                        plyrRnds_(uint256,uint256);
                    } else if (0xa65b37a1 == v0) {
                        buyXname(bytes32,uint256);
                    } else if (0xc519500e == v0) {
                        potSplit_(uint256);
                    } else if (0xc7e284b8 == v0) {
                        getTimeLeft();
                    } else if (0xce89c80c == v0) {
                        calcKeysReceived(uint256,uint256);
                    } else if (0xcf808000 == v0) {
                        iWantXKeys(uint256);
                    } else if (0xd53b2679 == v0) {
                        activated_();
                    } else if (0xd87574e0 == v0) {
                        airDropPot_();
                    } else if (0xde7874f3 == v0) {
                        plyr_(uint256);
                    } else if (0xed78cf4a == v0) {
                        potSwap();
                    } else if (0xee0b5d8b == v0) {
                        getPlayerInfoByAddress(address);
                    }
                }
            }
            symbol();
        }
    }
    ();
}
