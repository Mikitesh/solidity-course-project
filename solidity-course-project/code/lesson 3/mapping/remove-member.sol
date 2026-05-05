// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MemberManager {
    mapping(address => bool) public members;

    function addMember(address _address) external {
        members[_address] = true;
    }

    function removeMember(address _address) external {
        members[_address] = false;
    }

    function isMember(address _address) external view returns(bool) {
        return members[_address];
    }
}

contract Contract is MemberManager {}
