// Decompiled by library.dedaub.com
// 2023.01.13 08:22 UTC

// Data structures and variables inferred from the use of storage instructions
mapping (uint256 => [uint256]) owner_1; // STORAGE[0x1]
uint256 stor_9; // STORAGE[0x9]
uint256 stor_a; // STORAGE[0xa]
uint256 _receiveFlashLoan; // STORAGE[0xb]
uint256[] _getNftIds; // STORAGE[0xc]
address _owner; // STORAGE[0x0] bytes 0 to 19
uint16 _getStep; // STORAGE[0x2] bytes 0 to 1
address owner_2_2_21; // STORAGE[0x2] bytes 2 to 21
address _onFlashLoan; // STORAGE[0x3] bytes 0 to 19
address stor_4_0_19; // STORAGE[0x4] bytes 0 to 19
address stor_5_0_19; // STORAGE[0x5] bytes 0 to 19
address stor_6_0_19; // STORAGE[0x6] bytes 0 to 19
address stor_7_0_19; // STORAGE[0x7] bytes 0 to 19
uint160 stor_8_0_19; // STORAGE[0x8] bytes 0 to 19
address stor_d_0_19; // STORAGE[0xd] bytes 0 to 19
uint8 stor_d_20_20; // STORAGE[0xd] bytes 20 to 20

// Events
OwnershipTransferred(address, address);
LogAddress(address);
LogText(string);

function 0x19b8(uint256 varg0, uint256 varg1, uint256 varg2) private { 
    require(msg.sender == _owner, Error('Ownable: caller is not the owner'));
    require(address(varg1), Error('ERR: Zero Address'));
    require(address(varg2), Error('ERR: Zero Address'));
    require(MEM[varg0] > 0, Error('ERR: Zero Amount'));
    v0 = v1 = 0;
    while (v0 < MEM[varg0]) {
        v2 = address(varg2);
        if (v0 < MEM[varg0]) {
            break;
        }
        require(v0 < MEM[varg0], Panic(50));
        v3 = MEM[32 + (v0 << 5) + varg0];
        v4 = address(varg1);
        require(v2.code.size);
        v5 = v2.safeTransferFrom(address(this), v4, v3).gas(msg.gas);
        require(v5); // checks call status, propagates error data on error
        v0 = 0x3923(v0);
    }
    return ;
}

