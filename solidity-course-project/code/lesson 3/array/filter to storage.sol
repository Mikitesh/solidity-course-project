// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {

    // Public dynamic array state variable
    uint[] public evenNumbers;

    // External function to filter even numbers
    function filterEven(uint[] calldata numbers) external {

        for (uint i = 0; i < numbers.length; i++) {

            // Check if number is even
            if (numbers[i] % 2 == 0) {

                // Push even number into storage array
                evenNumbers.push(numbers[i]);
            }
        }
    }
}