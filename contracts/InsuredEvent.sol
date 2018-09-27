pragma solidity ^0.4.24

/**
 * The contractName contract does this and that...
 */
contract InsuredEvent {
	string title;
	string description;
	string symbol;
	int cost;
	uint256 time;
	address owner;
	address[] verifiers private;
	//coinGain
	//coinDecrease

	constructor(
		string eventTitle, 
		string eventDescription,
		string eventTime,
		string Event,
		address[] eventVerifiers;
		

		) 
	public
	{
		owner = msg.sender;

	}	

}
