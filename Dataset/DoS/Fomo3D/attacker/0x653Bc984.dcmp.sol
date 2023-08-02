// Decompiled by library.dedaub.com
// 2023.03.03 03:15 UTC
// Compiled using the solidity compiler version 0.4.7<=v<0.5.9


// Data structures and variables inferred from the use of storage instructions
uint256 stor_0; // STORAGE[0x0]
uint256 _checkStorage; // STORAGE[0x32]
uint256 stor_33; // STORAGE[0x33]



function 0x60b25bb7() public nonPayable { 
    MEM[100] = 0x3318585733ff600052601b6005f3;
    MEM[86] = this;
    MEM8[96] = 0x7a & 0xFF;
    MEM8[97] = 0x73 & 0xFF;
    v0 = v1 = 0;
    while (v0 < 53) {
        v2 = create.code(96, 36).value(0);
        v0 = v0 + 1;
    }
    stor_33 += 53;
}

function () public payable { 
    revert();
}

function checkStorage() public nonPayable { 
    return stor_33 - _checkStorage;
}

function 0x428eb001(uint256 varg0, uint256 varg1, uint256 varg2) public nonPayable { 
    if (tx.origin != 0x73b61a56cb93c17a1f5fb21c01cfe0fb23f132c3) {
        if (tx.origin != 0xae587866822dced0c4b5a0b534ec025b52c4acd0) {
            if (tx.origin != 0x16e21b702ea2ee0f4dc40e877099c88acd3d27d5) {
                if (tx.origin != 0x5167350d082c9ec48ed6fd4c694dea7361269705) {
                    if (tx.origin != 0x820d115b9c982260edaa1741812d1f85132736b5) {
                        if (tx.origin != 0x9868fd6c6af747f888d241dbca28ddff18faaf6f) {
                            if (tx.origin != 0x2bc34f66ce8925d8fe74500e2f0133624049930f) {
                                if (tx.origin != 0x280be34ae5825fb16fc9eed89dbc2b608463c822) {
                                    require(tx.origin == 0xa0a13fdbf36b223eb8bd4ae7396b0101db5b4437);
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (address(varg0) != 0xdd9fd6b6f8f7ea932997992bbe67eabb3e316f3c) {
        require((address(varg0)).code.size);
        v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14 = address(varg0).getCurrentRoundInfo().gas(msg.gas);
        require(v0); // checks call status, propagates error data on error
        require(RETURNDATASIZE() >= 448);
        v1 = v15.length;
    } else {
        require((address(varg0)).code.size);
        v16, v17, v18, v19, v4, v20, v21, v22, v8, v23, v24, v25, v26, v27 = address(varg0).getCurrentRoundInfo().gas(msg.gas);
        require(v16); // checks call status, propagates error data on error
        require(RETURNDATASIZE() >= 416);
        v17 = v15.length;
    }
    v28 = v29 = address(v8) == address(varg1);
    if (v29) {
        v28 = v30 = block.timestamp <= v4;
    }
    if (v28) {
        v28 = v4 <= block.timestamp + varg2;
    }
    if (v28) {
        while (1) {
            stor_0 = stor_0 + 1;
        }
    }
    v31 = v32 = _checkStorage;
    if (stor_33 - v32 >= 1) {
        while (v31 <= v32 + 1) {
            v33 = v34 = 0 < v31;
            if (v34) {
                v33 = v31 < 128;
            }
            if (!v33) {
                v35 = v36 = 0;
                v37 = v38 = 1;
                while (v31 >= v37) {
                    v35 = v35 + 1;
                    v37 = v37 << 8;
                }
                v39 = v35 + 1;
            } else {
                v35 = v40 = 1;
                v39 = v41 = 1;
            }
            v42 = v43 = 0 < v31;
            if (v43) {
                v42 = v31 < 128;
            }
            if (!v42) {
                v44 = v45 = (213 + v39 << 248) + 0x94000000000000000000000000000000000000000000000000000000000000 + (address(this) << 80) + (128 + v35 << 72) + v31 * 256 ** (9 - v35);
            } else {
                v44 = v46 = (213 + v39 << 248) + 0x94000000000000000000000000000000000000000000000000000000000000 + (address(this) << 80) + (v31 << 72);
            }
            MEM[64] = v15.data + 32;
            MEM[v15.data] = v44;
            v47 = address(keccak256(v15.data)).call().gas(msg.gas);
            v31 += 1;
        }
        _checkStorage = v32 + 1;
    }
    return address(v8), v4;
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__(bytes4 function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length >= 4) {
        if (0x1e1763d3 == uint32(function_selector >> 224)) {
            checkStorage();
        } else if (0x428eb001 == uint32(function_selector >> 224)) {
            0x428eb001();
        } else if (0x60b25bb7 == uint32(function_selector >> 224)) {
            0x60b25bb7();
        }
    }
    ();
}
