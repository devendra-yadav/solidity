// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

contract one{
    string public name;

    constructor(string memory _name){
        name=_name;
    }

    function greet() public view returns(string memory greeting){
        return (string)(abi.encodePacked("Hello ",name));
    }

}