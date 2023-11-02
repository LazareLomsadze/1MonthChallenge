pragma solidity ^0.8.17;
contract Caller {
 function setXFromAddress(address _addr, uint _x) public {
 Callee callee = Callee(_addr);
 callee.setX(_x);
 }
function setXandSendEther(Callee _callee, uint _x) public payable {
 (uint x, uint value) = _callee.setXandSendEther{value: msg.value}(_x);
 }
}