function 0x11fe65fa(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4) public nonPayable { 
    require(msg.data.length - 4 >= 160);
    require(varg0 == varg0);
    require(varg1 == varg1);
    require(varg2 == varg2);
    require(varg3 == varg3);
    require(varg4 == uint16(varg4));
    require(msg.sender == _owner, Error('Ownable: caller is not the owner'));
    emit LogText('Game Start');
    v0 = 0x20a5(0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2);
    emit 0x3f7b5a4eac77a83884ea205f0c123868a057bd880e615e32e7939788634a0097(v0);
    emit LogText('Main Logic');
    emit 0x3f7b5a4eac77a83884ea205f0c123868a057bd880e615e32e7939788634a0097(msg.gas);
    require(owner_2_2_21, Error('ERR: FlashLoanVault NULL'));
    require(this.code.size);
    v1 = this.call(0x7323f46000000000000000000000000000000000000000000000000000000000, 0).gas(msg.gas);
    require(v1); // checks call status, propagates error data on error
    stor_d_20_20 = varg3;
    stor_a = uint16(varg4);
    if (!varg2) {
        emit LogText('Main Logic');
        v2 = 0x20a5(0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2);
        emit 0x3f7b5a4eac77a83884ea205f0c123868a057bd880e615e32e7939788634a0097(v2);
        emit LogText('Gas Left:');
        emit 0x3f7b5a4eac77a83884ea205f0c123868a057bd880e615e32e7939788634a0097(msg.gas);
        v3, v4 = stor_7_0_19.getAssetPrice(0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2).gas(msg.gas);
        require(v3); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        v5 = v6 = 0;
        while (v5 < stor_a) {
            v7 = 0x3923(stor_9);
            stor_9 = v7;
            MEM[MEM[64]] = 0x3d602d80600a3d3981f3363d3d373d3d3d363d73000000000000000000000000;
            MEM[MEM[64] + 20] = stor_8_0_19 << 96;
            MEM[MEM[64] + 40] = 0x5af43d82803e903d91602b57fd5bf30000000000000000000000000000000000;
            if (address(CREATE2(0, MEM[64], 55, keccak256(0x7ab7e5c0b362e0cddd51f0c7c244206c8859520e98e4ce10c23cb3c56bee2cb6, stor_9)))) {
                break;
            }
            require(address(CREATE2(0, MEM[64], 55, keccak256(0x7ab7e5c0b362e0cddd51f0c7c244206c8859520e98e4ce10c23cb3c56bee2cb6, stor_9))), Error('ERC1167: create2 failed'));
            stor_d_0_19 = CREATE2(0, MEM[64], 55, keccak256(0x7ab7e5c0b362e0cddd51f0c7c244206c8859520e98e4ce10c23cb3c56bee2cb6, stor_9));
            emit LogText('Gas Left after withdrawall:');
            emit LogAddress(stor_d_0_19);
            require(this.code.size);
            v8 = this.setWhiteList(stor_d_0_19, 1).gas(msg.gas);
            require(v8); // checks call status, propagates error data on error
            MEM[MEM[64] + 4 + 64] = stor_6_0_19;
            MEM[MEM[64] + 4 + 96] = stor_4_0_19;
            v9 = new array[](_getNftIds.length);
            v10 = v11 = v9.data;
            v12 = v13 = 0;
            while (v12 < _getNftIds.length) {
                MEM[v10] = STORAGE[v14];
                v10 += 32;
                v14 += 1;
                v12 += 1;
            }
            require(stor_d_0_19.code.size);
            v15 = stor_d_0_19.init(_owner, address(this), stor_6_0_19, stor_4_0_19, v4, v9).gas(msg.gas);
            require(v15); // checks call status, propagates error data on error
            v16 = v17 = 0;
            while (v16 < _getNftIds.length) {
                require(v16 < _getNftIds.length, Panic(50));
                MEM[MEM[64]] = 0x23b872dd00000000000000000000000000000000000000000000000000000000;
                MEM[4 + MEM[64] + 64] = _getNftIds[v16];
                require(stor_4_0_19.code.size);
                v18 = stor_4_0_19.call(v19, address(this), stor_d_0_19, _getNftIds[v16]).gas(msg.gas);
                require(v18); // checks call status, propagates error data on error
                v16 = 0x3923(v16);
            }
            MEM[MEM[64]] = 0x38e15bd700000000000000000000000000000000000000000000000000000000;
            require(stor_d_0_19.code.size);
            v20 = stor_d_0_19.call(MEM[(MEM[64]) len 4], MEM[(MEM[64]) len 0]).gas(msg.gas);
            require(v20); // checks call status, propagates error data on error
            MEM[MEM[64]] = 0x853828b600000000000000000000000000000000000000000000000000000000;
            require(stor_d_0_19.code.size);
            v21 = stor_d_0_19.call(MEM[(MEM[64]) len 4], MEM[(MEM[64]) len 0]).gas(msg.gas);
            require(v21); // checks call status, propagates error data on error
            MEM[MEM[64]] = 32;
            emit LogText(address(this), stor_d_0_19, 'Gas Left after withdrawall:');
            emit 0x3f7b5a4eac77a83884ea205f0c123868a057bd880e615e32e7939788634a0097(msg.gas);
            v5 = 0x3923(v5);
        }
        goto 0x76d;
    } else {
        CALLDATACOPY(v22.data, msg.data.length, 32);
        require(0 < v22.length, Panic(50));
        CALLDATACOPY(v23.data, msg.data.length, 32);
        require(0 < v23.length, Panic(50));
        v24 = new array[](v22.length);
        v25 = v26 = 0;
        v27 = v28 = v22.data;
        v29 = v30 = v24.data;
        while (v25 < v22.length) {
            MEM[v29] = address(MEM[v27]);
            v27 += 32;
            v29 += 32;
            v25 += 1;
        }
        v29 = new array[](v23.length);
        v31 = v32 = v29.data;
        v33 = v34 = v23.data;
        v35 = v36 = 0;
        while (v35 < v23.length) {
            MEM[v31] = MEM[v33];
            v31 += 32;
            v33 += 32;
            v35 += 1;
        }
        v31 = new array[](0);
        require(owner_2_2_21.code.size);
        v37 = owner_2_2_21.flashLoan(address(this), v24, v29, v31, v19, 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2).gas(msg.gas);
        require(v37); // checks call status, propagates error data on error
    }
    if (varg0) {
        v38 = v39 = ~0;
        require(msg.sender == _owner, Error('Ownable: caller is not the owner'));
        require(_owner, Error('ERR: Zero Address'));
        require(0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2, Error('ERR: Zero Address'));
        require(v39 > 0, Error('ERR: Zero Amount'));
        if (0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee != 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2) {
            v40, v41 = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.balanceOf(this).gas(msg.gas);
            require(v40); // checks call status, propagates error data on error
            require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
            if (v41 < v39) {
                v42, v38 = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.balanceOf(this).gas(msg.gas);
                require(v42); // checks call status, propagates error data on error
                require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
                goto 0x1d000x797B0x774;
            }
            v43 = v44 = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2 == 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2;
            if (!v43) {
                MEM[MEM[64] + 68] = v38;
                MEM[MEM[64] + 32] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000 | 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffff & _owner;
                v45 = 0x2d92(0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2);
                require(v45, Error('SafeERC20: call to non-contract'));
                v46 = 0;
                while (v46 < 68) {
                    MEM[v46 + MEM[64]] = MEM[32 + (MEM[64] + v46)];
                    v46 += 32;
                }
                if (v46 > 68) {
                    MEM[MEM[64] + 68] = 0;
                }
                v47, v48, v49 = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.call(MEM[(MEM[64]) len 68], MEM[(MEM[64]) len 0]).gas(msg.gas);
                if (RETURNDATASIZE() == 0) {
                    v50 = 96;
                } else {
                    v50 = v51 = new bytes[](RETURNDATASIZE());
                    RETURNDATACOPY(v51.data, 0, RETURNDATASIZE());
                }
                require(v47, Error('SafeERC20: low-level call failed'));
                if (MEM[v50]) {
                    require(32 + v50 + MEM[v50] - (32 + v50) >= 32);
                    require(MEM[32 + v50] == MEM[32 + v50]);
                    require(MEM[32 + v50], Error('SafeERC20: ERC20 operation did not succeed'));
                }
                goto 0x1da20x797B0x774;
            } else {
                require(0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.code.size);
                v52 = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.withdraw(v38).gas(msg.gas);
                require(v52); // checks call status, propagates error data on error
                0x29ce(v38, _owner);
            }
        } else {
            if (this.balance < v39) {
                v38 = v53 = this.balance;
            }
            0x29ce(v38, _owner);
        }
    }
    emit LogText('Game End');
    v54 = 0x20a5(0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2);
    emit 0x3f7b5a4eac77a83884ea205f0c123868a057bd880e615e32e7939788634a0097(v54);
    emit LogText('Gas Left:');
    emit 0x3f7b5a4eac77a83884ea205f0c123868a057bd880e615e32e7939788634a0097(msg.gas);
}

function onERC721Received(address varg0, address varg1, uint256 varg2, bytes varg3) public nonPayable { 
    require(msg.data.length - 4 >= 128);
    require(varg0 == varg0);
    require(varg1 == varg1);
    require(varg3 <= 0xffffffffffffffff);
    require(4 + varg3 + 31 < msg.data.length);
    require(varg3.length <= 0xffffffffffffffff);
    v0 = varg3.data;
    require(4 + varg3 + varg3.length + 32 <= msg.data.length);
    v1 = v2 = 1 == _getStep;
    if (v2) {
        v3 = _SafeSub(_getNftIds.length, 2);
        require(v3 < _getNftIds.length, Panic(50));
        v1 = v4 = varg2 == _getNftIds[v3];
    }
    if (!v1) {
        v5 = v6 = _getStep == 2;
        if (v6) {
            v7 = _SafeSub(_getNftIds.length, 1);
            require(v7 < _getNftIds.length, Panic(50));
            v5 = v8 = varg2 == _getNftIds[v7];
        }
        if (v5) {
            v9 = _SafeSub(_getNftIds.length, 3);
            require(v9 < _getNftIds.length, Panic(50));
            require(stor_4_0_19.code.size);
            v10 = stor_4_0_19.transferFrom(address(this), stor_d_0_19, _getNftIds[v9]).gas(msg.gas);
            require(v10); // checks call status, propagates error data on error
            v11 = _SafeSub(_getNftIds.length, 2);
            require(v11 < _getNftIds.length, Panic(50));
            require(stor_4_0_19.code.size);
            v12 = stor_4_0_19.transferFrom(address(this), stor_d_0_19, _getNftIds[v11]).gas(msg.gas);
            require(v12); // checks call status, propagates error data on error
            v13 = _SafeSub(_getNftIds.length, 1);
            require(v13 < _getNftIds.length, Panic(50));
            require(stor_4_0_19.code.size);
            v14 = stor_4_0_19.transferFrom(address(this), stor_d_0_19, _getNftIds[v13]).gas(msg.gas);
            require(v14); // checks call status, propagates error data on error
            require(stor_d_0_19.code.size);
            v15 = stor_d_0_19.call(0xa6a4ad03).gas(msg.gas);
            require(v15); // checks call status, propagates error data on error
        }
    } else {
        v16, v17, v18, v19, v20, v21, v22, v23 = stor_6_0_19.fullExit(stor_d_0_19).gas(msg.gas);
        require(v16); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 224);
        require(v22 < 0xde0b6b3a7640000, Error('ERR: above HEALTH_FACTOR_LIQUIDATION_THRESHOLD'));
        require(this.code.size);
        v24 = this.call(0x7323f46000000000000000000000000000000000000000000000000000000000, 2).gas(msg.gas);
        require(v24); // checks call status, propagates error data on error
        emit LogText('ETH balance before liquidation:');
        v25 = 0x20a5(0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2);
        emit 0x3f7b5a4eac77a83884ea205f0c123868a057bd880e615e32e7939788634a0097(v25);
        v26 = _SafeSub(_getNftIds.length, 1);
        require(v26 < _getNftIds.length, Panic(50));
        require(stor_6_0_19.code.size);
        v27 = stor_6_0_19.liquidationERC721(stor_4_0_19, 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2, stor_d_0_19, _getNftIds[v26], 0x56bc75e2d63100000, 0).gas(msg.gas);
        require(v27); // checks call status, propagates error data on error
        emit LogText('ETH balance after liquidation:');
        v28 = 0x20a5(0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2);
        emit 0x3f7b5a4eac77a83884ea205f0c123868a057bd880e615e32e7939788634a0097(v28);
    }
    return 0x150b7a0200000000000000000000000000000000000000000000000000000000;
}

