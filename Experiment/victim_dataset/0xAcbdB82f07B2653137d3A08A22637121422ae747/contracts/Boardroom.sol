//SPDX-License-Identifier: MIT
pragma solidity =0.6.6;

import "@openzeppelin/contracts/math/Math.sol";
import "@openzeppelin/contracts/math/SafeMath.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import "./time/Timeboundable.sol";
import "./SyntheticToken.sol";
import "./interfaces/ITokenManager.sol";
import "./interfaces/IBoardroom.sol";

/// Boardroom distributes token emission among shareholders
contract Boardroom is IBoardroom, ReentrancyGuard, Timeboundable, Operatable {
    using SafeMath for uint256;

    /// Added each time reward to the Boardroom is added
    struct PoolRewardSnapshot {
        /// when snapshost was made
        uint256 timestamp;
        /// how much reward was added at this snapshot
        uint256 addedSyntheticReward;
        /// accumulated reward per share unit (10^18 of reward token)
        uint256 accruedRewardPerShareUnit;
    }

    /// Accumulated personal rewards available for claiming
    struct PersonRewardAccrual {
        /// Last accrual time represented by snapshotId
        uint256 lastAccrualSnaphotId;
        /// Accrued and ready for distribution reward
        uint256 accruedReward;
    }

    /// A set of PoolRewardSnapshots for every synthetic token
    mapping(address => PoolRewardSnapshot[]) public poolRewardSnapshots;
    /// A set of records of personal accumulated income.
    /// The first key is token, the second is holder address.
    mapping(address => mapping(address => PersonRewardAccrual))
        public personRewardAccruals;

    /// Pause
    bool public pause;

    /// one unit of staking token (e.g. # of wei in eth)
    uint256 public immutable stakingUnit;

    /// Staking token. Both base and boost token yield reward token which ultimately participates in rewards distribution.
    SyntheticToken public stakingToken;
    /// TokenManager ref
    ITokenManager public tokenManager;
    /// EmissionManager ref
    address public emissionManager;

    /// Staking token supply in the Boardroom
    uint256 public stakingTokenSupply;
    /// Staking token balances in the Boardroom
    mapping(address => uint256) public stakingTokenBalances;

    /// Creates new Boardroom
    /// @param _stakingToken address of the base token. Should have 18 decimals.
    /// @param _tokenManager address of the TokenManager
    /// @param _emissionManager address of the EmissionManager
    /// @param _start start of the boardroom date
    constructor(
        address _stakingToken,
        address _tokenManager,
        address _emissionManager,
        uint256 _start
    ) public Timeboundable(_start, 0) {
        stakingToken = SyntheticToken(_stakingToken);
        stakingUnit = uint256(10)**18;
        tokenManager = ITokenManager(_tokenManager);
        emissionManager = _emissionManager;
    }

    // ------- Modifiers ----------

    /// Checks if pause is set
    modifier unpaused() {
        require(!pause, "Boardroom operations are paused");
        _;
    }

    // ------- Public ----------

    /// Funds available for user to withdraw
    /// @param syntheticTokenAddress the token we're looking up balance for
    /// @param owner the owner of the token
    function availableForWithdraw(address syntheticTokenAddress, address owner)
        public
        view
        returns (uint256)
    {
        PersonRewardAccrual storage accrual =
            personRewardAccruals[syntheticTokenAddress][owner];
        PoolRewardSnapshot[] storage tokenSnapshots =
            poolRewardSnapshots[syntheticTokenAddress];
        if (tokenSnapshots.length == 0) {
            return 0;
        }
        PoolRewardSnapshot storage lastSnapshot =
            tokenSnapshots[tokenSnapshots.length.sub(1)];
        uint256 lastOverallRPSU = lastSnapshot.accruedRewardPerShareUnit;
        PoolRewardSnapshot storage lastAccrualSnapshot =
            tokenSnapshots[accrual.lastAccrualSnaphotId];
        uint256 lastUserAccrualRPSU =
            lastAccrualSnapshot.accruedRewardPerShareUnit;
        uint256 deltaRPSU = lastOverallRPSU.sub(lastUserAccrualRPSU);
        uint256 addedUserReward =
            shareTokenBalance(owner).mul(deltaRPSU).div(stakingUnit);
        return accrual.accruedReward.add(addedUserReward);
    }

    /// Stake tokens into Boardroom
    /// @param to the receiver of the token
    /// @param amount amount of staking token
    function stake(address to, uint256 amount)
        public
        nonReentrant
        inTimeBounds
        unpaused
    {
        require((amount > 0), "Boardroom: amount should be > 0");
        updateAccruals(msg.sender);
        stakingTokenBalances[to] = stakingTokenBalances[to].add(amount);
        stakingTokenSupply = stakingTokenSupply.add(amount);
        _doStakeTransfer(msg.sender, to, amount);
        emit Staked(msg.sender, to, amount);
    }

    /// Withdraw tokens from Boardroom
    /// @param to the receiver of the token
    /// @param amount amount of base token
    function withdraw(address to, uint256 amount) public nonReentrant {
        require((amount > 0), "Boardroom: amount should be > 0");
        updateAccruals(msg.sender);
        stakingTokenBalances[msg.sender] = stakingTokenBalances[msg.sender].sub(
            amount
        );
        stakingTokenSupply = stakingTokenSupply.sub(amount);
        _doWithdrawTransfer(msg.sender, to, amount);
        emit Withdrawn(msg.sender, to, amount);
    }

    /// Called inside `stake` method after updating internal balances
    /// @param from the owner of the staking tokens
    /// @param amount amount to stake
    function _doStakeTransfer(
        address from,
        address,
        uint256 amount
    ) internal virtual {
        stakingToken.transferFrom(from, address(this), amount);
    }

    /// Called inside `withdraw` method after updating internal balances
    /// @param to the receiver of the staking tokens
    /// @param amount amount to unstake
    function _doWithdrawTransfer(
        address,
        address to,
        uint256 amount
    ) internal virtual {
        stakingToken.transfer(to, amount);
    }

    /// Shows the balance of the virtual token that participates in reward calculation
    /// @param owner the owner of the share tokens
    function shareTokenBalance(address owner)
        public
        view
        virtual
        returns (uint256)
    {
        return stakingTokenBalances[owner];
    }

    /// Shows the supply of the virtual token that participates in reward calculation
    function shareTokenSupply() public view virtual returns (uint256) {
        return stakingTokenSupply;
    }

    /// Update accrued rewards for all tokens of sender
    /// @param owner address to update accruals
    function updateAccruals(address owner) public unpaused {
        address[] memory tokens = tokenManager.allTokens();
        for (uint256 i = 0; i < tokens.length; i++) {
            _updateAccrual(tokens[i], owner);
        }
    }

    /// Transfer all rewards to sender
    /// @param to reward receiver
    function claimRewards(address to) public nonReentrant unpaused {
        updateAccruals(msg.sender);
        address[] memory tokens = tokenManager.allTokens();
        for (uint256 i = 0; i < tokens.length; i++) {
            _claimReward(to, tokens[i]);
        }
    }

    // ------- Public, EmissionManager ----------

    /// Notify Boardroom about new incoming reward for token
    /// @param token Rewards denominated in this token
    /// @param amount The amount of rewards
    function notifyTransfer(address token, uint256 amount) external override {
        require(
            msg.sender == address(emissionManager),
            "Boardroom: can only be called by EmissionManager"
        );
        uint256 shareSupply = shareTokenSupply();
        require(
            shareSupply > 0,
            "Boardroom: Cannot receive incoming reward when token balance is 0"
        );
        PoolRewardSnapshot[] storage tokenSnapshots =
            poolRewardSnapshots[token];
        PoolRewardSnapshot storage lastSnapshot =
            tokenSnapshots[tokenSnapshots.length - 1];
        uint256 deltaRPSU = amount.mul(stakingUnit).div(shareSupply);
        tokenSnapshots.push(
            PoolRewardSnapshot({
                timestamp: block.timestamp,
                addedSyntheticReward: amount,
                accruedRewardPerShareUnit: lastSnapshot
                    .accruedRewardPerShareUnit
                    .add(deltaRPSU)
            })
        );
        emit IncomingBoardroomReward(token, msg.sender, amount);
    }

    // ------- Public, Owner (timelock) ----------

    /// Updates TokenManager
    /// @param _tokenManager new TokenManager
    function setTokenManager(address _tokenManager) public onlyOwner {
        tokenManager = ITokenManager(_tokenManager);
        emit UpdatedTokenManager(msg.sender, _tokenManager);
    }

    /// Updates EmissionManager
    /// @param _emissionManager new EmissionManager
    function setEmissionManager(address _emissionManager) public onlyOwner {
        emissionManager = _emissionManager;
        emit UpdatedEmissionManager(msg.sender, _emissionManager);
    }

    // ------- Public, Operator (multisig) ----------

    /// Set pause
    /// @param _pause pause value
    function setPause(bool _pause) public onlyOperator {
        pause = _pause;
        emit UpdatedPause(msg.sender, _pause);
    }

    // ------- Internal ----------

    function _claimReward(address to, address syntheticTokenAddress) internal {
        uint256 reward =
            personRewardAccruals[syntheticTokenAddress][msg.sender]
                .accruedReward;
        if (reward > 0) {
            personRewardAccruals[syntheticTokenAddress][msg.sender]
                .accruedReward = 0;
            SyntheticToken token = SyntheticToken(syntheticTokenAddress);
            token.transfer(to, reward);
            emit RewardPaid(syntheticTokenAddress, msg.sender, to, reward);
        }
    }

    function _updateAccrual(address syntheticTokenAddress, address owner)
        internal
    {
        PersonRewardAccrual storage accrual =
            personRewardAccruals[syntheticTokenAddress][owner];
        PoolRewardSnapshot[] storage tokenSnapshots =
            poolRewardSnapshots[syntheticTokenAddress];
        if (tokenSnapshots.length == 0) {
            tokenSnapshots.push(
                PoolRewardSnapshot({
                    timestamp: block.timestamp,
                    addedSyntheticReward: 0,
                    accruedRewardPerShareUnit: 0
                })
            );
        }
        if (accrual.lastAccrualSnaphotId == tokenSnapshots.length - 1) {
            return;
        }
        PoolRewardSnapshot storage lastSnapshot =
            tokenSnapshots[tokenSnapshots.length - 1];
        uint256 lastOverallRPSU = lastSnapshot.accruedRewardPerShareUnit;
        PoolRewardSnapshot storage lastAccrualSnapshot =
            tokenSnapshots[accrual.lastAccrualSnaphotId];
        uint256 lastUserAccrualRPSU =
            lastAccrualSnapshot.accruedRewardPerShareUnit;
        uint256 deltaRPSU = lastOverallRPSU.sub(lastUserAccrualRPSU);
        uint256 addedUserReward =
            shareTokenBalance(owner).mul(deltaRPSU).div(stakingUnit);
        accrual.lastAccrualSnaphotId = tokenSnapshots.length - 1;
        accrual.accruedReward = accrual.accruedReward.add(addedUserReward);
        emit RewardAccrued(
            syntheticTokenAddress,
            owner,
            addedUserReward,
            accrual.accruedReward
        );
    }

    // ------- Events ----------

    event RewardAccrued(
        address syntheticTokenAddress,
        address to,
        uint256 incrementalReward,
        uint256 totalReward
    );
    event RewardPaid(
        address indexed syntheticTokenAddress,
        address indexed from,
        address indexed to,
        uint256 reward
    );
    event IncomingBoardroomReward(
        address indexed token,
        address indexed from,
        uint256 amount
    );
    event Staked(address indexed from, address indexed to, uint256 amount);
    event Withdrawn(address indexed from, address indexed to, uint256 amount);
    event UpdatedPause(address indexed operator, bool pause);
    event UpdatedTokenManager(
        address indexed operator,
        address newTokenManager
    );
    event UpdatedEmissionManager(
        address indexed operator,
        address newEmissionManager
    );
}
