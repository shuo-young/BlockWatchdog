pragma solidity ^0.5.16;

import "./BlackListRole.sol";
import "./Ownable.sol";
import "./ERC20Pausable.sol";

/**
 * @title KineUSD
 * @notice Kine USD is Kine Trading System's stable coin which link the Kine on-chain staking contracts to
 * Kine off-chain trading platform. It can only be minted on chain when user staking collaterals and is used for
 * trading multiple synthetic assets in off-chain trading platform.
 * @dev KineUSD is mint when user stake Kine MCD in KUSDMinter contract and burnt first when user try to unstake Kine MCD.
 * @author Kine
 */
contract KineUSD is Ownable, ERC20Pausable, BlackListRole {

    /// @notice Emitted when KUSD minter is changed by owner
    event NewMinter(address oldMinter, address newMinter);

    /// @notice KineUSD token name
    string public name;
    /// @notice KineUSD token symbol
    string public symbol;
    /// @notice KineUSD token decimals
    uint8 public decimals;

    /**
     * @notice KUSD minter (see KUSDMinter) is responsible to stake/unstake Kine MCD (see KMCD) and call this contract to mint/burn KUSD onbehalf of user.
     */
    address public minter;

    constructor (string memory name_, string memory symbol_, uint8 decimals_, address minter_) public {
        name = name_;
        symbol = symbol_;
        decimals = decimals_;
        minter = minter_;
    }

    /// @notice Mint/burn can be only called by minter contract
    modifier onlyMinter {
        require(
            msg.sender == minter,
            "Only minter can call this function."
        );
        _;
    }

    /**
     * @notice Transfer caller's KUSD to target address
     * @param to Transfer target address
     * @param value The amount of KUSD to transfer
     * @return True if transfer succeed, false if failed
     */
    function transfer(address to, uint value) public onlyNotBlacklisted(msg.sender) returns (bool) {
        return super.transfer(to, value);
    }

    /**
     * @notice Transfer source address's KUSD to target address
     * @param from Source address
     * @param to Target address
     * @param value The amount of KUSD to transfer
     * @return True if transfer succeed, false if failed
     */
    function transferFrom(address from, address to, uint value) public onlyNotBlacklisted(from) returns (bool) {
        return super.transferFrom(from, to, value);
    }

    /**
     * @notice Mint KUSD to account, only KUSDMinter can call this function
     * @param account Account will receive mint KUSD
     * @param amount The amount of KUSD to mint
     */
    function mint(address account, uint amount) external onlyMinter {
        _mint(account, amount);
    }

    /**
     * @notice Burn KUSD from account, only KUSDMinter can call this function
     * @param account Account to burn KUSD from
     * @param amount The amount of KUSD to burn
     */
    function burn(address account, uint amount) external onlyMinter {
        _burn(account, amount);
    }

    /**
     * @notice Change minter address to a new one, only KUSD owner can do this
     * @param newMinter New KUSDMinter contract address
     */
    function _setMinter(address newMinter) external onlyOwner {
        address oldMinter = minter;
        minter = newMinter;
        emit NewMinter(oldMinter, minter);
    }

    /// @notice Add new account as blacklist admin member
    /// @dev Only owner can add new blacklist admin member
    function addBlacklistAdmin(address account) public onlyOwner {
        _addBlacklistAdmin(account);
    }

    /// @notice Remove account from blacklist admin members
    /// @dev Besides owner can remove admins, the blacklist admin can also renounce itself
    function removeBlacklistAdmin(address account) public onlyOwner {
        _removeBlacklistAdmin(account);
    }

}