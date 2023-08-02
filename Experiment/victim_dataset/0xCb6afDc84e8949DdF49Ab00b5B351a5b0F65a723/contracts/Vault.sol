// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/Math.sol";

contract Vault is IERC20, ReentrancyGuard, Ownable {
	using Math for uint256;
	using SafeERC20 for ERC20;
	event EmergencyShutdown(bool active);
	event SwapInProcessed(address indexed sender, uint256 amount, uint256 fee);
	event SwapOutProcessed(address indexed sender, uint256 amount);
	event RefundProcessed(address indexed sender, uint256 amount, uint256 fee);

	string public name;
	string public symbol;
	uint8 public decimals;

	uint256 public override totalSupply;

	// total USD amount of LP providers, decimals = 18
	uint256 public totalTokens;

	// treasury amount stored in contract, decimals = 6
	uint256 public treasuryAmount;

	// minimum swapin amount
	uint256 private _minAmountForSwap;

	mapping(address => uint256) private _balances;
	mapping(address => mapping(address => uint256)) private _allowances;

	bool public emergencyShutdown;
	ERC20 public token;
	address public bridge;

	// 50% of the fee to LP providers, 50% goes to treasury
	uint256 public lpFee = 5_000;
	uint256 constant BASIS_POINT = 10_000;

	uint256 public txFee;

	modifier onlyBridge() {
		require(msg.sender == bridge);
		_;
	}

	modifier notLocked() {
		require(!emergencyShutdown, "Vault is locked out");
		_;
	}

	constructor(
		string memory _name,
		string memory _symbol,
		address _token,
		address _bridge,
		uint256 _minAmount,
		uint256 _txFee
	) {
		require(_bridge != address(0));
		name = _name;
		symbol = _symbol;
		decimals = 18;
		token = ERC20(_token);
		bridge = _bridge;
		_minAmountForSwap = _minAmount;
		txFee = _txFee;
	}

	/// @notice Deposit USD token and get LP tokens in exchange
	/// @param _amount Amount of token user wants to deposit
	/// @param _recipient the address that receives LP tokens
	function deposit(uint256 _amount, address _recipient) public nonReentrant notLocked returns (uint256) {
		require(_recipient != address(0));
		require(_recipient != address(this));

		uint256 amount = _amount;

		// If _amount not specified, transfer the full token balance,
		// up to deposit limit
		if (amount == type(uint256).max) amount = token.balanceOf(msg.sender);

		// sanity check
		require(amount <= token.balanceOf(msg.sender) && amount <= token.allowance(msg.sender, address(this)), "Balance or allowance not sufficient");

		// Ensure we are depositing something
		require(amount > 0);

		// Issue new shares (needs to be done before taking deposit to be accurate)
		// Shares are issued to recipient (may be different from msg.sender)
		// See @dev note, above.
		uint256 shares = _issueSharesForAmount(_recipient, amount);

		// Tokens are transferred from msg.sender (may be different from _recipient)
		token.safeTransferFrom(msg.sender, address(this), amount);

		return shares; // Just in case someone wants them
	}

	/// @notice Withdraw USD tokens and burn LP tokens
	/// @param _amount Amount of LP token user wants to withdraw
	/// @param _recipient the address that receives USD tokens
	function withdraw(uint256 _amount, address _recipient) external nonReentrant notLocked returns (uint256) {
		// If _shares not specified, transfer full share balance
		uint256 shares = _amount;
		if (_amount == type(uint256).max) {
			shares = _balances[msg.sender];
		}

		// Limit to only the shares they own
		require(shares <= _balances[msg.sender], "Amount exceeds balance");

		// Ensure we are withdrawing something
		require(shares > 0, "Nothing to withdraw");

		uint256 tokensToTransfer = (shares * totalTokens) / totalSupply;
		totalSupply -= shares;
		_balances[msg.sender] -= shares;
		totalTokens -= tokensToTransfer;
		emit Transfer(msg.sender, address(0), shares);
		token.safeTransfer(_recipient, (tokensToTransfer * 10**token.decimals()) / (10**decimals));

		return shares;
	}

	function _issueSharesForAmount(address to, uint256 amount) internal returns (uint256) {
		// Issues `amount` Vault shares to `to`.
		// Shares must be issued prior to taking on new collateral, or
		// calculation will be wrong. This means that only *trusted* tokens
		// (with no capability for exploitative behavior) can be used.
		uint256 _amount = 0;

		_amount = (amount * (10**decimals)) / 10**token.decimals();
		require(_amount != 0); // dev: division rounding resulted in zero

		uint256 newSupply = _amount; // maybe small amount than amount
		if (totalSupply > 0) {
			newSupply = (newSupply * totalSupply) / totalTokens;
		}

		// Mint new shares
		totalSupply += newSupply;
		totalTokens += _amount;
		_balances[to] += newSupply;
		emit Transfer(address(0), to, newSupply);

		return newSupply;
	}

	function _totalAssets() internal view returns (uint256) {
		// See note on `totalAssets()`.
		return token.balanceOf(address(this));
	}

	/// @notice Returns the total quantity of all assets under control of this
	/// Vault, whether they're loaned out to a Strategy, or currently held in
	/// the Vault.
	/// @return The total assets under control of this Vault.
	function totalAssets() external view returns (uint256) {
		return _totalAssets();
	}

	/// @notice Returns the min amount for swapping, default is 0
	/// @return minimum token amount for swap
	function minAmountForSwap() external view returns (uint256) {
		return _minAmountForSwap;
	}

	/// @notice Set shutdown flag for emergency
	/// @param down Shutdown flag
	function setEmergencyShutdown(bool down) external onlyOwner {
		emergencyShutdown = down;
		emit EmergencyShutdown(down);
	}

	/// @notice Set minimum swap amount
	/// @param minAmount Minimum amount
	function setMinAmountForSwap(uint256 minAmount) external onlyOwner {
		_minAmountForSwap = minAmount;
	}

	/// @notice Set transaction fee
	/// @param _txFee Transaction fee in tokens
	function setTxFee(uint256 _txFee) external onlyOwner {
		txFee = _txFee;
	}

	function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
		_transfer(_msgSender(), recipient, amount);
		return true;
	}

	function balanceOf(address account) public view virtual override returns (uint256) {
		return _balances[account];
	}

	function tokenAllocationOf(address account) public view returns (uint256) {
		return ((_balances[account] * totalTokens) * (10**token.decimals())) / 10**decimals / totalSupply;
	}

	function _transfer(
		address sender,
		address recipient,
		uint256 amount
	) internal virtual {
		require(sender != address(0), "ERC20: transfer from the zero address");
		require(recipient != address(0), "ERC20: transfer to the zero address");

		uint256 senderBalance = _balances[sender];
		require(senderBalance >= amount, "ERC20: transfer amount exceeds balance");
		unchecked {
			_balances[sender] = senderBalance - amount;
		}
		_balances[recipient] += amount;

		emit Transfer(sender, recipient, amount);
	}

	function allowance(address owner, address spender) public view virtual override returns (uint256) {
		return _allowances[owner][spender];
	}

	function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {
		_approve(_msgSender(), spender, _allowances[_msgSender()][spender] + addedValue);
		return true;
	}

	function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {
		uint256 currentAllowance = _allowances[_msgSender()][spender];
		require(currentAllowance >= subtractedValue, "ERC20: decreased allowance below zero");
		unchecked {
			_approve(_msgSender(), spender, currentAllowance - subtractedValue);
		}
		return true;
	}

	function approve(address spender, uint256 amount) public virtual override returns (bool) {
		_approve(_msgSender(), spender, amount);
		return true;
	}

	function transferFrom(
		address sender,
		address recipient,
		uint256 amount
	) public virtual override returns (bool) {
		_transfer(sender, recipient, amount);
		uint256 currentAllowance = _allowances[sender][_msgSender()];
		require(currentAllowance >= amount, "ERC20: transfer amount exceeds allowance");
		unchecked {
			_approve(sender, _msgSender(), currentAllowance - amount);
		}
		return true;
	}

	function _approve(
		address owner,
		address spender,
		uint256 amount
	) internal virtual {
		require(owner != address(0), "ERC20: approve from the zero address");
		require(spender != address(0), "ERC20: approve to the zero address");

		_allowances[owner][spender] = amount;
		emit Approval(owner, spender, amount);
	}

	/// @notice Called by bridge to transfer amount to destination user
	/// @param account the account to receive swapped amount
	/// @param amount the amount of tokens the user will receive
	function swapOut(address account, uint256 amount) external onlyBridge notLocked returns (bool) {
		require(amount <= token.balanceOf(address(this)), "Transfer amount exceeds vault balance");
		token.safeTransfer(account, amount);
		emit SwapOutProcessed(account, amount);
		return true;
	}

	/// @notice Starts swapIn process
	/// @param account the account to receive on destination chain
	/// @param amount the amount user wants to send for swap(including fee)
	/// @param fee the fee amount needed for swap process
	function swapIn(
		address account,
		uint256 amount,
		uint256 fee
	) external notLocked {
		require(amount >= _minAmountForSwap, "Should be bigger than minimum amount");
		require(fee >= txFee, "Fee should be greater than tx fee");
		token.safeTransferFrom(msg.sender, address(this), amount);
		uint256 redistribution = ((fee - txFee) * lpFee) / BASIS_POINT;

		totalTokens += (redistribution * (10**decimals)) / 10**token.decimals();
		treasuryAmount += fee - redistribution;

		emit SwapInProcessed(account, amount, fee);
	}

	/// @notice Refund the amount waiting for swap
	/// @param account the account to receive on destination chain
	/// @param amount the amount user wanted to send for swap(including fee)
	/// @param fee the last fee amount that will be refunded
	/// @param gasFee the amount will be consumed for refund transaction
	function refund(
		address account,
		uint256 amount,
		uint256 fee,
		uint256 gasFee
	) external onlyBridge notLocked {
		token.safeTransfer(account, amount);
		uint256 redistribution = ((fee - txFee) * lpFee) / BASIS_POINT;

		totalTokens -= (redistribution * (10**decimals)) / 10**token.decimals();
		treasuryAmount -= fee - redistribution;

		treasuryAmount += gasFee;

		emit RefundProcessed(account, amount, fee);
	}

	function withdrawTreasury() external onlyOwner {
		require(treasuryAmount > 0, "Nothing to withdraw");
		uint256 amount = treasuryAmount;
		treasuryAmount = 0;
		token.safeTransfer(msg.sender, amount);
	}
}
