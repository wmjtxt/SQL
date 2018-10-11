use case3;
select count(*) from tbl_data;
select count(*) from tbl_user;
select * from tbl_user;
select (select UserID from tbl_user where PhoneNumber = tbl_user.PhoneNum) as UserID,(select UserID from tbl_user where OppositePhoneNumber = tbl_user.PhoneNum) as OppositeID from tbl_data;
select count(*) from (select distinct (select UserID from tbl_user where PhoneNumber = tbl_user.PhoneNum) as UserID,(select UserID from tbl_user where OppositePhoneNumber = tbl_user.PhoneNum) as OppositeID from tbl_data) as tmpresult;
-- Error Code: 2013. Lost connection to MySQL server during query
-- Edit->preferences->Sql editor->DBMS connection read ... set 6000s
