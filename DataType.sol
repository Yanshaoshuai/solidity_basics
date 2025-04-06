// 智能合约的许可协议
// SPDX-License-Identifier: MIT

//solidity 版本
pragma solidity >=0.8.0 <0.9.0;

contract DataType{
    // int x=-100;
    // uint y=-50;
    // uint y=10;

    // int public minInt=type(int).min;
    // int public maxInt=type(int).max;

    // uint public minUint=type(uint).min;
    // uint public maxUint=type(uint).max;

    // address public  myAddress=0x2C00279548bAa83c2108976BF7513c21b1806b4B;
    // address public targetAddress=0xCA7a83dFf6fAf16297Ef3632892C55299179e311;
    // //账号地址
    // address public msgSender=msg.sender;
    // // 合约自己的地址
    // address public thisAddress=address(this);
    
    // constructor() payable{

    // }


    //中文需要使用unicode编码
    string public str=unicode"你好";
    string public str1="123";
    string public str2="abc";

    function concact()public view returns (string memory){
        string memory result=string.concat(str,str1,str2);
        return result;
    }

    function concact2()public view returns (string memory){
        bytes memory byteArr=bytes(str);
        bytes memory byteArr1=bytes(str1);
        bytes memory byteArr2=bytes(str2);
        return string(bytes.concat(byteArr,byteArr1,byteArr2));
    }

    
    function concact3()public view returns (string memory){
        return string(abi.encodePacked(str,str1,str2));
    }

    function testStrLength()public view returns (uint){
        // return str1.length;
        return bytes(str).length;
    }

    function testStringEq()public view returns (bool){
        // return str1==str2;
        return keccak256(abi.encodePacked(str1))==keccak256(abi.encodePacked(str2));
    }

    

}