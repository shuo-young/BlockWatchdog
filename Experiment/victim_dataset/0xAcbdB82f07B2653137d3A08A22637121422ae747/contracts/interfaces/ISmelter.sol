//SPDX-License-Identifier: MIT
pragma solidity =0.6.6;

/// Smelter can mint and burn tokens
interface ISmelter {
    /// Burn SyntheticToken
    /// @param syntheticTokenAddress The address of the synthetic token
    /// @param owner Owner of the tokens to burn
    /// @param amount Amount to burn
    function burnSyntheticFrom(
        address syntheticTokenAddress,
        address owner,
        uint256 amount
    ) external;

    /// Mints synthetic token
    /// @param syntheticTokenAddress The address of the synthetic token
    /// @param receiver Address to receive minted token
    /// @param amount Amount to mint
    function mintSynthetic(
        address syntheticTokenAddress,
        address receiver,
        uint256 amount
    ) external;

    /// Check if address is token admin
    /// @param admin - address to check
    function isTokenAdmin(address admin) external view returns (bool);
}
