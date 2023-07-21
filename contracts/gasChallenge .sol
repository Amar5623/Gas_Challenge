// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract gasChallenge {
    uint8 constant ARRAY_SIZE = 10;
    uint8[ARRAY_SIZE] numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    uint256 sum;

    // Function to check for the sum of array
    function getSumOfArray() public view returns (uint256) {
        uint256 tempSum = 0;
        for (uint8 i = 0; i < ARRAY_SIZE; i++) {
            tempSum += numbers[i];
        }
        return tempSum;
    }

    function notOptimizedFunction() public {
        for (uint8 i = 0; i < ARRAY_SIZE; i++) {
            numbers[i] = 0;
        }
    }

    // Optimized function to set all elements of the numbers array to 0
    // Sum of elements in the numbers array should equal 0
    function optimizedFunction() public {
        unchecked {
            for (uint8 i = 0; i < ARRAY_SIZE; i++) {
                numbers[i] = 0;
            }
        }
        sum = 0;
    }

    // Function to get the sum of elements in the numbers array after optimization
    function getSumAfterOptimization() public view returns (uint256) {
        uint256 tempSum = 0;
        for (uint8 i = 0; i < ARRAY_SIZE; i++) {
            tempSum += numbers[i];
        }
        return tempSum;
    }
}