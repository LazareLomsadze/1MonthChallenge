When it comes to receiving Ether in a contract, two functions need to be implemented:
 `receive()` and `fallback()`. Let’s understand when each function is called:

The `receive()` function gets invoked when the transaction’s `msg.data` is empty. It is an `external payable` function commonly used to receive Ether. Here’s an example of the `receive()` function:

```solidity
receive() external payable {}
```

//  The `fallback()` function gets called when the transaction’s `msg.data` is not empty or when no other function matches the function signature. It is an `external payable` function that can also be used to receive Ether. Here’s an example of the `fallback()` function:

```solidity
fallback() external payable {}
```


- Sending Ether: Utilize the `call` method in conjunction with a re-entrancy guard to ensure secure transactions. Make all state changes before calling other contracts and employ a re-entrancy guard modifier to prevent malicious behavior.

- Receiving Ether: Implement both the `receive()` and `fallback()` functions in your contract to cover all possible scenarios. The `receive()` function should handle transfers when `msg.data` is empty, while the `fallback()` function can handle other cases.