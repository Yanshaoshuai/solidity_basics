// 智能合约的许可协议
// SPDX-License-Identifier: MIT

//solidity 版本
pragma solidity >=0.8.0 <0.9.0;

contract MappingType {
    mapping(address=>uint) public balances;
    //多维mapping
    mapping (address=>mapping (address=>uint)) xxx;

    // function getBalance(address _addr) public view returns (uint){
    //     return balances[_addr];
    // }

    function setBalance(address _addr,uint _amount) public {
        balances[_addr] = _amount;
    }
}