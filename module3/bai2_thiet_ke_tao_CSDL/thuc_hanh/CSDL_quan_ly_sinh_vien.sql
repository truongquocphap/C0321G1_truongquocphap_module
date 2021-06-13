create database quan_ly_sinh_vien;
use quan_ly_sinh_vien;
create table class(
class_id int not null auto_increment primary key,
class_name varchar(60) not null,
startDate datetime not null,
status_class bit
);
create table student(
student_id int not null auto_increment primary key,
student_name varchar (30) not null,
phone varchar (20),
status_student bit ,
class_id int not null,
foreign key (class_id) references class(class_id)
);
create table subject_ (
sub_id int not null auto_increment primary key,
sub_name varchar(20) not null,
credit  tinyint not null default 1 check (credit>=1),
status_ bit default 1
); 
create table mark (
mark_id int not null auto_increment primary key ,
sub_id int not null,
student_id int not null,
mark float default 0 check(mark between 0 and 100),
exam_time tinyint default 1,
unique (sub_id,student_id),
foreign key (sub_id) references  subject_ (sub_id),
foreign key (student_id) references student(student_id)
);