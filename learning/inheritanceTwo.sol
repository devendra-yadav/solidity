// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

import "./inheritance.sol";

contract two is one("Devendra"){

    function showCity() public view returns(string memory){
        return city;
    }
}