function onFlashLoan(address varg0, address varg1, uint256 varg2, uint256 varg3, bytes varg4) public nonPayable { 
    require(msg.data.length - 4 >= 160);
    require(varg0 == varg0);
    require(varg1 == varg1);
    require(varg4 <= 0xffffffffffffffff);
    require(4 + varg4 + 31 < msg.data.length);
    require(varg4.length <= 0xffffffffffffffff);
    v0 = varg4.data;
    require(4 + varg4 + varg4.length + 32 <= msg.data.length);
    require(msg.sender == _onFlashLoan, Error('ERR: Not from NFT vault'));
    require(this == varg0, Error('ERR: Called from Other'));
    require(_onFlashLoan == varg1, Error('ERR: Not Valid Token'));
    v1, v2 = _onFlashLoan.balanceOf(this).gas(msg.gas);
    require(v1); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v2 >= varg2, Error('ERR: Not enough nft token minted'));
    emit LogText('Flashloan from nft vault\x00\x00\x00\x00\x00\x00\x00\x00 \x18');
    CALLDATACOPY(v3.data, msg.data.length, 64);
    require(0 < v3.length, Panic(50));
    require(1 < v3.length, Panic(50));
    MEM[0xc02aaa39b223fe8d0a0e5c4f27ead9083c756d02] = _onFlashLoan;
    v4 = _SafeMul(0xde0b6b3a7640000, _receiveFlashLoan);
    require(20, Panic(18));
    emit LogText('ETH balance before swap:');
    v5 = 0x20a5(0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2);
    emit 0x3f7b5a4eac77a83884ea205f0c123868a057bd880e615e32e7939788634a0097(v5);
    require(600 <= ~block.timestamp, Panic(17));
    v6 = new array[](v3.length);
    v7 = v8 = v6.data;
    v9 = v10 = v3.data;
    v11 = v12 = 0;
    while (v11 < v3.length) {
        MEM[v7] = address(MEM[v9]);
        v9 += 32;
        v7 += 32;
        v11 += 1;
    }
    v13, v14 = stor_5_0_19.swapTokensForExactTokens(v4 / 20, 0xad78ebc5ac6200000, v6, address(this), 600 + block.timestamp, v15, 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2).gas(msg.gas);
    require(v13); // checks call status, propagates error data on error
    RETURNDATACOPY(v14, 0, RETURNDATASIZE());
    require(v14 + RETURNDATASIZE() - v14 >= 32);
    require(MEM[v14] <= 0xffffffffffffffff);
    require(v14 + RETURNDATASIZE() > v14 + MEM[v14] + 31);
    v16 = 0x3112(MEM[v14 + MEM[v14]]);
    require(!((MEM[64] + (~0x1f & v16 + 31) < MEM[64]) | (MEM[64] + (~0x1f & v16 + 31) > 0xffffffffffffffff)), Panic(65));
    MEM[64] = MEM[64] + (~0x1f & v16 + 31);
    MEM[MEM[64]] = MEM[v14 + MEM[v14]];
    v17 = v18 = MEM[64] + 32;
    require(32 + (v14 + MEM[v14] + (MEM[v14 + MEM[v14]] << 5)) <= v14 + RETURNDATASIZE());
    v19 = v20 = 32 + (v14 + MEM[v14]);
    while (v19 < 32 + (v14 + MEM[v14] + (MEM[v14 + MEM[v14]] << 5))) {
        MEM[v17] = MEM[v19];
        v19 += 32;
        v17 += 32;
    }
    emit LogText('ETH balance after swap:');
    v21 = 0x20a5(0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2);
    emit 0x3f7b5a4eac77a83884ea205f0c123868a057bd880e615e32e7939788634a0097(v21);
    _getNftIds.length = 0;
    while (v22 + _getNftIds.length > v23) {
        STORAGE[v23] = 0;
        v23 += 1;
    }
    v24 = new array[](0);
    v25 = v26 = v24.data;
    v27 = v28 = MEM[64] + 32;
    v29 = v30 = 0;
    while (v29 < 0) {
        MEM[v25] = MEM[v27];
        v25 += 32;
        v27 += 32;
        v29 += 1;
    }
    v31, v32 = _onFlashLoan.redeem(_receiveFlashLoan, v24).gas(msg.gas);
    require(v31); // checks call status, propagates error data on error
    RETURNDATACOPY(v32, 0, RETURNDATASIZE());
    MEM[64] = v32 + (~0x1f & RETURNDATASIZE() + 31);
    require(v32 + RETURNDATASIZE() - v32 >= 32);
    require(MEM[v32] <= 0xffffffffffffffff);
    require(v32 + RETURNDATASIZE() > v32 + MEM[v32] + 31);
    v33 = 0x3112(MEM[v32 + MEM[v32]]);
    require(!((MEM[64] + (~0x1f & v33 + 31) < MEM[64]) | (MEM[64] + (~0x1f & v33 + 31) > 0xffffffffffffffff)), Panic(65));
    v34 = v35 = MEM[64] + 32;
    require(32 + (v32 + MEM[v32] + (MEM[v32 + MEM[v32]] << 5)) <= v32 + RETURNDATASIZE());
    v36 = v37 = 32 + (v32 + MEM[v32]);
    while (v36 < 32 + (v32 + MEM[v32] + (MEM[v32 + MEM[v32]] << 5))) {
        MEM[v34] = MEM[v36];
        v36 += 32;
        v34 += 32;
    }
    v38 = v39 = MEM[64] + 32;
    _getNftIds.length = MEM[v32 + MEM[v32]];
    if (MEM[v32 + MEM[v32]]) {
        while (v39 + (MEM[v32 + MEM[v32]] << 5) > v38) {
            STORAGE[v40] = MEM[v38];
            v38 += 32;
            v40 += 1;
        }
    }
    while (v41 + _getNftIds.length > v40) {
        STORAGE[v40] = 0;
        v40 += 1;
    }
    emit LogText('Main Logic');
    v42 = 0x20a5(0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2);
    emit 0x3f7b5a4eac77a83884ea205f0c123868a057bd880e615e32e7939788634a0097(v42);
    emit LogText('Gas Left:');
    emit 0x3f7b5a4eac77a83884ea205f0c123868a057bd880e615e32e7939788634a0097(msg.gas);
    v43, v44 = stor_7_0_19.getAssetPrice(0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2).gas(msg.gas);
    require(v43); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    v45 = v46 = 0;
    while (v45 < stor_a) {
        v47 = 0x3923(stor_9);
        stor_9 = v47;
        MEM[MEM[64]] = 0x3d602d80600a3d3981f3363d3d373d3d3d363d73000000000000000000000000;
        MEM[MEM[64] + 20] = stor_8_0_19 << 96;
        MEM[MEM[64] + 40] = 0x5af43d82803e903d91602b57fd5bf30000000000000000000000000000000000;
        if (address(CREATE2(0, MEM[64], 55, keccak256(0x7ab7e5c0b362e0cddd51f0c7c244206c8859520e98e4ce10c23cb3c56bee2cb6, stor_9)))) {
            break;
        }
        require(address(CREATE2(0, MEM[64], 55, keccak256(0x7ab7e5c0b362e0cddd51f0c7c244206c8859520e98e4ce10c23cb3c56bee2cb6, stor_9))), Error('ERC1167: create2 failed'));
        stor_d_0_19 = CREATE2(0, MEM[64], 55, keccak256(0x7ab7e5c0b362e0cddd51f0c7c244206c8859520e98e4ce10c23cb3c56bee2cb6, stor_9));
        emit LogText('Gas Left after withdrawall:');
        emit LogAddress(stor_d_0_19);
        require(this.code.size);
        v48 = this.setWhiteList(stor_d_0_19, 1).gas(msg.gas);
        require(v48); // checks call status, propagates error data on error
        MEM[MEM[64] + 4 + 64] = stor_6_0_19;
        MEM[MEM[64] + 4 + 96] = stor_4_0_19;
        v49 = new array[](_getNftIds.length);
        v50 = v51 = v49.data;
        v52 = v53 = 0;
        while (v52 < _getNftIds.length) {
            MEM[v50] = STORAGE[v54];
            v50 += 32;
            v54 += 1;
            v52 += 1;
        }
        require(stor_d_0_19.code.size);
        v55 = stor_d_0_19.init(_owner, address(this), stor_6_0_19, stor_4_0_19, v44, v49).gas(msg.gas);
        require(v55); // checks call status, propagates error data on error
        v56 = v57 = 0;
        while (v56 < _getNftIds.length) {
            require(v56 < _getNftIds.length, Panic(50));
            MEM[MEM[64]] = 0x23b872dd00000000000000000000000000000000000000000000000000000000;
            MEM[4 + MEM[64] + 64] = _getNftIds[v56];
            require(stor_4_0_19.code.size);
            v58 = stor_4_0_19.call(v15, address(this), stor_d_0_19, _getNftIds[v56]).gas(msg.gas);
            require(v58); // checks call status, propagates error data on error
            v56 = 0x3923(v56);
        }
        MEM[MEM[64]] = 0x38e15bd700000000000000000000000000000000000000000000000000000000;
        require(stor_d_0_19.code.size);
        v59 = stor_d_0_19.call(MEM[(MEM[64]) len 4], MEM[(MEM[64]) len 0]).gas(msg.gas);
        require(v59); // checks call status, propagates error data on error
        MEM[MEM[64]] = 0x853828b600000000000000000000000000000000000000000000000000000000;
        require(stor_d_0_19.code.size);
        v60 = stor_d_0_19.call(MEM[(MEM[64]) len 4], MEM[(MEM[64]) len 0]).gas(msg.gas);
        require(v60); // checks call status, propagates error data on error
        MEM[MEM[64]] = 32;
        emit LogText(address(this), stor_d_0_19, 'Gas Left after withdrawall:');
        emit 0x3f7b5a4eac77a83884ea205f0c123868a057bd880e615e32e7939788634a0097(msg.gas);
        v45 = 0x3923(v45);
    }
    require(_getNftIds.length <= 0xffffffffffffffff, Panic(65));
    v61 = new uint256[](_getNftIds.length);
    if (_getNftIds.length) {
        CALLDATACOPY(v61.data, msg.data.length, _getNftIds.length << 5);
    }
    v62 = new array[](_getNftIds.length);
    v63 = v64 = v62.data;
    v65 = v66 = 0;
    while (v65 < _getNftIds.length) {
        MEM[v63] = STORAGE[v67];
        v63 += 32;
        v67 += 1;
        v65 += 1;
    }
    v63 = new array[](v61.length);
    v68 = v69 = v63.data;
    v70 = v71 = v61.data;
    v72 = v73 = 0;
    while (v72 < v61.length) {
        MEM[v68] = MEM[v70];
        v68 += 32;
        v70 += 32;
        v72 += 1;
    }
    v74, v75 = _onFlashLoan.fullExit(v62, v63).gas(msg.gas);
    require(v74); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    return 0x439148f0bbc682ca079e46d6e2c2f0c1e3b820f1a291b069d8882abf8cf18dd9;
}

