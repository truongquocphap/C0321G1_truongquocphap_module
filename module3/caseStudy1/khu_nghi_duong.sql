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
foreign key (id_vi_tri) references vi_tri(id_vi_tri)    ON DELETE CASCADE,
foreign key (id_trinh_do) references trinh_do(id_trinh_do)   ON DELETE CASCADE,
foreign key (id_bo_phan) references bo_phan(id_bo_phan)    ON DELETE CASCADE
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
foreign key (id_loai_khach) references loai_khach(id_loai_khach)    ON DELETE CASCADE
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
foreign key (id_kieu_thue) references kieu_thue(id_kieu_thue)    ON DELETE CASCADE,
foreign key (id_loai_dich_vu) references loai_dich_vu(id_loai_dich_vu)    ON DELETE CASCADE
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
foreign key (id_nhan_vien) references nhan_vien(id_nhan_vien)   ON DELETE CASCADE,
foreign key (id_khach_hang) references khach_hang(id_khach_hang)   ON DELETE CASCADE,
foreign key (id_dich_vu) references dich_vu(id_dich_vu)   ON DELETE CASCADE
);
create table hop_dong_chi_tiet(
id_hop_dong_chi_tiet int primary key,
id_hop_dong int,
id_dich_vu_di_kem int,
so_luong int default 0,
foreign key (id_dich_vu_di_kem) references dich_vu_di_kem(id_dich_vu_di_kem)   ON DELETE CASCADE,
foreign key (id_hop_dong) references hop_dong(id_hop_dong)   ON DELETE CASCADE
);
-- drop database khu_nghi_duong; 
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
(2,2,"Nguyễn Thi Mai Khanh","1987-11-30",11111111,1111222234,"1234@gmail.com","Quãng Trị"),
(3,3,"Nguyễn Thanh Khá","1789-11-30",11111111,1111222234,"1235@gmail.com","Quãng ngãi"),
(4,4,"Nguyễn Tuyết","2002-11-30",11111111,1111222234,"1236@gmail.com","Quãng Trị"),
(5,5,"Nguyễn Thi Mai","2009-11-30",11111111,1111222234,"1237@gmail.com","Đà nẵng");


insert into hop_dong
values (1,1,1,1,"2020-11-30","2020-12-31",1000,null),
(2,2,1,4,"2019-01-30","2020-12-31",1000,null),
(3,3,2,5,"2019-04-13","2020-01-31",1000,null),
(4,3,3,3,"2018-11-11","2020-01-31",1000,null),
(5,5,3,1,"2020-11-13","2020-12-31",1000,null);

