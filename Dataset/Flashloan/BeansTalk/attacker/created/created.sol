// Decompiled by library.dedaub.com
// 2023.01.13 03:44 UTC



function 0x5d9(uint256 varg0, uint256 varg1, uint256 varg2) private { 
    v0 = v1 = !varg0;
    if (varg0) {
        v2 = address(varg1);
        v3, v4 = address(varg2).allowance(this, v2).gas(msg.gas);
        require(v3); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        v0 = v5 = !v4;
    }
    require(v0, Error('SafeERC20: approve from non-zero to non-zero allowance'));
    v6 = address(varg1);
    v7 = address(varg2);
    if (this.balance >= 0) {
        if (v7.code.size) {
            v8 = v9 = 0;
            while (v8 < 68) {
                MEM[v8 + MEM[64]] = MEM[v8 + (MEM[64] + 32)];
                v8 += 32;
            }
            if (v8 > 68) {
                MEM[MEM[64] + 68] = 0;
            }
            v10, v11, v12, v13 = address(v7).approve(v6, varg0).gas(msg.gas);
            if (RETURNDATASIZE() == 0) {
                v14 = v15 = 96;
            } else {
                v14 = v16 = new bytes[](RETURNDATASIZE());
                RETURNDATACOPY(v16.data, 0, RETURNDATASIZE());
            }
            if (!v10) {
                require(!MEM[v14]v13, MEM[v14]);
                v17 = new array[](v18.length);
                v19 = v20 = 0;
                while (v19 < v18.length) {
                    v17[v19] = v18[v19];
                    v19 += 32;
                }
                if (v19 > v18.length) {
                    v17[v18.length] = 0;
                }
                revert(Error(v17, v21, 'SafeERC20: low-level call failed'));
            } else {
                if (MEM[v14]) {
                    require(32 + v14 + MEM[v14] - (32 + v14) >= 32);
                    require(MEM[32 + v14] == MEM[32 + v14]);
                    require(MEM[32 + v14], Error('SafeERC20: ERC20 operation did not succeed'));
                }
                return ;
            }
        } else {
            MEM[MEM[64] + 4] = 32;
            revert(Error('Address: call to non-contract'));
        }
    } else {
        MEM[MEM[64] + 4] = 32;
        revert(Error('Address: insufficient balance for call'));
    }
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__() public payable { 
    MEM[64] = 128;
    require(!msg.value);
    require(0x1c5dcdd006ea78a7e4783f9e6021c32935a10fb4 == tx.origin);
    0x5d9(0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, 0xa79828df1850e8a3a3064576f380d90aecdd3359, 0xdc59ac4fefa32293a95889dc396682858d52e5db);
    0x5d9(0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, 0xa79828df1850e8a3a3064576f380d90aecdd3359, 0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48);
    0x5d9(0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, 0xa79828df1850e8a3a3064576f380d90aecdd3359, 0x6b175474e89094c44da98b954eedeac495271d0f);
    0x5d9(0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, 0xa79828df1850e8a3a3064576f380d90aecdd3359, 0xdac17f958d2ee523a2206206994597c13d831ec7);
    0x5d9(0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, 0xbebc44782c7db0a1a60cb6fe97d0b483032ff1c7, 0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48);
    0x5d9(0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, 0xbebc44782c7db0a1a60cb6fe97d0b483032ff1c7, 0x6b175474e89094c44da98b954eedeac495271d0f);
    0x5d9(0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, 0xbebc44782c7db0a1a60cb6fe97d0b483032ff1c7, 0xdac17f958d2ee523a2206206994597c13d831ec7);
    0x5d9(0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, 0xed279fdd11ca84beef15af5d39bb4d4bee23f0ca, 0x6c3f90f043a72fa612cbac8115ee7e52bde6e490);
    0x5d9(0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, 0xed279fdd11ca84beef15af5d39bb4d4bee23f0ca, 0x5f98805a4e8be255a32880fdec7f6728c6568ba0);
    0x5d9(0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, 0x3a70dfa7d2262988064a2d051dd47521e43c9bdd, 0xdc59ac4fefa32293a95889dc396682858d52e5db);
    0x5d9(0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, 0x3a70dfa7d2262988064a2d051dd47521e43c9bdd, 0x6c3f90f043a72fa612cbac8115ee7e52bde6e490);
    0x5d9(0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, 0xd652c40fbb3f06d6b58cb9aa9cff063ee63d465d, 0xdc59ac4fefa32293a95889dc396682858d52e5db);
    0x5d9(0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, 0xd652c40fbb3f06d6b58cb9aa9cff063ee63d465d, 0x5f98805a4e8be255a32880fdec7f6728c6568ba0);
    0x5d9(0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, 0xc1e088fc1323b20bcbee9bd1b9fc9546db5624c5, 0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48);
    0x5d9(0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, 0xc1e088fc1323b20bcbee9bd1b9fc9546db5624c5, 0x3a70dfa7d2262988064a2d051dd47521e43c9bdd);
    0x5d9(0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, 0xc1e088fc1323b20bcbee9bd1b9fc9546db5624c5, 0xd652c40fbb3f06d6b58cb9aa9cff063ee63d465d);
    0x5d9(0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, 0xc1e088fc1323b20bcbee9bd1b9fc9546db5624c5, 0xdc59ac4fefa32293a95889dc396682858d52e5db);
    0x5d9(0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, 0x7d2768de32b0b80b7a3454c06bdac94a69ddc7a9, 0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48);
    0x5d9(0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, 0x7d2768de32b0b80b7a3454c06bdac94a69ddc7a9, 0xdac17f958d2ee523a2206206994597c13d831ec7);
    0x5d9(0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, 0x7d2768de32b0b80b7a3454c06bdac94a69ddc7a9, 0x6b175474e89094c44da98b954eedeac495271d0f);
    return MEM[0 len 10434];
}
