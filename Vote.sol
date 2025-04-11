// 智能合约的许可协议
// SPDX-License-Identifier: MIT

//solidity 版本
pragma solidity >=0.8.0 <0.9.0;

contract Vote{
    //构建投票人结构体
    struct Voter{
        uint256 amount;//票数
        bool isVoted; //是否投过票
        address delegator;//代理人地址
        uint256 targetId;//目标id
    }

    //投票看板结构体
    struct Board{
        string name;//目标名字
        uint256 totalAmount;//票数
    }

    //主持人信息
    address public host;

    //创建投票人集合
    mapping (address=>Voter) public voters;

    //主题集合
    Board[] public board;

    //数据初始化
    constructor(string[] memory nameList){
        //constructor中的msg.sender一定是合约部署地址
        host=msg.sender;
        //给主持人一票
        voters[host].amount=1;

        //初始化board
        for(uint256 i=0;i<nameList.length;i++){
            Board memory boardItem=Board(nameList[i],0);
            board.push(boardItem);
        }
    }

    //返回看板集合
    function getBoardInfo() public view returns(Board[] memory){
        return board;
    }

    //给某些地址赋予选票
    function mandate(address[] calldata addressList )public {
        //只有主持人可以调用该方法
        require(msg.sender==host,"Only the owner hash permissions.");
        for (uint i=0;i<addressList.length;i++){
            //如果该地址已经投过票 不做处理
            if(!voters[addressList[i]].isVoted){
                voters[addressList[i]].amount=1;
            }
        }
    }

    //委托投票
    function delegate(address to)public {
        //获取委托人
        Voter storage sender=voters[msg.sender];
        require(!sender.isVoted,"you have already voted.");
        require(msg.sender!=to,"can not delegate self.");

        //遍历代理链 避免循环委托
        address currentAddress=to;
        while (voters[currentAddress].delegator!=address(0)){
            address curDelegator=voters[currentAddress].delegator;
            require(curDelegator==msg.sender,unicode"不能循环授权");
            currentAddress=curDelegator;
        }
        //授权
        
        //获取被委托人
        Voter storage delegator=voters[to];
        if(delegator.isVoted){
            //追票
            board[delegator.targetId].totalAmount+=sender.amount;
        }else{
            //未投过 加票
            delegator.amount+=sender.amount;
        }

        sender.isVoted=true;
        sender.delegator=to;
    }

    //投票
    function vote(uint targetId)public {
        Voter storage sender=voters[msg.sender];
        require(sender.amount!=0,"Has no right to vote.");
        require(!sender.isVoted,"Already voted.");
        sender.targetId=targetId;
        sender.isVoted=true;
        board[targetId].totalAmount+=sender.amount;
        emit voteSuccess(unicode"投票成功");
    }

    //投票成功事件
    event voteSuccess(string);
}
//候选人
//["刘能","谢广坤","赵四"]
//投票人
//["0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2","0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db","0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB",0x617F2E2fD72FD9D5503197092aC168c91465E7f2]
//合约地址0x3167336973b969573b5f3d342E9B49863FFAe9A3