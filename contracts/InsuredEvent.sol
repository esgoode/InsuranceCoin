pragma solidity ^0.4.24;

import "./InsuranceCoin.sol";

/**
 * The contractName contract does this and that...
 */
contract InsuredEvent {
	string title;
	string description;
	string symbol;
	uint cost;
	uint time;


	address owner;
	address[] verifiers;
	address public tokenAddress;

	InsuranceCoin public coinContract;

	constructor(
		string _title,
		string _description,
		string _symbol,
		uint _cost,
		uint _time,
		address[] _verifiers
		) 
	public
	{
		title = _title;
		description = _description;
		symbol = _symbol;
		cost = _cost;
		time = _time;
		verifiers = _verifiers;
		coinContract = new InsuranceCoin(title, symbol, 0, cost);
	}

	function getContract() 
		public 
		returns (InsuranceCoin) 
	{
		return coinContract;
	}


}
