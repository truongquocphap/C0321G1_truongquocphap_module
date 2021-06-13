create database quan_ly_ban_hang;
use quan_ly_ban_hang;
create table customer(
cID int primary key ,
cName varchar(40),
cAge int default 0 check (cAge>0)
);
create table orders (
oID int primary key,
cID int unique,
oDate date,
oTotalPrice float,
foreign key (cID) references customer(cID)
);
create table product(
pID int primary key,
pName varchar(20),
pPrice float 
);
create table orderDetail(
pID int,
oID int,
odQTY varchar(20),
primary key (pID,oID),
foreign key(pID) references product(pID),
foreign key(oID) references orders(oID)
);

insert into customer
values (1,"phap",17),
(2,"chau",20);
insert into orders
values(2,2,"1111-11-11",113);
insert into product
values (1,"phi",12),
(2,"anh",15);
insert into orderDetail
values (1,1,"12"),
(2,2,"12");
 