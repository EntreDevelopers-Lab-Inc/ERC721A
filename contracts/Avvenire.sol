// SPDX-License-Identifier: MIT
// Creators: TokyoDan

pragma solidity ^0.8.0;

import '@openzeppelin/contracts/access/Ownable.sol';
import '@openzeppelin/contracts/security/ReentrancyGuard.sol';
import './ERC721A.sol';
import '@openzeppelin/contracts/utils/Strings.sol';
import './extensions/ERC721AOwnersExplicit.sol';

contract AvvenireCollection is ERC721A, Ownable, ERC721AOwnersExplicit {
    constructor(string memory name_, string memory symbol_) ERC721A(name_, symbol_) {}

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
        return '';
    }

    function exists(uint256 tokenId) public view returns (bool) {
        return _exists(tokenId);
    }

    function safeMint(address to, uint256 quantity) public {
        _safeMint(to, quantity);
    }

    function safeMint(
        address to,
        uint256 quantity,
        bytes memory _data
    ) public {
        _safeMint(to, quantity, _data);
    }

    function setOwnersExplicit(uint256 quantity) public onlyOwner {
        _setOwnersExplicit(quantity);
    }

    //Following functionality needs to be added: Whitelist,
}
