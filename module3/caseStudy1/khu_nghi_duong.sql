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
insert into nhan_vien
values (1,"Nguyen Hoang Ngoc Anh",1,1,"1990-12-31",123456789,20000,"090000000","aaaa@gmail.com","Da Nang"),
(2,"Cham Soc Khach Hang"),
(3,"Ngan Sach"),
(4,"Ve Sinh"),
(5," Phuc Vu");
