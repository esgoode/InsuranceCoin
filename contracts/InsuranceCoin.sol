pragma solidity ^0.4.24;

import 'openzeppelin-solidity/blob/master/contracts/token/ERC20/ERC20.sol';

contract InsuranceCoin is ERC20 {

	mapping(address => uint256) balances;


	constructor() ERC721Full("InsuranceCoin", "InsuranceCoin") public {

	}
}