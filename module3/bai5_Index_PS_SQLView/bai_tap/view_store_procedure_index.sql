create database demo;
use demo;
create table product(
id_product int primary key ,
product_code varchar(40),
name_product varchar(40),
price_product float ,
amount_product int,
-- description_product (mo ta)
description_product varchar(50),
status_product  varchar(50)
);
insert into product 
values ( 1,'123','ab',23.4,3,'aaaaa','con'),
( 2,'1234','cd',23.4,3,'aaaaa','con'),
( 3,'1235','qw',23.4,3,'aaaaa','con'),
( 4,'1236','er',23.4,3,'aaaaa','con'),
( 5,'1237','rr',23.4,3,'aaaaa','con'),
( 6,'1238','tt',23.4,3,'aaaaa','con'),
( 7,'1239','yy',23.4,3,'aaaaa','con'),
( 8,'12311','uui',23.4,3,'aaaaa','con'),
( 9,'12322','oo',23.4,3,'aaaaa','con'),
( 110,'12333','aa',23.4,3,'aaaaa','con'),
( 10,'12344','gg',23.4,3,'aaaaa','con'),
( 11,'12355','ab',23.4,3,'aaaaa','con');
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
alter table product add unique index index_product_code(product_code);
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
alter table product add unique index index_product_code_name(product_code,name_product);
-- alter table product drop index  index_product_code_name;
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select * from product 
where name_product = 'ab';
-- bước 4 tạo view
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view product_view as 
select product_code,name_product,price_product,status_product
from product;
-- sửa đổi view
update product_view 
set name_product = 'pppppppppppp'
where name_product ='ab';
-- xoá view
drop view product_view;
-- bước 5 
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure show_product()
begin 
select *
from product;
end //
delimiter ;
call show_product();
-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure add_product(
in id_product int,
in product_code varchar(40),
in name_product varchar(40),
in price_product float ,
in amount_product int,
in description_product varchar(50),
in status_product  varchar(50))
begin 
insert into product
values(id_product,product_code,name_product,price_product,amount_product,description_product,status_product);
end //
delimiter ;
drop procedure add_product;
call add_product(12,'1010110','kkkkkk',123123,10,'hàng nội địa','còn hàng');
-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure edit_product(id_product_in int ,name_product_in varchar(50))
begin 
update product 
set name_product =  name_product_in
where id_product = id_product_in;
end //
delimiter ;
call edit_product(3,'wwwwwwwwwwwww');
delimiter //
create procedure delete_product(id_product_in int)
begin 
delete from product 
where id_product = id_product_in;
end //
delimiter ;
call delete_product(1);



