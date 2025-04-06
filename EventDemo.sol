// 智能合约的许可协议
// SPDX-License-Identifier: MIT

//solidity 版本
pragma solidity >=0.8.0 <0.9.0;

contract EventDemo{
    event Log(uint);
    event Log(string);
    event Log(address);

    function foo() public {
        emit Log(100);
        emit Log("hello world");
        emit Log(msg.sender);
    }
}