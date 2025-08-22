// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

import {Script} from "forge-std/Script.sol";
import {NFTCollection} from "../src/NFTCollection.sol";
contract DeployNFTCollection is Script{

    function run() external returns(NFTCollection){
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        string memory name_ = "BlockChain Economic Forum NFT";
        string memory symbol_ = "BCEF";
        uint256 totalSupply_ = 100;
        string  memory baseUri_ = "ipfs://bafybeibx4wb4e5imke6764nk6cj24p3yenju37s3s6iarkq4i6zqrbomi4/";
        NFTCollection nftCollection = new NFTCollection(name_,symbol_,totalSupply_,baseUri_);

        vm.stopBroadcast();

        return nftCollection;

    }


}

