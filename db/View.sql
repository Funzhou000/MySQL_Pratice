use test;
create or replace view student_course_view as select s.name studentName,c.name courseName from student s, student_course sc ,course c where s.id =sc.studentid and sc.courseid=c.id;
select * from student_course_view;