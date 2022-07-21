// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

contract one{
    string public name;
    string city;

    constructor(string memory _name){
        name=_name;
        city="Shenzhen";
    }

    function greet() public view returns(string memory greeting){
        return (string)(abi.encodePacked("Hello ",name));
    }

    function setCity(string memory _city) public {
        city=_city;
    }

    function getCity() public returns(string memory) {
        return city;
    }

}