create database khu_nghi_duong;
use khu_nghi_duong;
--  tạo table từ mối quan hệ cơ sở dữ liệu quan hệ-- 
create table vi_tri(
id_vi_tri int primary key,
ten_vi_tri varchar (40)
);
create table trinh_do(
id_trinh_do int primary key,
trinh_do varchar (45)
);
create table bo_phan(
id_bo_phan int primary key,
ten_bo_phan varchar (45)
);
create table nhan_vien(
id_nhan_vien int primary key,
ho_ten varchar(40),
id_vi_tri int ,
id_trinh_do int,
id_bo_phan int ,
ngay_sinh date,
so_CMNN varchar (45),
luong float ,
SDT varchar(12),
email varchar (45),
dia_chi varchar (45),
foreign key (id_vi_tri) references vi_tri(id_vi_tri),
foreign key (id_trinh_do) references trinh_do(id_trinh_do),
foreign key (id_bo_phan) references bo_phan(id_bo_phan)
);
create table dich_vu_di_kem(
id_dich_vu_di_kem int primary key,
ten varchar(45),
gia float ,
don_vi int ,
trang_thai  varchar(45)
);

create table loai_khach(
id_loai_khach int primary key,
ten_loai_khach varchar(45)
);
create table khach_hang(
id_khach_hang int primary key,
id_loai_khach int,
ho_ten varchar(45),
ngay_sinh date ,
so_cmnd varchar(45),
SDT  varchar(12),
email varchar(45),
dia_chi varchar(45),
foreign key (id_loai_khach) references loai_khach(id_loai_khach)
);
create table kieu_thue(
id_kieu_thue int primary key,
ten_kieu_thue varchar(45)
);
create table loai_dich_vu(
id_loai_dich_vu int primary key,
ten_loai_dich_vu varchar(45)
);
create table dich_vu(
id_dich_vu int primary key,
ten_dich_vu varchar(45),
dien_tich float,
so_tang int,
so_nguoi_toi_da int ,
chi_phi_thue float ,
id_kieu_thue int,
id_loai_dich_vu int,
trang_thai varchar(45),
foreign key (id_kieu_thue) references kieu_thue(id_kieu_thue),
foreign key (id_loai_dich_vu) references loai_dich_vu(id_loai_dich_vu)
);
create table hop_dong(
id_hop_dong int primary key,
id_nhan_vien int,
id_khach_hang int,
id_dich_vu int,
ngay_lam_hop_dong date,
ngay_ket_thuc date,
tien_dat_coc float,
tong_tien float,
foreign key (id_nhan_vien) references nhan_vien(id_nhan_vien),
foreign key (id_khach_hang) references khach_hang(id_khach_hang),
foreign key (id_dich_vu) references dich_vu(id_dich_vu)
);
create table hop_dong_chi_tiet(
id_hop_dong_chi_tiet int primary key,
id_hop_dong int,
id_dich_vu_di_kem int,
so_luong int,
foreign key (id_dich_vu_di_kem) references dich_vu_di_kem(id_dich_vu_di_kem),
foreign key (id_hop_dong) references hop_dong(id_hop_dong)
);
-- 1.	Thêm mới thông tin cho tất cả các bảng có trong CSDL để có thể thõa mãn các yêu cầu bên dưới.
insert into vi_tri
values (1,"Quan Ly"),
(2,"Cham Soc Khach Hang"),
(3,"Ke Toan"),
(4,"Lao Cong"),
(5,"Nhan Vien Phuc Vu");
 
 insert into trinh_do
values (1,"Thac Si"),
(2,"Trung Cap Nghe"),
(3,"Dai Hoc Ke Toan"),
(4,"12/12"),
(5,"Cao Dang ");

insert into bo_phan
values (1,"Quan ly khach hang"),
(2,"Cham Soc Khach Hang"),
(3,"Ngan Sach"),
(4,"Ve Sinh"),
(5," Phuc Vu");

