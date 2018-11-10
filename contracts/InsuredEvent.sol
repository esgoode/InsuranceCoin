pragma solidity ^0.4.24;

import "./InsuranceCoin.sol";

/**
* @title InsuredEvent
* @author esgoode
*/
contract InsuredEvent {
    string title;
    string description;
    string symbol;
    uint cost;
    uint time;
    uint yesVotes;
    uint noVotes;
    uint numVerifiers;

    bool eventOccured;

    enum State { yes, no, before }
    State finalState = State.before;

    address owner;
    address public tokenAddress;

    //maps verifiers address to vote and if verifier
    mapping (address => State) private votes;
    mapping (address => bool) private verifiers;

    InsuranceCoin public coinContract;
    /**
    * @dev Reverts if not in time range.
    */
    modifier onlyAfter(uint _time) { require (now >= _time); _; }

    /**
    * @notice creating instance and InsuranceCoin for event
    * @dev Constructor 
    * @param _title title of event
    * @param _description description of event
    * @param _symbol token symbol
    * @param _cost cost per token
    * @param _time time of event
    * @param _verifiers address to vote on result of event
    */
    constructor(string _title, string _description, string _symbol, uint _cost, uint _time, address[] _verifiers) public
    {
        title = _title;
        description = _description;
        symbol = _symbol;
        cost = _cost;
        time = _time;

        coinContract = new InsuranceCoin(title, symbol, 0, cost);

        numVerifiers = _verifiers.length;

        for(uint i = 0; i < numVerifiers; ++i) {
            votes[_verifiers[i]] = State.before;
            verifiers[_verifiers[i]] = true;
        }
    }

    /**
    * To be deleted
    * @dev test function for getting InsuranceCoin information
    */  
    function getContract() public view returns (InsuranceCoin) 
    {
        return coinContract;
    }

    /**
    * @dev takes in verifiers result and adjusts tallies
    * @param _result verifers vote
    */
    function eventResults(uint _result) public
    {
        require(contains(msg.sender));
        votes[msg.sender] = State(_result);

        if(votes[msg.sender] == State.yes)
            yesVotes++;
        else if(votes[msg.sender] == State.no)
            noVotes++;
    }

    /**
    * @dev checks to see if address is a verifier
    * @param _verifier verifier to check
    */
    function contains(address _verifier) private view returns (bool){
        return verifiers[_verifier];
    }

    /**
    * @return returns whether the results have occured or not, sets result of final state
    */
    function checkEvent() onlyAfter(time) public returns (bool){


        require ((yesVotes + noVotes) == numVerifiers);
        if(yesVotes > noVotes)
            finalState = State.yes;
        else if (noVotes > yesVotes)
            finalState = State.no;

        //need condition when tie, participants receive money back

        return yesVotes > noVotes;
    }
}
