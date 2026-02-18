// SPDX-License-Identifier: MIT
pragma solidity >=0.8.28;

contract saveEth{
    mapping(address=>uint) public balances;

    event DepositSuccessful(address indexed sender, uint indexed amount);

    function deposit() external payable{
        require(msg.sender != address(0), "Address zero detected");
        require(msg.value > 0, "Can't deposit zero value");

        balances[msg.sender] = balances[msg.sender] + msg.value;
        // or balances[msg.sender] += msg.value;

        emit DepositSuccessful(msg.sender, msg.value1);
    }

    
}