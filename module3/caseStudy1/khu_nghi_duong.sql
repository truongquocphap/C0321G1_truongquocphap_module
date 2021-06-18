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
gia float default 0,
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
so_luong int default 0,
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

insert into dich_vu_di_kem 
values (6," ",0,0,"");
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
(5,2,5,2),
(6,4,6,0),
(6,5,6,0);

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
select k.ho_ten ,count(h.id_khach_hang) as "số lần khách hàng VIP đã đặt phòng"
from khach_hang k 
join hop_dong h on h.id_khach_hang = k.id_khach_hang
join loai_khach l on l.id_loai_khach=k.id_loai_khach
where l.ten_loai_khach="VIP"
group by k.ho_ten
order by count(l.id_loai_khach);
-- 5.	Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien 

select kh.id_khach_hang,kh.ho_ten,lk.ten_loai_khach ,hd.id_hop_dong,dv.ten_dich_vu,
hd.ngay_lam_hop_dong , hd.ngay_ket_thuc , sum(case when hdct.so_luong is null then 0 else hdct.so_luong*dvdk.gia end )  + dv.chi_phi_thue as 'tổng tiền'
from khach_hang kh
left join hop_dong hd on hd.id_khach_hang = kh.id_khach_hang
left join loai_khach lk on lk.id_loai_khach = kh.id_loai_khach
left join dich_vu dv on dv.id_dich_vu = hd.id_dich_vu
left join hop_dong_chi_tiet hdct on hdct.id_hop_dong=hd.id_hop_dong
left join dich_vu_di_kem dvdk on dvdk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
group by hd.id_hop_dong ,kh.id_khach_hang;
 
