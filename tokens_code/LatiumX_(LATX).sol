//token_name	LatiumX_(LATX)
//token_url	https://etherscan.io//address/0x2f85e502a988af76f7ee6d83b7db8d6c0a823bf9#code
//spider_time	2018/06/09 06:27:19
//token_Transactions	26766 txns
//token_price	

pragma solidity ^0.4.16;

contract LatiumX {
    string public constant name = "LatiumX";
    string public constant symbol = "LATX";
    uint8 public constant decimals = 8;
    uint256 public constant totalSupply =
        300000000 * 10 ** uint256(decimals);

    // owner of this contract
    address public owner;

    // balances for each account
    mapping (address => uint256) public balanceOf;

    // triggered when tokens are transferred
    event Transfer(address indexed _from, address indexed _to, uint _value);

    // constructor
    function LatiumX() {
        owner = msg.sender;
        balanceOf[owner] = totalSupply;
    }

    // transfer the balance from sender's account to another one
    function transfer(address _to, uint256 _value) {
        // prevent transfer to 0x0 address
        require(_to != 0x0);
        // sender and recipient should be different
        require(msg.sender != _to);
        // check if the sender has enough coins
        require(_value > 0 && balanceOf[msg.sender] >= _value);
        // check for overflows
        require(balanceOf[_to] + _value > balanceOf[_to]);
        // subtract coins from sender's account
        balanceOf[msg.sender] -= _value;
        // add coins to recipient's account
        balanceOf[_to] += _value;
        // notify listeners about this transfer
        Transfer(msg.sender, _to, _value);
    }
}