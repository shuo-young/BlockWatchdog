//SPDX-License-Identifier: MIT
pragma solidity =0.6.6;

/// Boardroom as seen by others
interface IBoardroom {
    /// Notify Boardroom about new incoming reward for token
    /// @param token Rewards denominated in this token
    /// @param amount The amount of rewards
    function notifyTransfer(address token, uint256 amount) external;
}
