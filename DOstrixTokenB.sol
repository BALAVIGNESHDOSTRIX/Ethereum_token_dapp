pragma solidity ^0.4.0;

contract DostrixtokenB 
    {
     
        
         uint256 public constant totalsupply = 1000;
         
         string public name;
         string public symbol;
         uint256 public decimals;
         
         address public Owner;
         
         function DostrixtokenB() public{
           name = "DostrixToken";
            symbol = "DTX";
            decimals = 0;
            Owner = msg.sender;
         }
       
        
       mapping(address => uint256) public Balance;
        
        modifier OwnerOnly()
        {
            if(msg.sender != Owner)
            {
                revert();
            }
            _;
        }
        
       
        
        
        function mint(uint256 _amount) public OwnerOnly  
        {
            
          require(_amount < totalsupply);
          
              Balance[Owner] = Balance[Owner] + _amount;
              
         
           
        }
        
        
        function transfer(address _to,uint256 _amount) public OwnerOnly 
        {
           require(Balance[Owner] >= _amount);
           
               Balance[_to] = Balance[_to] + _amount;
               Balance[Owner] = Balance[Owner] - _amount;
               
           
        }
        
        function TransferFromB(address _from,address _to,uint256 _amount) public 
        {
           require(Balance[_from] >= _amount);
           
               Balance[_from] = Balance[_from] - _amount;
               Balance[_to] = Balance[_to] + _amount;
               
        }
        
       function CheckBalance(address _check) public view returns(uint256)
       {
           return Balance[_check];
       }
    }
