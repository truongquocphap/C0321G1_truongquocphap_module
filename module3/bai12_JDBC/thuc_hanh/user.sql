CREATE DATABASE demo;
USE demo;

create table users (
 id  int(3) NOT NULL AUTO_INCREMENT,
 name varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
);
SELECT * FROM users 
ORDER BY `name` asc;
-- bài 13 transaction
-- thực hành 1  
delimiter //
create procedure fin_by_id(in search_id int)
begin
select * 
from users
where id=search_id;
end //
delimiter ;
call fin_by_id(3);
create procedure insert_users(
in `user_name` varchar(255),
in user_email varchar(255),
in user_country varchar(255))
begin
insert into users(`name`,email,country) 
VALUES(user_name,user_email,user_country)
end //
delimiter ;
-- thực hành 2: JDBC transaction
create table permision (
id int(11) primary key,
`name` varchar(255)
);
create table user_permision(
-- permision (cho phep) 
user_id int ,
permision_id int
);
insert into Permision(id, name) values(
1, 'add',
2, 'edit',
3, 'delete',
4, 'view'
);
delimiter //
create procedure edit_user(in `user_name` varchar(255),
in user_email varchar(255),
in user_country varchar(255),
in id_user int)
begin
update users 
set `name` = user_name , email = user_email , country = user_country
where id = id_user ; 
end //
delimiter ;
delimiter //
create procedure delete_user( id_user int )
begin 
delete from users
where id = id_user;
end //
delimiter ;