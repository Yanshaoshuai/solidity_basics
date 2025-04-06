// 智能合约的许可协议
// SPDX-License-Identifier: MIT

//solidity 版本
pragma solidity >=0.8.0 <0.9.0;

contract EnumType {
    enum State{
        Online,//0
        Offline,//1
        Unknown//2
    }

    State public status;

    function getStatus()public view  returns (State){
        return status;
    }

    //通过uint传递到枚举
    function setStatus(State _status) public {
        status=_status;
    }

    //使用枚举赋值
    function off()public {
        status=State.Offline;
    }

    //重置枚举值为第一个值
    function reset() public {
        delete status;
    }
}