function 0x20a5(uint256 varg0) private { 
    if (0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee != address(varg0)) {
        v0, v1 = address(varg0).balanceOf(this).gas(msg.gas);
        require(v0); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        return v1;
    } else {
        return this.balance;
    }
}

function 0x2ecc10f9(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5, uint256 varg6, uint256 varg7) public nonPayable { 
    require(msg.data.length - 4 >= 256);
    require(varg0 == address(varg0));
    require(varg1 == address(varg1));
    require(varg2 == address(varg2));
    require(varg3 == address(varg3));
    require(varg4 == address(varg4));
    require(varg5 == address(varg5));
    require(varg6 == address(varg6));
    require(varg7 == uint16(varg7));
    require(msg.sender == _owner, Error('Ownable: caller is not the owner'));
    owner_2_2_21 = varg0;
    _onFlashLoan = varg1;
    stor_4_0_19 = varg2;
    stor_5_0_19 = varg3;
    stor_6_0_19 = varg4;
    stor_7_0_19 = varg5;
    stor_8_0_19 = varg6;
    _receiveFlashLoan = uint16(varg7);
    v0, v1 = address(varg1).approve(address(varg1), ~0).gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v1 == v1);
    require(stor_4_0_19.code.size);
    v2 = stor_4_0_19.setApprovalForAll(_onFlashLoan, 1).gas(msg.gas);
    require(v2); // checks call status, propagates error data on error
    v3, v4 = 0x000000000000000000000000c02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.approve(stor_5_0_19, ~0).gas(msg.gas);
    require(v3); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v4 == v4);
    v5, v6 = 0x000000000000000000000000c02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.approve(stor_6_0_19, ~0).gas(msg.gas);
    require(v5); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v6 == v6);
    v7, v8 = 0x000000000000000000000000c02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.approve(_owner, ~0).gas(msg.gas);
    require(v7); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v8 == v8);
}

