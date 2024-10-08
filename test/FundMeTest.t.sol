//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import {DeployFundMe} from "../script/DeployFundMe.s.sol";

contract FundMeTest is Test {
    FundMe fundme;

    function setUp() external {
        DeployFundMe deployfundme = new DeployFundMe();
        fundme = deployfundme.run();
    }

    function testMinimumDollarIsFive() public {
        assertEq(fundme.MINIMUM_USD(), 5e18);
    }

    function testOwnerIsMessageSender() public {
        console.log(fundme.i_owner());
        console.log(msg.sender);
        assertEq(fundme.i_owner(), msg.sender);
    }

    function testPriceFeedVersionIsAccurate() public {
        uint256 version = fundme.getVersion();
        assertEq(version, 4);
    }
}
