pragma solidity ^0.4.24 ;

/*
Copyright : Anan Paenthongkham
Email : hs1gab@gmail.com
*/

contract weapons_move_ontheway {
    
    struct weaponsowner {
        string name ;
        string lastname ;
        string idcard ;
        address Account ;
        
    }
    mapping (address => weaponsowner) weaponsowners ;
    
    struct weapons {
        string brand ;
        string typeOf ;
        string registornomber ;
        address weaponsAddress ;
        
    }
    mapping (address => weapons) weaponss ;
    
    struct ontheway {
        string  StartLocation ;
        string  StopLocation ;
        string  CurrentGPS ; 
        uint  dateTimestart ;
        uint  dateTimestop ;
        string carRegistorNum ; // ทะเบียนรถ
        string transportDetail ; // หรือโดยสารขนสงสธารณะ 
        uint  counts ;  
        address owner ;
        address weapons ; 
    }
    mapping(address => uint ) counts ;  
    mapping (address => mapping (address => ontheway )) OntheWayInfomations ;   
    
    function requestCarryWeaponsOntheway (
    address _weaponAddress , 
     uint _datestart , 
     uint _dateStop , 
     string StartLocation ,
     string StopLocation ,
     uint _dateTimestart ,
     uint _dateTimestop ,
     string _carRegistorNum ,
     string _transportDetail 
     ) {
     require ( msg.sender == weaponsowners[msg.sender].Account ,  " Your are not owner " ) ; 
        OntheWayInfomations[msg.sender ][_weaponAddress].StartLocation = StartLocation ;
        OntheWayInfomations[msg.sender ][_weaponAddress].StopLocation = StopLocation ;
        OntheWayInfomations[msg.sender ][_weaponAddress].dateTimestart = _datestart ;
        OntheWayInfomations[msg.sender ][_weaponAddress].dateTimestop = _dateStop ;
        OntheWayInfomations[msg.sender ][_weaponAddress].carRegistorNum = _carRegistorNum ;
        OntheWayInfomations[msg.sender ][_weaponAddress].transportDetail = _transportDetail ;
        OntheWayInfomations[msg.sender ][_weaponAddress].counts += counts[msg.sender] ;
        counts[msg.sender] += 1 ; 
    }
    
    /*
    
    
    more code contact  email : hs1gab@gmail.com
    
    */
    
}
