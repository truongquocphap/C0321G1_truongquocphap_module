create database quan_ly_ban_hang;
-- drop database quan_ly_ban_hang;
use quan_ly_ban_hang;
create table customer(
customer_id int primary key ,
customer_name varchar(40),
customer_age int default 0 check (customer_age>0)
);
create table orders (
orders_id int primary key,
customer_id int ,
orders_date date,
orders_total_price float,
foreign key (customer_id) references customer(customer_id)
);
create table product(
product_id int primary key,
product_name varchar(20),
product_price float 
);
create table order_detail(
product_id int,
orders_id int,
order_detail_QTY varchar(20),
primary key (product_id,orders_id),
foreign key(product_id) references product(product_id),
foreign key(orders_id) references orders(orders_id)
);
