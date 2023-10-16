//  The assert function in smart contracts is like a safety net for developers. It's used to check for conditions that are so fundamental to the code that they should never, ever be false. If an assert statement fails, it's a strong indication that there's a critical error or bug in the code.

//  When to Use assert:

//  Use assert when you want to ensure that something is absolutely true, regardless of external factors or inputs. It's often used to check for internal consistency and correctness.


function safeMultiply(uint a, uint b) public pure returns (uint) {
    uint result = a * b;
    assert(result / a == b); // This checks if multiplication didn't overflow
    return result;
}
