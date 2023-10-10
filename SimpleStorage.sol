/// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract SimpleStorage {
uint public num;

function set(uint _num) public {
num = _num;
}
function get() public viev returns(uint) {
return num;
}
}
