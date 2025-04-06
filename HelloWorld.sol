// SPDX-License-Identifier: MIT

// 智能合约的许可协议
pragma solidity ^0.8.7;

contract HelloWorld {
    //状态变量
    string public name;
    
    constructor(){
        name="web3";
    }
    /**
    *   view 可见性
    *   returns 返回列表
    *   memory 存储位置
    *   读取调用不消耗gas费
    */
    function sayName() public view returns(string memory){
        return  name;
    }

    //写入 消耗gas费
    function changeName(string memory _name) public {
        //局部变量
        uint x=100;
        //name 状态变量
        name=_name;
        //msg 全局变量
        address a=msg.sender;
    }
}
