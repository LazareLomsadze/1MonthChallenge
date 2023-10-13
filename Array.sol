Several Types Array : 

1) Dynamic-sized Array:
```solidity
uint[] public arr;
uint[] public arr2 = [1, 2, 3];
```

2) Fixed-sized Array:
```solidity
uint[10] public myFixedSizeArr;
```
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

🔍 Array Access and Modification:

1) Accessing Elements:
```solidity
function get(uint i) public view returns (uint) {
return arr[i];
}
```
The `get` function allows us to retrieve the value at a specific index `i` from the `arr` array.


2)  Returning the Entire Array:
```solidity
function getArr() public view returns (uint[] memory) {
return arr;
}

The `getArr` function returns the entire `arr` array. However, be cautious when using this approach with arrays that can grow indefinitely, as it can consume a significant amount of gas.

3)  Appending Elements:

```solidity
function push(uint i) public {
arr.push(i);
}
```
The `push` function appends a new element `i` to the end of the `arr` array, increasing its length by one.

4)   Removing Elements:

```solidity
function pop() public {
arr.pop();
}
```

The `pop` function removes the last element from the `arr` array, decreasing its length by one.


5)  Array Length:

```solidity
function getLength() public view returns (uint) {
return arr.length;
}

The `getLength` function returns the current length of the `arr` array.

6)  Deleting Elements:

```solidity
function remove(uint index) public {
delete arr[index];
}
```

The `remove` function deletes the element at the specified index `index` in the `arr` array. The `delete` keyword resets the value at that index to its default value (0 in this case) without changing the array length.

7)  Working with Memory Arrays:

```solidity
function examples() external {
uint[] memory a = new uint[](5);
}
```

In the `examples` function, we demonstrate how to create a memory array with a fixed size of 5. Memory arrays are useful when you need to create temporary arrays within a function.


