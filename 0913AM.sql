--PL/SQL�﷨
--��һ�����飬��СPL/SQL����
begin
  null;
end;

--PL/SQL ���hello World!
--set serveroutput on; �ڱ������У���仰���Բ�д
begin
  --��仰���𵽵�����system.out.println("hello world!");
  dbms_output.put_line('Hello World!');
end;
/

--������PL/SQL����
declare
  --�������,ϰ���ϴ˴��ı������v��ͷ
  v_x integer;
  y int :=2;  
  v_res int;
begin
  v_x := 0;
  v_res := y/v_x;
exception 
  when others then
    dbms_output.put_line(SQLERRM);--sql error message
end;
/

--PL/SQL�е��߼��ж�
--if
/*
    if �жϱ��ʽ then
      ִ�б��ʽ
     elsif �жϱ��ʽ then
       ִ�б��ʽ
      else
        ִ�б��ʽ
      end if; 
      
      ִ�б��ʽҲ��������һ��if��
      
      ��ϰ��ͳ��student�����������������������60����ʾ���ѧУ��������࣬
      ����50����ʾ�����������У��������ʾ���ѧУ����̫ʢ

*/


declare
      v_total integer;
begin
  select count(*) into v_total from student  s where s.s_gender='��'; 
  
  if v_total >= 60 then
     dbms_output.put_line('���ѧУ���������'); 
  elsif v_total>=50 then
     dbms_output.put_line('���ѧУ��������������'); 
  else
     dbms_output.put_line('ѧУ����̫ʢ'); 
  end if;
  
exception
      when others then
        dbms_output.put_line(sqlerrm); 
end;
/

--ѭ��
--1.��ѭ��
/*
        loop
           ִ�б��ʽ
        end loop;

*/
declare
        v_count int :=0;
begin
       loop
        dbms_output.put_line(v_count);
        v_count := v_count+1;
        exit when v_count=10;--����д������while(����)
       end loop;
end;
/

declare
        v_count int :=0;
begin
       loop
        dbms_output.put_line(v_count);
        v_count := v_count+1;
        if v_count=10 then
          exit;------�����exit�� java�е�break;
        end if;
       end loop;
end;
/

select mod(9,2) from dual;

declare
        v_count int :=0;
begin
       loop
         v_count := v_count+1;
        if  mod(v_count,3)=0 then
          continue;--���Ա���ѭ��
        else
          dbms_output.put_line(v_count);
        end if;
        
        exit when v_count=10;--����д������while(����)
       end loop;
end;
/

--whileѭ��
/*
       while ���� loop
         ִ�б��ʽ
       end loop;
*/

declare 
       v_count int :=0;
begin
       while v_count<10 loop
         dbms_output.put_line(v_count);
         v_count:=v_count+1;
       end loop;
end;

--forѭ��
/*
       ����д��������1..10��ʾһ�����䷶Χ
       reverse��ʾ����������ؼ��ֿ�ѡ��
       
       for ���� in [Reverse] ���� loop
         ִ�б��ʽ
       end loop;       
*/
declare
       v_x int :=0;
begin
       for v_x in reverse 1..10 loop
         dbms_output.put_line(v_x);
       end loop;
end;
/

--�洢����
create or replace procedure �洢�������� (�����б� ����ֵ in,���ػ��ߴ���ֵ out )
is
--��������
begin
  
end;
--û��return

select * from userInfo;

create or replace procedure addUser(puerid in varchar2,pusername in varchar2)
is
begin
  insert into userInfo values (puerid,pusername);
end addUser;
/

create or replace procedure uLogin(puserid in varchar2,ppwd in varchar2,prow out int)
as
begin
  select count(*) into prow from userLogin u where u.userid=puserid and u.userpwd=ppwd;
end uLogin;
/