insert into nhan_vien
values (1,"Nguyen Hoang Ngoc Anh",1,1,1,"1990-12-31","123456789",20000,"090000005","aaaa@gmail.com","Da Nang"),
 (2,"Nguyen Hoang Phuoc",4,4,2,"1990-12-31","123456780",20000,"090000004","aaaa@gmail.com","Da Nang"),
 (3,"Nguyen Hoang Trung",3,1,5,"1990-12-31","123456789",20000,"090000003","aaaa@gmail.com","Quang Tri"),
 (4,"Nguyen Hoang Anh Nguyet",1,5,3,"1990-12-31","623456789",20000,"090000002","aaaa@gmail.com","Da Nang"),
 (5,"Nguyen Hoang Kien",5,5,4,"1990-12-31","023456789",20000,"090000001","aaaa@gmail.com","Quang Ngai");

insert into dich_vu_di_kem 
values (1,"Ăn bánh xèo giá rẻ ",2000,5,"đang thực hiện"),
(2,"Tham quan khu du lịch ",2000,5,"đang thực hiện"),
(3,"Massage ",2000,5,"đang thực hiện"),
(4,"Tắm hồ sen ",2000,5,"đang thực hiện"),
(5,"Karaoke ",2000,5,"đang thực hiện");

 insert into loai_khach
values (1,"VIP"),
(2,"Thượng lưu"),
(3,"Thỉnh thoảng"),
(4,"Khách Quốc tế"),
(5,"Thường ");

 insert into loai_dich_vu
values (1,"Biệt thự"),
(2,"Nhà"),
(3,"Phòng");


 insert into kieu_thue
values (1,"Thuê theo ngày"),
(2,"Thuê theo tháng"),
(3,"thuê trong ngày");

insert into dich_vu
values (1,"biệt thự không mái",100,1,10,2000000,1,1,"Đang trống"),
(2,"biệt thự ngàn sao",10,2,10,2000000,2,1,"Đang trống"),
(3,"Nhà 5 giường",140,1,10,1000000,3,2,"Đang trống"),
(4,"Nhà 3 tầng",100,3,10,3000000,3,2,"Đang trống"),
(5,"Phòng 1 giường",50,1,2,200000,3,3,"Đang trống");
create table khach_hang(
id_khach_hang int primary key,
id_loai_khach int,
ho_ten varchar(45),
ngay_sinh date ,
so_cmnd varchar(45),
SDT  varchar(12),
email varchar(45),
dia_chi varchar(45),
foreign key (id_loai_khach) references loai_khach(id_loai_khach)
);
insert into khach_hang
values (1,1,"Nguyễn Thi Mai Khanh","1990-11-30",11111111,1111222234,"123@gmail.com","Đà nẵng"),
(2,2,"Nguyễn Thi Mai Hạnh","1987-11-30",11111111,1111222234,"123@gmail.com","Quãng Trị"),
(3,3,"Nguyễn Thanh Khá","1789-11-30",11111111,1111222234,"123@gmail.com","Quãng ngãi"),
(4,4,"Nguyễn Tuyết","2002-11-30",11111111,1111222234,"123@gmail.com","Quãng Trị"),
(5,5,"Nguyễn Thi Mai","2009-11-30",11111111,1111222234,"123@gmail.com","Đà nẵng");


insert into hop_dong
values (1,1,1,1,"2020-11-30","2020-12-31",1000,null),
(2,2,1,4,"2020-11-30","2020-12-31",1000,null),
(3,3,2,5,"2019-11-13","2020-01-31",1000,null),
(4,3,3,3,"2018-11-11","2020-01-31",1000,null),
(5,5,3,1,"2020-11-13","2020-12-31",1000,null);

insert into hop_dong_chi_tiet 
values (1,1,3,2),
(2,2,2,5),
(3,3,1,4),
(4,1,4,1),
(5,2,5,2);
-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống 
-- có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.
select ho_ten ,SUBSTRING_INDEX(ho_ten, ' ', -1) as "tên có chữ H,K,T "
from khach_hang
where character_length(ho_ten) <=15 and ( SUBSTRING_INDEX(ho_ten, ' ', -1) like "K%" 
or SUBSTRING_INDEX(ho_ten, ' ', -1) like "H%"
or SUBSTRING_INDEX(ho_ten, ' ', -1) like "T%");

-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 
-- 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select ngay_sinh , dia_chi ,year(now())-year(ngay_sinh) as "tuổi"
from khach_hang 
where (year(now())-year(ngay_sinh) between 18 and 50 ) 
and (dia_chi ="Đà nẵng" or dia_chi ="Quãng trị");
-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
--  Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
--  Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.


