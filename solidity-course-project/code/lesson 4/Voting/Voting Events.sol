// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {

    event ProposalCreated(uint proposalId);
    event VoteCast(uint proposalId, address voter);
    event ProposalExecuted(uint proposalId);

    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
        bool executed; // ✅ NEW
    }

    Proposal[] public proposals;

    mapping(address => bool) public isMember;

    constructor(address[] memory _members) {
        isMember[msg.sender] = true;

        for (uint i = 0; i < _members.length; i++) {
            isMember[_members[i]] = true;
        }
    }

    modifier onlyMember() {
        require(isMember[msg.sender], "Not a voting member");
        _;
    }

    function newProposal(address _target, bytes calldata _data)
        external
        onlyMember
    {
        proposals.push(Proposal({
            target: _target,
            data: _data,
            yesCount: 0,
            noCount: 0,
            executed: false
        }));

        emit ProposalCreated(proposals.length - 1);
    }

    mapping(uint => mapping(address => int8)) public votes;

    function castVote(uint proposalId, bool support)
        external
        onlyMember
    {
        Proposal storage proposal = proposals[proposalId];

        require(!proposal.executed, "Already executed"); // safety

        int8 previousVote = votes[proposalId][msg.sender];
        int8 newVote = support ? int8(1) : int8(-1);

        // remove previous vote
        if (previousVote == 1) {
            proposal.yesCount--;
        } else if (previousVote == -1) {
            proposal.noCount--;
        }

        // apply new vote
        if (newVote == 1) {
            proposal.yesCount++;
        } else {
            proposal.noCount++;
        }

        votes[proposalId][msg.sender] = newVote;

        emit VoteCast(proposalId, msg.sender);

        // ---------------- EXECUTION LOGIC ----------------
        if (!proposal.executed && proposal.yesCount >= 10) {
            proposal.executed = true;

            (bool success, ) = proposal.target.call(proposal.data);
            require(success, "Execution failed");

            emit ProposalExecuted(proposalId);
        }
    }
}
