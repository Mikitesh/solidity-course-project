// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {

    struct User {
        uint256 balance;
        bool isActive;
    }

    mapping(address => User) public users;

    function createUser() external {
        require(!users[msg.sender].isActive, "User already exists");

        users[msg.sender] = User({
            balance: 100,
            isActive: true
        });
    }


    function transfer(address _to, uint256 _amount) external {

        // 1. both users must exist + be active
        require(users[msg.sender].isActive, "Sender not active");
        require(users[_to].isActive, "Recipient not active");

        // 2. sender must have enough balance
        require(users[msg.sender].balance >= _amount, "Insufficient balance");

        // 3. perform transfer
        users[msg.sender].balance -= _amount;
        users[_to].balance += _amount;
    }
}
