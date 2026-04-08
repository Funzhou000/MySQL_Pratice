#StringFunction
#对员工编号修改，让员工编号有 4位，前面补0
select database();
update t1 set id = lpad(id, 4, '0');
#生成6位数随机验证码
select  lpad(round(rand()* 1000000,0),6,0);
#查询并排序每个员工的入职天数
select names, datediff(curdate(), entrydate) as days from t1 order by days desc;
#流程函数
select if(1, 'y', 'no');
select ifnull(null, 'y');
select database();

select names,
       case when id=3 then 'a'
            when id=2 then 'b'
            else 'c' end as type from t1;
select names,
       id,
       case age when 20 then 'a'
        when 30 then 'b'
        else 'c' end as type from t1;

