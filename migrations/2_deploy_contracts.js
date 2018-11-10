const InsuranceCoin = artifacts.require("./InsuranceCoin.sol")
const InsuredEvent = artifacts.require("./InsuredEvent.sol")

const verifierAddress = web3.eth.accounts[1]

module.exports = function(deployer) {
	deployer.deploy(One).then(function() {
		return deployer.deploy(Two, One.address)
	  });
};