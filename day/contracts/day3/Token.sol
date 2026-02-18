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
     event DepositSuccessful(address indexed sender, uint256 indexed amount);
     event WithdrawalSuccessful(address indexed receiver, uint256 indexed amount, bytes data);
    constructor()payable {
        balanceOf[msg.sender] = (balanceOf[msg.sender]+totalSupply)*10**decimals;
        totalSupply = totalSupply*10**decimals;
    }

    function transferToken(address _to, uint _value) external returns(bool success){
        success = true;
       
        require(msg.sender != address(0), "Address zero found");
        require(balanceOf[msg.sender] > _value, "Insufficient Funds");
        require(balanceOf[msg.sender] > 0, "You cant send zero _value");
        balanceOf[msg.sender] = balanceOf[msg.sender] - _value;
        balanceOf[_to] = balanceOf[_to] + _value;

        emit Transfer(msg.sender, _to, _value);

        return success;
    }
    function TokenBalance() external view returns (uint){
        balanceOf[msg.sender];
    }
    function transferFrom(address _from, address _to, uint256 _value) external returns (bool success){
        success = true;
        require(_from != address(0), "Address Zero found");
        require(_to != address(0), "Address Zero found");
        require(balanceOf[_from] >=_value, "Insufficient Funds");
        require(allowance[_from][_to] >= _value, 'You are not allowed to withdraw upto this amount');

        balanceOf[_from] = balanceOf[_from] - _value;
        balanceOf[_to] = balanceOf[_to] + _value;
        allowance[_from][_to] = allowance[_from][_to]-_value;

         emit Transfer(_from, _to, _value);
        return success;
    } 
    function approve(address _spender, uint256 _value) external {
        require(_spender != address(0), "Address Zero found");

        allowance[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);
    }
     function depositEther() external payable {
        require(msg.value > 0, "Can't deposit zero value");

        etherBalance[msg.sender] = etherBalance[msg.sender] + msg.value;

        emit DepositSuccessful(msg.sender, msg.value);
    }
     function withdrawEther(uint256 _amount) external {
        require(msg.sender != address(0), "Address zero detected");

        // the balance mapping is a key to value pair, if the key is
        // provided it retuns the value at that location.
        //
        uint256 userSavings_ = etherBalance[msg.sender];

        require(userSavings_ > 0, "Insufficient funds");

        etherBalance[msg.sender] = userSavings_ - _amount;

        // (bool result,) = msg.sender.call{value: msg.value}("");
        (bool result, bytes memory data) = payable(msg.sender).call{value: _amount}("");

        require(result, "transfer failed");

        emit WithdrawalSuccessful(msg.sender, _amount, data);
    }

    function getEtherUserSavings() external view returns (uint256) {
        return etherBalance[msg.sender];
    }

    function getContractBalance() external view returns (uint256) {
        return address(this).balance;
    }
    receive() external payable {}
    fallback() external {}
}