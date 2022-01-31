// SPDX-License-Identifier: MIT
// Creators: TokyoDan

pragma solidity ^0.8.0;

import '@openzeppelin/contracts/access/Ownable.sol';
import '@openzeppelin/contracts/security/ReentrancyGuard.sol';
import './ERC721A.sol';
import '@openzeppelin/contracts/utils/Strings.sol';
import './extensions/ERC721AOwnersExplicit.sol';

contract AvvenireCollection is ERC721A, Ownable, ERC721AOwnersExplicit {
    uint256 maxSupply;

    constructor(
        string memory name_,
        string memory symbol_,
        uint256 maxSupply_
    ) ERC721A(name_, symbol_) Ownable() {
        maxSupply = maxSupply_;
    }

    function numberMinted(address owner) public view returns (uint256) {
        return _numberMinted(owner);
    }

    function baseURI() public view returns (string memory) {
        return _baseURI();
    }

    /**
     * @dev Overriding _baseURI() found in the ERC721A contract
     * Base URI for computing {tokenURI}. If set, the resulting URI for
     */
    function _baseURI() internal view override returns (string memory) {
        return 'https://ipfs.io/ipfs/QmXuxG21RtEbga9xk3c2ancUnQv2DppUnyEf6XzEBGd9ZP/3.jpg';
    }

    function exists(uint256 tokenId) public view returns (bool) {
        return _exists(tokenId);
    }

    /**
     * @dev Modifier to guarantee that mint quantity cannot exceed the max supply
     */
    modifier belowMaxSupply(uint256 quantity) {
        require(currentIndex < (maxSupply - quantity));
        _;
    }

    /**
     * @dev see ERC721A. Added belowMaxSupply modifier
     */
    function safeMint(address to, uint256 quantity) public belowMaxSupply(quantity) {
        require(currentIndex < maxSupply - quantity);
        _safeMint(to, quantity);
    }

    /**
     * @dev see ERC721A. Added belowMaxSupply modifier
     */
    function safeMint(
        address to,
        uint256 quantity,
        bytes memory _data
    ) public belowMaxSupply(quantity) {
        _safeMint(to, quantity, _data);
    }

    function setOwnersExplicit(uint256 quantity) public onlyOwner {
        _setOwnersExplicit(quantity);
    }

    //Following functionality needs to be added: Whitelist,
}
