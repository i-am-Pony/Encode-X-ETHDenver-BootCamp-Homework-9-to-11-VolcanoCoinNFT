// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "../src/VolcanoCoin.sol";

contract VolcanoCoinNFT is ERC721, Ownable {
    using Counters for Counters.Counter;

     Counters.Counter private _tokenIds;

     uint256 public constant MAX_SUPPLY = 13;
     uint256 public constant ETHCOST = 0.01 ether;
     uint256 public constant VOLCCOST = 100;
     string constant TOKEN_URI ="ipfs://QmQFotx3S1LeMXLDfXNwzBkQc4yGK7hpDVJG1Q2uTH6Lw2";

    constructor() ERC721("Volcano Coin NFT", "VCNFT") {}

    event Withdraw(address, uint256 balance);

    function mint() public payable {
       require(msg.value >= ETHCOST, "Insufficient funds");
       require (MAX_SUPPLY >= _tokenIds.current(), "You cannot mint anymore");

       _tokenIds.increment();
       _safeMint(msg.sender, _tokenIds.current());
    }

    function mint2() public payable {
       require(msg.value >= VOLCCOST, "Insufficient funds");
       require (MAX_SUPPLY >= _tokenIds.current(), "You cannot mint anymore");

       _tokenIds.increment();
       _safeMint(msg.sender, _tokenIds.current());
    }

    
    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://QmQFotx3S1LeMXLDfXNwzBkQc4yGK7hpDVJG1Q2uTH6Lw2";
    }

    function totalSupply() public view returns (uint256) {
        return _tokenIds.current();
    }
    
   function withdrawFunds() external onlyOwner {
       uint256 balance = address(this).balance;
       require(balance > 0, "No ether left to withdraw");
       (bool success, ) = (msg.sender).call{value: balance} ("");
       require(success, "Withdraw Failed");
       emit Withdraw(msg.sender, balance);
    }  

}