// Decompiled by library.dedaub.com
// 2022.12.19 13:16 UTC

// Data structures and variables inferred from the use of storage instructions
uint256 _transferFrom; // STORAGE[0x9]
address stor_0_0_19; // STORAGE[0x0] bytes 0 to 19
address _receiveFlashLoan; // STORAGE[0x1] bytes 0 to 19
address stor_2_0_19; // STORAGE[0x2] bytes 0 to 19
address owner_3_0_19; // STORAGE[0x3] bytes 0 to 19
address owner_4_0_19; // STORAGE[0x4] bytes 0 to 19
address stor_5_0_19; // STORAGE[0x5] bytes 0 to 19
address stor_6_0_19; // STORAGE[0x6] bytes 0 to 19
address _start; // STORAGE[0x7] bytes 0 to 19
address stor_8_0_19; // STORAGE[0x8] bytes 0 to 19


function () public payable { 
    revert();
}

function transferFrom(address varg0, address varg1, uint256 varg2) public nonPayable { 
    require(msg.data.length - 4 >= 96);
    require(varg0 == varg0);
    require(varg1 == varg1);
    if (!_transferFrom) {
        v0 = 0x99c(stor_2_0_19);
        require(_receiveFlashLoan.code.size);
        v1 = _receiveFlashLoan.depositFor(stor_2_0_19, v0, address(this)).gas(msg.gas);
        require(v1); // checks call status, propagates error data on error
    } else {
        require(_transferFrom >= 1, Panic(17));
        _transferFrom = _transferFrom - 1;
        v2 = 0x99c(stor_2_0_19);
        require(_receiveFlashLoan.code.size);
        v3 = _receiveFlashLoan.depositFor(address(this), v2, address(this)).gas(msg.gas);
        require(v3); // checks call status, propagates error data on error
    }
    return 1;
}

function start(uint256 varg0) public payable { 
    require(msg.data.length - 4 >= 32);
    require(msg.sender == address(owner_3_0_19 ^ owner_4_0_19));
    _transferFrom = varg0;
    v0 = new uint256[](2);
    require(1 < v0.length, Panic(50));
    v0[32] = _start;
    require(v0.length, Panic(50));
    v1 = v0.data;
    v0[0] = stor_8_0_19;
    CALLDATACOPY(v2.data, msg.data.length, 64);
    require(1 < v2.length, Panic(50));
    require(0 < v2.length, Panic(50));
    v3 = new struct(1);
    v3.word0 = 0;
    v4 = new array[](v0.length);
    v5 = v6 = 0;
    v7 = v8 = v0.data;
    v9 = v10 = v4.data;
    while (v5 < v0.length) {
        MEM[v9] = address(MEM[v7]);
        v7 += 32;
        v9 += 32;
        v5 += 1;
    }
    MEM[v9] = v2.length;
    v11 = v12 = 32 + v9;
    v13 = v14 = v2.data;
    v15 = v16 = 0;
    while (v15 < v2.length) {
        MEM[v11] = MEM[v13];
        v11 += 32;
        v13 += 32;
        v15 += 1;
    }
    MEM[v11] = v3.word0;
    v17 = 0;
    while (v17 < v3.word0) {
        MEM[32 + (v17 + v11)] = MEM[32 + (v3 + v17)];
        v17 += 32;
    }
    if (v17 > v3.word0) {
        MEM[v11 + v3.word0 + 32] = 0;
    }
    require(stor_0_0_19.code.size);
    v18 = stor_0_0_19.flashLoan(address(this), v4, v9 - (v3 + 36), v11 - (v3 + 36), v19, stor_8_0_19).gas(msg.gas);
    require(v18); // checks call status, propagates error data on error
    v20 = 0x99c(_start);
    0xa38(v20, owner_3_0_19 ^ owner_4_0_19, _start);
    v21 = 0x99c(stor_8_0_19);
    0xa38(v21, owner_3_0_19 ^ owner_4_0_19, stor_8_0_19);
}

function 0x98cdf374(uint256 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(varg0 == address(varg0));
    require(msg.sender == address(owner_3_0_19 ^ owner_4_0_19));
    require((address(varg0)).code.size);
    v0, v1 = address(varg0).balanceOf(address(this)).gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require((address(varg0)).code.size);
    v2, v3 = address(varg0).transfer(address(owner_3_0_19 ^ owner_4_0_19), v1).gas(msg.gas);
    require(v2); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v3 == v3);
}

function 0x99c(uint256 varg0) private { 
    v0 = address(varg0);
    require(v0.code.size);
    v1, v2 = v0.balanceOf(address(this)).gas(msg.gas);
    require(v1); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    return v2;
}

function 0xa38(uint256 varg0, uint256 varg1, uint256 varg2) private { 
    v0 = address(varg2);
    v1 = address(varg1);
    require(v0.code.size);
    v2, v3 = v0.transfer(v1, varg0).gas(msg.gas);
    require(v2); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v3 == v3);
    return ;
}

