-- thêm dữ liệu 
use quan_ly_ban_hang;
insert into customer 
values (1,"Minh Quan",10),
(2,"Ngoc Oanh",20),
(3,"Hong Ha",50);
insert into orders 
values (1,2,"2006-03-21",133.4),
(2,2,"2006-03-23",111.2),
(3,1,"2006-03-23",333.5);
insert into product 
values (1,"May Lanh", 3),
(2,"Tu Lanh", 5),
(3,"Dieu Hoa", 7),
(4,"Quat", 1),
(5,"Bep Dien", 2);
insert into orderDetail 
values (1,1,3),
(3,1,7),
(4,1,2),
(1,2,1),
(1,3,8),
(5,2,4),
(3,2,3);
--  Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select orders_ID,orders_Date,orders_totalPrice 
from orders ;
-- Hiển thị danh sách các khách hàng đã mua hàng,
--  và danh sách sản phẩm được mua bởi các khách 
select c.customer_Name,c.customer_Age,O.orders_Date,
P.product_Name,OD.orderDetail_QTY
from customer c
join orders O on O.customer_ID=c.customer_ID
join orderDetail OD on OD.orders_ID=O.orders_ID
join product P on P.product_ID =OD.product_ID;
--  Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select C.customer_ID,C.customer_Name,C.customer_Age
from customer C
left join orders OD on OD.customer_ID=C.customer_ID
where OD.orders_Date is  null
;
-- cach 2
 select C.customer_ID,C.customer_Name,C.customer_Age
from customer C
where C.customer_ID not in (select o.customer_ID from orders o);
--  Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng
--  xuất hiện trong hóa đơn.
--  Giá bán của từng loại được tính = odQTY*pPrice)
select o.orders_ID ,o.orders_Date,sum(od.orderDetail_QTY*p.product_Price)
from orders o
join orderDetail od on o.orders_ID=od.orders_ID
join product p on p.product_ID = od.product_ID
group by od.orders_ID;