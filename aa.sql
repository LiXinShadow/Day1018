--PL/SQL�﷨
--��һ�����飬��СPL/SQL����
begin
  null;
end;


--PL/SQL���hello World��
--set serveroutput on;�ڱ���������仰���Բ�д��sql�����Ҫд
begin
  --��仰���𵽵�����system.out.println("hello world");
  dems_output.put_line("hello world!");
end;

--������PL/SQL����
declare
  --�������,ϰ���ϴ˴��ı������v��ͷ
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

--PL/SQL�е��߼��ж�
--if
/*
   if �жϱ��ʽ��then
     ִ�б��ʽ
     elsif �жϱ��ʽ then
       ִ�б��ʽ
      else
       ִ�б��ʽ
      end if;
      
      ִ�б��ʽҲ��������һ��if��
      
      ��ϰ��ͳ��student�����������������������60����ʾ���ѧУ��������࣬����50����ʾ�����������У��������ʾ���ѧУ����̫ʢ
      

*/

declare
   v_total integer;
begin
  select count(*) into v_total from student s where s.s_gender='��';
  
  if v_total > 60then
    dbms_output.put_line('���ѧУ���������');
  elsif v_total>=50 then
    dbms_output.put_line('���ѧУ������������');
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
     v_count :=v_count+1;
     exit when v_count=10;--����д������while��������
     
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
       exit;--�����exit��java�е�break;
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
     exit when v_count=10;--����д������while��������
     
    end loop;
  
end;
/

--whileѭ��
/*
    while ���� loop
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

--for ѭ��
/*
����д��������1..10
or ���� in[Reverse]���� loop
*/



--�洢����
create or replace procedure �洢��������(�����б� ����ֵ in,���ػ��ߴ���ֵ out)
is
--��������
begin
  
end;

--û��return

select *from userInfo;

create or replace procedure addUser(puerid varchar2,pusername in varchar2)
is
begin
  insert into userInfo values(puerid,pusername);
end addUser;
/
