// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {

    // Enum provided/assumed
    enum Choices {
        Yes,
        No
    }

    // Struct definition
    struct Vote {
        Choices choice;
        address voter;
    }

    // External view function returning a Vote instance
    function createVote(Choices _choice)
        external
        view
        returns (Vote memory)
    {
        return Vote({
            choice: _choice,
            voter: msg.sender
        });
    }
}