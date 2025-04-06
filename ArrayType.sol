// 智能合约的许可协议
// SPDX-License-Identifier: MIT

//solidity 版本
pragma solidity >=0.8.0 <0.9.0;

contract FixedArrayType {
    //缺省值为0
    uint256[5] fixedArr = [1, 2, 3, 4];


    function getArr() public view returns (uint256[5] memory) {
        return fixedArr;
    }

    function sumArr() public view returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 0; i < fixedArr.length; i++) {
            sum += fixedArr[i];
        }
        return sum;
    }

    function changeArr() public {
       for (uint i=0; i<fixedArr.length; i++) 
        {
            fixedArr[i]*=fixedArr[i];
        }
        // fixedArr.push(1);
        // fixedArr.pop();
    }

}

contract NoFixedArr{
        //不定长数组
    uint[] noFixedArr;

    function getArr() public view returns (uint256[] memory) {
        return noFixedArr;
    }

     function changeArr() public {
       for (uint i=0; i<10;i++) 
        {
            noFixedArr.push(i);
        }
    }

     function sumArr() public view returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 0; i < noFixedArr.length; i++) {
            sum += noFixedArr[i];
        }
        return sum;
    }
}

contract FixedArr2{
    uint[2][2] arr=[[1,2]];
    function setArr(uint x) public {
        arr[0][1]=x;
    }
    function getArr() public view returns (uint[2][2] memory){
        return arr;
    }
}


contract NoFixedArr2{
    uint[][] arr=[[0,0]];
    function setArr(uint x) public {
        arr[0][1]=x;
    }

    function push(uint x) public {
        arr[0].push(x);
    }
    function getArr() public view returns (uint[][] memory){
        return arr;
    }
}