pragma solidity ^0.8.0;

contract FirstApp {
    string public greeting;

    constructor() public {
        greeting = "Hey Blockchain Dev";
    }
    function setGreeting(string memory _greeting) public {
        greeting = _greeting;
    }
    function getGreeting() public  view  returns(string memory) {
        return greeting;
    }
}
