// Decompiled by library.dedaub.com
// 2022.12.19 09:32 UTC

// Data structures and variables inferred from the use of storage instructions
uint256 _onERC1155Received; // STORAGE[0x3]
uint256 stor_4; // STORAGE[0x4]
uint256 stor_5; // STORAGE[0x5]
uint256 _uniswapV2Call; // STORAGE[0x6]
address owner_0_0_19; // STORAGE[0x0] bytes 0 to 19
address owner_1_0_19; // STORAGE[0x1] bytes 0 to 19
uint160 stor_2_0_19; // STORAGE[0x2] bytes 0 to 19
address stor_18_0_19; // STORAGE[0x18] bytes 0 to 19
address stor_19_0_19; // STORAGE[0x19] bytes 0 to 19


function 0xf0136a63() public nonPayable { 
    v0 = v1 = msg.sender == owner_0_0_19;
    if (msg.sender != owner_0_0_19) {
        v0 = v2 = msg.sender == owner_1_0_19;
    }
    require(v0, Error('Not authorized'));
    _onERC1155Received = 0;
    stor_4 = 0;
    stor_5 = 0;
    _uniswapV2Call = 0;
}

function onERC1155Received(address varg0, address varg1, uint256 varg2, uint256 varg3, bytes varg4) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 160);
    require(varg0 == varg0);
    require(varg1 == varg1);
    0x21d5(varg2);
    0x21d5(varg4);
    require(varg3 <= 0xffffffffffffffff);
    require(4 + varg3 + 31 < 4 + (msg.data.length - 4));
    require(varg3.length <= 0xffffffffffffffff);
    require(varg3.data + varg3.length <= 4 + (msg.data.length - 4));
    if (_onERC1155Received != 0) {
        if (_onERC1155Received == 1) {
            v0 = 0x2007(_onERC1155Received);
            _onERC1155Received = v0;
            require(stor_19_0_19.code.size);
            v1, v2 = stor_19_0_19.getNextId().gas(msg.gas);
            require(v1); // checks call status, propagates error data on error
            require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
            0x21d5(v2);
            require(v2 >= 1, Panic(17));
            require(stor_18_0_19.code.size);
            v3, v4 = stor_18_0_19.depositAdditionalToFNFT(v2 - 1, stor_4, 1).gas(msg.gas);
            require(v3); // checks call status, propagates error data on error
            MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
            require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
            0x21d5(v4);
        }
    } else {
        v5 = 0x2007(_onERC1155Received);
        _onERC1155Received = v5;
    }
    return 0xf23a6e6100000000000000000000000000000000000000000000000000000000;
}

function _SafeDiv(uint256 varg0, uint256 varg1) private { 
    require(varg1, Panic(18));
    return varg0 / varg1;
}

function _SafeMul(uint256 varg0, uint256 varg1) private { 
    require(!(varg0 & (varg1 > 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff / varg0)), Panic(17));
    return varg0 * varg1;
}

function 0x2007(uint256 varg0) private { 
    require(varg0 != 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, Panic(17));
    return varg0 + 1;
}

function 0x21d5(uint256 varg0) private { 
    require(varg0 == varg0);
    return ;
}

function () public payable { 
}

