// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {DeployBasicNft} from "../script/DeployBasicNft.s.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract BasicNftTest is Test {
    DeployBasicNft public deployer;
    BasicNft public basicNft;
    address public USER = makeAddr("USER");
    string public constant TOKEN_URI = "ipfs://QmXnnyufdzAWLZyZ2Y5v3v3v3v3v3v3v3v3v3v3v3v3";

    function setUp() external {
        deployer = new DeployBasicNft();
        basicNft = deployer.run();
    }

    function testNameIsCorrect() public view {
        assertEq(keccak256(abi.encodePacked(basicNft.name())), keccak256(abi.encodePacked("Doggie")));
    }

    function testCanMintAndHaveABalance() public {
        vm.prank(USER);
        basicNft.mintNft(TOKEN_URI);
        assertEq(basicNft.balanceOf(USER), 1);
        assertEq(keccak256(abi.encodePacked(basicNft.tokenURI(0))), keccak256(abi.encodePacked(TOKEN_URI)));
    }
    
    
}
