// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract VolcanoCoin is ERC20, Ownable {

    constructor() ERC20 ("Volcano Coin", "VOLC") {
        balances[msg.sender] = _totalSupply;
        }

    uint256 _totalSupply = 10000;

    struct Payment {
        uint256 transferToken;
        address recipient;
    }

    mapping(address => uint256) balances;
    mapping(address => Payment) payments;

    event supplyChange(uint256);
    event transferLog(uint256 transferredAmount, address recipient);


    function increaseTotalSupply() public onlyOwner {
      _totalSupply += 1000;
       emit supplyChange(_totalSupply);
    }

    function paymentRecord(address user) public view returns (uint256, address) {
       return (payments[user].transferToken, payments[user].recipient);
    }

    function recordPayment(address user, address _receiver, uint256 _amount) internal {
      payments[user] = Payment(_amount, _receiver);
    }

    function transfer(uint256 _amount, address _recipient) public {
       require(msg.sender.balance >= _amount);
       balances[msg.sender] -= _amount;
       balances[_recipient] += _amount;
       recordPayment(msg.sender, _recipient, _amount);
       emit transferLog(_amount, _recipient);
    }
   }