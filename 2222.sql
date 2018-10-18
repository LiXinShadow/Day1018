--�û�
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
--����
create table sys_dep(
 depid varchar2(32) primary key,
 depname varchar2(32) not null,
 depcreatetime date not null
);

--��ɫ
create table sys_role(
 roleid varchar2(32) primary key,
 rolename varchar2(32) not null,
 rolereatetime date not null
);

--�˵�
create table sys_menu(
 menuid varchar2(32) primary key,--�˵�id
 menuname varchar2(32) not null,--�˵�������
 menuParentid varchar2(32) not null,--���ڵ�id
 menuUrl varchar2(1000) not null,--·��
 menulcon varchar2(1000) not null,--ͼ��
 menucreatetime date not null,--����ʱ��
 menuParam varchar2(1000) not null,--����
 menuisEnable int not null,--���Ʋ˵��Ƿ����
 menuBase int not null,--�˵���Ȩ�أ�����Խ�󣬲˵�Խ��ǰ
 menuisLeaf int not null,--�Ƿ�����Ӳ˵�����������0ʱ����ʾ������Ԫ�أ�1��ʾû��
 menuState int not null,--�߼�ɾ����������Ϊ0����ʾɾ��
 menuTarget1 varchar2(1000) not null,
 menuTarget1 varchar2(1000) not null,
 menuTarget1 varchar2(1000) not null,
);

--�û��Ͳ���
create tabele depAneUser(
 dauid varchar2(32) primary key,
 userid varchar2(32) not null,
 depid varchar2(32) not null
);

--�û��ͽ�ɫ
create table roleAndUser(
 rauid varchar2(32) primary key,
 userid varchar2(32) not null,
 roleid varchar2(32) not null
);

--���źͲ˵�
create depAndMneu(
 demid varchar2(32) primary key,
 depid varchar2(32) not null,
 menuid varchar2(32) not null
);

--��ɫ�Ͳ˵�
create table roleAndMenu(
 ramid varchar2(32) primary key,
 roleid varchar2(32) not null,
 menuid varchar2(32) not null
);


--���ȥ��ѯ�û���Ȩ��
--1.���û���¼������û���id
--2.���Ҹ��û����ڵĲ��ź���ӵ�еĽ�ɫ
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


--�û���͵�½��ֿ�
--�½��û�����β���һ���ԵĽ����ݲ��뵽��½��
--������
--ʲô�Ǵ�����������������ĳ����������ʱ���������ݿ��Զ�ִ�е�һ�δ��롣
--��ˣ�����������Ҫ��Ϊȥ����

--��������Ϊ���֣�
--1.�м�������
--2.��伶������
/*
create or replace trigger �������� �����¼� �����¼�
on ����
[foreach row]
begin
  pl/sql���
end;
����ʱ�䣺
1.before:�ڶ���֮ǰ
2.after���ڶ���֮��
�����¼���ָ��Щ���ݿ�Ķ����ᴥ��
insert
update 
delete

foreach row:���е��м�����������foreach row 

�ڴ������У�����������ʱ��
:new����һ����ʱ�����²�������ʱ��û�н����ύ������ʱ����ڣ�new�г���insert����һ����������Ҳ�ᱣ���ڣ�new���У�update
:old����һ����ʱ����ɾ������ʱ����ʱ�����old���У�����update����е�Ҫ�����ǵ�


*/
--�м�������
select *from student
delete from student where s_id='807010101';
create or replace trigger demo_3
 before delete 
 on student
 for each row
begin
 dbms_output.put_line('��ɾ��������:'||:old.s_name);
end;

--��伶������
create or replace trigger demo_3
before insert or update or delete
on teacher
begin
  if to_char(sysdate,'DY')='����һ' then
    RAISE_APPLICATION_ERROR(-20600,'����һ���ܶ�Teacher������޸�');
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

--�û��Զ��庯��function
/*
�﷨��ʽ
create or replace function ������(�����б� in)
return Oracle�������������� as 
�������
begin
  
end;
*/
--����:����ѧ�Ų�ѯѧ������
create or replace function getStuName(v_id in varchar2)
return varchar2 as
v_name varchar2(100);
begin
  select s.s_name into v_name from student s where s.s_id=v_id;
  return v_name;
end;


--ִ��getStuName����
select *from student;
select getStuName('807010101') from dual;


select u.text from user_source u where u.name=upper('getStuName');

--����һ�����������������Ĵ洢����
--���ݸ����Ľ�ʦ�ŷ��ؽ�ʦ���������Ա���о�����
create or replace function searchTech1(v_id in teacher.t_id)
return teacher.t_name%type;

is
v_name teacher.t_name%type;
begin
  select t.t_name;
end;

