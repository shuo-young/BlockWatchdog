// Decompiled by library.dedaub.com
// 2023.01.13 07:31 UTC
//! https://slowmist.medium.com/paraluni-incident-analysis-58be442a4f99
// Data structures and variables inferred from the use of storage instructions
address stor_0_0_19; // STORAGE[0x0] bytes 0 to 19
address _withdrawToken; // STORAGE[0x1] bytes 0 to 19
address stor_2_0_19; // STORAGE[0x2] bytes 0 to 19
address _pancakeCall; // STORAGE[0x3] bytes 0 to 19
address stor_4_0_19; // STORAGE[0x4] bytes 0 to 19
address stor_5_0_19; // STORAGE[0x5] bytes 0 to 19


function _SafeAdd(uint256 varg0, uint256 varg1) private { 
    require(varg0 <= ~varg1, Panic(17));
    return varg0 + varg1;
}

function _SafeMul(uint256 varg0, uint256 varg1) private { 
    require(!(varg0 & (varg1 > ~0 / varg0)), Panic(17));
    return varg0 * varg1;
}

function () public payable { 
    revert();
}

function pancakeCall(address varg0, uint256 varg1, uint256 varg2, bytes varg3) public payable { 
    require(msg.data.length - 4 >= 128);
    require(varg0 == varg0);
    require(varg3 <= 0xffffffffffffffff);
    require(4 + varg3 + 31 < msg.data.length);
    require(varg3.length <= 0xffffffffffffffff);
    require(4 + varg3 + varg3.length + 32 <= msg.data.length);
    v0 = v1 = !varg1;
    if (varg1) {
        v0 = !varg2;
    }
    if (!v0) {
        require(varg3.data + varg3.length - varg3.data >= 96);
        require(varg3[32] == address(varg3[32]));
        require(varg3[64] == address(varg3[64]));
        require((address(varg3[32])).code.size);
        v2, v3 = address(varg3[32]).token0().gas(msg.gas);
        require(v2); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v3 == address(v3));
        require((address(varg3[32])).code.size);
        v4, v5 = address(varg3[32]).token1().gas(msg.gas);
        require(v4); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v5 == address(v5));
        require((address(v3)).code.size);
        v6, v7 = address(v3).approve(stor_5_0_19, 0xc9f2c9cd5b23c4c17a3100000).gas(msg.gas);
        require(v6); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v7 == v7);
        require((address(v5)).code.size);
        v8, v9 = address(v5).approve(stor_5_0_19, 0xc9f2c9cd5b23c4c17a3100000).gas(msg.gas);
        require(v8); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v9 == v9);
        require(stor_5_0_19.code.size);
        v10, v11, v12, v13 = stor_5_0_19.addLiquidity(address(v3), address(v5), varg1, varg2, 1, 1, _pancakeCall, block.timestamp).gas(msg.gas);
        require(v10); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 96);
        v14 = v15 = new struct(2);
        v15.word0 = stor_2_0_19;
        v15.word1 = _pancakeCall;
        v16 = v17 = new struct(2);
        v17.word0 = 0xde0b6b3a7640000;
        v17.word1 = 0xde0b6b3a7640000;
        require(stor_2_0_19.code.size);
        v18, v19 = stor_2_0_19.balanceOf(address(this)).gas(msg.gas);
        require(v18); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(stor_2_0_19.code.size);
        v20, v21 = stor_2_0_19.approve(stor_0_0_19, v19).gas(msg.gas);
        require(v20); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v21 == v21);
        require(_pancakeCall.code.size);
        v22, v23 = _pancakeCall.balanceOf(address(this)).gas(msg.gas);
        require(v22); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(_pancakeCall.code.size);
        v24, v25 = _pancakeCall.approve(stor_0_0_19, v23).gas(msg.gas);
        require(v24); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v25 == v25);
        require(_pancakeCall.code.size);
        v26 = _pancakeCall.fullExit(0x48bb5f07e78f32ac7039366533d620c72c389797).gas(msg.gas);
        require(v26); // checks call status, propagates error data on error
        require(_pancakeCall.code.size);
        v27 = _pancakeCall.fullExit(msg.data[varg3.data], address(varg3[32])).gas(msg.gas);
        require(v27); // checks call status, propagates error data on error
        v28 = v29 = 4 + MEM[64] + 32;
        v30 = v31 = 0;
        while (v30 < 2) {
            MEM[v28] = address(MEM[v14]);
            v28 += 32;
            v14 += 32;
            v30 += 1;
        }
        v32 = v33 = 4 + MEM[64] + 96;
        v34 = v35 = 0;
        while (v34 < 2) {
            MEM[v32] = MEM[v16];
            v32 += 32;
            v16 += 32;
            v34 += 1;
        }
        require(stor_0_0_19.code.size);
        v36 = stor_0_0_19.call(~0xf68ce4ffffffffffffffffffffffffffffffffffffffffffffffffffffffff, msg.data[varg3.data], address(varg3[32]), v37, 0xde0b6b3a7640000).gas(msg.gas);
        require(v36); // checks call status, propagates error data on error
        require(_pancakeCall.code.size);
        v38 = _pancakeCall.withdrawAsset(msg.data[varg3.data]).gas(msg.gas);
        require(v38); // checks call status, propagates error data on error
        require(stor_0_0_19.code.size);
        v39, v40, v41 = stor_0_0_19.userInfo(msg.data[varg3.data], address(this)).gas(msg.gas);
        require(v39); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 64);
        require(stor_0_0_19.code.size);
        v42 = stor_0_0_19.withdraw(msg.data[varg3.data], v40).gas(msg.gas);
        require(v42); // checks call status, propagates error data on error
        require((address(varg3[32])).code.size);
        v43, v44 = address(varg3[32]).balanceOf(address(this)).gas(msg.gas);
        require(v43); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require((address(varg3[32])).code.size);
        v45, v46 = address(varg3[32]).approve(stor_5_0_19, v44).gas(msg.gas);
        require(v45); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v46 == v46);
        require(stor_5_0_19.code.size);
        v47, v48, v49 = stor_5_0_19.removeLiquidity(address(v3), address(v5), v44, 1, 1, address(this), block.timestamp).gas(msg.gas);
        require(v47); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 64);
        v50 = _SafeMul(1000, varg1);
        require(997, Panic(18));
        v51 = _SafeAdd(1, v50 / 997);
        require((address(v3)).code.size);
        v52, v53 = address(v3).transfer(address(varg3[64]), v51).gas(msg.gas);
        require(v52); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v53 == v53);
        v54 = _SafeMul(1000, varg2);
        require(997, Panic(18));
        v55 = _SafeAdd(1, v54 / 997);
        require((address(v5)).code.size);
        v56, v57 = address(v5).transfer(address(varg3[64]), v55).gas(msg.gas);
        require(v56); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v57 == v57);
        require((address(v3)).code.size);
        v58, v59 = address(v3).balanceOf(address(this)).gas(msg.gas);
        require(v58); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require((address(v3)).code.size);
        v60, v61 = address(v3).transfer(address(tx.origin), v59).gas(msg.gas);
        require(v60); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v61 == v61);
        require((address(v5)).code.size);
        v62, v63 = address(v5).balanceOf(address(this)).gas(msg.gas);
        require(v62); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require((address(v5)).code.size);
        v64, v65 = address(v5).transfer(address(tx.origin), v63).gas(msg.gas);
        require(v64); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v65 == v65);
    } else {
        require(varg3.data + varg3.length - varg3.data >= 96);
        require(varg3[32] == address(varg3[32]));
        require(varg3[64] == address(varg3[64]));
        v66 = _SafeAdd(varg1, varg2);
        v67 = _SafeMul(10000, v66);
        require(9975, Panic(18));
        v68 = _SafeAdd(1, v67 / 9975);
        require((address(varg3[64])).code.size);
        v69, v70 = address(varg3[64]).transfer(_pancakeCall, v66).gas(msg.gas);
        require(v69); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v70 == v70);
        v71 = v72 = new struct(2);
        v72.word0 = stor_2_0_19;
        v72.word1 = _pancakeCall;
        v73 = v74 = new struct(2);
        v74.word0 = 0xde0b6b3a7640000;
        v74.word1 = 0xde0b6b3a7640000;
        require(stor_2_0_19.code.size);
        v75, v76 = stor_2_0_19.balanceOf(address(this)).gas(msg.gas);
        require(v75); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(stor_2_0_19.code.size);
        v77, v78 = stor_2_0_19.approve(stor_0_0_19, v76).gas(msg.gas);
        require(v77); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v78 == v78);
        require(_pancakeCall.code.size);
        v79, v80 = _pancakeCall.balanceOf(address(this)).gas(msg.gas);
        require(v79); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(_pancakeCall.code.size);
        v81, v82 = _pancakeCall.approve(stor_0_0_19, v80).gas(msg.gas);
        require(v81); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v82 == v82);
        require(_pancakeCall.code.size);
        v83 = _pancakeCall.fullExit(0x48bb5f07e78f32ac7039366533d620c72c389797).gas(msg.gas);
        require(v83); // checks call status, propagates error data on error
        require(_pancakeCall.code.size);
        v84 = _pancakeCall.fullExit(msg.data[varg3.data], address(varg3[64])).gas(msg.gas);
        require(v84); // checks call status, propagates error data on error
        v85 = v86 = 4 + MEM[64] + 32;
        v87 = v88 = 0;
        while (v87 < 2) {
            MEM[v85] = address(MEM[v71]);
            v85 += 32;
            v71 += 32;
            v87 += 1;
        }
        v89 = v90 = 4 + MEM[64] + 96;
        v91 = v92 = 0;
        while (v91 < 2) {
            MEM[v89] = MEM[v73];
            v89 += 32;
            v73 += 32;
            v91 += 1;
        }
        require(stor_0_0_19.code.size);
        v93 = stor_0_0_19.call(~0xf68ce4ffffffffffffffffffffffffffffffffffffffffffffffffffffffff, msg.data[varg3.data], address(varg3[64]), v37, 0xde0b6b3a7640000).gas(msg.gas);
        require(v93); // checks call status, propagates error data on error
        require(_pancakeCall.code.size);
        v94 = _pancakeCall.withdrawAsset(msg.data[varg3.data]).gas(msg.gas);
        require(v94); // checks call status, propagates error data on error
        require(stor_0_0_19.code.size);
        v95, v96, v97 = stor_0_0_19.userInfo(msg.data[varg3.data], address(this)).gas(msg.gas);
        require(v95); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 64);
        require(stor_0_0_19.code.size);
        v98 = stor_0_0_19.withdraw(msg.data[varg3.data], v96).gas(msg.gas);
        require(v98); // checks call status, propagates error data on error
        require((address(varg3[64])).code.size);
        v99, v100 = address(varg3[64]).transfer(address(varg3[32]), v68).gas(msg.gas);
        require(v99); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v100 == v100);
        require((address(varg3[64])).code.size);
        v101, v102 = address(varg3[64]).balanceOf(address(this)).gas(msg.gas);
        require(v101); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require((address(varg3[64])).code.size);
        v103, v104 = address(varg3[64]).transfer(address(tx.origin), v102).gas(msg.gas);
        require(v103); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v104 == v104);
    }
}

