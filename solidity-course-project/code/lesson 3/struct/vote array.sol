// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {

    enum Choices {
        Yes,
        No
    }

    struct Vote {
        Choices choice;
        address voter;
    }

    Vote[] public votes;

    mapping(address => bool) public hasVotedMap;

    // -------------------------------
    // CREATE VOTE (only once)
    // -------------------------------
    function createVote(Choices _choice) public {

        require(!hasVotedMap[msg.sender], "Already voted");

        votes.push(
            Vote({
                choice: _choice,
                voter: msg.sender
            })
        );

        hasVotedMap[msg.sender] = true;
    }

    // -------------------------------
    // CHANGE VOTE
    // -------------------------------
    function changeVote(Choices _choice) external {

        require(hasVotedMap[msg.sender], "No existing vote");

        // find and update vote
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == msg.sender) {
                votes[i].choice = _choice;
                return;
            }
        }

        // safety fallback (should never hit if mapping is correct)
        revert("Vote not found");
    }

    // -------------------------------
    // HAS VOTED
    // -------------------------------
    function hasVoted(address user) external view returns (bool) {
        return hasVotedMap[user];
    }

    // -------------------------------
    // FIND CHOICE
    // -------------------------------
    function findChoice(address user) external view returns (Choices) {

        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == user) {
                return votes[i].choice;
            }
        }

        revert("No vote found");
    }
}