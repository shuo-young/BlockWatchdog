// Decompiled by library.dedaub.com
// 2022.12.13 12:25 UTC

// Data structures and variables inferred from the use of storage instructions
uint256 stor_0; // STORAGE[0x0]
uint256 stor_1; // STORAGE[0x1]
uint256 stor_3; // STORAGE[0x3]
mapping (uint256 => [uint256]) map_102; // STORAGE[0x102]
uint256 stor_105; // STORAGE[0x105]
uint256 stor_107; // STORAGE[0x107]
uint256 ___function_selector__; // STORAGE[0x108]


// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__() public payable { 
    MEM[64] = 96;
    ___function_selector__ = 2;
    MEM[(MEM[64]) len (this.code.size - 342)] = this.code[342 len (this.code.size - 342)];
    MEM[64] = MEM[64] + (this.code.size - 342);
    stor_1 = 1 + MEM[MEM[64] + MEM[MEM[64]]];
    v0 = v1 = 0;
    stor_3 = address(tx.origin);
    map_102[address(tx.origin)] = 1;
    while (v0 < MEM[MEM[64] + MEM[MEM[64]]]) {
        assert(v0 < MEM[MEM[64] + MEM[MEM[64]]]);
        assert(2 + v0 < 256);
        STORAGE[2 + v0 + 2] = address(MEM[(v0 << 5) + (32 + (MEM[64] + MEM[MEM[64]]))]);
        assert(v0 < MEM[MEM[64] + MEM[MEM[64]]]);
        map_102[address(MEM[(v0 << 5) + (32 + (MEM[64] + MEM[MEM[64]]))])] = 2 + v0;
        v0 += 1;
    }
    stor_0 = MEM[128];
    stor_105 = MEM[160];
    stor_107 = block.timestamp / 0x15180;
    return MEM[0 len 49];
}
