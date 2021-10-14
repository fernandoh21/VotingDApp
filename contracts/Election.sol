// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;

contract Election {
    // Model a Candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // Store accounts that have voted
    mapping(address => uint) public voters;

    // Fetch Candidate
    mapping(uint => Candidate) public candidates;
    
    // Store Candidates Count
    uint public candidatesCount;

    // voted event
    event votedEvent (
        uint indexed _candidateId
    );
    
     constructor() public{
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
        addCandidate("Candidate 3");
        addCandidate("Candidate 4");
        addCandidate("Candidate 5");
        addCandidate("Candidate 6");
    }

     function addCandidate (string memory _name) private {
        candidatesCount++; 
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

   //Store voters total number of votes
   uint public totalVotes;

    function vote (uint _candidateId) public {
        // require that they haven't voted before
        require(voters[msg.sender].totalVotes < 4);

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // record that voter has voted
        voters[msg.sender].totalVoters ++;

        // update candidate vote Count
        candidates[_candidateId].voteCount ++;

        // trigger voted event
        emit votedEvent(_candidateId);
    }
}