function 0x3895e410() public nonPayable { 
    return stor_d_0_19;
}

function 0x51a870e7(uint256 varg0, uint256 varg1) public nonPayable { 
    require(msg.data.length - 4 >= 64);
    require(varg0 == varg0);
    require(varg1 <= 0xffffffffffffffff);
    require(4 + varg1 + 31 < msg.data.length);
    v0 = 0x3112(varg1.length);
    require(!((MEM[64] + (~0x1f & v0 + 31) < MEM[64]) | (MEM[64] + (~0x1f & v0 + 31) > 0xffffffffffffffff)), Panic(65));
    MEM[64] = MEM[64] + (~0x1f & v0 + 31);
    MEM[MEM[64]] = varg1.length;
    v1 = v2 = MEM[64] + 32;
    require(32 + (4 + varg1 + (varg1.length << 5)) <= msg.data.length);
    v3 = v4 = varg1.data;
    while (v3 < 32 + (4 + varg1 + (varg1.length << 5))) {
        MEM[v1] = msg.data[v3];
        v1 += 32;
        v3 += 32;
    }
    require(msg.sender == _owner, Error('Ownable: caller is not the owner'));
    if (!varg0) {
        0x19b8(MEM[64], msg.sender, stor_4_0_19);
    } else {
        v5 = v6 = MEM[64] + 32;
        if (_getNftIds.length) {
            do {
                MEM[v5] = STORAGE[v7];
                v5 += 32;
                v7 += 1;
            } while (v6 + (_getNftIds.length << 5) <= v5);
        }
        require(msg.sender == _owner, Error('Ownable: caller is not the owner'));
        require(msg.sender, Error('ERR: Zero Address'));
        require(stor_4_0_19, Error('ERR: Zero Address'));
        require(_getNftIds.length > 0, Error('ERR: Zero Amount'));
        v8 = 0;
        while (v8 < _getNftIds.length) {
            if (v8 < _getNftIds.length) {
                break;
            }
            require(v8 < _getNftIds.length, Panic(50));
            require(stor_4_0_19.code.size);
            v9 = stor_4_0_19.safeTransferFrom(address(this), msg.sender, MEM[32 + (v8 << 5) + MEM[64]]).gas(msg.gas);
            require(v9); // checks call status, propagates error data on error
            v8 = 0x3923(v8);
        }
    }
}

function 0x29ce(uint256 varg0, uint256 varg1) private { 
    require(this.balance >= varg0, Error('Address: insufficient balance'));
    v0, v1 = address(varg1).call().value(varg0).gas(msg.gas);
    if (RETURNDATASIZE() != 0) {
        v2 = new bytes[](RETURNDATASIZE());
        v1 = v2.data;
        RETURNDATACOPY(v1, 0, RETURNDATASIZE());
    }
    require(v0, Error('Address: unable to send value, recipient may have reverted'));
    return ;
}

function renounceOwnership() public nonPayable { 
    require(msg.sender == _owner, Error('Ownable: caller is not the owner'));
    emit OwnershipTransferred(_owner, 0);
    _owner = 0;
}

function 0x7323f460(uint256 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(varg0 == uint16(varg0));
    v0 = v1 = msg.sender == _owner;
    if (msg.sender != _owner) {
        v0 = v2 = this == msg.sender;
    }
    if (!v0) {
        v0 = v3 = 0xff & owner_1[msg.sender];
    }
    require(v0, Error('ERR: Not WhiteList'));
    _getStep = varg0;
}

function destroyAndTransfer(address varg0) public payable { 
    require(msg.data.length - 4 >= 32);
    require(varg0 == varg0);
    require(msg.sender == _owner, Error('Ownable: caller is not the owner'));
    selfdestruct(varg0);
}

function 0x2d92(uint256 varg0) private { 
    v0 = EXTCODEHASH(varg0);
    if (0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 == v0) {
        return 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 != v0;
    } else {
        return v0;
    }
}

function 0x7927b76c(uint256 varg0, uint256 varg1, uint256 varg2) public nonPayable { 
    require(msg.data.length - 4 >= 96);
    require(varg0 == address(varg0));
    require(varg1 == address(varg1));
    require(varg2 <= 0xffffffffffffffff);
    require(4 + varg2 + 31 < msg.data.length);
    v0 = 0x3112(varg2.length);
    require(!((MEM[64] + (~0x1f & v0 + 31) < MEM[64]) | (MEM[64] + (~0x1f & v0 + 31) > 0xffffffffffffffff)), Panic(65));
    MEM[64] = MEM[64] + (~0x1f & v0 + 31);
    MEM[MEM[64]] = varg2.length;
    v1 = v2 = MEM[64] + 32;
    require(32 + (4 + varg2 + (varg2.length << 5)) <= msg.data.length);
    v3 = v4 = varg2.data;
    while (v3 < 32 + (4 + varg2 + (varg2.length << 5))) {
        MEM[v1] = msg.data[v3];
        v1 += 32;
        v3 += 32;
    }
    0x19b8(MEM[64], varg1, varg0);
}

function getNftIds() public nonPayable { 
    v0 = new uint256[](_getNftIds.length);
    v1 = v2 = v0.data;
    if (_getNftIds.length) {
        do {
            MEM[v1] = STORAGE[v3];
            v1 += 32;
            v3 += 1;
        } while (v2 + (_getNftIds.length << 5) <= v1);
    }
    v4 = new array[](v0.length);
    v5 = v6 = v4.data;
    v7 = v8 = v0.data;
    v9 = v10 = 0;
    while (v9 < v0.length) {
        MEM[v5] = MEM[v7];
        v5 += 32;
        v7 += 32;
        v9 += 1;
    }
    return v4;
}

function 0x3112(uint256 varg0) private { 
    require(varg0 <= 0xffffffffffffffff, Panic(65));
    return 32 + (varg0 << 5);
}

