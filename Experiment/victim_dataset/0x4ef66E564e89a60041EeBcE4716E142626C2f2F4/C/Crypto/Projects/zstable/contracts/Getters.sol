// SPDX-License-Identifier: MIT

pragma solidity ^0.6.12;
pragma experimental ABIEncoderV2;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/math/SafeMath.sol";
import "@openzeppelin/contracts/utils/Address.sol";
import "./external/IUniswapV2Factory.sol";
import "./external/IUniswapV2Router02.sol";
import "./Constants.sol";
import "./State.sol";

contract Getters is State {
    using SafeMath for uint256;
    using Address for address;

    function getLargeBalances(address account) public view returns (uint256) {
        return _largeBalances[account];
    }
    function getAllowances(address account, address spender) public view returns (uint256) {
        return _allowances[account][spender];
    } 
    function getSupportedPools(uint256 index) public view returns (address) {
        return _supportedPools[index];
    }
    function getPoolCounters(address pool) public view returns (address, uint256, uint256, uint256, uint256, uint256) {
        PoolCounter memory pc = _poolCounters[pool];
        return (pc.pairToken, pc.tokenBalance, pc.pairTokenBalance, pc.lpBalance, pc.startTokenBalance, pc.startPairTokenBalance);
    }
    function isSupportedPool(address pool) public view returns (bool) {
        return _isSupportedPool[pool];
    }
    function mainPool() public view returns (address) {
        return _mainPool;
    }
    function getCurrentEpoch() public view returns (uint256) {
        return _currentEpoch;
    }
    function getLargeTotal() public view returns (uint256) {
        return _largeTotal;
    }
    function getTotalSupply() public view returns (uint256) {
        return _totalSupply;
    }
    function isPresaleDone() public view returns (bool) {
        return _presaleDone;
    }
    function isTaxLess() public view returns (bool) {
        return _taxLess;
    }
    function getUniswapRouter() public view returns (IUniswapV2Router02) {
        return IUniswapV2Router02(Constants.getRouterAdd());
    }
    function getUniswapFactory() public view returns (IUniswapV2Factory) {
        return IUniswapV2Factory(Constants.getFactoryAdd());
    }
    function getFactor() public view returns(uint256) {
        if (isPresaleDone()) {
            return _largeTotal.div(_totalSupply);
        } else {
            return _largeTotal.div(Constants.getLaunchSupply());
        }
    }
    function getUpdatedPoolCounters(address pool, address pairToken) public view returns (uint256, uint256, uint256) {
        uint256 lpBalance = IERC20(pool).totalSupply();
        uint256 tokenBalance = IERC20(address(this)).balanceOf(pool);
        uint256 pairTokenBalance = IERC20(address(pairToken)).balanceOf(pool);
        return (tokenBalance, pairTokenBalance, lpBalance);
    }
    function getMintValue(address sender, uint256 amount) internal view returns(uint256) {
        uint256 expansionR = (_poolCounters[sender].pairTokenBalance).mul(_poolCounters[sender].startTokenBalance).mul(100).div(_poolCounters[sender].startPairTokenBalance).div(_poolCounters[sender].tokenBalance);
        uint256 mintAmount;
        if (expansionR > (Constants.getBaseExpansionFactor()).add(10000).div(100)) {
            uint256 mintFactor = expansionR.mul(expansionR);
            mintAmount = amount.mul(mintFactor.sub(10000)).div(10000);
        } else {
            mintAmount = amount.mul(Constants.getBaseExpansionFactor()).div(10000);
        }
        return mintAmount;
    }

    function getUtilityFee(uint256 amount) internal view returns(uint256, uint256) {
        uint256 currentFactor = getFactor();
        uint256 utilityFee = amount.mul(Constants.getBaseUtilityFee()).div(10000);
        return (utilityFee, utilityFee.mul(currentFactor));
    }
    function getMintRate(address pool) external view returns (uint256) {
        uint256 expansionR = (_poolCounters[pool].pairTokenBalance).mul(_poolCounters[pool].startTokenBalance).mul(100).div(_poolCounters[pool].startPairTokenBalance).div(_poolCounters[pool].tokenBalance);
        if (expansionR > (Constants.getBaseExpansionFactor()).add(10000).div(100)) {
            uint256 mintFactor = expansionR.mul(expansionR);
            return mintFactor.sub(10000);
        } else {
            return Constants.getBaseExpansionFactor();
        }
    }
    function getBurnRate(address pool) external view returns (uint256) {
        uint256 contractionR = (_poolCounters[pool].tokenBalance).mul(_poolCounters[pool].startPairTokenBalance).mul(100).div(_poolCounters[pool].pairTokenBalance).div(_poolCounters[pool].startTokenBalance);
        uint256 burnRate;
        if (contractionR > (Constants.getBaseContractionFactor().add(10000)).div(100)) {
            uint256 burnFactor = contractionR.mul(contractionR);
            burnRate = burnFactor.sub(10000);
            if (burnRate > Constants.getBaseContractionCap()) {
                return Constants.getBaseContractionCap();
            }
            return burnRate;

        } else {
            return Constants.getBaseContractionFactor();
        }
    }
}