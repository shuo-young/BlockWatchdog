// SPDX-License-Identifier: MIT

pragma solidity ^0.6.12;
pragma experimental ABIEncoderV2;

import "./Constants.sol";
import "./State.sol";
import "./Getters.sol";

contract Setters is State, Getters {
    function setAllowances(address owner, address spender, uint256 amount) internal {
        _allowances[owner][spender] = amount;
    }
    function addToAccount(address account, uint256 amount) internal {
        uint256 currentFactor = getFactor();
        uint256 largeAmount = amount.mul(currentFactor);
        _largeBalances[account] = _largeBalances[account].add(largeAmount);
        _totalSupply = _totalSupply.add(amount);
    }
    function addToAll(uint256 amount) internal {
        _totalSupply = _totalSupply.add(amount);
    }
    function initializeEpoch() internal {
        _currentEpoch = now;
    }
    function updateEpoch() internal {
        initializeEpoch();
        for (uint256 i=0; i<_supportedPools.length; i++) {
            _poolCounters[_supportedPools[i]].startTokenBalance = _poolCounters[_supportedPools[i]].tokenBalance;
            _poolCounters[_supportedPools[i]].startPairTokenBalance = _poolCounters[_supportedPools[i]].pairTokenBalance;
        }
    }
    function initializeLargeTotal() internal {
        _largeTotal = Constants.getLargeTotal();
    }
    function syncPair(address pool) internal returns(bool) {
        (uint256 tokenBalance, uint256 pairTokenBalance, uint256 lpBalance) = getUpdatedPoolCounters(pool, _poolCounters[pool].pairToken);
        bool lpBurn = lpBalance < _poolCounters[pool].lpBalance;
        _poolCounters[pool].lpBalance = lpBalance;
        _poolCounters[pool].tokenBalance = tokenBalance;
        _poolCounters[pool].pairTokenBalance = pairTokenBalance;
        return (lpBurn);
    }
    function silentSyncPair(address pool) public {
        (uint256 tokenBalance, uint256 pairTokenBalance, uint256 lpBalance) = getUpdatedPoolCounters(pool, _poolCounters[pool].pairToken);
        _poolCounters[pool].lpBalance = lpBalance;
        _poolCounters[pool].tokenBalance = tokenBalance;
        _poolCounters[pool].pairTokenBalance = pairTokenBalance;
    }
    function addSupportedPool(address pool, address pairToken) internal {
        require(!isSupportedPool(pool),"This pool is already supported");
        _isSupportedPool[pool] = true;
        _supportedPools.push(pool);
        (uint256 tokenBalance, uint256 pairTokenBalance, uint256 lpBalance) = getUpdatedPoolCounters(pool, pairToken);
        _poolCounters[pool] = PoolCounter(pairToken, tokenBalance, pairTokenBalance, lpBalance, tokenBalance, pairTokenBalance);
    }
    function removeSupportedPool(address pool) internal {
        require(isSupportedPool(pool), "This pool is currently not supported");
        for (uint256 i = 0; i < _supportedPools.length; i++) {
            if (_supportedPools[i] == pool) {
                _supportedPools[i] = _supportedPools[_supportedPools.length - 1];
                _isSupportedPool[pool] = false;
                delete _poolCounters[pool];
                _supportedPools.pop();
                break;
            }
        }
    }
}