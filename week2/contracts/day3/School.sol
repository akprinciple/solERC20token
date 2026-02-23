// SPDX-License-Identifier:MIT
pragma solidity >=0.8.28;

contract School {

        // ERC-20 Token data
    string public name = 'LeoCoin';
    string public symbol = 'leo';
    uint256 public decimals = 18;
    uint public totalSupply = 100;
    uint256 public schoolAccount;

    address _owner;
    enum Grade { level_100, level_200, level_300, level_400 }
    struct student{
        address id;
        string studentName;
        uint16 age;
        Grade grade;
        bool hasPaid;
        uint date;
    }
    student[] public students;
    struct staff{
        address id;
        string staffName;
        bool isPaid;
        uint date;
    }
    staff[] public staffs;
    mapping(address=>uint) public balanceOf;
    mapping(address=>mapping(address=>uint)) public allowance;
    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);

    constructor(){
        
        _owner = msg.sender;
        totalSupply = totalSupply*10**decimals;
        balanceOf[msg.sender] = totalSupply;
    }
    
   
    function payStaffSalary(address _to, uint _value) external returns(bool success){
        success = true;

        require(msg.sender != address(0), "Address zero found");
        require(msg.sender == _owner, "You dont have access to this");
        require(balanceOf[msg.sender] > _value, "Insufficient Funds");
        require(balanceOf[msg.sender] > 0, "You cant send zero _value");

        balanceOf[msg.sender] = balanceOf[msg.sender] - _value;
        balanceOf[_to] = balanceOf[_to] + _value;
        
        emit Transfer(msg.sender, _to, _value);

        return success;
    }
    
    function createStudent(string memory _studentName, uint16 _age, Grade _grade) public {
        require(_owner != msg.sender, "You are the owner. You cant registered as a student");
        require(_age > 0, "Age must be greater than 0");
        student memory std = student({studentName: _studentName, age: _age, grade: _grade, id: msg.sender, hasPaid: true, date: block.timestamp});
        students.push(std);
         uint256 fee = (uint256(_grade) + 1) * 500000000000000;
         balanceOf[_owner] = balanceOf[_owner] - fee;
        schoolAccount = schoolAccount + fee;
    }
    function viewAllStudents() public view returns (student[] memory) {
        return students;
    }
     function Bank() public view returns (uint256) {
        return balanceOf[_owner];
    }
    function createStaff(string memory _staffName) public {
        require(_owner != msg.sender, "You are the owner. You cant registered as a staff");
        staff memory Staffs = staff({staffName: _staffName, id: msg.sender, isPaid: false, date: 0});
        staffs.push(Staffs);
    }
         
    function getAllStaffs() public view returns (staff[] memory) {
        return staffs;
    }
}