// Decompiled by library.dedaub.com
// 2023.01.14 06:59 UTC

// Data structures and variables inferred from the use of storage instructions
uint256 stor_2; // STORAGE[0x2]
address _wb; // STORAGE[0x0] bytes 0 to 19
uint8 _tokensToSend; // STORAGE[0x3] bytes 0 to 0
uint8 stor_3_1_1; // STORAGE[0x3] bytes 1 to 1
address _b; // STORAGE[0x1] bytes 0 to 19
address stor_3_2_21; // STORAGE[0x3] bytes 2 to 21
address _execute; // STORAGE[0x4] bytes 0 to 19


function 0x27e8c8f0() public nonPayable { 
    require(_b.code.size);
    v0, v1 = _b.getSupplyBalance(this, _wb).gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
    return v1;
}

function 0x4262802d() public nonPayable { 
    require(_wb.code.size);
    v0, v1 = _wb.balanceOf(_b).gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
    return v1;
}

function tokensToSend(address varg0, address varg1, address varg2, uint256 varg3, bytes varg4, bytes varg5) public nonPayable { 
    require(msg.data.length - 4 >= 192);
    require(varg4 <= 0x100000000);
    require(varg4.data <= 4 + (msg.data.length - 4));
    require(!((varg4.length > 0x100000000) | (varg4.data + varg4.length > 4 + (msg.data.length - 4))));
    require(varg5 <= 0x100000000);
    require(varg5.data <= 4 + (msg.data.length - 4));
    require(!((varg5.length > 0x100000000) | (varg5.data + varg5.length > 4 + (msg.data.length - 4))));
    if (!_tokensToSend) {
        require(_b.code.size);
        v0, v1 = _b.getSupplyBalance(this, _wb).gas(msg.gas);
        require(v0); // checks call status, propagates error data on error
        require(RETURNDATASIZE() >= 32);
        require(_wb.code.size);
        v2, v1 = _wb.balanceOf(_b).gas(msg.gas);
        require(v2); // checks call status, propagates error data on error
        require(RETURNDATASIZE() >= 32);
        if (v1 <= v1) {
        }
        require(_b.code.size);
        v3 = _b.withdraw(_wb, v1).gas(msg.gas);
        require(v3); // checks call status, propagates error data on error
        require(RETURNDATASIZE() >= 32);
    }
}

function wb() public nonPayable { 
    require(_b.code.size);
    v0, v1 = _b.getSupplyBalance(this, _wb).gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
    require(_wb.code.size);
    v2, v1 = _wb.balanceOf(_b).gas(msg.gas);
    require(v2); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
    if (v1 <= v1) {
    }
    require(_b.code.size);
    v3 = _b.withdraw(_wb, v1).gas(msg.gas);
    require(v3); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
    require(_wb.code.size);
    v4, v5 = _wb.balanceOf(this).gas(msg.gas);
    require(v4); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
    require(_wb.code.size);
    v6 = _wb.transfer(_execute, v5).gas(msg.gas);
    require(v6); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
}

function execute(address varg0, uint256 varg1, bytes varg2) public nonPayable { 
    require(msg.data.length - 4 >= 96);
    require(varg2 <= 0x100000000);
    require(varg2.data <= 4 + (msg.data.length - 4));
    require(!((varg2.length > 0x100000000) | (varg2.data + varg2.length > 4 + (msg.data.length - 4))));
    require(msg.sender == _execute);
    v0, v1, v2 = varg0.call(MEM[(MEM[64]) len (MEM[64] + varg2.length - MEM[64])], MEM[(MEM[64]) len 0]).value(varg1).gas(msg.gas);
    if (RETURNDATASIZE() == 0) {
        v3 = v4 = 96;
    } else {
        v3 = v5 = new bytes[](RETURNDATASIZE());
        v2 = v5.data;
        RETURNDATACOPY(v2, 0, RETURNDATASIZE());
    }
    require(v0, Error('Call failed'));
    v6 = new array[](MEM[v3]);
    v7 = v8 = 0;
    while (v7 < MEM[v3]) {
        v6[v7] = MEM[v7 + (v3 + 32)];
        v7 += 32;
    }
    v9 = v10 = MEM[v3] + v6.data;
    if (0x1f & MEM[v3]) {
        MEM[v10 - (0x1f & MEM[v3])] = ~(256 ** (32 - (0x1f & MEM[v3])) - 1) & MEM[v10 - (0x1f & MEM[v3])];
    }
    return v6;
}

