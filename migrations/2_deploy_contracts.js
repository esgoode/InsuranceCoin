const InsuranceCoin = artifacts.require("./InsuranceCoin.sol")

module.exports = function(deployer) {
	deployer.deploy(InsuranceCoin, "name1", "nm", 13, 20);
};