function uniswapV2Call(address varg0, uint256 varg1, uint256 varg2, bytes varg3) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 128);
    require(varg0 == varg0);
    0x21d5(varg1);
    0x21d5(varg2);
    require(varg3 <= 0xffffffffffffffff);
    require(4 + varg3 + 31 < 4 + (msg.data.length - 4));
    require(varg3.length <= 0xffffffffffffffff);
    require(varg3.data + varg3.length <= 4 + (msg.data.length - 4));
    require(_uniswapV2Call < 4, Panic(50));
    MEM[96 + MEM[64]] = 0;
    require(_uniswapV2Call < 4, Panic(50));
    MEM[96 + MEM[64]] = 0;
    v0 = new uint256[](1);
    if (1) {
        CALLDATACOPY(v0.data, msg.data.length, 32);
    }
    if (1) {
        CALLDATACOPY(v1.data, msg.data.length, 32);
    }
    v2 = new uint256[](1);
    if (1) {
        CALLDATACOPY(v2.data, msg.data.length, 32);
    }
    require(0 < v0.length, Panic(50));
    v3 = v0.data;
    v0[0] = address(this);
    require(0 < v1.length, Panic(50));
    require(0 < v2.length, Panic(50));
    v4 = v2.data;
    v2[0] = stor_5;
    MEM[MEM[64]] = 0x2e236bc00000000000000000000000000000000000000000000000000000000;
    v5 = new array[](v0.length);
    v6 = v7 = v5.data;
    v8 = v9 = v0.data;
    v10 = v11 = 0;
    while (v10 < v0.length) {
        MEM[v6] = address(MEM[v8]);
        v6 = v6 + 32;
        v8 = v8 + 32;
        v10 = v10 + 1;
    }
    v6 = new array[](v1.length);
    v12 = v13 = v6.data;
    v14 = v15 = v1.data;
    v16 = v17 = 0;
    while (v16 < v1.length) {
        MEM[v12] = MEM[v14];
        v12 = v12 + 32;
        v14 = v14 + 32;
        v16 = v16 + 1;
    }
    require(stor_18_0_19.code.size);
    v18, v19 = stor_18_0_19.call(0x2e236bc, address(this), 1, v20.data, v21, address(STORAGE[_uniswapV2Call + 15]), 0, 0, v21, 0, 0, 0, 1, 0, v21, v21, address(this), v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v6, v21, MEM[MEM[64] + 11079]).gas(msg.gas);
    require(v18); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x21d5(v19);
    v22 = new array[](v0.length);
    v23 = v24 = v22.data;
    v25 = v26 = v0.data;
    v27 = v28 = 0;
    while (v27 < v0.length) {
        MEM[v23] = address(MEM[v25]);
        v23 = v23 + 32;
        v25 = v25 + 32;
        v27 = v27 + 1;
    }
    v23 = new array[](v2.length);
    v29 = v30 = v23.data;
    v31 = v32 = v2.data;
    v33 = v34 = 0;
    while (v33 < v2.length) {
        MEM[v29] = MEM[v31];
        v29 = v29 + 32;
        v31 = v31 + 32;
        v33 = v33 + 1;
    }
    require(stor_18_0_19.code.size);
    v35, v36 = stor_18_0_19.call(0x2e236bc, address(this), 1, v37.data, v21, address(STORAGE[_uniswapV2Call + 15]), 0, 0, v21, 0, 0, 0, 1, 0, v21, v21, address(this), v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v21, v23, v21, MEM[MEM[64] + 11079]).gas(msg.gas);
    require(v35); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x21d5(v36);
    require(0 < v2.length, Panic(50));
    v38 = v2.data;
    require(1 <= 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff - v2[0], Panic(17));
    require(stor_18_0_19.code.size);
    v39 = stor_18_0_19.withdrawFNFT(v36, 1 + v2[0]).gas(msg.gas);
    require(v39); // checks call status, propagates error data on error
    if (varg1 != 0) {
        require(_uniswapV2Call < 4, Panic(50));
        require(_uniswapV2Call < 4, Panic(50));
        v40 = _SafeMul(varg1, 1100);
        v41 = _SafeDiv(v40, 1000);
        require((address(STORAGE[_uniswapV2Call + 15])).code.size);
        v42, v43 = address(STORAGE[_uniswapV2Call + 15]).transfer(address(STORAGE[_uniswapV2Call + 20]), v41).gas(msg.gas);
        require(v42); // checks call status, propagates error data on error
        MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v43 == v43);
    } else {
        require(_uniswapV2Call < 4, Panic(50));
        require(_uniswapV2Call < 4, Panic(50));
        v44 = _SafeMul(varg2, 1100);
        v45 = _SafeDiv(v44, 1000);
        require((address(STORAGE[_uniswapV2Call + 15])).code.size);
        v46, v47 = address(STORAGE[_uniswapV2Call + 15]).transfer(address(STORAGE[_uniswapV2Call + 20]), v45).gas(msg.gas);
        require(v46); // checks call status, propagates error data on error
        MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v47 == v47);
    }
}

