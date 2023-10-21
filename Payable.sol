// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract AnotherPayable {
 address public owner;
constructor() {
 owner = msg.sender;
 }
function deposit() public payable {}
function notPayable() public {}
function withdraw() public {
 require(msg.sender == owner, "Only owner can withdraw");
 uint amount = address(this).balance;
 payable(msg.sender).transfer(amount);
 }
function transfer(address _to, uint _amount) public {
 require(msg.sender == owner, "Only owner can transfer");
 payable(_to).transfer(_amount);
 }
}
