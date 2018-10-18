--输入教师编号,查询该教师的教师姓名
select *from teacher;
create or replace procedure searchTea(pid in varchar2,pname out varchar2)
is 
begin
  select t.t_name into pname from teacher t where t.t_id=pid;
end;
/

declare
 v_name teacher.t_name%type;
begin
 searchTea('060001',v_name);
 dbms_output.put_line(v_name);
end;


--创建一个无参数的存储过程，输出当前系统的时间。
select sysdate from dual;
create or replace procedure printSystTime
is
begin
 dbms_output.put_line(to_char(sysdate,'yyyy-mm-dd'));
end;


begin
 printSystTime();
end;


--创建一个带输入参数的存储过程，将指定编号的教师的职称晋升一级。

update teacher set t.t_titleid=t.t_titleid+1 where t.t_id='';
commit;

create or replace procedure upTeacher(pid in char)
is
begin
 update teacher t set t.t_titleid=t.t_titleid+1 where t.t_id='';
 commit;
end;

begin
  upTeacher('060001');
end;

--创建一个带输入和输出参数的存储过程，根据给定的教师号返回教师的姓名和研究方向。
select t.t_name,t.t_research from teacher t where t.t_id='060001';

create or replace procedure serchTeacher2(pid in char,pname out varchar2,preach out varchar2)
is
begin
select t.t_name,t.t_research into pname,preach from teacher t where t.t_id=pid;
end;

--测试
declare
 v_name teacher.t_name%type;
 v_reach teacher.t_research%type;
 v_id char(6) :='060001';
begin
  serchTeacher2(v_id,v_name,v_reach);
  dbms_output.put_line('姓名：'||v_name);
  dbms_output.put_line('研究方向：'||v_reach);
end;


--创建一个带输入输出参数的存储过程，将期末成绩以70%计算，并返回。
create or replace procedure myCalc(pscore in out number)
is
begin
  pscore :=pscore*0.7;
end;

declare
  v_score number;
begin
  v_score :=90;
  
  myCalc(v_score);
  dbms_output.put_line(v_score);
end;

--删除存储过程out_date。
drop procedure printSystTime;

--查看存储过程query_tea的参数信息。
--以下语句不属于sql语句是Oracle命令语句，因此不能再SQL窗口中运行
--desc searchteacher2;

--
begin
  select *from teacher t where t.t_id=&tid;
end;











