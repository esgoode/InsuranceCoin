pragma solidity ^0.4.24;

import 'openzeppelin-solidity/contracts/token/ERC20/MintableToken.sol';
//import 'InsuredEvent.sol'

contract InsuranceCoin is MintableToken {

  string public name;
  string public symbol;
  InsuredEvent insEvent;
  uint8 public constant decimals = 18;

  uint256 totalSupply_;

  /**
   * @dev Constructor that creates token and gives msg.sender all initial tokens
   */
  constructor(
  	string coinName,
  	string coinSymbol,
  	InsuredEvent newEvent,
  	uint256 initSupply
  	)
  public
  {

  	name = coinName;
  	symbol = coinSymbol;
	totalSupply_ = initSupply;
	insEvent = newEvent;

	address owner = msg.sender;

  	mint(msg.sender, totalSupply_);
  }

  function eventOccurs public {
  	require(creator == msg.sender)
  }

  
}