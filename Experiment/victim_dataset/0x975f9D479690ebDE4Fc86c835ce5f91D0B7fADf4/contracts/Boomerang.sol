// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";

contract Boomerang is ERC721Enumerable, Ownable {
    uint256 constant MAX_TOKENS = 11;

    constructor() ERC721("The Emperor's Boomerang", "BOOM") {
        _safeMint(msg.sender, 0);
    }

    function contractURI() public pure returns (string memory) {
        return "ipfs://QmWhBBabB1UsdEEpd3KKhKP6FrCqCZ1NSx6Sp2RGrhDJKb";
    }

    function tokenURI(uint256 /*tokenId*/) public pure override returns (string memory) {
        return contractURI();
    }

    function mint() external {
        require(totalSupply() < MAX_TOKENS, "The boomerangs are all gone.");

        uint256 tokenId = totalSupply();
        // You did it!
        _safeMint(msg.sender, tokenId);

        // Just kidding. It's a boomerang.
        yoink(msg.sender, tokenId);
    }

    // If the boomerang is still in this address's posession, it will come
    // right back.
    function yoink(address yoinkee, uint256 tokenId) internal returns (bool) {
        if (ownerOf(tokenId) == yoinkee) {
            _burn(tokenId);
            return true;
        }

        return false;
    }
}
