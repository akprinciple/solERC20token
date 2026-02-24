// SPDX-License-Identifier: MIT
pragma solidity >=0.8.28;
import {IERC20} from './IERC.sol';

contract propertyManagement{
    error Admin_Only();
    error Not_Available();
    address token_address;
    address public owner;
    struct property{
        uint256 id;
        uint256 price;
        string location;
        bool isAvailable;
    }
    property[] public properties;
    constructor(address _token_address){
        owner = msg.sender;
        token_address = _token_address;

    }
    modifier onlyOwner(){
        require(owner == msg.sender, Admin_Only());
        _;
    }
    function createProperty(uint256 _id, uint256 _price, string memory _location) external onlyOwner {
        property memory newProperty = property({
            id: _id,
            price: _price,
            location: _location,
            isAvailable: true
        });
        properties.push(newProperty);
        }
    function getAllProperties() external view returns (property[] memory) {
        return properties;
    }
    function removeProperty(uint256 _index) external onlyOwner {
        properties[_index] = properties[properties.length - 1];
        properties.pop();
        
        }

    function buyProperty(uint256 _id) external{
        for(uint256 i = 0; i < properties.length; i++){
            if(properties[i].id == _id){
                require(properties[i].isAvailable == true, Not_Available());
                IERC20(token_address).transferFrom(msg.sender, owner, properties[i].price);
                properties[i].isAvailable = false;
            }
        }
        
    }

}
    