function 0x86e7175b(uint256 varg0, uint256 varg1, uint256 varg2) public payable { 
    require(msg.data.length - 4 >= 96);
    require(varg2 == address(varg2));
    require(msg.sender == _withdrawToken, Error('permission error'));
    require(stor_0_0_19.code.size);
    v0, v1, v2, v3, v4, v5, v6 = stor_0_0_19.poolInfo(varg0).gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 192);
    require(v1 == address(v1));
    require(v5 == address(v5));
    require(stor_0_0_19.code.size);
    v7, v8 = stor_0_0_19.call(0x5029d25f, varg0).gas(msg.gas);
    require(v7); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    v9 = _SafeMul(v8, varg1);
    require(1000, Panic(18));
    v10 = v9 / 1000;
    require((address(varg2)).code.size);
    v11, v12 = address(varg2).token0().gas(msg.gas);
    require(v11); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v12 == address(v12));
    if (address(v1) != address(v12)) {
        v10 = v13 = 0;
    } else {
        v10 = v14 = 0;
    }
    v15 = new struct(4);
    v15.word1 = varg0;
    v15.word2 = address(varg2);
    v15.word3 = address(v1);
    v15.word0 = 96;
    v16 = v17 = 0;
    while (v16 < v15.word0) {
        MEM[160 + (v16 + (132 + v15))] = MEM[32 + (v16 + MEM[64])];
        v16 += 32;
    }
    if (v16 > v15.word0) {
    }
    require((address(varg2)).code.size);
    v18 = address(varg2).swap(v10, v10, address(this), 128, v15.word0, v19, v19, v19, v17).gas(msg.gas);
    require(v18); // checks call status, propagates error data on error
}

