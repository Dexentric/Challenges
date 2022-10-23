// SPDX-License-Identifier: MIT
//You have to enter the gate of valhala twice to see the grandmaster 
//Enter the key and the deed shall be yours
//KEY = R33NT74NC13
pragma solidity ^0.8.13;

contract EthBank {
    mapping(address => uint) public balances;

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() external payable {
        (bool sent, ) = msg.sender.call{value: balances[msg.sender]}("");
        require(sent, "error send ETH");

        balances[msg.sender] = 0;
    }
}
