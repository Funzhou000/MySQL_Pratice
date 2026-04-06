insert into t1 (id, names, age, gender, entrydate) VALUES ('1', '张三', 20, '男', '2020-01-01');
insert into t1 values ('2', '李四', 22, '男', '2020-02-01'),
('3', '王五', 21, '女', '2020-03-01'),
('4', '赵六', 23, '男', '2020-04-01'),
('5', '钱七', 24, '女', '2020-05-01');

update t1 set id = '6' where id = '1';
delete from t1 where id = '2';

update t1 set id='3'where id ='6';

