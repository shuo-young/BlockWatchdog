// SPDX-License-Identifier: GPL-3.0-only
pragma solidity 0.7.6;
pragma abicoder v2;

interface IVisor {
    function owner() external returns(address);
    function delegatedTransferERC20( address token, address to, uint256 amount) external;
}
