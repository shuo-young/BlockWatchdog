//SPDX-License-Identifier: MIT
pragma solidity =0.6.6;

import "@openzeppelin/contracts/token/ERC20/ERC20Burnable.sol";
import "./access/Operatable.sol";

/// @title Synthetic token for the Klondike platform
contract SyntheticToken is ERC20Burnable, Operatable {
    /// Creates a new synthetic token
    /// @param _name Name of the token
    /// @param _symbol Ticker for the token
    /// @param _decimals Number of decimals
    constructor(
        string memory _name,
        string memory _symbol,
        uint8 _decimals
    ) public ERC20(_name, _symbol) {
        _setupDecimals(_decimals);
    }

    ///  Mints tokens to the recepient
    ///  @param recipient The address of recipient
    ///  @param amount The amount of tokens to mint
    function mint(address recipient, uint256 amount)
        public
        onlyOperator
        returns (bool)
    {
        _mint(recipient, amount);
    }

    ///  Burns token from the caller
    ///  @param amount The amount of tokens to burn
    function burn(uint256 amount) public override onlyOperator {
        super.burn(amount);
    }

    ///  Burns token from address
    ///  @param account The account to burn from
    ///  @param amount The amount of tokens to burn
    ///  @dev The allowance for sender in address account must be
    ///  strictly >= amount. Otherwise the function call will fail.
    function burnFrom(address account, uint256 amount)
        public
        override
        onlyOperator
    {
        super.burnFrom(account, amount);
    }
}
