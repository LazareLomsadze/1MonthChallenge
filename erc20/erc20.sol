// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import "./IERC20.sol";
contract ERC20 is IERC20 {
 uint public totalSupply;
 mapping(address => uint) public balanceOf;
 mapping(address => mapping(address => uint)) public allowance;
 string public name = "Solidity by Example";
 string public symbol = "SOLBYEX";
 uint8 public decimals = 18;
// Function to transfer tokens from the sender's account to a recipient's account
 function transfer(address recipient, uint amount) external returns (bool) {
 balanceOf[msg.sender] -= amount;
 balanceOf[recipient] += amount;
 emit Transfer(msg.sender, recipient, amount);
 return true;
 }
// Function to approve a spender to spend tokens on behalf of the sender
 function approve(address spender, uint amount) external returns (bool) {
 allowance[msg.sender][spender] = amount;
 emit Approval(msg.sender, spender, amount);
 return true;
 }
// Function to transfer tokens from a specific account to another account
 function transferFrom(address sender, address recipient, uint amount) external returns (bool) {
 allowance[sender][msg.sender] -= amount;
 balanceOf[sender] -= amount;
 balanceOf[recipient] += amount;
 emit Transfer(sender, recipient, amount);
 return true;
 }
// Function to mint new tokens
 function mint(uint amount) external {
 balanceOf[msg.sender] += amount;
 totalSupply += amount;
 emit Transfer(address(0), msg.sender, amount);
 }
// Function to burn tokens
 function burn(uint amount) external {
 balanceOf[msg.sender] -= amount;
 totalSupply -= amount;
 emit Transfer(msg.sender, address(0), amount);
 }
}