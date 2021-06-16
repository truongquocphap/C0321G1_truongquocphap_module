use classicmodels;
create view customer_view as 
select customerNumber,customerName,phone
from customers;
select * 
from customer_view;
-- cập nhật view
create or replace view customer_view as
select customerNumber, customerName , contactFirstName, contactLastName
from customers
where city='Nantes';

select * from customer_view;
-- xoá view
drop view customer_view;