// SPDX-License-Identifier: MIT

pragma solidity ^0.6.12;
pragma experimental ABIEncoderV2;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/math/SafeMath.sol";
import "@openzeppelin/contracts/utils/Address.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/proxy/Initializable.sol";
import "./external/IUniswapV2Factory.sol";
import "./external/IUniswapV2Router02.sol";
import "./external/IWETH.sol";
import "./Constants.sol";
import "./Setters.sol";

contract UPStable is Setters, Context, IERC20, Ownable {
    using SafeMath for uint256;
    using Address for address;

    modifier taxlessTx {
        _taxLess = true;
        _;
        _taxLess = false;
    }

    constructor () public {
        // uniswapRouterV2 = IUniswapV2Router02(Constants.getRouterAdd());
        // uniswapFactory = IUniswapV2Factory(Constants.getFactoryAdd());
        updateEpoch();
        initializeLargeTotal();
        _totalSupply = 10**5 * 10**9;
        uint256 currentFactor = getFactor();
        _largeBalances[_msgSender()] = _largeBalances[_msgSender()].add(_totalSupply.mul(currentFactor));
        _presaleTime = now + 24 hours;
        _presalePrice = 600000;
        emit Transfer(address(0),_msgSender(),_totalSupply);
    }

    function name() public view returns (string memory) {
        return Constants.getName();
    }
    
    function symbol() public view returns (string memory) {
        return Constants.getSymbol();
    }
    
    function decimals() public view returns (uint8) {
        return Constants.getDecimals();
    }
    
    function totalSupply() public view override returns (uint256) {
        return getTotalSupply();
    }
    
    function balanceOf(address account) public view override returns (uint256) {
        uint256 currentFactor = getFactor();
        return getLargeBalances(account).div(currentFactor);
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    function allowance(address owner, address spender) public view override returns (uint256) {
        return getAllowances(owner,spender);
    }

    function approve(address spender, uint256 amount) public override returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(sender, _msgSender(), getAllowances(sender,_msgSender()).sub(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

    function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {
        _approve(_msgSender(), spender, getAllowances(_msgSender(),spender).add(addedValue));
        return true;
    }

    function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {
        _approve(_msgSender(), spender, getAllowances(_msgSender(),spender).sub(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }

    function _approve(address owner, address spender, uint256 amount) private {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");
        setAllowances(owner, spender, amount);
        emit Approval(owner, spender, amount);
    }

    function _transfer(address sender, address recipient, uint256 amount) private {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        require(amount > 0, "Amount must be greater than zero");
        require(amount <= balanceOf(sender),"Amount exceeds balance");
        require(isPresaleDone(),"Presale yet to close");
        if (now > getCurrentEpoch().add(Constants.getEpochLength())) updateEpoch();
        uint256 currentFactor = getFactor();
        uint256 largeAmount = amount.mul(currentFactor);
        uint256 txType;
        if (isTaxLess()) {
            txType = 3;
        } else {
            bool lpBurn;
            if (isSupportedPool(sender)) {
                lpBurn = syncPair(sender);
            } else if (isSupportedPool(recipient)){
                silentSyncPair(recipient);
            } else {
                silentSyncPair(_mainPool);
            }
            txType = _getTxType(sender, recipient, lpBurn);
        }
        // Buy Transaction from supported pools - requires mint, no utility fee
        if (txType == 1) {
            uint256 totalMint = getMintValue(sender, amount);
            // uint256 mintSize = amount.div(100);
            _largeBalances[sender] = _largeBalances[sender].sub(largeAmount);
            _largeBalances[recipient] = _largeBalances[recipient].add(largeAmount);
            _totalSupply = _totalSupply.add(totalMint);
            emit Transfer(sender, recipient, amount);
        }
        // Sells to supported pools or unsupported transfer - requires exit burn and utility fee
        else if (txType == 2) {
            (uint256 burnSize, uint256 largeBurnSize) = getBurnValues(recipient, amount);
            uint256 actualTransferAmount = amount.sub(burnSize);
            uint256 largeTransferAmount = actualTransferAmount.mul(currentFactor);
            _largeBalances[sender] = _largeBalances[sender].sub(largeAmount);
            _largeBalances[recipient] = _largeBalances[recipient].add(largeTransferAmount);
            _totalSupply = _totalSupply.sub(burnSize);
            _largeTotal = _largeTotal.sub(largeBurnSize);
            emit Transfer(sender, recipient, actualTransferAmount);
            emit Transfer(sender, address(0), burnSize);
        } 
        // Add Liquidity via interface or Remove Liquidity Transaction to supported pools - no fee of any sort
        else if (txType == 3) {
            _largeBalances[sender] = _largeBalances[sender].sub(largeAmount);
            _largeBalances[recipient] = _largeBalances[recipient].add(largeAmount);
            emit Transfer(sender, recipient, amount);
        }
    }

    function _getTxType(address sender, address recipient, bool lpBurn) private returns(uint256) {
        uint256 txType = 2;
        if (isSupportedPool(sender)) {
            if (lpBurn) {
                txType = 3;
            } else {
                txType = 1;
            }
        } else if (sender == Constants.getRouterAdd()) {
            txType = 3;
        }
        return txType;
    }

    function setPresaleTime(uint256 time) external onlyOwner() {
        require(isPresaleDone() == false, "This cannot be modified after the presale is done");
        _presaleTime = time;
    }

    function setPresalePrice(uint256 priceInWei) external onlyOwner() {
        require(!isPresaleDone(),"Can only be set before presale");
        _presalePrice = priceInWei;
    }

    // Presale function
    function buyPresale() external payable {
        require(!isPresaleDone(), "Presale is already completed");
        require(_presaleTime <= now, "Presale hasn't started yet");
        require(_presaleParticipation[_msgSender()].add(msg.value) <= Constants.getPresaleIndividualCap(), "Crossed individual cap");
        require(_presalePrice != 0, "Presale price is not set");
        require(msg.value >= Constants.getPresaleIndividualMin(), "Needs to be above min eth!");
        require(!Address.isContract(_msgSender()),"no contracts");
        require(tx.gasprice <= Constants.getMaxPresaleGas(),"gas price above limit");
        uint256 amountToDist = msg.value.div(_presalePrice);
        require(_presaleDist.add(amountToDist) <= Constants.getPresaleCap(), "Presale max cap already reached");
        uint256 currentFactor = getFactor();
        uint256 largeAmount = amountToDist.mul(currentFactor);
        _largeBalances[owner()] = _largeBalances[owner()].sub(largeAmount);
        _largeBalances[_msgSender()] = _largeBalances[_msgSender()].add(largeAmount);
        emit Transfer(owner(), _msgSender(), amountToDist);
        _presaleParticipation[_msgSender()] = _presaleParticipation[_msgSender()].add(msg.value);
        _presaleDist = _presaleDist.add(amountToDist);
    }

    function setPresaleDone() public onlyOwner() {
        require(totalSupply() <= Constants.getLaunchSupply(), "Total supply is already minted");
        _mintRemaining();
        _presaleDone = true;
        _createEthPool();
    }

    function _mintRemaining() private {
        require(!isPresaleDone(), "Cannot mint post presale");
        addToAccount(address(this),70000 * 10 ** 9);
        addToAccount(owner(),15000 * 10 ** 9);
        emit Transfer(address(0),address(this),70000 * 10 ** 9);
    }

    function _createEthPool() private taxlessTx {
        IUniswapV2Router02 uniswapRouterV2 = getUniswapRouter();
        IUniswapV2Factory uniswapFactory = getUniswapFactory();
        address tokenUniswapPair;
        if (uniswapFactory.getPair(address(uniswapRouterV2.WETH()), address(this)) == address(0)) {
            tokenUniswapPair = uniswapFactory.createPair(
            address(uniswapRouterV2.WETH()), address(this));
        } else {
            tokenUniswapPair = uniswapFactory.getPair(address(this),uniswapRouterV2.WETH());
        }
        Constants.getDeployerAdd().transfer(Constants.getDeployerCost());
        _approve(address(this), 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D, 7 * 10**4 * 10**9);
        uniswapRouterV2.addLiquidityETH{value: address(this).balance}(address(this),
            7 * 10**4 * 10**9, 0, 0, address(this), block.timestamp);
        addSupportedPool(tokenUniswapPair, address(uniswapRouterV2.WETH()));
        _mainPool = tokenUniswapPair;
    }

    function getBurnValues(address recipient, uint256 amount) internal returns(uint256, uint256) {
        uint256 currentFactor = getFactor();
        uint256 contractionR;
        if (isSupportedPool(recipient)) {
            contractionR = (_poolCounters[recipient].tokenBalance).mul(_poolCounters[recipient].startPairTokenBalance).mul(100).div(_poolCounters[recipient].pairTokenBalance).div(_poolCounters[recipient].startTokenBalance);
        } else {
            contractionR = (_poolCounters[_mainPool].tokenBalance).mul(_poolCounters[_mainPool].startPairTokenBalance).mul(100).div(_poolCounters[_mainPool].pairTokenBalance).div(_poolCounters[_mainPool].startTokenBalance);
        }
        uint256 burnAmount;
        if (contractionR > (Constants.getBaseContractionFactor().add(10000)).div(100)) {
            uint256 burnFactor = contractionR.mul(contractionR);
            burnAmount = amount.mul(burnFactor.sub(10000)).div(10000);
            require(burnAmount <= amount.mul(Constants.getBaseContractionCap()).div(10000),"Burn rate at max, can't sell");
        } else {
            burnAmount = amount.mul(Constants.getBaseContractionFactor()).div(10000);
        }
        return (burnAmount, burnAmount.mul(currentFactor));
    }

}