function 0x2b6a3f7e(uint256 varg0, uint256 varg1, uint256 varg2) public payable { 
    require(4 + (msg.data.length - 4) - 4 >= 10467);
    require(varg0 == address(varg0));
    0x21d5(varg1);
    require(varg2 <= 0xffffffffffffffff);
    require(4 + varg2 + 31 < 4 + (msg.data.length - 4));
    require(varg2.length <= 0xffffffffffffffff);
    require(varg2.data + varg2.length <= 4 + (msg.data.length - 4));
    v0 = v1 = msg.sender == owner_0_0_19;
    if (msg.sender != owner_0_0_19) {
        v0 = msg.sender == owner_1_0_19;
    }
    require(v0, Error('Not authorized'));
    require(address(varg0) != 0);
    MEM[MEM[64] + varg2.length] = 0;
    v2, v3 = address(varg0).call(MEM[(MEM[64]) len (MEM[64] + varg2.length - MEM[64])], MEM[(MEM[64]) len 0]).value(varg1).gas(msg.gas);
    if (RETURNDATASIZE() == 0) {
        v4 = v5 = 9891;
    } else {
        v4 = v6 = new bytes[](RETURNDATASIZE());
        RETURNDATACOPY(v6.data, 0, RETURNDATASIZE());
    }
    require(v2);
    v7 = new array[](MEM[v4]);
    v8 = v9 = 0;
    while (v8 < MEM[v4]) {
        v7[v8] = MEM[v4 + 32 + v8];
        v8 = v8 + 32;
    }
    if (v8 > MEM[v4]) {
        v7[MEM[v4]] = 0;
    }
    return v7;
}

function tokensToSend(address varg0, address varg1, address varg2, uint256 varg3, bytes varg4, bytes varg5) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 192);
    require(varg0 == varg0);
    require(varg1 == varg1);
    require(varg2 == varg2);
    0x21d5(varg5);
    require(varg3 <= 0xffffffffffffffff);
    require(4 + varg3 + 31 < 4 + (msg.data.length - 4));
    require(varg3.length <= 0xffffffffffffffff, Panic(65));
    v0 = new bytes[](varg3.length);
    require(!((v0 + ((varg3.length + 31 & ~0x1f) + 32 + 31 & ~0x1f) > 0xffffffffffffffff) | (v0 + ((varg3.length + 31 & ~0x1f) + 32 + 31 & ~0x1f) < v0)), Panic(65));
    require(varg3.data + varg3.length <= 4 + (msg.data.length - 4));
    CALLDATACOPY(v0.data, varg3.data, varg3.length);
    v0[varg3.length] = 0;
    require(varg4 <= 0xffffffffffffffff);
    require(4 + varg4 + 31 < 4 + (msg.data.length - 4));
    require(varg4.length <= 0xffffffffffffffff, Panic(65));
    v1 = new bytes[](varg4.length);
    require(!((v1 + ((varg4.length + 31 & ~0x1f) + 32 + 31 & ~0x1f) > 0xffffffffffffffff) | (v1 + ((varg4.length + 31 & ~0x1f) + 32 + 31 & ~0x1f) < v1)), Panic(65));
    require(varg4.data + varg4.length <= 4 + (msg.data.length - 4));
    CALLDATACOPY(v1.data, varg4.data, varg4.length);
    v1[varg4.length] = 0;
}

