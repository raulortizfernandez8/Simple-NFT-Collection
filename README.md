# NFTCollection – ERC721 on Arbitrum

A simple ERC721 NFT collection deployed on the Arbitrum blockchain. This project demonstrates a basic NFT smart contract with a limited supply, metadata hosted on IPFS, and minting functionality.

## Features

- **ERC721 standard** using OpenZeppelin contracts.
- **Limited supply** configurable during deployment (example: 3 tokens).
- **Minting function** allowing users to mint until total supply is reached.
- **Metadata on IPFS** for each token (JSON + image).
- **Events** emitted on each mint (`MintNFT`) to track ownership.
- **Compatible with marketplaces** like OpenSea (Arbitrum network).

## Contract Details

- **Contract Name:** `NFTCollection`
- **Network:** Arbitrum
- **Token Standard:** ERC721
- **Base URI:** Configurable for IPFS metadata
- **Total Supply:** Configurable on deployment
- **Minting:** Public (anyone can mint, configurable)

### Key Functions

- `mint()`
  - Mints a new NFT to the caller.
  - Emits `MintNFT` event with owner and token ID.
  - Requires that `currentTokenId < totalSupply`.

- `tokenURI(uint256 tokenId)`
  - Returns the metadata URI for a specific token.
  - Automatically appends `tokenId` to `baseUri` (e.g., `ipfs://QmABC123/0.json`).

## Deployment

The contract can be deployed was deployed in Foundry.  

Metadata Example
Each token JSON file stored on IPFS should follow this structure:

{
    "name":"BlockChain Economic Forum NFT 0",
    "description":"This is VIP ticket for the best seat in the Blockchain Economic Forum",
    "image":"ipfs://bafybeihnaatntecnf25vhnyun7vhb6txtoafgr56bwrndhv67leyejvd2m",
    "attributes":[
        {
            "trait_type": "Rarity",
            "value":"1"
        }
    ]
}

Images can be PNG, JPG, or GIF.

Attributes are optional but recommended for marketplaces.

Usage
Connect to Arbitrum network using MetaMask.

Access the contract via Arbiscan or your deployed address.

Call mint() to mint an NFT.

View metadata in OpenSea or compatible marketplaces. 
