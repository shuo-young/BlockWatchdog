// Decompiled by library.dedaub.com
// 2023.01.13 07:19 UTC

// Data structures and variables inferred from the use of storage instructions
uint256 stor_8; // STORAGE[0x8]
uint256 stor_9; // STORAGE[0x9]
uint256 stor_a; // STORAGE[0xa]
uint256 stor_b; // STORAGE[0xb]
address stor_0_0_19; // STORAGE[0x0] bytes 0 to 19
address stor_1_0_19; // STORAGE[0x1] bytes 0 to 19
address stor_2_0_19; // STORAGE[0x2] bytes 0 to 19
address _uniswapV2Call; // STORAGE[0x3] bytes 0 to 19
address stor_4_0_19; // STORAGE[0x4] bytes 0 to 19
address stor_5_0_19; // STORAGE[0x5] bytes 0 to 19
address stor_6_0_19; // STORAGE[0x6] bytes 0 to 19
address stor_7_0_19; // STORAGE[0x7] bytes 0 to 19
address _changeOwner; // STORAGE[0xc] bytes 0 to 19


function () public payable {
}

function uniswapV2Call(address varg0, uint256 varg1, uint256 varg2, bytes varg3) public nonPayable {
    require(msg.data.length - 4 >= 128);
    require(varg0 == varg0);
    require(varg3 <= 0xffffffffffffffff);
    require(4 + varg3 + 31 < msg.data.length);
    require(varg3.length <= 0xffffffffffffffff);
    require(4 + varg3 + varg3.length + 32 <= msg.data.length);
    if (varg1 <= 0) {
    }
    require(_uniswapV2Call.code.size);
    v0, v1 = _uniswapV2Call.approve(stor_1_0_19, ~0).gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v1 == v1);
    require(_uniswapV2Call.code.size);
    v2 = _uniswapV2Call.withdraw(v3).gas(msg.gas);
    require(v2); // checks call status, propagates error data on error
    require(stor_2_0_19.code.size);
    v4 = stor_2_0_19.mint().value(this.balance).gas(msg.gas);
    require(v4); // checks call status, propagates error data on error
    v5 = new uint256[](1);
    if (1) {
        CALLDATACOPY(v5.data, msg.data.length, 32);
    }
    require(v5.length, Panic(50));
    v6 = v5.data;
    v5[0] = stor_2_0_19;
    MEM[MEM[64]] = 0xc299823800000000000000000000000000000000000000000000000000000000;
    v7 = new array[](v5.length);
    v8 = v9 = 0;
    v10 = v11 = v7.data;
    v12 = v13 = v5.data;
    while (v8 < v5.length) {
        MEM[v10] = address(MEM[v12]);
        v10 += 32;
        v12 += 32;
        v8 += 1;
    }
    require(stor_4_0_19.code.size);
    v14, v15 = stor_4_0_19.enterMarkets(v7, v16, stor_2_0_19).gas(msg.gas);
    require(v14); // checks call status, propagates error data on error
    RETURNDATACOPY(v15, 0, RETURNDATASIZE());
    MEM[64] = v15 + (~0x1f & RETURNDATASIZE() + 31);
    v17 = v18 = 0;
    require(v15 + RETURNDATASIZE() - v15 >= 32v18, v18);
    require(MEM[v15] <= 0xffffffffffffffffv18, v18);
    require(v15 + MEM[v15] + 31 < v15 + RETURNDATASIZE()v18, v18);
    require(MEM[v15 + MEM[v15]] <= 0xffffffffffffffff, Panic(65));
    require(!((MEM[64] + ((MEM[v15 + MEM[v15]] << 5) + 63 & ~0x1f) > 0xffffffffffffffff) | (MEM[64] + ((MEM[v15 + MEM[v15]] << 5) + 63 & ~0x1f) < MEM[64])), Panic(65));
    MEM[64] = MEM[64] + ((MEM[v15 + MEM[v15]] << 5) + 63 & ~0x1f);
    MEM[MEM[64]] = MEM[v15 + MEM[v15]];
    v19 = v20 = MEM[64] + 32;
    v21 = v22 = 32 + (v15 + MEM[v15]);
    require(v15 + RETURNDATASIZE() >= 32 + (v15 + MEM[v15] + (MEM[v15 + MEM[v15]] << 5))v18, v18);
    while (v17 < MEM[v15 + MEM[v15]]) {
        MEM[v19] = MEM[v21];
        v17 += 1;
        v19 += 32;
        v21 += 32;
    }
    require(stor_1_0_19.code.size);
    v23, v24 = stor_1_0_19.borrow(stor_a).gas(msg.gas);
    require(v23); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    if (this.balance) {
        require(_uniswapV2Call.code.size);
        v25 = _uniswapV2Call.deposit().value(this.balance).gas(msg.gas);
        require(v25); // checks call status, propagates error data on error
    }
    require(stor_6_0_19.code.size);
    v26, v27 = stor_6_0_19.approve(stor_5_0_19, ~0).gas(msg.gas);
    require(v26); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v27 == v27);
    v28 = new uint256[](2);
    require(v28.length, Panic(50));
    v29 = v28.data;
    v28[0] = stor_6_0_19;
    require(1 < v28.length, Panic(50));
    v28[32] = _uniswapV2Call;
    v30 = 0x992(_uniswapV2Call);
    v31 = 0xa12(v3);
    require(v31 >= v30, Panic(17));
    v32 = new array[](v28.length);
    v33 = v34 = 0;
    v35 = v36 = v32.data;
    v37 = v38 = v28.data;
    while (v33 < v28.length) {
        MEM[v35] = address(MEM[v37]);
        v35 += 32;
        v37 += 32;
        v33 += 1;
    }
    require(stor_5_0_19.code.size);
    v39, v40 = stor_5_0_19.swapTokensForExactTokens(v31 - v30, ~0, v32, address(this), block.timestamp, v16, stor_6_0_19).gas(msg.gas);
    require(v39); // checks call status, propagates error data on error
    RETURNDATACOPY(v40, 0, RETURNDATASIZE());
    MEM[64] = v40 + (~0x1f & RETURNDATASIZE() + 31);
    v41 = v42 = 0;
    require(v40 + RETURNDATASIZE() - v40 >= 32v42, v42);
    require(MEM[v40] <= 0xffffffffffffffffv42, v42);
    require(v40 + MEM[v40] + 31 < v40 + RETURNDATASIZE()v42, v42);
    require(MEM[v40 + MEM[v40]] <= 0xffffffffffffffff, Panic(65));
    require(!((MEM[64] + ((MEM[v40 + MEM[v40]] << 5) + 63 & ~0x1f) > 0xffffffffffffffff) | (MEM[64] + ((MEM[v40 + MEM[v40]] << 5) + 63 & ~0x1f) < MEM[64])), Panic(65));
    MEM[64] = MEM[64] + ((MEM[v40 + MEM[v40]] << 5) + 63 & ~0x1f);
    MEM[MEM[64]] = MEM[v40 + MEM[v40]];
    v43 = v44 = MEM[64] + 32;
    v45 = v46 = 32 + (v40 + MEM[v40]);
    require(v40 + RETURNDATASIZE() >= 32 + (v40 + MEM[v40] + (MEM[v40 + MEM[v40]] << 5))v42, v42);
    while (v41 < MEM[v40 + MEM[v40]]) {
        MEM[v43] = MEM[v45];
        v41 += 1;
        v43 += 32;
        v45 += 32;
    }
    v47 = 0xa12(v3);
    0xa3a(v47, stor_0_0_19, _uniswapV2Call);
}