insert into hop_dong_chi_tiet 
values (1,1,3,2),
(2,2,2,5),
(3,3,1,4),
(4,1,4,1),
(5,2,5,2),
(6,4,6,0),
(7,5,6,0);

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
-- Thông tin hiển thị bao gồm IDHopDong, TenLoaiDichVu, SoLanSuDung.
select hd.id_hop_dong , ldv.ten_loai_dich_vu,count(hdct.id_dich_vu_di_kem) as 'số lần'
from  dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on hdct.id_dich_vu_di_kem=dvdk.id_dich_vu_di_kem
join hop_dong hd on  hd.id_hop_dong=hdct.id_hop_dong 
join dich_vu dv on dv.id_dich_vu=hd.id_dich_vu
join loai_dich_vu ldv on ldv.id_loai_dich_vu = dv.id_loai_dich_vu
group by hd.id_hop_dong 
having count(hdct.id_dich_vu_di_kem)=1;
-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm IDNhanVien, HoTen, TrinhDo,
-- TenBoPhan, SoDienThoai, DiaChi mới chỉ lập được tối đa 3 hợp đồng từ năm 2018 đến 2019.
select nv.id_nhan_vien, nv.ho_ten,td.trinh_do,bp.ten_bo_phan,nv.SDT,nv.dia_chi, count(nv.id_nhan_vien) as 'so_lan'
from   nhan_vien nv
join hop_dong hd on hd.id_nhan_vien= nv.id_nhan_vien
join bo_phan bp on bp.id_bo_phan = nv.id_bo_phan
join trinh_do td on td.id_trinh_do = nv.id_trinh_do
where year(hd.ngay_lam_hop_dong) in ('2019','2018') 
group by nv.id_nhan_vien
having count(nv.id_nhan_vien)<=3;
-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017 đến năm 2019.
create temporary table id_nhan_vien(
select hd.id_nhan_vien from hop_dong hd 
where year(hd.ngay_lam_hop_dong)  in ('2017','2018','2019')
);
delete from nhan_vien 
where id_nhan_vien not in ( select id_nhan_vien from id_nhan_vien); ;
-- drop table id_nhan_vien;
-- 17.	Cập nhật thông tin những khách hàng có TenLoaiKhachHang từ  Thỉnh thoảng lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với tổng Tiền thanh toán trong năm 2019 là lớn hơn 10.000.000 VNĐ.
 create temporary table tong_tien( select  lk.id_loai_khach, sum(case when hdct.so_luong is null then 0 else hdct.so_luong*dvdk.gia end )  + dv.chi_phi_thue as 'tổng_tiền'
from khach_hang kh
left join hop_dong hd on hd.id_khach_hang = kh.id_khach_hang
left join loai_khach lk on lk.id_loai_khach = kh.id_loai_khach
left join dich_vu dv on dv.id_dich_vu = hd.id_dich_vu
left join hop_dong_chi_tiet hdct on hdct.id_hop_dong=hd.id_hop_dong
left join dich_vu_di_kem dvdk on dvdk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
where year(hd.ngay_lam_hop_dong) in ('2019') 
group by hd.id_hop_dong ,kh.id_khach_hang
 having tổng_tiền >=10000000 ); 
 drop table id_khach_hang;
update loai_khach 
set ten_loai_khach = 'Diamond'
where ten_loai_khach in ('Thỉnh thoảng') and id_loai_khach in  (select id_loai_khach
from tong_tien) ;
-- 18.	Xóa những khách hàng có hợp đồng trước năm 2016 (chú ý ràngbuộc giữa các bảng).
create temporary table id_khach_hang (select kh.id_khach_hang as id
from khach_hang kh
join hop_dong hd on hd.id_khach_hang=kh.id_khach_hang
where  year(hd.ngay_lam_hop_dong) <2016 );
delete from khach_hang
where id_khach_hang in (select id 
from id_khach_hang);
-- 19.	Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 lên gấp đôi.
create temporary table bang_tam(
 select dvdk.id_dich_vu_di_kem, sum(hdct.so_luong) as 'so_luong'
from dich_vu_di_kem dvdk 
join hop_dong_chi_tiet hdct on hdct.id_dich_vu_di_kem =dvdk.id_dich_vu_di_kem
join hop_dong hd on hd.id_hop_dong = hdct.id_hop_dong
join khach_hang kh on kh.id_khach_hang=hd.id_khach_hang
where year(hd.ngay_lam_hop_dong) in ('2019')
group by dvdk.id_dich_vu_di_kem
having so_luong >=10);
drop table bang_tam;
update dich_vu_di_kem
set gia = gia*2
where id_dich_vu_di_kem in (select id_dich_vu_di_kem
from bang_tam)
;
-- 20.	Hiển thị thông tin của tất cả các Nhân viên và Khách hàng có trong hệ thống, thông tin hiển thị bao gồm ID
-- (IDNhanVien, IDKhachHang), HoTen, Email, SoDienThoai, NgaySinh, DiaChi.
select id_khach_hang,ho_ten,email,SDT,ngay_sinh,dia_chi,'khach_hang' as `type`
from khach_hang 
union all 
select id_nhan_vien,ho_ten,email,SDT,ngay_sinh,dia_chi,'nhan_vien'
from nhan_vien;
-- 21.	Tạo khung nhìn có tên là V_NHANVIEN để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” 
-- và đã từng lập hợp đồng cho 1 hoặc nhiều Khách hàng bất kỳ  với ngày lập hợp đồng là “12/12/2019”
create view V_NHANVIEN as
select nv.*
from nhan_vien nv
 join hop_dong hd on hd.id_nhan_vien = nv.id_nhan_vien
 where hd.ngay_lam_hop_dong in ('2019-12-12') and nv.dia_chi in ('Hải Châu')
