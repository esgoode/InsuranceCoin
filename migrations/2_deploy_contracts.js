const InsuranceCoin = artifacts.require("./InsuranceCoin.sol")
const InsuredEvent = artifacts.require("./InsuredEvent.sol")

const verifierAddress = web3.eth.accounts[1]

module.exports = function(deployer) {
	
		return deployer.deploy(InsuredEvent, InsuranceCoin.address)
};