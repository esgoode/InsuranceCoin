# Insurance

> This is an ERC20 token implementation. InsuredEvent.sol creates an event that creates an associated token Insurance coin. 

Insured Event creates a token for each event that is created. It has a set of validators who vote on whether the event occured or not.

InsuranceCoin can be bought for ETH. If the event occurs and is voted on correctly by the validators, individuals can trade in their InsuranceCoin for ETH. If the event does not occur, the ETH is added to the insurance pool and the InsuranceCoin that was created for the specific event is now worthless.
> 

Uses truffle for development. These contracts have not been audited or fully vetted.

## Example Logic

For each event, an InsuranceCoin contract is created

* Users can buy and sell tokens, limited supply offered at a fixed rate
* If the event occurs, token holders can redeem tokens for their deposited ether
* Portion of Ether not redeemed is added to an insurance pool that grows for each event. As the pool grows, insurance payouts will grow for new events.

## InsuredEvent

To create an event deploy the InsuredEvent contract with proper fields.

```javascript
constructor(string _title, string _description, string _symbol, uint _cost, uint _time, uint _numVerifiers) public
```
Once the event is created, an InsuranceCoin is issued. Users can buy said coin by calling the address returned by getCoinContract's buyTokenForEth method

```javascript
function buyTokensForEth() public payable {
    require(msg.value >= 0, "not greater than 0");

    totalSupply_ += costPerToken * msg.value;
    mint(msg.sender, costPerToken * msg.value);
}
```

To add a verifier, contract deployer can specify trusted entitities that can attest to the completion of event with.

```javascript
function addVerrifier(address verifierAddress) public returns (address)
```

Verifiers can then vote on the result of the event.

```javascript
/**
* @dev takes in verifiers result and adjusts tallies
* @param _result verifers vote
*/
function eventResults(uint _result) public
{
    require(contains(msg.sender), "not a verified validator");
    require(eventOccured, "event voting is over");

    //update verifier vote
    votes[msg.sender] = State(_result);

    //increment vote count
    if(votes[msg.sender] == State.yes)
        yesVotes++;
    else if(votes[msg.sender] == State.no)
        noVotes++;
}
```

Once all votes are cast, the event is marked as completed. True if the event occured, and false if not. After this, owners of the created InsuranceCoin token can redeem their tokens for ETH using.

```javascript
function unlockEth(uint256 _value) public payable {
    require(eventResult, "event has or did not occur");
    require(balances[msg.sender] >= _value, "account below balance");
    require(_value > 0, "requested value below 0");

    msg.sender.transfer(_value * costPerToken);

    balances[msg.sender] = balances[msg.sender].sub(_value);
}
```



## Goals and Changes

Implement factory method pattern, so users can create an event without deploying contract for each event. TBD.