function 0xb645ecef() public nonPayable { 
    require(_wb.code.size);
    v0, v1 = _wb.balanceOf(this).gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
    return v1;
}

function b(address varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(varg0.code.size);
    v0, v1 = varg0.balanceOf(_b).gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
    if (v1 > 100) {
        require(_b.code.size);
        v2 = _b.borrow(varg0, v1 + ~0).gas(msg.gas);
        require(v2); // checks call status, propagates error data on error
        require(RETURNDATASIZE() >= 32);
    }
}

function balanceOf(address varg0, address varg1) public nonPayable { 
    require(msg.data.length - 4 >= 64);
    require(varg0.code.size);
    v0, v1 = varg0.balanceOf(varg1).gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
    return v1;
}

function () public payable { 
}

function a() public nonPayable { 
    if (!stor_3_1_1) {
        require(_wb.code.size);
        v0 = _wb.approve(_b, stor_2).gas(msg.gas);
        require(v0); // checks call status, propagates error data on error
        require(RETURNDATASIZE() >= 32);
        require(stor_3_2_21.code.size);
        v1 = stor_3_2_21.setInterfaceImplementer(this, 0x29ddb589b1fb5fc7cf394961c1adf5f8c6454761adf795e67fe149f658abe895, this).gas(msg.gas);
        require(v1); // checks call status, propagates error data on error
        stor_3_1_1 = 0;
    }
    require(_wb.code.size);
    v2, v3 = _wb.balanceOf(this).gas(msg.gas);
    require(v2); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
    _tokensToSend = 1;
    require(_b.code.size);
    v4 = _b.supply(_wb, v3 + ~0).gas(msg.gas);
    require(v4); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
    _tokensToSend = 0;
    require(_b.code.size);
    v5 = _b.supply(_wb, 1).gas(msg.gas);
    require(v5); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
}

function w(address[] varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(varg0 <= 0x100000000);
    require(varg0.data <= 4 + (msg.data.length - 4));
    require(!((varg0.length > 0x100000000) | (varg0.data + (varg0.length << 5) > 4 + (msg.data.length - 4))));
    v0 = new uint256[](varg0.length);
    CALLDATACOPY(v0.data, varg0.data, varg0.length << 5);
    v0[varg0.length << 5] = 0;
    v1 = v2 = 0;
    while (v1 < v0.length) {
        if (v1 < v0.length) {
            break;
        }
        assert(v1 < v0.length);
        require((address(v0[v1])).code.size);
        v3, v4 = address(v0[v1]).balanceOf(address(this)).gas(msg.gas);
        require(v3); // checks call status, propagates error data on error
        require(RETURNDATASIZE() >= 32);
        require((address(v0[v1])).code.size);
        v5 = address(v0[v1]).transfer(_execute, v4).gas(msg.gas);
        require(v5); // checks call status, propagates error data on error
        v1 = v1 + 1;
    }
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__(bytes4 function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length >= 4) {
        if (0x9c5b33ae > function_selector >> 224) {
            if (0xdbe671f == function_selector >> 224) {
                a();
            } else if (0x1a774787 == function_selector >> 224) {
                w(address[]);
            } else if (0x27e8c8f0 == function_selector >> 224) {
                0x27e8c8f0();
            } else if (0x4262802d == function_selector >> 224) {
                0x4262802d();
            } else if (0x75ab9782 == function_selector >> 224) {
                tokensToSend(address,address,address,uint256,bytes,bytes);
            }
        } else if (0x9c5b33ae == function_selector >> 224) {
            wb();
        } else if (0xb61d27f6 == function_selector >> 224) {
            execute(address,uint256,bytes);
        } else if (0xb645ecef == function_selector >> 224) {
            0xb645ecef();
        } else if (0xbda02782 == function_selector >> 224) {
            b(address);
        } else if (0xf7888aec == function_selector >> 224) {
            balanceOf(address,address);
        }
    }
    ();
}
