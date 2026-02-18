// SPDX-License-Identifier: MIT
pragma solidity >=0.8.28;


    contract ERC20{
    string public name = 'LeoCoin';
    string public symbol = 'leo';
    uint8 public decimals = 1;
    uint public totalSupply = 100;
    mapping(address=>uint) public balanceOf;
    mapping(address=>mapping(address=>uint)) public allowance;
    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);

    constructor(){
        balanceOf[msg.sender] = (balanceOf[msg.sender]+totalSupply)*10**decimals;
        totalSupply = totalSupply*10**decimals;
    }
    

   
    function transfer(address _to, uint _value) external returns(bool success){
        success = true;
       
        require(msg.sender != address(0), "Address zero found");
        require(balanceOf[msg.sender] > _value, "Insufficient Funds");
        require(balanceOf[msg.sender] > 0, "You cant send zero _value");

        balanceOf[msg.sender] = balanceOf[msg.sender] - _value;
        balanceOf[_to] = balanceOf[_to] + _value;

        emit Transfer(msg.sender, _to, _value);

        return success;
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

}