pragma solidity ^0.4.24;

import 'openzeppelin-solidity/contracts/token/ERC20/MintableToken.sol';
//import 'InsuredEvent.sol'

contract InsuranceCoin is MintableToken {

  string public name;
  string public symbol;
  InsuredEvent insEvent;
  uint8 public constant decimals = 18;
  uint256 totalSupply_;
  uint256 costPerToken;

  /**
   * @dev Constructor that creates token and gives msg.sender all initial tokens
   */
  constructor(
  	string coinName,
  	string coinSymbol,
  	InsuredEvent newEvent,
  	uint256 initSupply,
  	uint256 cost
  	)
  public
  {

  	name = coinName;
  	symbol = coinSymbol;
	totalSupply_ = initSupply;
	insEvent = newEvent;
	costPerToken = cost;

	address owner = msg.sender;
  }

  // function eventEnds(
  // 	bool hasOccured
  // 	) 
  // public 
  // {
  // 	require(creator == msg.sender)

  // 	if(hasOccured){

  // 	} else {

  // 	}
  // }

   /**
   * @dev Function that mints token given cost of token and amount of ether sent
   */
  function buyTokensForEth() public {
  	require(msg.value >= 0);

  	totalSupply_ += costPerToken * msg.value;
  	mint(msg.sender, costPerToken * msg.value);
  }


}