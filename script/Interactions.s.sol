// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {BasicNft} from "../src/BasicNft.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {MoodNft} from "../src/MoodNft.sol";

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

contract MintMoodNft is Script {
    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("MoodNft", block.chainid);
        mintNft(mostRecentlyDeployed);
    }

    function mintNft(address mostRecentlyDeployed) public {
        vm.startBroadcast();
        MoodNft(mostRecentlyDeployed).mintNft();
        vm.stopBroadcast();
    }
}

contract FlipMoodNft is Script {
    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("MoodNft", block.chainid);
        flipMoodNft(mostRecentlyDeployed);
    }

    function flipMoodNft(address mostRecentlyDeployed) public {
        vm.startBroadcast();
        MoodNft(mostRecentlyDeployed).flipMood(0);
        vm.stopBroadcast();
    }
}

contract GetMoodNft is Script {
    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("MoodNft", block.chainid);
        getMoodNft(mostRecentlyDeployed);
    }

    function getMoodNft(address mostRecentlyDeployed) public {
        vm.startBroadcast();
        MoodNft(mostRecentlyDeployed).tokenURI(0);
        vm.stopBroadcast();
    }
}
