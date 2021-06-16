use classicmodels;
-- dùng tham số in 
DELIMITER //
create procedure get_cus_by_id(in cus_num int )
begin 
select * from customers 
where customerNumber =cus_num;
end //
call get_cus_by_id(175);
 
 -- sử dụng out
 DELIMITER //
 create procedure get_customer_by_count_by_city(
 in in_city varchar(50) , out total int)
 begin 
 select count(customerNumber)
 into total 
 from customers 
 where city = in_city;
 end//
call get_customer_by_count_by_city("Lyon",@total);
select @total;
-- tham số loại inout
delimiter //
create procedure set_cuonter(
inout counter int , in inc int )
begin 
set counter =counter+inc;
end //
delimiter ;

set @counter = 1;
call set_cuonter (@counter,1);
select @counter;