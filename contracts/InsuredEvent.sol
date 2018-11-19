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

    //maps verifiers address to vote and if verifier
    mapping (address => State) private votes;
    mapping (address => bool) private verifiers;

    InsuranceCoin public coinContract;
    event LogCreatedCoin(InsuranceCoin childCoin);
    /**
    * @dev Reverts if not in time range.
    */
    //modifier onlyAfter(uint _time) {require (now >= _time)"not after period"}

    /**
    * @notice creating instance and InsuranceCoin for event
    * @dev Constructor 
    * @param _title title of event
    * @param _description description of event
    * @param _symbol token symbol
    * @param _cost cost per token
    * @param _time time of event
    */
    constructor(string _title, string _description, string _symbol, uint _cost, uint _time, uint _numVerifiers) public
    {
        title = _title;
        description = _description;
        symbol = _symbol;
        cost = _cost;
        time = _time;
        numVerifiers = _numVerifiers;

        coinContract = new InsuranceCoin(_title, _symbol, 20, _cost);
        emit LogCreatedCoin(coinContract);
    }

    function addVerrifier(address verifierAddress) public returns (address){
        verifiers[verifierAddress] = true;
        votes[verifierAddress] = State.before;
        return verifierAddress;
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
        //require(contains(msg.sender), "not contract creator");
        require(eventOccured, "event voting is over");
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
    function contains(address _verifier) public view returns (bool){
        return verifiers[_verifier];
    }

    /**
    * @return returns whether the results have occured or not, sets result of final state
    */
    function countVotes() public view returns (bool){

        require(eventOccured, "event voting is over");

        if(yesVotes > noVotes)
            finalState = State.yes;
        else if (noVotes > yesVotes)
            finalState = State.no;

        return yesVotes > noVotes;
    }

    function finalizeResults() public
    {
        //ensure all votes are cast
        require(numVerifiers == (noVotes + yesVotes), "not all votes are cast");


        //check results
        checkEvent();
        eventOccured = true;
        
        //set coin results
        coinContract.setResult(finalState);
    }


}
