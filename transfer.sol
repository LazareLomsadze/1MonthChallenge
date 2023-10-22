//  The `transfer` method serves as the simplest way to send Ether. It transfers a fixed amount of gas (2300 gas) and automatically throws an error if the transfer fails. Here’s an example of using the `transfer` method in Solidity:

function sendEtherUsingTransfer(address payable _to) public payable {
_to.transfer(msg.value);
}