-- 6.	Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu 
-- của tất cả các loại Dịch vụ chưa từng được Khách hàng thực hiện 
-- đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).
select dv.id_dich_vu,dv.ten_dich_vu,dv.dien_tich,dv.chi_phi_thue,ldv.ten_loai_dich_vu
from dich_vu dv
join loai_dich_vu ldv on ldv.id_loai_dich_vu = dv.id_loai_dich_vu
join hop_dong hd on hd.id_dich_vu=dv.id_dich_vu
where (year(hd.ngay_lam_hop_dong) in ('2019') and month(hd.ngay_lam_hop_dong) not in ('01','02','03'))
or (year(hd.ngay_lam_hop_dong) not in ('2019') and month(hd.ngay_lam_hop_dong) not in ('01','02','03'));
-- 7.	Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu
--  của tất cả các loại dịch vụ đã từng được Khách hàng đặt phòng trong năm 2018 nhưng chưa từng được
--  Khách hàng đặt phòng  trong năm 2019.
select dv.id_dich_vu,dv.ten_dich_vu,dv.dien_tich,dv.chi_phi_thue,dv.so_nguoi_toi_da,ldv.ten_loai_dich_vu
from dich_vu dv
join loai_dich_vu ldv on ldv.id_loai_dich_vu = dv.id_loai_dich_vu
join hop_dong hd on hd.id_dich_vu=dv.id_dich_vu
join khach_hang kh on kh.id_khach_hang=hd.id_khach_hang
where (year(hd.ngay_lam_hop_dong) in ('2018')) and kh.id_khach_hang not in 
(select id_khach_hang from hop_dong hd
where year(hd.ngay_lam_hop_dong) in ('2019'));
-- 8.	Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên 
-- cách 1
select distinct ho_ten 
from khach_hang ;
-- cách 2
select distinctrow ho_ten
from khach_hang;
-- cách 3
select  ho_ten
from khach_hang
union
select ho_ten
from khach_hang;
-- 9.	Thực hiện thống kê doanh thu theo tháng, 
-- nghĩa là tương ứng với mỗi tháng trong năm 2019 thì sẽ 
-- có bao nhiêu khách hàng thực hiện đặt phòng.
select month(ngay_lam_hop_dong) as 'tháng', count(month(ngay_lam_hop_dong)) as 'tổng số hợp đồng'
from hop_dong 
where year(ngay_lam_hop_dong) in ('2019')
group by ngay_lam_hop_dong;
-- 10.	Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm.
-- Kết quả hiển thị bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem 
-- (được tính dựa trên việc count các IDHopDongChiTiet).
select hd.id_hop_dong,hd.ngay_lam_hop_dong,hd.ngay_ket_thuc,hd.tien_dat_coc,
count(hdct.id_dich_vu_di_kem) as 'số lượng dịch vụ đi kèm'
from hop_dong hd
join hop_dong_chi_tiet hdct on hdct.id_hop_dong=hd.id_hop_dong
group by hd.id_hop_dong;
-- 11.	Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách hàng có TenLoaiKhachHang
-- là “Diamond” và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.
select  kh.id_khach_hang,lk.ten_loai_khach,dvdk.ten,dvdk.gia,dvdk.don_vi,dvdk.trang_thai
from  dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on hdct.id_dich_vu_di_kem=dvdk.id_dich_vu_di_kem
join hop_dong hd on hd.id_hop_dong =hdct.id_hop_dong
join khach_hang kh on kh.id_khach_hang =hd.id_khach_hang
join loai_khach lk on lk.id_loai_khach=kh.id_loai_khach
where lk.ten_loai_khach in ('VIP') and (kh.dia_chi ='Quãng ngãi' or kh.dia_chi='Vinh') ;
-- 12.	Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang,
-- TenDichVu, SoLuongDichVuDikem (được tính dựa trên tổng Hợp đồng chi tiết),
-- TienDatCoc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2019
-- nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2019.
select hd.id_hop_dong,nv.ho_ten,kh.ho_ten,kh.SDT,dv.ten_dich_vu,hdct.so_luong,hd.tien_dat_coc
from khach_hang kh
join hop_dong hd  on hd.id_khach_hang=kh.id_khach_hang
join hop_dong_chi_tiet hdct on hdct.id_hop_dong=hd.id_hop_dong
join dich_vu dv on dv.id_dich_vu =hd.id_dich_vu
join nhan_vien nv on nv.id_nhan_vien =hd.id_nhan_vien
join dich_vu_di_kem dvdk on dvdk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
where (year(hd.ngay_lam_hop_dong) in ('2019') and month(hd.ngay_lam_hop_dong) in ('10','11','12'))
and kh.id_khach_hang not in (
select kh.id_khach_hang 
from khach_hang kh 
join hop_dong hk on hd.id_khach_hang = kh.id_khach_hang
where year(hd.ngay_lam_hop_dong) in ('2019') and month(hd.ngay_lam_hop_dong)in ('01','02','03','04','05','06'));
-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
create temporary table `max`(
select dvdk.id_dich_vu_di_kem,dvdk.ten,dvdk.gia,dvdk.don_vi,dvdk.trang_thai,count(hdct.id_dich_vu_di_kem) as 'số_lượng'
from dich_vu_di_kem dvdk 
join hop_dong_chi_tiet hdct on hdct.id_dich_vu_di_kem=dvdk.id_dich_vu_di_kem
group by hdct.id_dich_vu_di_kem
);
select dvdk.id_dich_vu_di_kem,dvdk.ten,dvdk.gia,dvdk.don_vi,dvdk.trang_thai,count(hdct.id_dich_vu_di_kem) as 'số lượng sử dụng nhiều nhất'
from dich_vu_di_kem dvdk 
join hop_dong_chi_tiet hdct on hdct.id_dich_vu_di_kem=dvdk.id_dich_vu_di_kem
group by hdct.id_dich_vu_di_kem
having count(hdct.id_dich_vu_di_kem) =(select  max(số_lượng) 
from `max`);
 drop  table `max`;
-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
-- Thông tin hiển thị bao gồm IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung.
select hd.id_hop_dong , ldv.ten_loai_dich_vu,dvdk.ten,count(hdct.id_dich_vu_di_kem)
from  dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on hdct.id_dich_vu_di_kem=dvdk.id_dich_vu_di_kem
join hop_dong hd on hdct.id_hop_dong = hd.id_hop_dong
join dich_vu dv on dv.id_dich_vu=hd.id_dich_vu
join loai_dich_vu ldv on ldv.id_loai_dich_vu = dv.id_loai_dich_vu
group by  ldv.ten_loai_dich_vu;

