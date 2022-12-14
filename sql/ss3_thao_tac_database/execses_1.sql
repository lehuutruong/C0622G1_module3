drop database if exists managament_student;
create database managament_student;
use managament_student;
CREATE TABLE class
(
    class_id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(60) NOT NULL,
    start_date DATETIME    NOT NULL,
    Status    BIT
);
CREATE TABLE student
(
    student_id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(30) NOT NULL,
    address     VARCHAR(50),
    phone       VARCHAR(20),
    Status      BIT,
    class_id     INT         NOT NULL,
    FOREIGN KEY (class_id) REFERENCES class (class_id)
);
CREATE TABLE subject
(
    sub_id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_name VARCHAR(30) NOT NULL,
    credit  TINYINT     NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),
    status  BIT                  DEFAULT 1
);
CREATE TABLE mark
(
    mark_id    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_id     INT NOT NULL,
    student_id INT NOT NULL,
    mark      FLOAT   DEFAULT 0 CHECK ( mark BETWEEN 0 AND 100),
    exam_times TINYINT DEFAULT 1,
    UNIQUE (sub_id, student_id),
    FOREIGN KEY (sub_id) REFERENCES Subject (sub_id),
    FOREIGN KEY (student_id) REFERENCES student (student_id)
);
INSERT INTO class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO class
VALUES (3, 'B3', current_date, 0);

INSERT INTO student (student_name, address, phone, status, class_id)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO student (student_name, address, status, class_id)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO student (student_name, address, phone, status, class_id)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
       INSERT INTO mark (sub_id, student_id, mark, exam_times)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
     --   Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
       select * from student where student_name like 'H%';
 --      Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
       select *from class where month(start_date)=12;
     --  Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
      select *from subject where credit >=3 and credit <=5;
  --     Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
      update student 
      set  class_id=2
      where student_name="Hung";
      set sql_safe_updates=0;
      select*from student;
    --   Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
      select s.mark_id,s.mark,s.exam_times, c.sub_name,d.student_id
      from mark s 
      join subject c on s.sub_id=c.sub_id
      join student d on s.sub_id=d.student_id
      order by mark desc,sub_name asc ;
	 SELECT *
FROM student;
SELECT *
FROM student
WHERE status = true;

SELECT *
FROM subject
WHERE credit < 10;

SELECT s.student_id, s.student_name, c.class_name
FROM student s join class c on s.class_id = c.class_id;

SELECT s.student_id, s.student_name, c.class_name
FROM student s join class c on s.class_id = c.class_id
WHERE c.class_name = 'A1';

SELECT s.student_id, s.student_name, sub.sub_name, m.mark
FROM student s join mark m on s.student_id = m.student_id join subject sub on m.sub_id = sub.sub_id;
SELECT s.student_id, s.student_name, sub.sub_name, m.mark
FROM student s join mark m on s.student_id = m.student_id join subject sub on m.sub_id = sub.sub_id
WHERE sub.sub_name = 'CF';

SELECT address, COUNT(student_id) as 'Số lượng học viên'
FROM student
GROUP BY address;

SELECT s.student_id, s.student_name, AVG(mark)
FROM student s join mark m on  s.student_id = m.student_id
GROUP BY s.student_id, s.student_name;

SELECT s.student_id, s.student_name, AVG(mark)
FROM student s join mark m on  s.student_id = m.student_id
GROUP BY s.student_id, s.student_name
HAVING AVG(mark) >= ALL (SELECT AVG(mark) FROM mark GROUP BY mark.student_id);

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select * from subject where credit = (select max(credit) from subject);
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select * from subject 
join mark on subject.sub_id = mark.sub_id
where mark.mark = (select max(mark) from mark);
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select student.*, avg (mark) as avarage_mark from student
join mark on student.student_id = mark.student_id
group by student.student_id 
order by avg(mark) desc;
