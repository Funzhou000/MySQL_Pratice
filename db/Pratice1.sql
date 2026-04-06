
select * from t1;
insert into t1 values ('6', '赵王流', 23, '男', '2020-04-9');
insert into t1 values ('7', '赵把流', 56, '男', '2020-05-9');
insert into t1 values ('8', '把流', 35, '男', '2026-05-9');

# 查询年龄为 20，21，22，23  的员工
select * from t1 where age in (20, 21, 22, 23);
#查询性别为男，并且年龄在 20-40（含）的姓名为 3 个字的员工
select * from t1 where gender='男'and age between 20 and 40 and names like '___';
#age小于 60 的员工的男性和女性的人数
select gender, count(*) as num from t1 where age < 60 group by gender;
#age<=35 的员工的姓名和年龄，并对查询结果按照年龄升序排序，如果年龄相同，则按照姓名降序排序
select names,age from t1 where age <= 35 order by age asc, names desc;
#且年龄在[20,40]的前五个员工星系，对查询的结果按照年龄升序，如果年龄相同，则按照入职时间降序排序
select * from t1 where  age between 20 and 40 order by age asc, entrydate desc limit 0,5;

