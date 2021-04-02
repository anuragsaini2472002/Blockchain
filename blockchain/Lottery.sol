pragma solidity ^0.4.5;

contract Lottery {
    
    address owner;
    adress[] participants;
    constructor() public{
        owner=msg.sender;
    }

    function participate() public payable returns(bool){
        if(msg.value<=1){
            return false;
        }
        else{
            participants.push(msg.sender);
        }
    }

    function getrparticipants() public view returns(address[]){
        return participants;
    }
    modifier onlyowner(){
        require(msg.sender==owner);
        _;
    }
    function randowm() private view return(uint){
        return uint(keccak256(abi.encode(block.difficulty,new,participants)));
    }

    function winner() public onlyowner{
        uint index=random()%participants.length;
        participants[index].transfer(address(this).balance);
        participants=new address[](0);
    }
}