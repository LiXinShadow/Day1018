--PL/SQL语法
--第一个语句块，最小PL/SQL语句块
begin
  null;
end;


--PL/SQL版的hello World！
--set serveroutput on;在编译器中这句话可以不写，sql命令窗口要写
begin
  --这句话所起到的作用system.out.println("hello world");
  dems_output.put_line("hello world!");
end;

--完整的PL/SQL语句块
declare
  --定义变量,习惯上此处的变量添加v开头
  v_x integer;
  y int :=2;
  v_res int;
begin
  v_x :=0;
  v_res :=y/v_x;
exception
 when others then
   dbms_output.put_line(SQLERRM);--sql error message
end;
/

--PL/SQL中的逻辑判断
--if
/*
   if 判断表达式，then
     执行表达式
     elsif 判断表达式 then
       执行表达式
      else
       执行表达式
      end if;
      
      执行表达式也可以是另一个if体
      
      练习：统计student表中男生的人数，如果大于60人显示这个学校的男生真多，大于50人显示男生人数还行，否则就显示这个学校阴气太盛
      

*/

declare
   v_total integer;
begin
  select count(*) into v_total from student s where s.s_gender='男';
  
  if v_total > 60then
    dbms_output.put_line('这个学校的男生真多');
  elsif v_total>=50 then
    dbms_output.put_line('这个学校男生人数还行');
  else
    dbms_output.put_line('学校阴气太盛');
  end if;
exception
   when others then
     dbms_output.put_line(sqlerrm);
end;
/

--循环
--1.简单循环
/*
     loop
       执行表达式
     end loop;
     
     
*/

declare
     v_count int :=0;
     
begin
    loop
     dbms_output.put_line(v_count);
     v_count :=v_count+1;
     exit when v_count=10;--这总写法，像while（条件）
     
    end loop;
  
end;
/

declare
     v_count int :=0;
     
begin
    loop
     dbms_output.put_line(v_count);
     v_count :=v_count+1;
     if v_count=10 then
       exit;--这里的exit像java中的break;
       end if;
     
    end loop;
  
end;
/

declare
     v_count int :=0;
     
begin
    loop
      v_count 
     dbms_output.put_line(v_count);
     v_count :=v_count+1;
     exit when v_count=10;--这总写法，像while（条件）
     
    end loop;
  
end;
/

--while循环
/*
    while 条件 loop
      end loop;
      
*/

declare
     v_count int :=0;
     
begin
   while v_count< loop
     dbms_output.put_line(v_count);
     v_count:=v_count+;
     
    end loop;
  
end;
/

--for 循环
/*
计数写法类似于1..10
or 条件 in[Reverse]计数 loop
*/



--存储过程
create or replace procedure 存储过程名称(参数列表 传入值 in,返回或者传出值 out)
is
--变量定义
begin
  
end;

--没有return

select *from userInfo;

create or replace procedure addUser(puerid varchar2,pusername in varchar2)
is
begin
  insert into userInfo values(puerid,pusername);
end addUser;
/
