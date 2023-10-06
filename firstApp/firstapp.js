const Web3 = require('web3');
const abi = require('path/to/contract/abi');
const contractAddress = '0x1F81F32AB41bb0548CD4a11cfBe9aEa963106767'; // Address of the deployed contract
const web3 = new Web3
('https://ropsten.infura.io/v3/YOUR_INFURA_API_KEY');
const contract = new web3.eth.Contract(abi, contractAddress);
// Get the current greeting
contract.methods.getGreeting().call((error, result) => {
 if (error) {
 console.error(error);
 } else {
 console.log('Current greeting:', result);
 }
});
// Update the greeting
const newGreeting = 'Hello, Solidity!';
contract.methods.setGreeting(newGreeting).send({ from: '0x…' }, (error, transactionHash) => {
 if (error) {
 console.error(error);
 } else {
 console.log('Transaction hash:', transactionHash);
 }
});