// 
// Code snippet for the Math library
library Math {
 function sqrt(uint y) internal pure returns (uint z) {
 // Square root calculation logic
 // …
 }
}
contract TestMath {
 function testSquareRoot(uint x) public pure returns (uint) {
 return Math.sqrt(x);
 }
}
// 🔹 Code Reusability: Libraries enable you to write modular and reusable code, reducing duplication and improving code quality. ♻️🔄

// 🔹 Gas Efficiency: By separating reusable code into libraries, you can save gas costs by avoiding code duplication in multiple contracts. 💨💰

// 🔹 Code Organization: Libraries help in organizing your codebase, making it more maintainable and easier to understand. 🗂️📚

// 🔹 Upgradability: Libraries empower you to upgrade the logic of your contracts without affecting stored data, allowing for bug fixes and new feature additions. 🚀🔧
