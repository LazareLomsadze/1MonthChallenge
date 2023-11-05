// The process of signature verification involves two main steps: signing and verifying. Let’s delve into each step in detail.

Signing ✍️
1️⃣ Create message to sign: To initiate the signing process, we need a message that
 we want to authenticate. This message can be any piece of data or a combination of
  data that requires verification.

2️⃣ Hash the message: Next, we perform a cryptographic hash function on the message. 
This process converts the message into a unique fixed-length string of characters.
 In the provided sample contract, the `getMessageHash` function showcases this step. 
 It takes various inputs, such as the recipient’s address, the transaction amount,
  a message, and a nonce, and combines them using the `keccak256` function to obtain the message hash.

 3️⃣ Sign the hash: Once the message is hashed, it is signed using the private key of the signer.
   This signature generation process occurs off-chain, often facilitated by tools like MetaMask or web3 libraries. 
   The `getEthSignedMessageHash` function in the contract demonstrates how the hash is signed. It adheres to the Ethereum signature standard by
   prefixing the hash with “\x19Ethereum Signed Message:\n32” and then applying the `keccak256` 
   function to the prefixed hash.


   Verification 👁️
1️⃣ Recreate hash from the original message: In order to verify the signature, we must reconstruct
 the hash of the original message on-chain. This is achieved by calling the `getMessageHash`
  function with the same inputs used during the signing process.

2️⃣ Recover signer from signature and hash: Armed with the hash of the original message and 
the signature, we can recover the signer’s address using the `ecrecover` function.
 The `recoverSigner` function in the contract exemplifies this step. It takes the 
 ethSignedMessageHash and the signature as inputs, splits the signature into its
  components (r, s, and v) using the `splitSignature` function, and then invokes
   `ecrecover` with these components.

3️⃣ Compare recovered signer to claimed signer: Finally, we compare the recovered signer’s
 address with the claimed signer’s address. If the two addresses match, the signature is
  deemed valid; otherwise, it is considered invalid. The `verify` function in the contract 
  demonstrates this critical step.

  // SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

/* Signature Verification

How to Sign and Verify
# Signing
1. Create message to sign
2. Hash the message
3. Sign the hash (off chain, keep your private key secret)

# Verify
1. Recreate hash from the original message
2. Recover signer from signature and hash
3. Compare recovered signer to claimed signer
*/

contract VerifySignature {
    /* 1. Unlock MetaMask account
    ethereum.enable()
    */

    /* 2. Get message hash to sign
    getMessageHash(
        0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C,
        123,
        "coffee and donuts",
        1
    )

    hash = "0xcf36ac4f97dc10d91fc2cbb20d718e94a8cbfe0f82eaedc6a4aa38946fb797cd"
    */
    function getMessageHash(
        address _to,
        uint _amount,
        string memory _message,
        uint _nonce
    ) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_to, _amount, _message, _nonce));
    }

    /* 3. Sign message hash
    # using browser
    account = "copy paste account of signer here"
    ethereum.request({ method: "personal_sign", params: [account, hash]}).then(console.log)

    # using web3
    web3.personal.sign(hash, web3.eth.defaultAccount, console.log)

    Signature will be different for different accounts
    0x993dab3dd91f5c6dc28e17439be475478f5635c92a56e17e82349d3fb2f166196f466c0b4e0c146f285204f0dcb13e5ae67bc33f4b888ec32dfe0a063e8f3f781b
    */
    function getEthSignedMessageHash(
        bytes32 _messageHash
    ) public pure returns (bytes32) {
        /*
        Signature is produced by signing a keccak256 hash with the following format:
        "\x19Ethereum Signed Message\n" + len(msg) + msg
        */
        return
            keccak256(
                abi.encodePacked("\x19Ethereum Signed Message:\n32", _messageHash)
            );
    }

    /* 4. Verify signature
    signer = 0xB273216C05A8c0D4F0a4Dd0d7Bae1D2EfFE636dd
    to = 0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C
    amount = 123
    message = "coffee and donuts"
    nonce = 1
    signature =
        0x993dab3dd91f5c6dc28e17439be475478f5635c92a56e17e82349d3fb2f166196f466c0b4e0c146f285204f0dcb13e5ae67bc33f4b888ec32dfe0a063e8f3f781b
    */
    function verify(
        address _signer,
        address _to,
        uint _amount,
        string memory _message,
        uint _nonce,
        bytes memory signature
    ) public pure returns (bool) {
        bytes32 messageHash = getMessageHash(_to, _amount, _message, _nonce);
        bytes32 ethSignedMessageHash = getEthSignedMessageHash(messageHash);

        return recoverSigner(ethSignedMessageHash, signature) == _signer;
    }

    function recoverSigner(
        bytes32 _ethSignedMessageHash,
        bytes memory _signature
    ) public pure returns (address) {
        (bytes32 r, bytes32 s, uint8 v) = splitSignature(_signature);

        return ecrecover(_ethSignedMessageHash, v, r, s);
    }

    function splitSignature(
        bytes memory sig
    ) public pure returns (bytes32 r, bytes32 s, uint8 v) {
        require(sig.length == 65, "invalid signature length");

        assembly {
            /*
            First 32 bytes stores the length of the signature

            add(sig, 32) = pointer of sig + 32
            effectively, skips first 32 bytes of signature

            mload(p) loads next 32 bytes starting at the memory address p into memory
            */

            // first 32 bytes, after the length prefix
            r := mload(add(sig, 32))
            // second 32 bytes
            s := mload(add(sig, 64))
            // final byte (first byte of the next 32 bytes)
            v := byte(0, mload(add(sig, 96)))
        }

        // implicitly return (r, s, v)
    }
}

