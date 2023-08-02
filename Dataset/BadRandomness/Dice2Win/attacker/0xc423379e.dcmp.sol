// Decompiled by library.dedaub.com
// 2022.12.16 05:47 UTC



// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__() public payable { 
    MEM[64] = 128;
    MEM[(MEM[64]) len (this.code.size - 718)] = this.code[718 len (this.code.size - 718)];
    MEM[64] = MEM[64] + (this.code.size - 718);
    v0 = MEM[64] + MEM[MEM[64] + 32];
    v1 = v2 = 0;
    while (v1 < MEM[MEM[64]]) {
        if (0xd1ceeeeee8af2791fc928beffb0ffac3387850de.balance >= 0x4563918244f40000) {
            break;
        }
        if (0xd1ceeeeee8af2791fc928beffb0ffac3387850de.balance < 0x4563918244f40000) {
            break;
        }
        require(MEM[v0] >= 32 + v1);
        require(MEM[v0] >= v1 + 32 + MEM[32 + (v1 + v0)]);
        if (MEM[32 + (v1 + v0)]) {
            v3 = v4 = MEM[64];
            v5 = v6 = v4 + (MEM[32 + (v1 + v0)] & 0x1f) + (!(MEM[32 + (v1 + v0)] & 0x1f) << 5);
            v7 = v8 = v0 + (MEM[32 + (v1 + v0)] & 0x1f) + (!(MEM[32 + (v1 + v0)] & 0x1f) << 5) + (v1 + 32);
            while (v5 < v6 + MEM[32 + (v1 + v0)]) {
                MEM[v5] = MEM[v7];
                v5 += 32;
                v7 += 32;
            }
            MEM[v4] = MEM[32 + (v1 + v0)];
            MEM[64] = ~0x1f & 31 + v5;
        } else {
            v3 = v9 = new struct(1);
        }
        require(MEM[v0] >= 32 + (MEM[32 + (v1 + v0)] + (v1 + 32)));
        v10 = MEM[32 + (MEM[32 + (v1 + v0)] + (v1 + 32) + v0)];
        require(MEM[v0] >= MEM[32 + (v1 + v0)] + (v1 + 32) + 32 + v10);
        if (v10) {
            v11 = v12 = MEM[64];
            v13 = v14 = v12 + (v10 & 0x1f) + (!(v10 & 0x1f) << 5);
            v15 = v16 = v0 + (v10 & 0x1f) + (!(v10 & 0x1f) << 5) + (MEM[32 + (v1 + v0)] + (v1 + 32) + 32);
            while (v13 < v14 + v10) {
                MEM[v13] = MEM[v15];
                v13 += 32;
                v15 += 32;
            }
            MEM[v12] = v10;
            MEM[64] = ~0x1f & 31 + v13;
        } else {
            v11 = v17 = new struct(1);
        }
        v1 = MEM[32 + (v1 + v0)] + (v1 + 32) + 32 + v10;
        v18 = v19 = 0;
        while (v18 < MEM[v3]) {
            MEM[v18 + MEM[64]] = MEM[v18 + (32 + v3)];
            v18 += 32;
        }
        v20 = v21 = MEM[v3] + MEM[64];
        if (0x1f & MEM[v3]) {
            MEM[v21 - (0x1f & MEM[v3])] = ~(256 ** (32 - (0x1f & MEM[v3])) - 1) & MEM[v21 - (0x1f & MEM[v3])];
            v20 = v22 = 32 + (v21 - (0x1f & MEM[v3]));
        }
        v23 = 0xd1ceeeeee8af2791fc928beffb0ffac3387850de.call(MEM[(MEM[64]) len (v20 - MEM[64])], MEM[(MEM[64]) len 0]).value(msg.value).gas(msg.gas);
        require(v23);
        v24 = v25 = 0;
        while (v24 < MEM[v11]) {
            MEM[v24 + MEM[64]] = MEM[v24 + (32 + v11)];
            v24 += 32;
        }
        v26 = v27 = MEM[v11] + MEM[64];
        if (0x1f & MEM[v11]) {
            MEM[v27 - (0x1f & MEM[v11])] = ~(256 ** (32 - (0x1f & MEM[v11])) - 1) & MEM[v27 - (0x1f & MEM[v11])];
            v26 = v28 = 32 + (v27 - (0x1f & MEM[v11]));
        }
        v29 = 0xd1ceeeeee8af2791fc928beffb0ffac3387850de.call(MEM[(MEM[64]) len (v26 - MEM[64])], MEM[(MEM[64]) len 0]).gas(msg.gas);
        require(v29);
        v1 = v1 + 1;
    }
    require(this.balance > this.balance + MEM[MEM[64]] * 0x14d1120d7b160000);
    selfdestruct(msg.sender);
}
