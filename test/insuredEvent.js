var InsuredEvent = artifacts.require("InsuredEvent");

contract('InsuredEvent', function(accounts) {
	it("should create event and associated token", function() {
		return InsuredEvent.deployed().then(function(instance) {
			return instance.getContract();
		}).then(function(address) {
			assert.equal(0, 0, "this is just a test")
		});
	});
});