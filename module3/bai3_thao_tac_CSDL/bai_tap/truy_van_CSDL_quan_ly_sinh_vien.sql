use quan_ly_sinh_vien;
--  Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select *
from student
where student_name like "h%";
--  Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select *
from class 
where month (startDate)="12";
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select *
from subject_ 
where    (credit>=3) and (credit <=5);
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
-- SET SQL_SAFE_UPDATES = 0;
update student
set class_id =2
where student_name='Hung';
-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần.
--  nếu trùng sắp theo tên tăng dần.
select s.student_name,sub.sub_name,m.mark
from student s
join mark m on m.student_id=s.student_id
join subject_ sub on sub.sub_id=m.sub_id
order by m.mark desc ,m.mark asc ;