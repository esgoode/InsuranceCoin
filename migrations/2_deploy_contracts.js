const InsuredEvent = artifacts.require("./InsuredEvent.sol")
const verifierAddress = web3.eth.accounts[1]

module.exports = function(deployer) {
	deployer.deploy(InsuredEvent, "string _title", "string _description", "string _symbol", 20, 20, [verifierAddress]);
};