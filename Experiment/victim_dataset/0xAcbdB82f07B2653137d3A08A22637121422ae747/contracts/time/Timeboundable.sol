//SPDX-License-Identifier: MIT
pragma solidity =0.6.6;

/// Checks time bounds for contract
abstract contract Timeboundable {
    uint256 public immutable start;
    uint256 public immutable finish;

    /// @param _start The block timestamp to start from (in secs). Use 0 for unbounded start.
    /// @param _finish The block timestamp to finish in (in secs). Use 0 for unbounded finish.
    constructor(uint256 _start, uint256 _finish) internal {
        require(
            (_start != 0) || (_finish != 0),
            "Timebound: either start or finish must be nonzero"
        );
        require(
            (_finish == 0) || (_finish > _start),
            "Timebound: finish must be zero or greater than start"
        );
        uint256 s = _start;
        if (s == 0) {
            s = block.timestamp;
        }
        uint256 f = _finish;
        if (f == 0) {
            f = uint256(-1);
        }
        start = s;
        finish = f;
    }

    /// Checks if timebounds are satisfied
    modifier inTimeBounds() {
        require(block.timestamp >= start, "Timeboundable: Not started yet");
        require(block.timestamp <= finish, "Timeboundable: Already finished");
        _;
    }
}