;
-- 22.	Thông qua khung nhìn V_NHANVIEN thực hiện cập nhật địa chỉ thành 
-- “Liên Chiểu” đối với tất cả các Nhân viên được nhìn thấy bởi khung nhìn này.
update V_NHANVIEN
set dia_chi='Liên Chiểu';
--  23.	Tạo Clustered Index có tên là IX_KHACHHANG trên bảng Khách hàng.
-- Giải thích lý do và thực hiện kiểm tra tính hiệu quả của việc sử dụng INDEX

-- lý do khi sử dụng index là lúc ta truy xuất dữ liệu lơn thì việc tạo index này rất hữu dụng
-- tại vì dựa vào index nó chỉ kiểm tra 1 lần trong tất cả dữ liệu có trong danh sách và sau đây là code để 
--  kiểm tra
-- khi chưa tạo index 
explain select * 
from khach_hang  
where ho_ten ='Nguyễn Thị Mai';
-- khi tạo index cho trường name
create unique index IX_KHACHHANG 
on khach_hang(ho_ten);
-- kiểm tra quá trình thực hiện
explain select * 
from khach_hang  
where ho_ten ='Nguyễn Thị Mai';
-- 24.	Tạo Non-Clustered Index có tên là IX_SoDT_DiaChi trên các cột SODIENTHOAI 
-- và DIACHI trên bảng KHACH HANG và kiểm tra tính hiệu quả tìm kiếm sau khi tạo Index.
create index IX_SoDT_DiaChi
on khach_hang(SDT,dia_chi);
-- hiệu quả sau khi tạo index
explain select *
from khach_hang
where SDT ='090000003';
explain select *
from khach_hang
where dia_chi ='Quang Tri';
-- 25.	Tạo Store procedure Sp_1 Dùng để xóa thông tin của một Khách hàng nào đó 
-- với Id Khách hàng được truyền vào như là 1 tham số của Sp_1
delimiter //
create procedure Sp_1( id_khach_hang_in int )
begin 
delete from khach_hang
where id_khach_hang = id_khach_hang_in;
end //
delimiter ;
call Sp_1(2);
-- 26.	Tạo Store procedure Sp_2 Dùng để thêm mới vào bảng HopDong với yêu cầu Sp_2
-- phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không được trùng khóa chính và
-- đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
delimiter //
create procedure Sp_2(id_hop_dong_in int , id_nhan_vien_in int, id_khach_hang_in int , id_dich_vu_in int , ngay_lam_hop_dong_in date, ngay_ket_thuc_in date, tien_dat_coc_in float , tong_tien_in float)
begin 
if id_hop_dong_in not in (select id_hop_dong from hop_dong) and
id_nhan_vien_in  in (select id_nhan_vien from nhan_vien) and
id_khach_hang_in  in (select id_khach_hang from khach_hang) and
id_dich_vu_in  in (select id_dich_vu from dich_vu)
then 
insert into hop_dong
values (id_hop_dong_in , id_nhan_vien_in, id_khach_hang_in , id_dich_vu_in , ngay_lam_hop_dong_in , ngay_ket_thuc_in , tien_dat_coc_in , tong_tien_in);
	else 
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Thêm không thành công";
        end if;
end //
delimiter ;
call Sp_2(8,3,3,5,'2020-10-21','2020-11-01',2000,null);
-- 27.	Tạo triggers có tên Tr_1 Xóa bản ghi trong bảng HopDong thì hiển thị tổng số lượng bản ghi còn lại có trong bảng HopDong ra giao diện console của database






