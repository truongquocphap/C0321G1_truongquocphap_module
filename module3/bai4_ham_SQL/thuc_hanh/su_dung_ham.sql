use quan_ly_sinh_vien;
-- Sử dụng hàm count để hiển thị số lượng sinh viên ở từng nơi
select student_dia_chi ,count(student_id) as "so luong sinh vien"
from student 
group by student_dia_chi;
-- Tính điểm trung bình các môn học của mỗi học viên bằng cách sử dụng hàm AVG
select s.student_id,s.student_name,avg(mark) as 'diem trung binh'
from student s 
join mark m on s.student_id =m.student_id
group by s.student_id;
-- Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 9
-- Đầu tiên hiển thị điểm trung bình các môn học của mỗi học viên
select s.student_id,s.student_name,avg(mark) as 'diem trung binh'
from student s 
join mark m on s.student_id =m.student_id
group by s.student_id;
-- Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 9
 select s.student_id,s.student_name,avg(mark) as 'diem trung binh'
from student s 
join mark m on s.student_id =m.student_id
group by s.student_id
having avg(mark)>9;
-- Hiển thị thông tin các học viên có điểm trung bình lớn nhất.
select s.student_id,s.student_name,avg(mark) as 'diem trung binh'
from student s 
join mark m on s.student_id =m.student_id
group by s.student_id
having avg(mark)= all (select avg(mark)
 from mark 
 group by mark.student_id);