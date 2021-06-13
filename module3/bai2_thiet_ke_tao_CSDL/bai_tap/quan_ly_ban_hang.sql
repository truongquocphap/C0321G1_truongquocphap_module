create database quan_ly_ban_hang;
use quan_ly_ban_hang;
create table customer(
customer_ID int primary key ,
customer_Name varchar(40),
customer_Age int default 0 check (customer_Age>0)
);
create table orders (
orders_ID int primary key,
customer_ID int ,
orders_Date date,
orders_totalPrice float,
foreign key (customer_ID) references customer(customer_ID)
);
create table product(
product_ID int primary key,
product_Name varchar(20),
product_Price float 
);
create table orderDetail(
product_ID int,
orders_ID int,
orderDetail_QTY varchar(20),
primary key (product_ID,orders_ID),
foreign key(product_ID) references product(product_ID),
foreign key(orders_ID) references orders(orders_ID)
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
