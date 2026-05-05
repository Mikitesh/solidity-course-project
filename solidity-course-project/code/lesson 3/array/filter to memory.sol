// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {

    // Pure external function
    // Returns only even numbers from the input array
    function filterEven(uint[] calldata numbers)
        external
        pure
        returns (uint[] memory)
    {

        // First count how many even numbers exist
        uint count = 0;

        for (uint i = 0; i < numbers.length; i++) {
            if (numbers[i] % 2 == 0) {
                count++;
            }
        }

        // Create memory array with exact size
        uint[] memory evenNumbers = new uint[](count);

        // Fill the new array with even numbers
        uint index = 0;

        for (uint i = 0; i < numbers.length; i++) {
            if (numbers[i] % 2 == 0) {
                evenNumbers[index] = numbers[i];
                index++;
            }
        }

        return evenNumbers;
    }
}