// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract ConstantsExample {
 address public constant MY_ADDRESS = 0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
 uint public constant MY_UINT = 123;
function getMyAddress() public view returns (address) {
 return MY_ADDRESS;
 }
function getMyUint() public view returns (uint) {
 return MY_UINT;
 }
}

Constant's benefits : 
1) Immutability
2) Gas Optimization
3) Code Readability
4) Reusability.
