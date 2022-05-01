// SPDX-License-Identifier: BUSL-1.1

pragma solidity ^0.8.0;

import "../LZ/UniversalONFT721.sol";

/// @title A LayerZero UniversalONFT example
/// @notice You can use this to mint ONFT and send nftIds across chain.
///  Each contract deployed to a chain should carefully set a `_startMintIndex` and a `_maxMint`
///  value to set a range of allowed mintable nftIds (so that no two chains can mint the same id!)
contract TestNFT is UniversalONFT721 {

    uint public counter;

    function _nonblockingLzReceive(uint16, bytes memory, uint64, bytes memory) internal override {
        counter += 1;
    }

    constructor(string memory _name, string memory _symbol, address _layerZeroEndpoint, uint _startMintId, uint _endMintId) UniversalONFT721(_name,_symbol, _layerZeroEndpoint, _startMintId, _endMintId) {}
}