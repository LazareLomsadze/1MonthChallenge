// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract Variables {
 string public text = "Hello";
 uint
public num = 123;
function doSomething() public {
 uint i = 456;
 uint timestamp = block.timestamp;
 address sender = msg.sender;
 // Rest of the function code…
 }
}



// `block.timestamp`: This variable returns the current timestamp (in seconds)
//  of the block in which the contract is being executed. It enables contracts
//   to incorporate time-based logic or record the occurrence of specific events.



// `msg.sender`: This variable represents the address of the account (or contract)
//  that called the current function. It can be used to verify the identity
//   of the caller or perform access control checks.
