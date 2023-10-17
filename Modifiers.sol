// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract FunctionModifier {
 address public owner;
 uint public x = 10;
 bool public locked;
constructor() {
 owner = msg.sender;
 }
modifier onlyOwner() {
 require(msg.sender == owner, "Not owner");
 _;
 }
function changeOwner(address _newOwner) public onlyOwner {
owner = _newOwner;
}

modifier validInput(uint _value) {
 require(_value > 0, "Invalid value");
 _;
}
modifier onlyPositiveBalance() {
 require(address(this).balance > 0, "No balance");
 _;
}
function withdraw(uint _value) public validInput(_value) onlyPositiveBalance {
 // Withdraw logic…
}
}
