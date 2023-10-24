contract A {
    uint public value;

    function setValue(uint _value) external {
        value = _value;
    }

    function delegatecallB(address _target, uint _value) external returns (bool success) {
        bytes memory data = abi.encodeWithSignature("setValue(uint256)", _value);
        (success, ) = _target.delegatecall(data);
    }
}

// Contract B
contract B {
    // This contract doesn't have any state variables.

    // Function to get the current value of the state variable in Contract A
    function getValueFromA(address _target) external view returns (uint) {
        (bool success, bytes memory result) = _target.staticcall(
            abi.encodeWithSignature("value()")
        );
        require(success, "Call failed");
        return abi.decode(result, (uint));
    }
}
