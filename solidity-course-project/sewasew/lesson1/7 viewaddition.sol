pragma solidity ^0.8.20;

contract Contract {
    uint256 public x;

    constructor(uint256 initialX) {
        x = initialX;
    }

    function increment() external {
        x = x + 1;
    }
    function add(uint256 value) external view returns (uint256) {
        return x + value;
    }
}
