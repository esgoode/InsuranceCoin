pragma solidity ^0.4.24;

import 'openzeppelin-solidity/blob/master/contracts/token/ERC20/ERC20.sol';
import 'InsuredEvent.sol'

contract InsuranceCoin is ERC20 {

  string public name;
  string public symbol;
  InsuredEvent insEvent;
  uint8 public constant decimals = 18;

  /**
   * @dev Constructor that creates token and gives msg.sender all initial tokens
   */
  constructor(string coinName, string coinSymbol, InsuredEvent coinEvent, uint256 initSupply) {
  	require("")

  	name = coinName;
  	symbol = coinSymbol;
  	insEvent = coinEvent;
	_totalSupply = initSupply;

  	_mint(msg.sender, INITIAL_SUPPLY);
  }


}