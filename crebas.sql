/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/4/11 18:09:27                           */
/*==============================================================*/


drop table if exists ServiceNum_bak;

drop table if exists tbl_location_bak;

drop table if exists tbl_relation_bak;

drop table if exists tbl_time_bak;

drop table if exists tbl_user_bak;

/*==============================================================*/
/* Table: ServiceNum_bak                                        */
/*==============================================================*/
create table ServiceNum_bak
(
   PhoneNum             varchar(20),
   ServiceProvider      varchar(50),
   IndustryType         varchar(20)
);

/*==============================================================*/
/* Table: tbl_location_bak                                      */
/*==============================================================*/
create table tbl_location_bak
(
   LocationID           int not null auto_increment,
   CallLoc              varchar(5),
   CallLocCHN           varchar(20),
   CGI                  varchar(20),
   CGICHN               varchar(100),
   primary key (LocationID)
);

/*==============================================================*/
/* Table: tbl_relation_bak                                      */
/*==============================================================*/
create table tbl_relation_bak
(
   RelationID           int not null auto_increment,
   TimeID               int,
   UserID               int,
   OppositeID           int,
   UserLocID            int,
   OppositeLocID        int,
   TalkTime             int,
   CallType             varchar(10),
   CallSign             varchar(10),
   Column_17            varchar(20),
   Column_18            varchar(20),
   Column_19            varchar(20),
   Column_20            varchar(20),
   primary key (RelationID)
);

/*==============================================================*/
/* Table: tbl_time_bak                                          */
/*==============================================================*/
create table tbl_time_bak
(
   TimeID               int not null auto_increment,
   Date                 date,
   Time                 time,
   Year                 int,
   Month                int,
   Day                  int,
   Hour                 int,
   Minute               int,
   Second               int,
   primary key (TimeID)
);

/*==============================================================*/
/* Table: tbl_user_bak                                          */
/*==============================================================*/
create table tbl_user_bak
(
   UserID               int not null auto_increment,
   PhoneNum             varchar(20),
   PhoneAreaCode        varchar(10),
   PhoneArea            varchar(20),
   NumberSource         varchar(20),
   Sign                 varchar(1),
   IMSI                 varchar(20),
   DeviceID             varchar(20),
   Name                 varchar(20),
   IDCardNum            varchar(20),
   primary key (UserID)
);

alter table tbl_relation_bak add constraint FK_Reference_13 foreign key (UserID)
      references tbl_user_bak (UserID) on delete restrict on update restrict;

alter table tbl_relation_bak add constraint FK_Reference_14 foreign key (TimeID)
      references tbl_time_bak (TimeID) on delete restrict on update restrict;

alter table tbl_relation_bak add constraint FK_Reference_15 foreign key (OppositeID)
      references tbl_user_bak (UserID) on delete restrict on update restrict;

alter table tbl_relation_bak add constraint FK_Reference_16 foreign key (UserLocID)
      references tbl_location_bak (LocationID) on delete restrict on update restrict;

alter table tbl_relation_bak add constraint FK_Reference_17 foreign key (OppositeLocID)
      references tbl_location_bak (LocationID) on delete restrict on update restrict;

