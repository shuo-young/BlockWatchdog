// SPDX-License-Identifier: MIT
pragma solidity =0.6.6;

import "@openzeppelin/contracts/access/Ownable.sol";

/// Introduces `Operator` role that can be changed only by Owner.
abstract contract Operatable is Ownable {
    address public operator;

    constructor() internal {
        operator = msg.sender;
    }

    modifier onlyOperator() {
        require(msg.sender == operator, "Only operator can call this method");
        _;
    }

    /// Set new operator
    /// @param newOperator New operator to be set
    /// @dev Only owner is allowed to call this method.
    function transferOperator(address newOperator) public onlyOwner {
        emit OperatorTransferred(operator, newOperator);
        operator = newOperator;
    }

    event OperatorTransferred(
        address indexed previousOperator,
        address indexed newOperator
    );
}
