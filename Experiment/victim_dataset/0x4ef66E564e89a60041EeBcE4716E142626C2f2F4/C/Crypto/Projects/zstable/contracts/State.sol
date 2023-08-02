// SPDX-License-Identifier: MIT

pragma solidity ^0.6.12;
pragma experimental ABIEncoderV2;

contract State {

    mapping (address => uint256) _largeBalances;
    mapping (address => mapping (address => uint256)) _allowances;

    // Supported pools and data for measuring mint & burn factors
    struct PoolCounter {
        address pairToken;
        uint256 tokenBalance;
        uint256 pairTokenBalance;
        uint256 lpBalance;
        uint256 startTokenBalance;
        uint256 startPairTokenBalance;
    }

    address[] _supportedPools;
    mapping (address => PoolCounter) _poolCounters;
    mapping (address => bool) _isSupportedPool;
    address _mainPool;

    uint256 _currentEpoch;
 
    uint256 _largeTotal;
    uint256 _totalSupply;

    uint256 _presaleDist;
    uint256 _presaleTime;
    uint256 _presalePrice;
    mapping (address => uint256) _presaleParticipation;
    bool _presaleDone;
    
    bool _taxLess;
}