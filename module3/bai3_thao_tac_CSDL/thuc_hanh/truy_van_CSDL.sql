use quan_ly_sinh_vien;
-- hiển thị tất cả danh sách sinh viên 
SELECT *
FROM Student;
-- hiển thị tất cả sinh viên đang học
SELECT *
FROM student
WHERE status_student = true;
-- hiển thị  danh sách các môn học có thời gian học nhỏ hơn 10:
 SELECT *
FROM subject_
WHERE credit < 10;
--  hiển thị danh sách học viên lớp A1
SELECT S.student_id, S.student_name, C.class_name
FROM student S 
join class C on S.class_id = C.class_id
WHERE C.class_name = 'A1';
--  Hiển thị điểm môn CF của các học viên
SELECT class_id, student_name,subject_.sub_name,mark.mark
FROM student  
join mark  on student.student_id = mark.student_id 
join subject_  on mark.sub_id = subject_.sub_id
WHERE subject_.sub_name = 'CF';