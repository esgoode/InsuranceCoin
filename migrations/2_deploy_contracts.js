const InsuranceCoin = artifacts.require("./InsuranceCoin.sol")
const InsuredEvent = artifacts.require("./InsuredEvent.sol")

module.exports = function(deployer) {
	deployer.deploy(InsuredEvent, "string _title", "string _description", "string _symbol", 20, 20, ['0xa1aae54e99202578fe60850f6c33616c81e67cc1']);
};