function 0x8186787f(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3) public nonPayable { 
    require(msg.data.length - 4 >= 128);
    require(varg0 == address(varg0));
    require(varg1 == address(varg1));
    require(varg3 == varg3);
    require(msg.sender == _owner, Error('Ownable: caller is not the owner'));
    require(address(varg1), Error('ERR: Zero Address'));
    require(address(varg0), Error('ERR: Zero Address'));
    require(varg2 > 0, Error('ERR: Zero Amount'));
    if (0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee != address(varg0)) {
        v0, v1 = address(varg0).balanceOf(this).gas(msg.gas);
        require(v0); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        if (v1 < varg2) {
            v2, v3 = address(varg0).balanceOf(this).gas(msg.gas);
            require(v2); // checks call status, propagates error data on error
            require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
            goto 0x1d000x1b47B0x346;
        }
        v4 = v5 = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2 == address(varg0);
        if (!v4) {
            MEM[MEM[64] + 68] = v3;
            MEM[MEM[64] + 32] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000 | 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffff & address(varg1);
            v6 = 0x2d92(address(varg0));
            require(v6, Error('SafeERC20: call to non-contract'));
            v7 = 0;
            while (v7 < 68) {
                MEM[v7 + MEM[64]] = MEM[32 + (MEM[64] + v7)];
                v7 += 32;
            }
            if (v7 > 68) {
                MEM[MEM[64] + 68] = 0;
            }
            v8, v9, v10 = address(varg0).call(MEM[(MEM[64]) len 68], MEM[(MEM[64]) len 0]).gas(msg.gas);
            if (RETURNDATASIZE() == 0) {
                v11 = 96;
            } else {
                v11 = v12 = new bytes[](RETURNDATASIZE());
                RETURNDATACOPY(v12.data, 0, RETURNDATASIZE());
            }
            require(v8, Error('SafeERC20: low-level call failed'));
            if (MEM[v11]) {
                require(32 + v11 + MEM[v11] - (32 + v11) >= 32);
                require(MEM[32 + v11] == MEM[32 + v11]);
                require(MEM[32 + v11], Error('SafeERC20: ERC20 operation did not succeed'));
            }
            goto 0x1da20x1b47B0x346;
        } else {
            require((address(varg0)).code.size);
            v13 = address(varg0).withdraw(v3).gas(msg.gas);
            require(v13); // checks call status, propagates error data on error
            0x29ce(v3, varg1);
        }
    } else {
        if (this.balance < varg2) {
            v3 = v14 = this.balance;
        }
        0x29ce(v3, varg1);
    }
    return v3;
}

function 0x8264d100(uint256 varg0, uint256 varg1) public nonPayable { 
    require(msg.data.length - 4 >= 64);
    require(varg0 <= 0xffffffffffffffff);
    require(4 + varg0 + 31 < msg.data.length);
    v0 = 0x3112(varg0.length);
    require(!((MEM[64] + (~0x1f & v0 + 31) < MEM[64]) | (MEM[64] + (~0x1f & v0 + 31) > 0xffffffffffffffff)), Panic(65));
    v1 = v2 = MEM[64] + 32;
    require(32 + (4 + varg0 + (varg0.length << 5)) <= msg.data.length);
    v3 = v4 = varg0.data;
    while (v3 < 32 + (4 + varg0 + (varg0.length << 5))) {
        MEM[v1] = msg.data[v3];
        v1 += 32;
        v3 += 32;
    }
    require(varg1 == varg1);
    require(msg.sender == _owner, Error('Ownable: caller is not the owner'));
    _getNftIds.length = 0;
    while (v5 + _getNftIds.length > v6) {
        STORAGE[v6] = 0;
        v6 += 1;
    }
    v7 = v8 = MEM[64] + 32;
    _getNftIds.length = varg0.length;
    if (varg0.length) {
        while (v8 + (varg0.length << 5) > v7) {
            STORAGE[v9] = MEM[v7];
            v7 += 32;
            v9 += 1;
        }
    }
    while (v10 + _getNftIds.length > v9) {
        STORAGE[v9] = 0;
        v9 += 1;
    }
    if (!varg1) {
        v11 = v12 = 0;
        while (v11 < varg0.length) {
            if (v11 < varg0.length) {
                break;
            }
            require(v11 < varg0.length, Panic(50));
            require(stor_4_0_19.code.size);
            v13 = stor_4_0_19.safeTransferFrom(msg.sender, address(this), MEM[32 + (v11 << 5) + MEM[64]]).gas(msg.gas);
            require(v13); // checks call status, propagates error data on error
            v11 = 0x3923(v11);
        }
        goto 0x1960x34b;
    }
}

function _SafeSub(uint256 varg0, uint256 varg1) private { 
    require(varg0 >= varg1, Panic(17));
    return varg0 - varg1;
}

function setWhiteList(address varg0, bool varg1) public nonPayable { 
    require(msg.data.length - 4 >= 64);
    require(varg0 == varg0);
    require(varg1 == varg1);
    v0 = v1 = msg.sender == _owner;
    if (msg.sender != _owner) {
        v0 = v2 = this == msg.sender;
    }
    require(v0, Error('ERR: No privilege'));
    owner_1[varg0] = varg1 | ~0xff & owner_1[varg0];
}

function _SafeMul(uint256 varg0, uint256 varg1) private { 
    require(!(varg0 & (varg1 > ~0 / varg0)), Panic(17));
    return varg0 * varg1;
}

function owner() public nonPayable { 
    return _owner;
}

function 0x3923(uint256 varg0) private { 
    require(varg0 != ~0, Panic(17));
    return 1 + varg0;
}

function getStep() public nonPayable { 
    return _getStep;
}

function HEALTH_FACTOR_LIQUIDATION_THRESHOLD() public nonPayable { 
    return 0xde0b6b3a7640000;
}

function 0xce5bc45f() public nonPayable { 
    return 0x7ab7e5c0b362e0cddd51f0c7c244206c8859520e98e4ce10c23cb3c56bee2cb6;
}

