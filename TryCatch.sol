// Solidity, the programming language for Ethereum smart contracts, offers a powerful error handling mechanism known as try-catch.

// Handling Errors in External Function Calls ⚙️

// One of the primary use cases of try-catch in Solidity is handling errors that may arise during external function calls. 📞 In the provided code sample, we have two contracts, `Foo` and `Bar`. The `Bar` contract utilizes an instance of the `Foo` contract to demonstrate the try-catch mechanism with external function calls. Let’s analyze the code snippet and its output. 🔄

// function tryCatchExternalCall(uint _i) public {
//  try foo.myFunc(_i) returns (string memory result) {
//  emit Log(result);
//  } catch {
//  emit Log("external call failed");
//  }
// }