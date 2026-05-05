 // SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {

    // IMPORTANT: must match test expectations
    enum ConnectionTypes {
        Unacquainted, // 👈 added to match test
        Friend,
        Family,
        Blocked
    }

    mapping(address => mapping(address => ConnectionTypes)) public connections;

    function connectWith(address _to, ConnectionTypes _type) external {
        require(_to != msg.sender, "Cannot connect to yourself");

        connections[msg.sender][_to] = _type;
    }
}

