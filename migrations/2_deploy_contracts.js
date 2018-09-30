const InsuranceCoin = artifacts.require("./InsuranceCoin.sol")
const InsuredEvent = artifacts.require("./InsuredEvent.sol")

module.exports = function(deployer) {
	deployer.deploy(InsuredEvent, "string _title", "string _description", "string _symbol", 20, 20, ['0xf94c5d4727b17b96be6e360adbcd17d08b0bec30']);
};