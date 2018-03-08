pragma solidity ^0.4.0;
import "./DostrixTokenERC.sol";
contract DostrixtokenB is DostrixToken
    {
     
        
        
        
       
        
       
        
        modifier OwnerOnly()
        {
            if(msg.sender != Owner)
            {
                revert();
            }
            _;
        }
        
       
        
        
        function mint(uint256 _amount) public OwnerOnly  returns(bool)
        {
           if(_amount < totalsupply){
            
            balanceOf[Owner] = balanceOf[Owner] + _amount;
            
            return true;
           }
           else
           {
               return false;
           }
            
        }
        
        
        function TransferB(address _to,uint256 _amount) public OwnerOnly returns(bool)
        {
            transfer(_to,_amount);
        }
        
        function TransferFromB(address _from,address _to,uint256 _amount) public returns(bool)
        {
            transferFrom(_from,_to,_amount);
        }
        
       
    }
