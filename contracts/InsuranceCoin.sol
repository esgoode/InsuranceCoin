pragma solidity ^0.4.24;
import "../node_modules/openzeppelin-solidity/contracts/token/ERC20/MintableToken.sol";

contract InsuranceCoin is MintableToken {

    string public  name;
    string public symbol;
    uint8 public constant decimals = 18;
    uint totalSupply_;
    uint costPerToken;
    address creator;
    bool eventResult;

    /**
    * @dev Constructor that creates token
    * @param _name name of coin
    * @param _symbol symbol of coin
    * @param _totalSupply initial supply of coins
    * @param _cost cost per token
    */
    constructor(string _name, string _symbol, uint _totalSupply, uint _cost) public
    {

        name = _name;
        symbol = _symbol;
        totalSupply_ = _totalSupply;
        costPerToken = 1 / _cost;
        creator = msg.sender;
    }

    /**
    * @dev Function that mints token given cost of token and amount of ether sent
    */
    function buyTokensForEth() public payable {
        require(msg.value >= 0, "not greater than 0");

        totalSupply_ += costPerToken * msg.value;
        mint(msg.sender, costPerToken * msg.value);
    }

    function setResult(bool result) public {
        require(msg.sender == creator, "not called from InsuredEvent contract");

        eventResult = result;
    }

    function unlockEth(uint256 _value) public payable {
        require(eventResult, "event has or did not occur");
        require(balances[msg.sender] >= _value, "account below balance");
        require(_value > 0, "requested value below 0");

        msg.sender.transfer(_value * costPerToken);

        balances[msg.sender] = balances[msg.sender].sub(_value);
    }
}