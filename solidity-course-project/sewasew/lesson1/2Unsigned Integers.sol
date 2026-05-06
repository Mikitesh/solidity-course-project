// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    uint8 public a = 100;      // valid (0–255) accept  between 0 to  256

    uint16 public b = 300;     // valid (≥ 256) accept above or euals to 256

    uint256 public sum = a + b;

    
}
