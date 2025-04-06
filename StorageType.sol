// 智能合约的许可协议
// SPDX-License-Identifier: MIT

//solidity 版本
pragma solidity >=0.8.0 <0.9.0;

contract StorageType {


}

contract Person{
    struct State{
        string name;
        string gender;
    }

    State public state;

    function setState(string calldata _name,string calldata _gender) external {
        state.name=_name;
        state.gender=_gender;
    }

    function getName() external view returns (string memory){
        return  state.name;
    }

    function changeGender(uint value) external {
        require(value==0||value==1,"gender input error");
        state.gender=value==0?"female":"male";
    }
}