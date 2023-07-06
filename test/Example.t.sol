// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../src/Example.sol";

contract ExampleTest is Test {
    Example public example;

    function setUp() public {
        example = new Example();
    }

    function testBackdoor(uint256 x) public {
        example.backdoor(x);
    }

/*    function testBackdoor_2tx(bool isLive, uint256 x) public {
        example.setLive(isLive);
        example.backdoor(x);
    }
*/
}
