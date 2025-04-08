// 智能合约的许可协议
// SPDX-License-Identifier: MIT

//solidity 版本
pragma solidity >=0.8.0 <0.9.0;
import "./Context.sol";

// function name() public view returns (string)
// function symbol() public view returns (string)
// function decimals() public view returns (uint8)
// function totalSupply() public view returns (uint256)
// function balanceOf(address _owner) public view returns (uint256 balance)
// function transfer(address _to, uint256 _value) public returns (bool success)
// function transferFrom(address _from, address _to, uint256 _value) public returns (bool success)
// function approve(address _spender, uint256 _value) public returns (bool success)
// function allowance(address _owner, address _spender) public view returns (uint256 remaining)

contract MyToken is Context {
    //=====================1.代币信息
    //代币名称 name
    string private _name;
    //代币标识 symbol
    string private _symbol;
    //代币小数位 decimals
    uint8 private _decimals;
    //代币总发行量 totalSupply
    uint256 private _totalSupply;
    //地址-代币数量 balance
    mapping(address => uint256) private _balances;
    //授权地址-（地址-授权代币数量） allowance
    mapping(address => mapping(address => uint256)) private _allowances;

    //=====================2. 初始化
    constructor() {
        _name = "YanCoin";
        _symbol = "YANTC";
        _decimals = 18;
        //初始化货币池
        _mint(_msgSender(), 100 * 10000 * 10**_decimals);
    }

    //=====================3.取值器
    //返回代币名称
    function name() public view returns (string memory) {
        return _name;
    }

    //返回代币标识
    function symbol() public view returns (string memory) {
        return _symbol;
    }

    //返回代币的小数位数
    function decimals() public view returns (uint8) {
        return _decimals;
    }

    //返回总发行量
    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    //返回指定地址的余额
    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }

    //返回指定地址授权余额
    function allowance(address owner, address spender)
        public
        view
        returns (uint256)
    {
        return _allowances[owner][spender];
    }

    //=====================4.实现函数
    //代币转发
    function transfer(address to, uint256 amount)
        public
        returns (bool success)
    {
        _transfer(_msgSender(), to, amount);
        return true;
    }

    //授权代币的转发 放贷人->借款人 记录到allances
    function approve(address spender, uint256 amount) public returns (bool success)
    {
        _approve(_msgSender(),spender,amount);
        return true;
    }

    //提款和转账  放贷人->指定账户 发送者是借款人 to随便
    //需要先从allances账户扣减再从放贷人账户转账
    function transferFrom(address from, address to, uint256 amount) public returns (bool success){
        //更新授权账户信息 把放贷人在放贷记录里的钱扣减
        _spendAllowance(from,_msgSender(),amount);
        //执行转账
        _transfer(from, to, amount);
        return true;
    }

    //================5.事件
    event Transfer(address from,address to,uint256 amount);
    event Approval(address owner,address spender,uint256 amount);



    //合约内部函数
    function _mint(address account, uint256 amount) internal {
        require(account != address(0), "ERC20: mint to the zero address");
        //初始化货币数量
        _totalSupply += amount;
        //给某个账号注入起始资金
        unchecked {
            _balances[account] += amount;
        }
    }

    function _transfer(
        address from,
        address to,
        uint256 amount
    ) internal {
        //地址检查
        require(from != address(0), "ERC20: transfer from the zero address");
        require(to != address(0), "ERC20:transfer to the zero address");
        //余额检查
        require(
            _balances[from] >= amount,
            "ERC20:transfer amount exceeds balance"
        );
        unchecked {
            _balances[from] -= amount;
            _balances[to] += amount;
        }

        emit Transfer(from, to, amount);
    }

    function _approve(address owner,address spender,uint amount) internal {
         //地址检查
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20:approve to the zero address");

        _allowances[owner][spender]=amount;

        emit Approval(owner, spender, amount);
    }

    function _spendAllowance(address owner,address spender,uint amount)internal {
        uint currentAllowance=allowance(owner, spender);
        if(currentAllowance<=type(uint256).max){
            require(currentAllowance>=amount,unicode"ERC20: 余额不足");
            unchecked{
                _approve(owner,spender,currentAllowance-amount);
            }
        }
    }
}
