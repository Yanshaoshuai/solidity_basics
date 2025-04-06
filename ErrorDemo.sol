// 智能合约的许可协议
// SPDX-License-Identifier: MIT

//solidity 版本
pragma solidity >=0.8.0 <0.9.0;

contract ErrorDemo{
    uint public  x=10;

    uint public  y=200;
    
    function testAssert() view public returns(uint){
            // assert(3>5);
            require(3>5,unicode"3不能大于5");
            return 4;
    }
}