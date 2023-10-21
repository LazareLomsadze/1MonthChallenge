// Parent contract X
contract X {
    string public inputX;
    
    constructor(string memory _inputX) {
        inputX = _inputX;
    }
}

// Parent contract Y
contract Y {
    string public inputY;
    
    constructor(string memory _inputY) {
        inputY = _inputY;
    }
}

// Child contract B inheriting from X and Y
contract B is X("Input to X"), Y("Input to Y") {
    string public combinedInput;
    
    constructor() {
        combinedInput = string(abi.encodePacked(inputX, " ", inputY));
    }
}