function start(uint256 varg0, uint256 varg1, uint256 varg2) public nonPayable {
    require(msg.data.length - 4 >= 96);
    require(msg.sender == _changeOwner, Error(0x7775740000000000000000000000000000000000000000000000000000000000));
    if (!stor_9) {
        v0 = v1 = 0;
        while (v0 < v2.length) {
            MEM[v0 + (32 + MEM[64])] = v2[v0];
            v0 += 32;
        }
        if (v0 > v2.length) {
            MEM[32 + MEM[64] + v2.length] = 0;
        }
        require(stor_7_0_19.code.size);
        v3 = stor_7_0_19.setInterfaceImplementer(this, keccak256('AmpTokensRecipient'), this).gas(msg.gas);
        require(v3); // checks call status, propagates error data on error
        stor_9 = 1;
    }
    stor_a = varg1;
    stor_b = varg2;
    v4 = new uint256[](1);
    MEM[MEM[64]] = 0x22c0d9f00000000000000000000000000000000000000000000000000000000;
    v5 = new array[](v4.length);
    v6 = v7 = 0;
    while (v6 < v4.length) {
        v5[v6] = v4[v6];
        v6 += 32;
    }
    if (v6 > v4.length) {
        v5[v4.length] = 0;
    }
    require(stor_0_0_19.code.size);
    v8 = stor_0_0_19.swap(0, varg0, address(this), v5).gas(msg.gas);
    require(v8); // checks call status, propagates error data on error
    v9 = 0x992(stor_6_0_19);
    0xa3a(v9, _changeOwner, stor_6_0_19);
}

