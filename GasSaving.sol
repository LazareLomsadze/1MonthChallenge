function sumIfEvenAndLessThan99(uint[] calldata nums) external {
// … function body
}
// By using `calldata` instead of `memory` for the `nums` array parameter, we significantly reduce the gas cost. This simple substitution can make a noticeable impact on the efficiency of your contract. 💡💰

uint public total;

function sumIfEvenAndLessThan99(uint[] calldata nums) external {
uint _total = total;
// … rest of the function
}
// In this example, we create a local variable `_total` and initialize it with the value of the `total` state variable. By performing computations on `_total` instead of directly modifying `total`, we avoid redundant SSTORE operations and optimize gas usage. This small adjustment can lead to significant efficiency improvements. ⚡️🔋

function sumIfEvenAndLessThan99(uint[] calldata nums) external {
 uint _total = total;
 uint len = nums.length;
for (uint i = 0; i < len; ) {
 uint num = nums[i];
 if (num % 2 == 0 && num < 99) {
 _total += num;
 }
 unchecked {
 ++i;
 }
 }
total = _total;
}

// By combining the conditions `num % 2 == 0` and `num < 99` into a single `if` statement, we enable short circuiting. Solidity will only evaluate the second condition if the first condition evaluates to true, thereby saving gas by avoiding unnecessary computations. This technique can significantly optimize the execution of conditional logic in your smart contracts. ⚡️💡

function iterateAndIncrement(uint[] calldata nums) external {
 for (uint i = 0; i < nums.length; ) {
 // … loop logic
 unchecked {
 ++i;
 }
 }
}
// By using the pre-increment operator `++i`, we optimize gas usage within the loop construct. This seemingly small adjustment can add up to substantial savings when dealing with extensive iterations. 🔄💰

function processArray(uint[] calldata arr) external {
uint len = arr.length;
for (uint i = 0; i < len; i++) {
// … loop logic
}
}

// In this optimized version, we assign the length of the `arr` array to a local variable `len` before entering the loop. By accessing `len` in the loop condition instead of repeatedly accessing `arr.length`, we eliminate unnecessary gas costs associated with loading the array length on each iteration. This technique is particularly beneficial for contracts handling large arrays. 📏💡

function sumArray(uint[] calldata arr) external returns (uint) {
uint sum = 0;
for (uint i = 0; i < arr.length; i++) {
uint element = arr[i];
sum += element;
}
return sum;
}

// In this optimized code, we load the current array element `arr[i]` into a local variable `element` before performing any computations. By accessing `element` instead of `arr[i]` multiple times within the loop, we reduce the number of costly SLOAD operations, resulting in gas savings. This technique is particularly beneficial for scenarios where array elements are accessed multiple times or undergo complex calculations. 📄💰

function increment(uint value) external {
unchecked {
value++;
}
}

// In this code snippet, we use `unchecked` to suppress potential exceptions related to overflow or underflow during the increment operation. By assuring the compiler that the bounds of `value` are already guaranteed, we save gas that would otherwise be consumed by the exception handling mechanism. This technique should be used with caution and only in situations where the absence of exceptions is guaranteed. ✅⛽️


