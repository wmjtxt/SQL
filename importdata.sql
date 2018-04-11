#import data

#tbl_user_bak

#1.导入数据
insert into tbl_user_bak(PhoneNum,PhoneAreaCode,PhoneArea,NumberSource,Sign,IMSI,DeviceID)
select distinct PhoneNumber,PhoneAreaCode,PhoneArea,CallSource,1,IMSI,DeviceNumber
from tbl_data;

insert into tbl_user_bak(PhoneNum,PhoneAreaCode,PhoneArea,Sign)
select distinct OppositePhoneNumber,OppositePhoneAreaCode,OppositePhoneArea,0
from tbl_data;


#2.去除重复数据
delete from tbl_user_bak where UserID in (select UserID from (select UserID from tbl_user_bak where PhoneNum in (SELECT PhoneNum FROM tbl_user_bak group by PhoneNum having count(PhoneNum)>1) and UserID not in(select min(UserID) from tbl_user_bak group by PhoneNum having count(PhoneNum)>1)) as tmpresult);

#3.创建临时表
drop table if exists temp;
create table wmj.temp(
PhoneNum varchar(20),
PhoneAreaCode varchar(10),
PhoneArea varchar(20),
NumberSource varchar(20),
Sign varchar(1),
IMSI varchar(20),
DeviceID varchar(20),
Name varchar(20),
IDCardNum varchar(20));

#4.将去重后的数据插入到临时表中
insert into temp
select PhoneNum,PhoneAreaCode,PhoneArea,NumberSource,Sign,IMSI,DeviceID,Name,IDCardNum from tbl_user_bak;

#5.删除原数据表数据，并修改自增初始值为1
delete from tbl_user_bak;#删除表tbl_user_bak的所有数据
ALTER TABLE tbl_user_bak AUTO_INCREMENT = 1; #修改自增初始值为1

#6.将去重后的数据插入原表
insert into tbl_user_bak(PhoneNum,PhoneAreaCode,PhoneArea,NumberSource,Sign,IMSI,DeviceID,Name,IDCardNum) 
select * from temp;


#tbl_relation_bak
insert into tbl_relation_bak(UserID,OppositeID,TalkTime,CallType,CallSign)
select PhoneNumber,OppositePhoneNumber,TalkTime,CallSign from tbl_data;