function 0xd72e1911(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3) public payable { 
    require(msg.data.length - 4 >= 128);
    require(varg0 == address(varg0));
    require(varg1 == address(varg1));
    require(varg3 == varg3);
    require(msg.sender == _owner, Error('Ownable: caller is not the owner'));
    require(address(varg1), Error('ERR: Zero Address'));
    require(address(varg0), Error('ERR: Zero Address'));
    require(varg2 > 0, Error('ERR: Zero Amount'));
    if (0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee != address(varg0)) {
        require(!msg.value, Error('ERR: ETH sent'));
        MEM[36 + MEM[64] + 32] = address(this);
        MEM[36 + MEM[64] + 64] = varg2;
        MEM[MEM[64] + 32] = 0x23b872dd00000000000000000000000000000000000000000000000000000000 | 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffff & address(varg1);
        v0 = 0x2d92(address(varg0));
        require(v0, Error('SafeERC20: call to non-contract'));
        v1 = 0;
        while (v1 < 100) {
            MEM[v1 + MEM[64]] = MEM[32 + (MEM[64] + v1)];
            v1 += 32;
        }
        if (v1 > 100) {
            MEM[MEM[64] + 100] = 0;
        }
        v2, v3, v4 = address(varg0).call(MEM[(MEM[64]) len 100], MEM[(MEM[64]) len 0]).gas(msg.gas);
        if (RETURNDATASIZE() == 0) {
            v5 = 96;
        } else {
            v5 = v6 = new bytes[](RETURNDATASIZE());
            RETURNDATACOPY(v6.data, 0, RETURNDATASIZE());
        }
        require(v2, Error('SafeERC20: low-level call failed'));
        if (MEM[v5]) {
            require(32 + v5 + MEM[v5] - (32 + v5) >= 32);
            require(MEM[32 + v5] == MEM[32 + v5]);
            require(MEM[32 + v5], Error('SafeERC20: ERC20 operation did not succeed'));
        }
        goto 0x1da20x1f25B0x42a;
    } else {
        v7 = v8 = msg.value;
        if (varg3) {
            require(0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.code.size);
            v9 = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.deposit().value(v8).gas(msg.gas);
            require(v9); // checks call status, propagates error data on error
        }
    }
    return v7;
}

function balance(address varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(varg0 == varg0);
    v0 = 0x20a5(varg0);
    return v0;
}

function () public payable { 
    require(0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2 == msg.sender, Error('Receive not allowed'));
}

