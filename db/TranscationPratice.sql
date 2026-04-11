create table user(
    id int primary key auto_increment comment 'userId',
    name varchar(20) comment 'name',
    balance int comment '余额'
);
insert into user (name, balance) VALUES (  '张三',2000   ),('李四',2000);
update from user