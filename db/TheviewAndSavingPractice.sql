use test;
#创建查询修改删除视图
create or replace view firstView as select * from employee;
update employee set employee.name = 'employee'  where employee.id =1;
drop view if exists firstview;
