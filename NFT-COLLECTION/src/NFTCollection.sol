// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

import "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import {Strings} from "../lib/openzeppelin-contracts/contracts/utils/Strings.sol";

contract NFTCollection is ERC721{
    using Strings for uint256;

    uint256 public currentTokenId; // It is 0 by default.
    uint256 public totalSupply = 100; // Total supply = 100. [0-99]
    string public baseUri;

    event MintNFT(address user_, uint256 tokenID_);

    constructor(string memory name_, string memory symbol_, uint256 totalSupply_,string memory baseUri_) ERC721(name_,symbol_){
        totalSupply = totalSupply_;
        baseUri = baseUri_;
    }
    function mint() external{
        require(currentTokenId<totalSupply,"Sold out");
        _safeMint(msg.sender,currentTokenId);
        currentTokenId++;
        emit MintNFT(msg.sender, currentTokenId-1);
    }
    function _baseURI() internal override view virtual returns (string memory) {
        return baseUri;
    }
     function tokenURI(uint256 tokenId) public view override virtual returns (string memory) {
        _requireOwned(tokenId);

        string memory baseURI = _baseURI();
        return bytes(baseURI).length > 0 ? string.concat(baseURI, tokenId.toString(),".json") : "";
    }





}