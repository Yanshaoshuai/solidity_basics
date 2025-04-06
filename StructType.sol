// 智能合约的许可协议
// SPDX-License-Identifier: MIT

//solidity 版本
pragma solidity >=0.8.0 <0.9.0;

contract StructType {
    struct Person{
        string name;
        string gender;
        uint age;
    }

    Person person;

    function init(string calldata name,string calldata gender,uint age) public {
        // person=Person(name,gender,age);
        person=Person({name:name,gender:gender,age:age});
        // person.name=name;
        // person.gender=gender;
        // person.age=age;
    }

    function getInfo() view external returns (Person memory) {
       return person;
    }

}