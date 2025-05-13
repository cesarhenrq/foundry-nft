// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {BasicNft} from "../src/BasicNft.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

contract MintBasicNft is Script {
    string public constant TOKEN_URI = "ipfs://QmXnnyufdzAWLZyZ2Y5v3v3v3v3v3v3v3v3v3v3v3v3";

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("BasicNft", block.chainid);
        mintNft(mostRecentlyDeployed);
    }

    function mintNft(address mostRecentlyDeployed) public {
        vm.startBroadcast();
        BasicNft(mostRecentlyDeployed).mintNft(TOKEN_URI);
        vm.stopBroadcast();
    }
}