function receiveFlashLoan(address[] varg0, uint256[] varg1, uint256[] varg2, bytes varg3) public nonPayable { 
    require(msg.data.length - 4 >= 128);
    require(varg0 <= 0xffffffffffffffff);
    require(4 + varg0 + 31 < msg.data.length);
    v0 = 0x3112(varg0.length);
    require(!((MEM[64] + (~0x1f & v0 + 31) < MEM[64]) | (MEM[64] + (~0x1f & v0 + 31) > 0xffffffffffffffff)), Panic(65));
    v1 = v2 = MEM[64] + 32;
    require(32 + (4 + varg0 + (varg0.length << 5)) <= msg.data.length);
    v3 = v4 = varg0.data;
    while (v3 < 32 + (4 + varg0 + (varg0.length << 5))) {
        require(msg.data[v3] == address(msg.data[v3]));
        MEM[v1] = msg.data[v3];
        v3 += 32;
        v1 += 32;
    }
    require(varg1 <= 0xffffffffffffffff);
    require(4 + varg1 + 31 < msg.data.length);
    v5 = 0x3112(varg1.length);
    require(!((MEM[64] + (~0x1f & v5 + 31) < MEM[64]) | (MEM[64] + (~0x1f & v5 + 31) > 0xffffffffffffffff)), Panic(65));
    v6 = v7 = MEM[64] + 32;
    require(32 + (4 + varg1 + (varg1.length << 5)) <= msg.data.length);
    v8 = v9 = varg1.data;
    while (v8 < 32 + (4 + varg1 + (varg1.length << 5))) {
        MEM[v6] = msg.data[v8];
        v6 += 32;
        v8 += 32;
    }
    require(varg2 <= 0xffffffffffffffff);
    require(4 + varg2 + 31 < msg.data.length);
    v10 = 0x3112(varg2.length);
    require(!((MEM[64] + (~0x1f & v10 + 31) < MEM[64]) | (MEM[64] + (~0x1f & v10 + 31) > 0xffffffffffffffff)), Panic(65));
    MEM[64] = MEM[64] + (~0x1f & v10 + 31);
    MEM[MEM[64]] = varg2.length;
    v11 = v12 = MEM[64] + 32;
    require(32 + (4 + varg2 + (varg2.length << 5)) <= msg.data.length);
    v13 = v14 = varg2.data;
    while (v13 < 32 + (4 + varg2 + (varg2.length << 5))) {
        MEM[v11] = msg.data[v13];
        v11 += 32;
        v13 += 32;
    }
    require(varg3 <= 0xffffffffffffffff);
    require(4 + varg3 + 31 < msg.data.length);
    require(varg3.length <= 0xffffffffffffffff, Panic(65));
    v15 = new bytes[](varg3.length);
    require(!((v15 + (~0x1f & 32 + (~0x1f & varg3.length + 31) + 31) < v15) | (v15 + (~0x1f & 32 + (~0x1f & varg3.length + 31) + 31) > 0xffffffffffffffff)), Panic(65));
    require(4 + varg3 + varg3.length + 32 <= msg.data.length);
    CALLDATACOPY(v15.data, varg3.data, varg3.length);
    v15[varg3.length] = 0;
    require(owner_2_2_21 == msg.sender, Error('ERR: Not from balance vault'));
    emit LogText('Flashloan from vault');
    v16 = 0x20a5(0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2);
    emit 0x3f7b5a4eac77a83884ea205f0c123868a057bd880e615e32e7939788634a0097(v16);
    if (!stor_d_20_20) {
        emit LogText('Main Logic');
        v17 = 0x20a5(0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2);
        emit 0x3f7b5a4eac77a83884ea205f0c123868a057bd880e615e32e7939788634a0097(v17);
        emit LogText('Gas Left:');
        emit 0x3f7b5a4eac77a83884ea205f0c123868a057bd880e615e32e7939788634a0097(msg.gas);
        v18, v19 = stor_7_0_19.getAssetPrice(0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2).gas(msg.gas);
        require(v18); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        v20 = v21 = 0;
        while (v20 < stor_a) {
            v22 = 0x3923(stor_9);
            stor_9 = v22;
            MEM[MEM[64]] = 0x3d602d80600a3d3981f3363d3d373d3d3d363d73000000000000000000000000;
            MEM[MEM[64] + 20] = stor_8_0_19 << 96;
            MEM[MEM[64] + 40] = 0x5af43d82803e903d91602b57fd5bf30000000000000000000000000000000000;
            if (address(CREATE2(0, MEM[64], 55, keccak256(0x7ab7e5c0b362e0cddd51f0c7c244206c8859520e98e4ce10c23cb3c56bee2cb6, stor_9)))) {
                break;
            }
            require(address(CREATE2(0, MEM[64], 55, keccak256(0x7ab7e5c0b362e0cddd51f0c7c244206c8859520e98e4ce10c23cb3c56bee2cb6, stor_9))), Error('ERC1167: create2 failed'));
            stor_d_0_19 = CREATE2(0, MEM[64], 55, keccak256(0x7ab7e5c0b362e0cddd51f0c7c244206c8859520e98e4ce10c23cb3c56bee2cb6, stor_9));
            emit LogText('Gas Left after withdrawall:');
            emit LogAddress(stor_d_0_19);
            require(this.code.size);
            v23 = this.setWhiteList(stor_d_0_19, 1).gas(msg.gas);
            require(v23); // checks call status, propagates error data on error
            MEM[MEM[64] + 4 + 64] = stor_6_0_19;
            MEM[MEM[64] + 4 + 96] = stor_4_0_19;
            v24 = new array[](_getNftIds.length);
            v25 = v26 = v24.data;
            v27 = v28 = 0;
            while (v27 < _getNftIds.length) {
                MEM[v25] = STORAGE[v29];
                v25 += 32;
                v29 += 1;
                v27 += 1;
            }
            require(stor_d_0_19.code.size);
            v30 = stor_d_0_19.init(_owner, address(this), stor_6_0_19, stor_4_0_19, v19, v24).gas(msg.gas);
            require(v30); // checks call status, propagates error data on error
            v31 = v32 = 0;
            while (v31 < _getNftIds.length) {
                require(v31 < _getNftIds.length, Panic(50));
                MEM[MEM[64]] = 0x23b872dd00000000000000000000000000000000000000000000000000000000;
                MEM[4 + MEM[64] + 64] = _getNftIds[v31];
                require(stor_4_0_19.code.size);
                v33 = stor_4_0_19.call(v34, address(this), stor_d_0_19, _getNftIds[v31]).gas(msg.gas);
                require(v33); // checks call status, propagates error data on error
                v31 = 0x3923(v31);
            }
            MEM[MEM[64]] = 0x38e15bd700000000000000000000000000000000000000000000000000000000;
            require(stor_d_0_19.code.size);
            v35 = stor_d_0_19.call(MEM[(MEM[64]) len 4], MEM[(MEM[64]) len 0]).gas(msg.gas);
            require(v35); // checks call status, propagates error data on error
            MEM[MEM[64]] = 0x853828b600000000000000000000000000000000000000000000000000000000;
            require(stor_d_0_19.code.size);
            v36 = stor_d_0_19.call(MEM[(MEM[64]) len 4], MEM[(MEM[64]) len 0]).gas(msg.gas);
            require(v36); // checks call status, propagates error data on error
            MEM[MEM[64]] = 32;
            emit LogText(address(this), stor_d_0_19, 'Gas Left after withdrawall:');
            emit 0x3f7b5a4eac77a83884ea205f0c123868a057bd880e615e32e7939788634a0097(msg.gas);
            v20 = 0x3923(v20);
        }
        goto 0x22feB0x46a;
    } else {
        v37 = _SafeMul(0xde0b6b3a7640000, _receiveFlashLoan);
        v38 = new array[](0);
        v39, v40 = _onFlashLoan.flashLoan(address(this), _onFlashLoan, v37, v38).gas(msg.gas);
        require(v39); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v40 == v40);
    }
    v41 = v42 = 0;
    while (v41 < varg0.length) {
        if (v41 < varg0.length) {
            break;
        }
        require(v41 < varg0.length, Panic(50));
        if (v41 < varg1.length) {
            break;
        }
        require(v41 < varg1.length, Panic(50));
        MEM[MEM[64] + 68] = MEM[32 + (v41 << 5) + MEM[64]];
        MEM[MEM[64] + 32] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000 | 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffff & owner_2_2_21;
        v43 = 0x2d92(address(MEM[32 + (v41 << 5) + MEM[64]]));
        require(v43, Error('SafeERC20: call to non-contract'));
        v44 = 0;
        while (v44 < 68) {
            MEM[v44 + MEM[64]] = MEM[32 + (MEM[64] + v44)];
            v44 += 32;
        }
        if (v44 > 68) {
            MEM[MEM[64] + 68] = 0;
        }
        v45, v46, v47 = address(MEM[32 + (v41 << 5) + MEM[64]]).call(stor_4_0_19, v19, 192).gas(msg.gas);
        if (RETURNDATASIZE() == 0) {
            v48 = 96;
        } else {
            v48 = v49 = new bytes[](RETURNDATASIZE());
            RETURNDATACOPY(v49.data, 0, RETURNDATASIZE());
        }
        require(v45, Error('SafeERC20: low-level call failed'));
        if (MEM[v48]) {
            require(32 + v48 + MEM[v48] - (32 + v48) >= 32);
            require(MEM[32 + v48] == MEM[32 + v48]);
            require(MEM[32 + v48], Error('SafeERC20: ERC20 operation did not succeed'));
        }
        v41 = 0x3923(v41);
    }
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
    } else if (0x8186787f > function_selector >> 224) {
        if (0x51a870e7 > function_selector >> 224) {
            if (0x11fe65fa == function_selector >> 224) {
                0x11fe65fa();
            } else if (0x150b7a02 == function_selector >> 224) {
                onERC721Received(address,address,uint256,bytes);
            } else if (0x23e30c8b == function_selector >> 224) {
                onFlashLoan(address,address,uint256,uint256,bytes);
            } else if (0x2ecc10f9 == function_selector >> 224) {
                0x2ecc10f9();
            } else {
                require(0x3895e410 == function_selector >> 224);
                0x3895e410();
            }
        } else if (0x51a870e7 == function_selector >> 224) {
            0x51a870e7();
        } else if (0x715018a6 == function_selector >> 224) {
            renounceOwnership();
        } else if (0x7323f460 == function_selector >> 224) {
            0x7323f460();
        } else if (0x785e07b3 == function_selector >> 224) {
            destroyAndTransfer(address);
        } else if (0x7927b76c == function_selector >> 224) {
            0x7927b76c();
        } else {
            require(0x804ff143 == function_selector >> 224);
            getNftIds();
        }
    } else if (0xc3525c28 > function_selector >> 224) {
        if (0x8186787f == function_selector >> 224) {
            0x8186787f();
        } else if (0x8264d100 == function_selector >> 224) {
            0x8264d100();
        } else if (0x8d14e127 == function_selector >> 224) {
            setWhiteList(address,bool);
        } else if (0x8da5cb5b == function_selector >> 224) {
            owner();
        } else {
            require(0x9e5288a0 == function_selector >> 224);
            getStep();
        }
    } else if (0xc3525c28 == function_selector >> 224) {
        HEALTH_FACTOR_LIQUIDATION_THRESHOLD();
    } else if (0xce5bc45f == function_selector >> 224) {
        0xce5bc45f();
    } else if (0xd72e1911 == function_selector >> 224) {
        0xd72e1911();
    } else if (0xe3d670d7 == function_selector >> 224) {
        balance(address);
    } else if (0xf04f2707 == function_selector >> 224) {
        receiveFlashLoan(address[],uint256[],uint256[],bytes);
    } else {
        require(0xf2fde38b == function_selector >> 224);
        transferOwnership(address);
    }
}
