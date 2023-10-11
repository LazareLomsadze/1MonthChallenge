pragma solidity ^0.8.17;
contract UnitConversion {
 function convertWeiToEther(uint weiAmount) public pure returns (uint)
{
 return weiAmount / 1 ether; // Transmuting Wei into Ether
 }
 
 function convertEtherToWei(uint etherAmount) public pure returns (uint) {
 return etherAmount * 1 ether; // Transmuting Ether into Wei
 }
}
