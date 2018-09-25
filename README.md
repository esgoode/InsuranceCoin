# InsuranceCoin

> Experimenting with ERC20 token implementation. InsuredEvent and Insurance Coin contracts. Each event has a respective coin. The goal is to build an event based insurance system, so a user can insure themselves from an event by buying its respective coins.
> 

Uses truffle and inherits from OpenZeppelin ERC20 token implementation. Details and architecture to be provided, changed, and elaborated on.

## Example Logic

For each event, an InsuranceCoin contract is created

* Users can buy and sell tokens, limited supply offered at a flat rate
* If the event occurs, token holders can redeem tokens for ether
* If the event does not occur, token can be redeemed for a fraction of their value
* Ether not redeemed is added to an insurance pool that grows for each event

Essentially, their insurance compounds - as they continue to insure themselves against events, their payout will increase.