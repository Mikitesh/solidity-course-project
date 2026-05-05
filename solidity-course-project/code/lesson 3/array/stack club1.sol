// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract StackClub {

    address[] public members;

    // Constructor: deployer becomes first member
    constructor() {
        members.push(msg.sender);
    }

    // Check if address is a member
    function isMember(address user) public view returns (bool) {
        for (uint i = 0; i < members.length; i++) {
            if (members[i] == user) {
                return true;
            }
        }
        return false;
    }

    // Modifier: only existing members can call
    modifier onlyMember() {
        require(isMember(msg.sender), "Not a member");
        _;
    }

    // Add a new member (only existing members)
    function addMember(address newMember) external onlyMember {
        members.push(newMember);
    }

    // Remove last member (only existing members)
    function removeLastMember() external onlyMember {
        require(members.length > 0, "No members to remove");

        members.pop();
    }
}