function 0xdd869c35(uint256 varg0, uint256 varg1, uint256 varg2) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 11007);
    0x21d5(varg0);
    0x21d5(varg1);
    0x21d5(varg2);
    v0 = v1 = msg.sender == owner_0_0_19;
    if (msg.sender != owner_0_0_19) {
        v0 = v2 = msg.sender == owner_1_0_19;
    }
    require(v0, Error('Not authorized'));
    stor_4 = varg1;
    stor_5 = varg2;
    _uniswapV2Call = varg0;
    require(0x1820a4b7618bde71dce8cdc73aab6c95905fad24.code.size);
    v3 = 0x1820a4b7618bde71dce8cdc73aab6c95905fad24.setInterfaceImplementer(address(this), 0x29ddb589b1fb5fc7cf394961c1adf5f8c6454761adf795e67fe149f658abe895, address(this)).gas(msg.gas);
    require(v3); // checks call status, propagates error data on error
    require(_uniswapV2Call < 4, Panic(50));
    require((address(STORAGE[_uniswapV2Call + 15])).code.size);
    v4, v5 = address(STORAGE[_uniswapV2Call + 15]).approve(0x2320a28f52334d62622cc2eafa15de55f9987ed9, 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff).gas(msg.gas);
    require(v4); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v5 == v5);
    require(_uniswapV2Call < 4, Panic(50));
    if (!(0xff & STORAGE[(_uniswapV2Call >> 5) + 19] / 256 ** (_uniswapV2Call % 32))) {
        require(_uniswapV2Call < 4, Panic(50));
        v6 = _SafeMul(2, stor_4);
        MEM[4 + MEM[64] + 11187] = 128;
        require((address(STORAGE[_uniswapV2Call + 20])).code.size);
        v7 = address(STORAGE[_uniswapV2Call + 20]).swap(0, v6, address(this), v8, 1, 0x7800000000000000000000000000000000000000000000000000000000000000).gas(msg.gas);
        require(v7); // checks call status, propagates error data on error
    } else {
        require(_uniswapV2Call < 4, Panic(50));
        v9 = _SafeMul(2, stor_4);
        MEM[4 + MEM[64] + 11223] = 128;
        require((address(STORAGE[_uniswapV2Call + 20])).code.size);
        v10 = address(STORAGE[_uniswapV2Call + 20]).swap(v9, 0, address(this), v8, 1, 0x7800000000000000000000000000000000000000000000000000000000000000).gas(msg.gas);
        require(v10); // checks call status, propagates error data on error
    }
    require(_uniswapV2Call < 4, Panic(50));
    require(_uniswapV2Call < 4, Panic(50));
    require((address(STORAGE[_uniswapV2Call + 15])).code.size);
    v11, v12 = address(STORAGE[_uniswapV2Call + 15]).balanceOf(address(this)).gas(msg.gas);
    require(v11); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x21d5(v12);
    require((address(STORAGE[_uniswapV2Call + 15])).code.size);
    v13, v14 = address(STORAGE[_uniswapV2Call + 15]).transfer(stor_2_0_19, v12).gas(msg.gas);
    require(v13); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v14 == v14);
    _onERC1155Received = 0;
    stor_4 = 0;
    stor_5 = 0;
    _uniswapV2Call = 0;
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__(bytes4 function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length < 4) {
        require(!msg.data.length);
        ();
    } else if (0x10d1e85c == function_selector >> 224) {
        uniswapV2Call(address,uint256,uint256,bytes);
    } else if (0x2b6a3f7e == function_selector >> 224) {
        0x2b6a3f7e();
    } else if (0x75ab9782 == function_selector >> 224) {
        tokensToSend(address,address,address,uint256,bytes,bytes);
    } else if (0xdd869c35 == function_selector >> 224) {
        0xdd869c35();
    } else if (0xf0136a63 == function_selector >> 224) {
        0xf0136a63();
    } else {
        require(0xf23a6e61 == function_selector >> 224);
        onERC1155Received(address,address,uint256,uint256,bytes);
    }
}
