//SPDX-License-Identifier: MIT
pragma solidity =0.6.6;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

/// Voting escrow interface
interface IVotingEscrow is IERC20 {
    function locked__balance(address _addr) external view returns (uint256);

    function supply() external view returns (uint256);

    function withdraw() external;

    function deposit_for(address _addr, uint256 _value) external;

    function create_lock(uint256 _value, uint256 _unlock_time) external;

    function increase_amount(uint256 _value) external;

    function increase_unlock_time(uint256 _unlock_time) external;
}
