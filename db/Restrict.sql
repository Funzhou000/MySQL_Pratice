#创建表
create table  user_restrict(
    id int primary key auto_increment comment '主键',
    name varchar(20) not null comment '姓名',
    age int  check ( age<120 and age >=0 ) comment '年龄',
    gender varchar(10) not null comment '性别',
    status char(1) default '1' comment '状态，1正常，0禁用',
    depth_id int, foreign key (depth_id) references t1(id) on delete set null on update cascade
    );
insert into user_restrict( name, age, gender, status, depth_id) values
('张三',20,'男','1',1),
('李四',30,'女','1',2),
('王五',40,'男','0',3);
update  user_restrict t set t.age=15 where t.id =1;
