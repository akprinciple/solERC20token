// SPDX-License-Identifier: MIT
pragma solidity >=0.8.20;

contract Token{
    string public name = 'w3bToken';
    string public symbol = 'w3b';
    uint8 public decimals = 1;
    uint public totalSupply = 1000;
    mapping(address=>uint) public balanceOf;
     mapping(address => uint256) public etherBalance;
    mapping(address=>mapping(address=>uint)) public allowance;
    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);

    constructor(){
        balanceOf[msg.sender] = (balanceOf[msg.sender]+totalSupply)*10**decimals;
        totalSupply = totalSupply*10**decimals;
    }
     function deposit() external payable {
        require(msg.value > 0, "Can't deposit zero value");

        balances[msg.sender] = balances[msg.sender] + msg.value;

        emit DepositSuccessful(msg.sender, msg.value);
    }
}