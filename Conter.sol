// 智能合约的许可协议
// SPDX-License-Identifier: MIT

//solidity 版本
pragma solidity >=0.8.0 <0.9.0;

contract Counter{
    function start() external pure returns(uint sum){
        uint a1=1;
        uint a2=1;
        uint a3=1;
        uint a4=1;
        uint a5=1;
        uint a6=1;
        uint a7=1;
        uint a8=1;
        // uint a9=1;
        //stack too deep
        // sum=a1+a2+a3+a4+a5+a6+a7+a8+a9;
        sum=a1+a2+a3+a4+a5+a6+a7+a8;
    }
}