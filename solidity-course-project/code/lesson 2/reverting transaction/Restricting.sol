// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
     address public owner;

    error NotOwner(address caller);

    constructor() payable {
        owner = msg.sender; // store deployer
    }

    function withdraw() public {
        if (msg.sender != owner) {
            revert NotOwner(msg.sender);
        }

        // transfer entire balance to owner
        payable(owner).transfer(address(this).balance);
    }
}