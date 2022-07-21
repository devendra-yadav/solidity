//SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

import './IERC20.sol';

contract Owned{
    address public owner;
    
    modifier onlyOwner(){
        require(msg.sender==owner,"Only owner can run this");
        _;
    }

    constructor(){
        owner=msg.sender;
    }

    function transferOwnership(address _newOwner) public onlyOwner{
        owner=_newOwner;
    }

}

contract AMDToken is IERC20, Owned{

    string override public name;
    string override public symbol;
    uint8 override public decimals;
    uint256 override public totalSupply;
    mapping(address=>uint256) override public balanceOf;
    
    address public minter;

    constructor(){
        name="AMD Token";
        symbol="AMD";
        decimals=18;
        totalSupply=1000000000000*10**decimals;
        owner=msg.sender;
        minter=owner;
        balanceOf[owner]=totalSupply;
    }

    function transferFrom(address _from, address _to, uint256 _value) override external  returns (bool success){
        require(balanceOf[_from]>=_value,"sender dont have enough balance");
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(_from, _to, _value);
        return true;
    }

    function transfer(address _to, uint256 _value) override external returns (bool success){
        require(balanceOf[msg.sender]>=_value,"sender dont have enough balance");
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
    
    function approve(address _spender, uint256 _value) override external returns (bool success){
        return true;
    }
    function allowance(address _owner, address _spender) override external view returns (uint256 remaining){
        return 2;
    }

}