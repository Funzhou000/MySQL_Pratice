# 多表关系 1 对多 多对多 1对 1
# 1对多
#部门与员工
create table department(
    id int primary key auto_increment comment '主键',
    name varchar(20) not null comment '部门名称'
);
create table employee(
    id int primary key auto_increment comment '主键',
    name varchar(20) not null comment '员工姓名',
    age int not null comment '员工年龄',
    depth_id  int unique ,
    foreign key (depth_id) references department(id)
        on delete set null
        on update cascade
);
insert into department(name) values ('人事部'),('财务部'),('技术部');
insert into employee(name, age, depth_id) values
('张三',20,1),
('李四',30,2),
('王五',40,3),
('赵六',50,null);
#多对多eg:不同员工选择可以选择多个部门
#使用用中间表
create table transfer_table(
    id int primary key auto_increment comment '主键',
    employee_id int, foreign key (employee_id) references employee(id) on delete cascade on update cascade,
    department_id int, foreign key (department_id) references department(id) on delete cascade on update cascade
);
insert into transfer_table(employee_id, department_id) values
(1,1),
(1,2),
(2,1),
(3,2),
(4,2);

#一对一要求加入外键的一缸设置外键为唯一，可以用于合表

select * from employee,department where department.id=employee.depth_id;