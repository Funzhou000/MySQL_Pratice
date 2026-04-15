#分别使用 case 和 if 判断传入的月份对应的季度，并返回
create procedure  p1(in month int , out result varchar(20))
begin

    if month>=1 and month<=3 then
    set result:='firstSeason';
    elseif month>=4 and month<=6 then
        set  result ='SecondSeason';
    elseif month>=7 and month<=9 then
    set result='ThirdSeason';
    elseif month>=10 and month<=12 then
    set result= 'FourthSeason';
    else set result='wrongInput';
    end if;
  end;
select @result ;
call p1(3,@result);
select @result;
create procedure  p2(in month int , out result varchar(20))
begin
    case
        when month>=1 and month<=3 then
            set result:='firstSeason';
        when month>=4 and month<=6 then
           set result:='SecondSeason';
        when month>=7 and month<=9 then
           set result:='ThirdSeason';
        when month>=10 and month<=12 then
           set result:='FourthSeason';
        else set result='wrongInput';
#     if month>=1 and month<=3 then
#         set result:='firstSeason';
#     elseif month>=4 and month<=6 then
#         set  result ='SecondSeason';
#     elseif month>=7 and month<=9 then
#         set result='ThirdSeason';
#     elseif month>=10 and month<=12 then
#         set result= 'FourthSeason';
#     else set result='wrongInput';
#     end if;
    end case ;
end;


call p2(7,@result);
select @result;

#使用 while 累加练习
create procedure p3(in n int )
begin
    declare total int default 0;
    while n>0 do
        set total:=total+n;
        set n := n-1;
        end while;
    select total;
end;
call p3(100);
#loop 对 0-n 中的奇数进行累加
create procedure p4(in n int)
begin
    declare ttl int default 0;
    sum: loop
        if n<=0 then
            leave sum;
        end if;
        if n%2=1 then
            set n =n-1;
            iterate sum;
        end if;
        set ttl :=ttl+n;
        set n :=n-1;
    end loop sum;
    select ttl;
end;
call p4(100);



# create a procedure to extract the name and salary who are under N years old creat a table to save it

create procedure p5(in n int )
begin

    #declare two 变量去 fetch number from cursor
    declare u_Name varchar(100);
    declare u_salary int default 0;

    #声明光标变量提取 name and salary from table
    declare c_Name_salary cursor for select employee.name,employee.salary from employee where age<=n;
    #declare how to do when face error
    declare exit handler for not found close c_Name_salary;
    open  c_Name_salary;
    # create a table for the two 变量

    create  table if not exists Name_Salary (
        no int primary key  auto_increment,
        name varchar(100),
        salary int
    );

        while true do
        fetch c_Name_salary into u_Name,u_salary;
        insert into Name_Salary(name,salary)values(u_Name ,u_salary);
        end while;



end;
call p5(32);