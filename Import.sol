// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// A)
import "openzeppelin/contracts/token/ERC20/ERC20.sol";
contract MyContract is ERC20 {
 constructor() ERC20("MyToken", "MTK") {
 // Additional initialization logic…
 }
 
 // Rest of the contract code…
}

// B)

import "./Token.sol";
contract MyContract {
 Token private myToken;
 
 constructor() {
 myToken = new Token();
 }
 
 // Rest of the contract code…
}