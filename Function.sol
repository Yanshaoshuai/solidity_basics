// 智能合约的许可协议
// SPDX-License-Identifier: MIT

//solidity 版本
pragma solidity >=0.8.0 <0.9.0;

contract Function {
    string name='yanshaoshuai';

    function setName(string memory _name) public returns (string memory){
        name=_name;
        return printName(name);
    }

    function foo()pure public  returns(string memory){
        return "hello";
    }

    function fzz()view public  returns(string memory){
        return name;
    }
}


function printName(string memory _name) pure returns (string memory){
        return _name;
}

