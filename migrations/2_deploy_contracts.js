const InsuranceCoin = artifacts.require("./InsuranceCoin.sol")
const InsuredEvent = artifacts.require("./InsuredEvent.sol")

const verifierAddress = web3.eth.accounts[1]

module.exports = function(deployer) {
		_title = "Event1"
		_description = "description"
		_symbol = "TST"
		_cost = 20
		_time = 0
		_numVerifiers = 1
		return deployer.deploy(InsuredEvent, _title, _description, _symbol, _cost, _time, _numVerifiers)
};