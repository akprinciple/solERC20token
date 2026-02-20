//SPDX-License-Identifier: MIT
pragma solidity >=0.8.28;
import {IERC20} from './IERC.sol';
contract School {

         // ERC-20 Token data
    
    uint256 schoolAccount;
    address _schoolAddress;
    address _owner;
    address token_address;

    enum Grade { level_100, level_200, level_300, level_400 }
    struct student{
        string studentName;
        uint16 age;
        Grade grade;
        uint256 fee;
        bool hasPaid;
        uint date;
    }
    mapping(address=>student) public studentInfo;

    function addStudent (string memory _studentName, uint16 _age, Grade _grade) public {
        uint256 _fee = (uint256(_grade) + 1) *25;
        require(_owner != msg.sender, "You are the owner. You cant registered as a student");
        require(_age > 0, "Age must be greater than 0");
        require(IERC20(token_address).balanceOf(msg.sender) > _fee, "Insufficient funds");
        IERC20(token_address).transferFrom(msg.sender,_schoolAddress, _fee);
        studentInfo[msg.sender] = student({
            studentName: _studentName,
             age: _age, 
             grade: _grade,
             fee:  _fee,
             hasPaid: true, 
             date: block.timestamp
             });
    }
   
    mapping(address=>uint) public balanceOf;
    mapping(address=>mapping(address=>uint)) public allowance;
   
    constructor(address _token_address){
        _owner = msg.sender; // Contract Owner
        _schoolAddress = 0xdD870fA1b7C4700F2BD7f44238821C26f7392148; // School Address
        token_address = _token_address;
    }
    student[] public students;
    struct staff{
        address id;
        string staffName;
        bool isPaid;
        uint date;
    }
    staff[] public staffs;
    
    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);

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
 