#old


drop table tbl_data;

CREATE TABLE `tbl_data` (
  `CallID` varchar(5) NOT NULL,
  `CallRecordType` varchar(20) DEFAULT NULL,
  `CallSource` varchar(10) DEFAULT NULL,
  `CallListType` varchar(10) DEFAULT NULL,
  `CallIdentification` varchar(10) DEFAULT NULL,
  `RoamingIdentifier` varchar(10) DEFAULT NULL,
  `CallDate` date DEFAULT NULL,
  `CallTime` time DEFAULT NULL,
  `TalkTime` int(5) DEFAULT NULL,
  `PhoneAreaCode` varchar(4) DEFAULT NULL,
  `PhoneArea` varchar(20) DEFAULT NULL,
  `PhoneNumber` varchar(20) NOT NULL,
  `OppositePhoneAreacode` varchar(10) DEFAULT NULL,
  `OppositePhoneArea` varchar(20) DEFAULT NULL,
  `OppositePhoneNumber` varchar(20) DEFAULT NULL,
  `CallType` varchar(10) DEFAULT NULL,
  `CallTypeChinese` varchar(30) DEFAULT NULL,
  `CallSign` varchar(10) DEFAULT NULL,
  `PhoneCallAreacode` varchar(4) DEFAULT NULL,
  `PhoneCallArea` varchar(20) DEFAULT NULL,
  `CallDescription` varchar(10) DEFAULT NULL,
  `CardNumber` varchar(10) DEFAULT NULL,
  `InternetAccount` varchar(20) DEFAULT NULL,
  `IMSI` varchar(50) DEFAULT NULL,
  `DeviceNumber` varchar(50) DEFAULT NULL,
  `SwitchBoardID` varchar(20) DEFAULT NULL,
  `CGI` varchar(50) DEFAULT NULL,
  `CGIChinese` varchar(200) DEFAULT NULL,
  `LAC` varchar(10) DEFAULT NULL,
  `CID` varchar(10) DEFAULT NULL,
  `OppositeLAC` varchar(10) DEFAULT NULL,
  `OppositeCallAreacode` varchar(4) DEFAULT NULL,
  `OppositeCallArea` varchar(20) DEFAULT NULL,
  `OutRoute` varchar(20) DEFAULT NULL,
  `InRoute` varchar(20) DEFAULT NULL,
  `DynamicRoamingNumber` varchar(10) DEFAULT NULL,
  `CTX` varchar(10) DEFAULT NULL,
  `OppositeCTX` varchar(10) DEFAULT NULL,
  `FarwardingNumber` varchar(10) DEFAULT NULL,
  `CallCost` varchar(10) DEFAULT NULL,
  `IP` varchar(20) DEFAULT NULL,
  `UserName` varchar(20) DEFAULT NULL,
  `HAIP` varchar(20) DEFAULT NULL,
  `PdsnfaIP` varchar(20) DEFAULT NULL,
  `PcfIP` varchar(20) DEFAULT NULL,
  `BSID` varchar(20) DEFAULT NULL,
  `RoamingIdentifier2` varchar(10) DEFAULT NULL,
  `CardType` varchar(20) DEFAULT NULL,
  `UserIP` varchar(20) DEFAULT NULL,
  `OppositeIP` varchar(20) DEFAULT NULL,
  `ConferenceID` varchar(10) DEFAULT NULL,
  `NumberOfParticipants` varchar(10) DEFAULT NULL,
  `UserAttachedNumber` varchar(20) DEFAULT NULL,
  `OppositePhoneNumberArea` varchar(20) DEFAULT NULL,
  `OppositeCID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


create table tbl_user as
select distinct CallID,PhoneNumber,PhoneAreaCode,PhoneArea,CallSource,Signn(1),IMSI,DeviceNumber,Namee,IDCardNum
from tbl_data;

insert into tbl_user(PhoneNumber,PhoneAreaCode,PhoneArea)
select distinct OppositePhoneNumber,OppositePhoneAreaCode,OppositePhoneArea 
from tbl_data;

create table tbl_relation as 
select distinct PhoneNumber,OppositePhoneNumber 
from tbl_data;

create table tbl_relation2 as 
select PhoneNumber,OppositePhoneNumber,count(OppositePhoneNumber) as number_of_call 
from tbl_data 
group by PhoneNumber,OppositePhoneNumber;


create table tbl_call as 
select PhoneNumber,OppositePhoneNumber,call_date,call_time,talktime,call_sign 
from tbl_data;