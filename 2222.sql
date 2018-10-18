--用户
create table sys_user(
 userid varchar2(32) primary key,
 username varchar2(maxvalue) not null,
 userdepid varchar2(32) not null
);

create table sys_login(
loginid varchar2(32) primary key,
userid varchar2(32) not null,
loginname varchar2(1000) not null,
loginpwd carchar2(30) not null
);
--部门
create table sys_dep(
 depid varchar2(32) primary key,
 depname varchar2(32) not null,
 depcreatetime date not null
);

--角色
create table sys_role(
 roleid varchar2(32) primary key,
 rolename varchar2(32) not null,
 rolereatetime date not null
);

--菜单
create table sys_menu(
 menuid varchar2(32) primary key,--菜单id
 menuname varchar2(32) not null,--菜单中文名
 menuParentid varchar2(32) not null,--父节点id
 menuUrl varchar2(1000) not null,--路径
 menulcon varchar2(1000) not null,--图标
 menucreatetime date not null,--创建时间
 menuParam varchar2(1000) not null,--参数
 menuisEnable int not null,--控制菜单是否可用
 menuBase int not null,--菜单的权重，数字越大，菜单越靠前
 menuisLeaf int not null,--是否存在子菜单，当数字是0时，表示还有子元素，1表示没有
 menuState int not null,--逻辑删除，当数字为0，表示删除
 menuTarget1 varchar2(1000) not null,
 menuTarget1 varchar2(1000) not null,
 menuTarget1 varchar2(1000) not null,
);

--用户和部门
create tabele depAneUser(
 dauid varchar2(32) primary key,
 userid varchar2(32) not null,
 depid varchar2(32) not null
);

--用户和角色
create table roleAndUser(
 rauid varchar2(32) primary key,
 userid varchar2(32) not null,
 roleid varchar2(32) not null
);

--部门和菜单
create depAndMneu(
 demid varchar2(32) primary key,
 depid varchar2(32) not null,
 menuid varchar2(32) not null
);

--角色和菜单
create table roleAndMenu(
 ramid varchar2(32) primary key,
 roleid varchar2(32) not null,
 menuid varchar2(32) not null
);


--如何去查询用户的权限
--1.从用户登录，获得用户的id
--2.查找该用户所在的部门和所拥有的角色
create or replace procedure getUserRight(pid in varchar2)
as
begin
select *from sys_menu where 
menuid in
(select menuid from depAndMenu where depid i
(select depid from roleAndUser where userid='')
union
select menuid form roleAndMenu where roleid in
(select orleid from roleAndUser where userid=''));
end;
/


--用户表和登陆表分开
--新建用户表，如何才能一次性的将数据插入到登陆表
--触发器
--什么是触发器：触发器就是某个条件成立时，，由数据库自动执行的一段代码。
--因此，触发器不需要人为去调用

--触发器分为俩种，
--1.行级触发器
--2.语句级触发器
/*
create or replace trigger 触发器名 触发事件 触发事件
on 表名
[foreach row]
begin
  pl/sql语句
end;
触发时间：
1.before:在动作之前
2.after：在动作之后
触发事件：指那些数据库的动作会触发
insert
update 
delete

foreach row:所有的行级触发器加上foreach row 

在触发器中，还有俩个临时表
:new表是一个临时表，当新插入数据时，没有进行提交数据临时存放在：new中除了insert还有一个操作数据也会保存在：new表中，update
:old表是一个临时表，当删除数据时，临时存放在old表中，还有update语句中的要被覆盖掉


*/
--行级触发器
select *from student
delete from student where s_id='807010101';
create or replace trigger demo_3
 before delete 
 on student
 for each row
begin
 dbms_output.put_line('被删除的人是:'||:old.s_name);
end;

--语句级触发器
create or replace trigger demo_3
before insert or update or delete
on teacher
begin
  if to_char(sysdate,'DY')='星期一' then
    RAISE_APPLICATION_ERROR(-20600,'星期一不能对Teacher表进行修改');
  end if;
end;

delete from teacher;



--
create or replace trigger addUser
 after insert
 on sys_user
 for each row
begin
 insert into sys_login values(sys_guid(),:new.userid,:username,:'111111')
 end;
select 




select * from teacher;
create or replace procedure pri
is
begin
 dbms_output.put_line(to_char(select min(teacher.t_graduatetime) from teacher,'yyyy-mm-dd'));
end;

begin
 pri();
end;


create or replace procedure sys_date1
is
begin
  dbms_output.put_line(to_char(sysdate,'yyyy-mm-dd'));
end;

begin
  sys_date1();
end;

--用户自定义函数function
/*
语法格式
create or replace function 函数名(参数列表 in)
return Oracle的内置数据类型 as 
定义变量
begin
  
end;
*/
--比如:根据学号查询学生姓名
create or replace function getStuName(v_id in varchar2)
return varchar2 as
v_name varchar2(100);
begin
  select s.s_name into v_name from student s where s.s_id=v_id;
  return v_name;
end;


--执行getStuName函数
select *from student;
select getStuName('807010101') from dual;


select u.text from user_source u where u.name=upper('getStuName');

--创建一个带输入和输出参数的存储函数
--根据给定的教师号返回教师的姓名、性别和研究方向。
create or replace function searchTech1(v_id in teacher.t_id)
return teacher.t_name%type;

is
v_name teacher.t_name%type;
begin
  select t.t_name;
end;

