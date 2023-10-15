// storage - variable is a state variable (store on blockchain) !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


function f() public {
 _f(arr, map, myStructs[1]);
MyStruct storage myStruct = myStructs[1];
 MyStruct memory myMemStruct = MyStruct(0);
}
function _f(
 uint[] storage _arr,
 mapping(uint => address) storage _map,
 MyStruct storage _myStruct
) internal {
 // Perform operations with storage variables
}
