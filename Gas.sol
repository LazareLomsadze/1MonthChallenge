Calculating Gas Spent:

contract GasExample {
 function calculateGas() public pure returns (uint) {
 uint startGas = gasleft();
 // Perform computations or operations
 uint endGas = gasleft();
 return startGas - endGas;
 }
}

Setting Gas Price:

pragma solidity ^0.8.0;
contract GasPriceExample {
 uint public gasPrice;
function setGasPrice(uint _gasPrice) public {
 require(_gasPrice > 0, "Gas price must be greater than zero");
 gasPrice = _gasPrice;
 }
}

