pragma solidity ^0.4.24;

import "./InsuranceCoin.sol";

/**
 * The contractName contract does this and that...
 */
contract InsuredEvent {
	string title;
	string description;
	string symbol;
	uint256 cost;
	uint256 time;


	address owner;
	address[] verifiers;
	address public tokenAddress;

	address coinContract;

	constructor(
		string _title,
		string _description,
		string _symbol,
		uint256 _cost,
		uint256 _time,
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

}
