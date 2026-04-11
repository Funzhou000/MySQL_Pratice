#生成employee表 department表 Rang_of_Salary_by_grade表
create table department(
                           id int primary key auto_increment comment '主键',
                           name varchar(20) not null comment '部门名称'
);
create table employee(
    id int primary key auto_increment comment '主键',
    name varchar(20) not null comment '员工姓名',
    age int not null comment '员工年龄',
    salary int not null comment '员工薪资',
    entrydate date not null comment '入职日期',
    manageid int not null comment '领导 id',
    depth_id  int  ,
    foreign key (depth_id) references department(id)
        on delete set null
        on update cascade
);


create table Rang_of_Salary_by_grade(
    grade varchar(20) not null comment '等级',
    min_salary int not null comment '最低薪资',
    max_salary int not null comment '最高薪资'
);

#初始化department表数据
insert into department (name) values
    ('研发部'),
    ('销售部'),
    ('财务部'),
    ('人事部'),
    ('总经办');

#初始化employee表数据
insert into employee (name, age, salary, entrydate, manageid, depth_id) values
    ('金庸', 66, 20000, '2000-01-01', 0, 5),
    ('张无忌', 20, 8000, '2005-09-01', 1, 1),
    ('杨逍', 33, 11000, '2001-11-03', 1, 1),
    ('韦一笑', 38, 9000, '2002-12-05', 1, 1),
    ('常遇春', 43, 8500, '2004-09-07', 1, 1),
    ('小昭', 19, 4500, '2004-10-12', 2, 1),
    ('灭绝', 60, 12000, '2001-04-12', 1, 2),
    ('周芷若', 25, 6000, '2020-01-01', 7, 2),
    ('丁敏君', 28, 5500, '2020-11-05', 7, 2),
    ('赵敏', 22, 11000, '2002-09-06', 1, 3),
    ('鹿杖客', 56, 9500, '2006-07-06', 10, 3),
    ('鹤笔翁', 55, 9500, '2006-07-06', 10, 3),
    ('方东白', 45, 8000, '2006-12-06', 10, 3),
    ('张三丰', 80, 15000, '2000-01-01', 0, 4),
    ('俞莲舟', 50, 10000, '2001-12-01', 14, 4),
    ('宋远桥', 52, 10000, '2001-08-01', 14, 4),
    ('陈友谅', 35, 7500, '2001-05-01', 1, null);

#初始化Rang_of_Salary_by_grade表数据
insert into Rang_of_Salary_by_grade (grade, min_salary, max_salary) values
    ('初级', 0, 5000),
    ('中级', 5001, 10000),
    ('高级', 10001, 15000),
    ('特级', 15001, 25000);

#查询员工姓名、部门名称
select e.name,d.name from department d,employee e where d.id=e.depth_id;
#显式内连接查询员工姓名、部门名称
select e.name,d.name from employee e join department d on e.depth_id=d.id;
#查询有员工的部门
select distinct d.name from department d,employee e where d.id=e.depth_id;
#查询员工的部门名称，如果没有部门则显示为null，外连接
select e.name,d.name from employee e left join department d on e.depth_id=d.id;
#查询员工对应的薪资等级
select e.name,r.grade from employee e , Rang_of_Salary_by_grade r where e.salary>=r.min_salary and e.salary<=r.max_salary;
#查询所有研发部员工的信息和薪资登记
select  e.name,r.grade,d.name from employee e ,department d ,Rang_of_Salary_by_grade r where (e.salary between r.min_salary and r.max_salary)AND (e.depth_id=d.id) AND d.name='研发部';
#查询研发部的平均工资
select avg(e.salary) from employee e , department d where e.depth_id=d.id and d.name='研发部';
#查询比灭绝薪资低的员工信息
select * from employee e where e.salary<=(select salary from employee where name='灭绝') and e.name!='灭绝';
#查询比平均薪资高的员工信息
select avg(employee.salary)  from employee;
select *,(SELECT AVG(salary) FROM employee) AS global_avg_salary from employee e where e.salary>=(select avg(employee.salary)  from employee);
#查询每个部门都有多少人
select count(*) from employee where employee.depth_id=2;
# select distinct d.name,(select count(*) from employee where employee.depth_id=d.id)as 'number' from department d left join employee e  on e.depth_id = d.id
select d.name,(select count(*) from employee where employee.depth_id=d.id)as'number' from department d;

#初始化student表数据
insert into student (id, name, no) values
    (1, '张三', '2000100101'),
    (2, '李四', '2000100102'),
    (3, '王五', '2000100103'),
    (4, '赵六', '2000100104');

#初始化course表数据
insert into course (id, name) values
    (1, 'Java'),
    (2, 'PHP'),
    (3, 'MySQL'),
    (4, 'Hadoop');

#初始化student_course表数据
insert into student_course (id, studentid, courseid) values
    (1, 1, 1),
    (2, 1, 2),
    (3, 1, 3),
    (4, 2, 2),
    (5, 2, 3),
    (6, 3, 4);
#查询所有学生的学号姓名，选课
select course.name,student.name,student.id from course,student,student_course where course.id=student_course.courseid and student.id = student_course.studentid ;