function 0x801(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5, uint256 varg6, uint256 varg7, uint256 varg8, uint256 varg9) private {
    require(stor_2_0_19.code.size);
    v0, v1 = stor_2_0_19.borrow(stor_b).gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    return ;
}

function tokensReceived(bytes4 varg0, bytes32 varg1, address varg2, address varg3, address varg4, uint256 varg5, bytes varg6, bytes varg7) public nonPayable {
    require(msg.data.length - 4 >= 256);
    require(varg0 == varg0 & ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
    require(varg2 == varg2);
    require(varg3 == varg3);
    require(varg4 == varg4);
    require(varg6 <= 0xffffffffffffffff);
    require(4 + varg6 + 31 < msg.data.length);
    require(varg6.length <= 0xffffffffffffffff);
    require(4 + varg6 + varg6.length + 32 <= msg.data.length);
    require(varg7 <= 0xffffffffffffffff);
    require(4 + varg7 + 31 < msg.data.length);
    require(varg7.length <= 0xffffffffffffffff);
    require(4 + varg7 + varg7.length + 32 <= msg.data.length);
    0x801(varg7.length, varg7.data, varg6.length, varg6.data, varg5, varg4, varg3, varg2, varg1, varg0);
}

function 0x992(uint256 varg0) private {
    v0 = address(varg0);
    require(v0.code.size);
    v1, v2 = v0.balanceOf(this).gas(msg.gas);
    require(v1); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    return v2;
}

function 0xa12(uint256 varg0) private {
    require(!(varg0 & (stor_8 > ~0 / varg0)), Panic(17));
    require(10000, Panic(18));
    require(varg0 * stor_8 / 10000 <= ~varg0, Panic(17));
    return varg0 * stor_8 / 10000 + varg0;
}

function 0xa3a(uint256 varg0, uint256 varg1, uint256 varg2) private {
    v0 = address(varg1);
    v1 = address(varg2);
    require(v1.code.size);
    v2, v3 = v1.transfer(v0, varg0).gas(msg.gas);
    require(v2); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v3 == v3);
    return ;
}

function 0x98cdf374(uint256 varg0) public nonPayable {
    require(msg.data.length - 4 >= 32);
    require(varg0 == address(varg0));
    require(msg.sender == _changeOwner, Error(0x7775740000000000000000000000000000000000000000000000000000000000));
    require((address(varg0)).code.size);
    v0, v1 = address(varg0).balanceOf(this).gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require((address(varg0)).code.size);
    v2, v3 = address(varg0).transfer(_changeOwner, v1).gas(msg.gas);
    require(v2); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v3 == v3);
}

function changeOwner(address varg0) public nonPayable {
    require(msg.data.length - 4 >= 32);
    require(varg0 == varg0);
    require(msg.sender == _changeOwner, Error(0x7775740000000000000000000000000000000000000000000000000000000000));
    _changeOwner = varg0;
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__(bytes4 function_selector) public payable {
    MEM[64] = 128;
    if (msg.data.length >= 4) {
        if (0x10d1e85c == function_selector >> 224) {
            uniswapV2Call(address,uint256,uint256,bytes);
        } else if (0x641ccd83 == function_selector >> 224) {
            start(uint256,uint256,uint256);
        } else if (0x8240ef48 == function_selector >> 224) {
            tokensReceived(bytes4,bytes32,address,address,address,uint256,bytes,bytes);
        } else if (0x98cdf374 == function_selector >> 224) {
            0x98cdf374();
        } else if (0xa6f9dae1 == function_selector >> 224) {
            changeOwner(address);
        }
    }
    ();
}
