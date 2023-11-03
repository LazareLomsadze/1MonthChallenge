// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract Immutable {
 address public immutable MY_ADDRESS;
 uint public immutable MY_UINT;
constructor(uint _myUint) {
 MY_ADDRESS = msg.sender;
 MY_UINT = _myUint;
 }
}

// Benefits and Use Cases of Immutability:
// 1. Security and Trust: Immutability enhances security in smart contracts by ensuring that critical variables, such as contract addresses or configuration parameters, remain unchanged. This prevents potential vulnerabilities that could arise from malicious modifications.
// 2. Predictability: Immutable variables provide predictability in contract execution. Since their values remain constant, developers and users can rely on these variables to always have the same values throughout the contract’s lifespan. This predictability is crucial for building robust and reliable decentralized applications.
// 3. Optimization: Solidity can optimize contracts that use immutable variables. The compiler can replace references to these variables with their actual values, eliminating the need for storage access during contract execution.