function withdrawToken(address varg0) public payable { 
    require(msg.data.length - 4 >= 32);
    require(varg0 == varg0);
    require(msg.sender == _withdrawToken, Error('permission error'));
    require(varg0.code.size);
    v0, v1 = varg0.balanceOf(address(this)).gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(varg0.code.size);
    v2, v3 = varg0.transfer(_withdrawToken, v1).gas(msg.gas);
    require(v2); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v3 == v3);
}

function depositLp(uint256 varg0, uint256 varg1) public payable { 
    require(msg.data.length - 4 >= 64);
    require(msg.sender == _withdrawToken, Error('permission error'));
    require(stor_0_0_19.code.size);
    v0, v1, v2, v3, v4, v5, v6 = stor_0_0_19.poolInfo(varg0).gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 192);
    require(v1 == address(v1));
    require(v5 == address(v5));
    require(stor_0_0_19.code.size);
    v7, v8 = stor_0_0_19.call(0x5029d25f, varg0).gas(msg.gas);
    require(v7); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require((address(v1)).code.size);
    v9, v10 = address(v1).token0().gas(msg.gas);
    require(v9); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v10 == address(v10));
    require((address(v1)).code.size);
    v11, v12 = address(v1).token1().gas(msg.gas);
    require(v11); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v12 == address(v12));
    require(stor_4_0_19.code.size);
    v13, v14 = stor_4_0_19.getPair(address(v10), address(v12)).gas(msg.gas);
    require(v13); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v14 == address(v14));
    require((address(v1)).code.size);
    v15, v16 = address(v1).totalSupply().gas(msg.gas);
    require(v15); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require((address(v10)).code.size);
    v17, v18 = address(v10).balanceOf(address(v1)).gas(msg.gas);
    require(v17); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    v19 = _SafeMul(v18, v8);
    v20 = _SafeMul(v19, varg1);
    require(v16, Panic(18));
    require(1000, Panic(18));
    require((address(v12)).code.size);
    v21, v22 = address(v12).balanceOf(address(v1)).gas(msg.gas);
    require(v21); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    v23 = _SafeMul(v22, v8);
    v24 = _SafeMul(v23, varg1);
    require(v16, Panic(18));
    require(1000, Panic(18));
    v25 = new struct(4);
    v25.word1 = varg0;
    v25.word2 = address(v1);
    v25.word3 = address(v14);
    v25.word0 = 96;
    v26 = v27 = 0;
    while (v26 < v25.word0) {
        MEM[160 + (v26 + (132 + v25))] = MEM[32 + (v26 + MEM[64])];
        v26 += 32;
    }
    if (v26 > v25.word0) {
    }
    require((address(v14)).code.size);
    v28 = address(v14).swap(v20 / v16 / 1000, v24 / v16 / 1000, address(this), 128, v25.word0, v29, v29, v29, v27).gas(msg.gas);
    require(v28); // checks call status, propagates error data on error
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__(bytes4 function_selector) public payable { 
    MEM[64] = 128;
    require(!msg.value);
    if (msg.data.length >= 4) {
        if (0x84800812 == function_selector >> 224) {
            pancakeCall(address,uint256,uint256,bytes);
        } else if (0x86e7175b == function_selector >> 224) {
            0x86e7175b();
        } else if (0x89476069 == function_selector >> 224) {
            withdrawToken(address);
        } else if (0xc7c31137 == function_selector >> 224) {
            depositLp(uint256,uint256);
        }
    }
    ();
}
