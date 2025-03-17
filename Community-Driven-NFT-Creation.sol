// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract CommunityNFTDAO {
    string public projectTitle = "Community-Driven NFT Creation";
    string public projectDescription = "Build a DAO that allows community members to vote on and fund the creation of new NFTs.";

    struct Proposal {
        string description;
        uint256 voteCount;
    }

    Proposal[] public proposals;
    mapping(address => bool) public hasVoted;

    function createProposal(string memory _description) public {
        proposals.push(Proposal({description: _description, voteCount: 0}));
    }

    function voteOnProposal(uint256 _proposalIndex) public {
        require(!hasVoted[msg.sender], "You have already voted.");
        require(_proposalIndex < proposals.length, "Invalid proposal index.");

        proposals[_proposalIndex].voteCount++;
        hasVoted[msg.sender] = true;
    }
    
    function getProposal(uint256 _proposalIndex) public view returns (string memory description, uint256 voteCount) {
        require(_proposalIndex < proposals.length, "Invalid proposal index.");
        Proposal memory proposal = proposals[_proposalIndex];
        return (proposal.description, proposal.voteCount);
    }
}
