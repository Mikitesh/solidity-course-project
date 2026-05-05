// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {

    // Example enum (required because Vote uses Choices)
    enum Choices {
        Yes,
        No
    }

    // Struct definition
    struct Vote {
        Choices choice;
        address voter;
    }

    // Public storage variable of type Vote
    Vote public vote;

    // Create vote function
    function createVote(Choices _choice) external {

        // Store new Vote in storage
        vote = Vote({
            choice: _choice,
            voter: msg.sender
        });
    }
}