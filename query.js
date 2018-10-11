const artifacts = require('./build/contracts/InsuredEvent.json')
var Web3 = require("web3")
var provider = new Web3.providers.HttpProvider("http://localhost:9545")
const contract = require('truffle-contract')

let InsuredEvent = contract(artifacts);

InsuredEvent.setProvider(provider);

InsuredEvent.deployed().then(function(instance){
	meta = instance; 
	return meta.totalSupply()
}).catch(function () {
	console.log("caught");
});