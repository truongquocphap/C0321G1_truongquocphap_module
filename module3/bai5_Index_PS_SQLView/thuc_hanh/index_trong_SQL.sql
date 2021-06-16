use classicmodels;
-- câu lệnh kiểm tra mà k có index
EXPLAIN SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.'; 
-- câu lệnh kiểm tra có index
ALTER TABLE customers ADD INDEX idx_customerName(customerName);
EXPLAIN SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.'; 
-- drop index 
ALTER TABLE customers DROP INDEX idx_customerName;
-- câu lệnh thêm 1 lần 2 cột index 
ALTER TABLE customers ADD INDEX idx_full_name(contactFirstName, contactLastName);
EXPLAIN SELECT * FROM customers 
WHERE contactFirstName = 'Jean' or contactFirstName = 'King';