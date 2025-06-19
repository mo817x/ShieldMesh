// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title CodexSeal – Symbolic Integrity Anchor for Ethereum Contracts
/// @author Mo817
/// @notice This is the first layer of ShieldMesh™: the Codex Seal Layer

contract CodexSeal {
    // Immutable symbolic hash (could be linked to CodexWall in Mo817)
    bytes32 public immutable codexHash;

    // Creator address (for symbolic origin tracing)
    address public immutable originator;

    // Timestamp of symbolic sealing
    uint256 public immutable sealTime;

    // Optional message to verify identity
    string public codexMessage;

    constructor(bytes32 _codexHash, string memory _message) {
        codexHash = _codexHash;
        originator = msg.sender;
        sealTime = block.timestamp;
        codexMessage = _message;
    }

    /// @notice Verify symbolic consistency of a given hash
    function verify(bytes32 externalHash) public view returns (bool) {
        return externalHash == codexHash;
    }

    /// @notice Retrieve full symbolic fingerprint
    function getSealMetadata() public view returns (
        bytes32 _hash,
        address _origin,
        uint256 _time,
        string memory _message
    ) {
        return (codexHash, originator, sealTime, codexMessage);
    }
}
