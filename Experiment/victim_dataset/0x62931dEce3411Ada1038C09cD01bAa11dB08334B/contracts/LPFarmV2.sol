//SPDX-License-Identifier: Unlicense
pragma solidity 0.8.4;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./FormToken.sol";
import "./StableToken.sol";
import "./LPToken.sol";

contract LPFarmingV2 is Ownable {

    // base APR
    uint256 public BASE_APR = 5;
    uint256 public MULTIPLIER;
    uint256 public FEE = 3;
    uint256 public FEE_BALANCE = 0;
    address public FEE_TO;
    address public FEE_TO_SETTER;
    uint256 private ONE_YEAR = 31536000;
    uint256 private ONE_ETH = 1000000000000000000;
    // user's staking balance in LP
    mapping(address => uint256) public stakingBalanceLp;
    // staking start timestamp
    mapping(address => uint256) public startTime;
    // user's yield to claim
    mapping(address => uint256) public yieldBalance;
    // user's index
    mapping(address => uint256) public trenchIndex;
    // Trenches
    uint256[2][] public trenches;
    // Staking and rewards token interface
    LPToken public lpToken;
    FormToken public formToken;
    StableToken public stableToken;

    // contract's events
    event Staked(address indexed from, uint256 amount);
    event Unstaked(address indexed from, uint256 amount);
    event YieldWithdraw(address indexed to, uint256 amount);
    event FeeWithdraw(address indexed to, uint256 amount);

    constructor(
        FormToken _formToken,
        LPToken _lpToken,
        StableToken _stableToken,
        uint256 initialMultiplier,
        address _feeToSetter
        ) {
        formToken = _formToken;
        lpToken = _lpToken;
        stableToken = _stableToken;
        MULTIPLIER = initialMultiplier;
        FEE_TO_SETTER = _feeToSetter;
        FEE_TO = _feeToSetter;
        trenches.push([block.timestamp, BASE_APR*MULTIPLIER]);
    }

    /// APR and multiplier calculations
    function getAPRValue() external view returns(uint256) {
        return BASE_APR*MULTIPLIER;
    }
    function setMultiplier(uint256 newMultiplier) onlyOwner external {
        MULTIPLIER = newMultiplier;
        trenches.push([block.timestamp, BASE_APR*MULTIPLIER]);
    }
    function setFee(uint256 newFee) external {
        require(msg.sender == FEE_TO_SETTER, 'FORBIDDEN');
        FEE = newFee;
    }
    function sendFeeTo(address feeTo) external {
        require(msg.sender == FEE_TO_SETTER, 'FORBIDDEN');
        FEE_TO = feeTo;
    }
    function setFeeToSetter(address newSetter) external {
        require(msg.sender == FEE_TO_SETTER, 'FORBIDDEN');
        FEE_TO_SETTER = newSetter;
    }
    function getStakingBalance(uint256 amount) public view returns(uint256) {
        uint256 LPSupply = lpToken.totalSupply();
        uint256 stableTokenBalance = stableToken.balanceOf(address(lpToken));
        uint256 stakingBalanceUSD = stableTokenBalance * 2 * ((amount * ONE_ETH) / LPSupply);
        return stakingBalanceUSD / ONE_ETH;
    }
    function getRewardsValueInForm(uint256 amount) private view returns(uint256) {
        uint256 formTokenBalance = formToken.balanceOf(address(lpToken));
        uint256 stableCoinBalance = stableToken.balanceOf(address(lpToken));
        uint256 formPrice = (stableCoinBalance * ONE_ETH) / formTokenBalance;
        uint256 rewardInForm = (amount * ONE_ETH) / formPrice;
        return rewardInForm;
    }
    /// Yield calculations
    function _calculateYield(address user) private view returns(uint256) {
        // end means now
        uint256 end = block.timestamp;
        uint256 totalYield;
        // loop through trenches
        for(uint256 i = trenchIndex[user]; i < trenches.length; i++){
            // how long the user was staking during the trench
            uint256 stakingTimeWithinTier;
            // if comparing to the last trench then
            // check how long user was staking during that trench
            if (i + 1 == trenches.length) {
                if (startTime[user] > trenches[i][0]) {
                    stakingTimeWithinTier = end - startTime[user];
                } else {
                    stakingTimeWithinTier = end - trenches[i][0];
                    // if no at all, then work is done
                    if (stakingTimeWithinTier < 0) {
                        continue;
                    }
                }
            } else {
                // check if user was staking during that trench
                // if no skip to another trench
                if (startTime[user] >= trenches[i + 1][0]) {
                    continue;
                } else {
                    // check if user was staking during the entire trench or partially
                    uint256 stakingTimeRelative = trenches[i + 1][0] - startTime[user];
                    uint256 tierTime = trenches[i + 1][0] - trenches[i][0];
                    // that means entire timespan (even more)
                    if (stakingTimeRelative >= tierTime) {
                        stakingTimeWithinTier = tierTime;
                    } else {
                        // that means partially
                        stakingTimeWithinTier = stakingTimeRelative;
                    }
                }
            }
            // calculate yield earned during the trench
            uint256 yieldEarnedWithinTier = (((trenches[i][1] * ONE_ETH) / ONE_YEAR) * stakingTimeWithinTier) / 100;
            uint256 stakingBalance = getStakingBalance(stakingBalanceLp[user]);
            uint256 netYield = stakingBalance * yieldEarnedWithinTier;
            uint256 netYieldFormatted = netYield / ONE_ETH;
            // add to total yield (from all trenches eventually)
            totalYield += netYieldFormatted;
        }
        return totalYield;
    }

    function getUsersYieldAmount(address user) public view returns(uint256) {
        require(
            stakingBalanceLp[user] > 0,
            "You do not stake any tokens");
        uint256 yieldEarned = _calculateYield(user);
        uint256 yieldUpToDate = yieldBalance[user];
        uint256 yieldTotal = yieldEarned + yieldUpToDate;
        return yieldTotal;
    }

    /// Core functions
    function stake(uint256 amount) external {
        // amount to stake and user's balance can not be 0
        require(
            amount > 0 &&
            lpToken.balanceOf(msg.sender) >= amount, 
            "You cannot stake zero tokens");
        
        // if user is already staking, calculate up-to-date yield
        if(stakingBalanceLp[msg.sender] > 0){
            uint256 yieldEarned = getUsersYieldAmount(msg.sender);
            yieldBalance[msg.sender] = yieldEarned;
        }

        lpToken.transferFrom(msg.sender, address(this), amount); // add LP tokens to the staking pool
        stakingBalanceLp[msg.sender] += amount;
        startTime[msg.sender] = block.timestamp; // upserting the staking schedule whether user is already staking or not
        trenchIndex[msg.sender] = trenches.length - 1;
        emit Staked(msg.sender, amount);
    }

    function unstake(uint256 amount) external {
        require(
            stakingBalanceLp[msg.sender] >= amount, 
            "Nothing to unstake"
        );

        uint256 lpFeeValue = amount * FEE / 1000;
        uint256 lpTransferValue = amount - lpFeeValue;
        uint256 usdTransferValue = getUsersYieldAmount(msg.sender);
        uint256 formTransferValue = getRewardsValueInForm(usdTransferValue);

        lpToken.transfer(msg.sender, lpTransferValue); // transfer LP tokens
        formToken.transfer(msg.sender, formTransferValue); // transfer FORM tokens
        yieldBalance[msg.sender] = 0;
        FEE_BALANCE += lpFeeValue;
        startTime[msg.sender] = block.timestamp;
        stakingBalanceLp[msg.sender] -= amount;
        trenchIndex[msg.sender] = trenches.length - 1;

        emit Unstaked(msg.sender, amount);
    }
    
    function withdrawYield() external {
        uint256 yieldEarned = getUsersYieldAmount(msg.sender);
        require(yieldEarned > 0, "Nothing to withdraw");

        uint256 transferValue = yieldEarned;

        uint256 transferValueForm = getRewardsValueInForm(transferValue);

        formToken.transfer(msg.sender, transferValueForm);

        startTime[msg.sender] = block.timestamp;
        yieldBalance[msg.sender] = 0;
        trenchIndex[msg.sender] = trenches.length - 1;

        emit YieldWithdraw(msg.sender, transferValue);
    }

    function withdrawFee() external {
        require(FEE_BALANCE > 0, "Nothing to withdraw");
        require(msg.sender == FEE_TO, 'FORBIDDEN');
        uint256 transferValue = FEE_BALANCE;
        lpToken.transfer(msg.sender, transferValue);
        FEE_BALANCE = 0;
        emit FeeWithdraw(msg.sender, transferValue);
    }

}