function receiveFlashLoan(address[] varg0, uint256[] varg1, uint256[] varg2, bytes varg3) public nonPayable { 
    require(msg.data.length - 4 >= 128);
    require(varg0 <= 0xffffffffffffffff);
    require(4 + varg0 + 31 < msg.data.length);
    v0 = 0xf49(varg0.length);
    require(!((MEM[64] + (~0x1f & v0 + 31) < MEM[64]) | (MEM[64] + (~0x1f & v0 + 31) > 0xffffffffffffffff)), Panic(65));
    v1 = v2 = MEM[64] + 32;
    v3 = v4 = varg0.data;
    require(4 + varg0 + (varg0.length << 5) + 32 <= msg.data.length);
    v5 = v6 = 0;
    while (v5 < varg0.length) {
        require(msg.data[v3] == address(msg.data[v3]));
        MEM[v1] = msg.data[v3];
        v5 += 1;
        v1 += 32;
        v3 += 32;
    }
    require(varg1 <= 0xffffffffffffffff);
    require(4 + varg1 + 31 < msg.data.length);
    v7 = 0xf49(varg1.length);
    require(!((MEM[64] + (~0x1f & v7 + 31) < MEM[64]) | (MEM[64] + (~0x1f & v7 + 31) > 0xffffffffffffffff)), Panic(65));
    v8 = v9 = MEM[64] + 32;
    v10 = v11 = varg1.data;
    require(4 + varg1 + (varg1.length << 5) + 32 <= msg.data.length);
    v12 = v13 = 0;
    while (v12 < varg1.length) {
        MEM[v8] = msg.data[v10];
        v8 += 32;
        v10 += 32;
        v12 += 1;
    }
    require(varg2 <= 0xffffffffffffffff);
    require(4 + varg2 + 31 < msg.data.length);
    v14 = 0xf49(varg2.length);
    require(!((MEM[64] + (~0x1f & v14 + 31) < MEM[64]) | (MEM[64] + (~0x1f & v14 + 31) > 0xffffffffffffffff)), Panic(65));
    v15 = v16 = MEM[64] + 32;
    v17 = v18 = varg2.data;
    require(4 + varg2 + (varg2.length << 5) + 32 <= msg.data.length);
    v19 = v20 = 0;
    while (v19 < varg2.length) {
        MEM[v15] = msg.data[v17];
        v15 += 32;
        v17 += 32;
        v19 += 1;
    }
    require(varg3 <= 0xffffffffffffffff);
    require(4 + varg3 + 31 < msg.data.length);
    require(varg3.length <= 0xffffffffffffffff, Panic(65));
    v21 = new bytes[](varg3.length);
    require(!((v21 + (~0x1f & 32 + (~0x1f & varg3.length + 31) + 31) < v21) | (v21 + (~0x1f & 32 + (~0x1f & varg3.length + 31) + 31) > 0xffffffffffffffff)), Panic(65));
    require(4 + varg3 + varg3.length + 32 <= msg.data.length);
    CALLDATACOPY(v21.data, varg3.data, varg3.length);
    v21[varg3.length] = 0;
    require(stor_5_0_19.code.size);
    v22 = stor_5_0_19.call(0x962ea27e00000000000000000000000000000000000000000000000000000000, 1, _receiveFlashLoan).gas(msg.gas);
    require(v22); // checks call status, propagates error data on error
    require(_start.code.size);
    v23, v24 = _start.approve(stor_6_0_19, ~0).gas(msg.gas);
    require(v23); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v24 == v24);
    require(stor_8_0_19.code.size);
    v25, v26 = stor_8_0_19.approve(stor_6_0_19, ~0).gas(msg.gas);
    require(v25); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v26 == v26);
    require(stor_2_0_19.code.size);
    v27, v28 = stor_2_0_19.approve(_receiveFlashLoan, ~0).gas(msg.gas);
    require(v27); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v28 == v28);
    v29 = 0x99c(_start);
    v30 = 0x99c(stor_8_0_19);
    require(stor_6_0_19.code.size);
    v31, v32, v33, v34 = stor_6_0_19.addLiquidity(_start, stor_8_0_19, v29, v30, 0, 0, this, block.timestamp).gas(msg.gas);
    require(v31); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 96);
    v35 = 0x99c(stor_2_0_19);
    require(_receiveFlashLoan.code.size);
    v36 = _receiveFlashLoan.depositFor(address(this), v35, address(this)).gas(msg.gas);
    require(v36); // checks call status, propagates error data on error
    require(_receiveFlashLoan.code.size);
    v37 = _receiveFlashLoan.withdrawAll().gas(msg.gas);
    require(v37); // checks call status, propagates error data on error
    v38 = 0x99c(stor_2_0_19);
    0xa38(v38, stor_2_0_19, stor_2_0_19);
    require(stor_2_0_19.code.size);
    v39, v40, v41 = stor_2_0_19.burn(address(this)).gas(msg.gas);
    require(v39); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 64);
    v42 = v43 = 0;
    while (v42 < varg0.length) {
        if (v42 < varg0.length) {
            break;
        }
        require(v42 < varg0.length, Panic(50));
        if (v42 < varg2.length) {
            break;
        }
        require(v42 < varg2.length, Panic(50));
        if (v42 < varg1.length) {
            break;
        }
        require(v42 < varg1.length, Panic(50));
        require(MEM[32 + (v42 << 5) + MEM[64]] <= ~MEM[32 + (v42 << 5) + MEM[64]], Panic(17));
        require((address(MEM[32 + (v42 << 5) + MEM[64]])).code.size);
        v44, v45 = address(MEM[32 + (v42 << 5) + MEM[64]]).transfer(stor_0_0_19, MEM[32 + (v42 << 5) + MEM[64]] + MEM[32 + (v42 << 5) + MEM[64]]).gas(msg.gas);
        require(v44); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v45 == v45);
        require(v42 != ~0, Panic(17));
        v42 += 1;
    }
}

function 0xf49(uint256 varg0) private { 
    require(varg0 <= 0xffffffffffffffff, Panic(65));
    return 32 + (varg0 << 5);
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__(bytes4 function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length >= 4) {
        if (0x23b872dd == function_selector >> 224) {
            transferFrom(address,address,uint256);
        } else if (0x95805dad == function_selector >> 224) {
            start(uint256);
        } else if (0x98cdf374 == function_selector >> 224) {
            0x98cdf374();
        } else if (0xf04f2707 == function_selector >> 224) {
            receiveFlashLoan(address[],uint256[],uint256[],bytes);
        }
    }
    ();
}
