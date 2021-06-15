use quan_ly_sinh_vien;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select * 
from subject_ 
where credit=(select max(credit) from subject_ );
-- Hiển thị các thông tin môn học có điểm thi lớn nhất. 
select  subject_.sub_id,subject_.sub_name,subject_.credit,subject_.status_,mark.mark
from subject_  
join mark on mark.sub_id =subject_.sub_id
where mark =(select max(mark) from mark );
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, 
-- xếp hạng theo thứ tự điểm giảm dần
select st.student_id,st.student_name,st.phone  ,avg(mark.mark) as "điểm trung bình"
from student st
join mark on mark.student_id=st.student_id
group by st.student_id 
order by avg(mark.mark) desc;


