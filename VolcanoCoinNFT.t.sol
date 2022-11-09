// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/Vm.sol";
import "../src/VolcanoCoinNFT.sol";
import "../src/VolcanoCoin.sol";

contract VolcanoCoinNFTTest is Test {
    VolcanoCoinNFT public volcanoCoinNFT;
    VolcanoCoin public volcanoToken;

   address owner = address(0x1223);
   address alice = address(0x1889);
   address bob = address(0x1778);

    function setUp() public {
      vm.startPrank (owner);
       volcanoCoinNFT = new VolcanoCoinNFT();
       volcanoToken = new VolcanoCoin();
       vm.stopPrank();
   }

   function testMaxSupply() public {
      assertEq(volcanoCoinNFT.MAX_SUPPLY(), 13);
   }
 
 function testMint() public {
   vm.startPrank(alice);
   vm.deal (alice, 1 ether);
   volcanoCoinNFT.mint{value: 0.69 ether}();
   vm.stopPrank();
   assertEq(volcanoCoinNFT.balanceOf(alice), 1);
 }

 function testMint2() public {
   vm.startPrank(alice);
   vm.deal (alice, 150);
   volcanoCoinNFT.mint2{value: 100}();
   vm.stopPrank();
   assertEq(volcanoCoinNFT.balanceOf(alice), 1);
 }

 function testFailMint() public {
   vm.startPrank(bob);
   vm.deal(bob, 0.5 ether);
   vm.stopPrank();
   assertEq(volcanoCoinNFT.balanceOf(bob), 1);
 }

 function testWithdrawFromOwner() public {
   vm.startPrank(bob);
   vm.deal(bob, 1 ether);
   volcanoCoinNFT.mint{value: 0.69 ether}();
   assertEq(volcanoCoinNFT.balanceOf(bob), 1);
   vm.stopPrank();

   vm.startPrank(owner);
   volcanoCoinNFT.withdrawFunds();
   assertEq(owner.balance, 0.69 ether);
 }

}