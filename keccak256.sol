pragma solidity ^0.8.0;
contract UniqueIDGenerator {
 function generateUniqueID(string memory input) public pure returns (bytes32) {
 bytes32 hash = keccak256(abi.encodePacked(input));
 return hash;
 }
}

pragma solidity ^0.8.0;
contract CommitReveal {
 bytes32 private commitHash;
function commit(bytes32 hash) public {
 commitHash = hash;
 }
function reveal(string memory secret) public view returns (bool) {
 bytes32 secretHash = keccak256(abi.encodePacked(secret));
 return secretHash == commitHash;
 }
}