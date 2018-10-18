create table Atm(
    userid varchar2(32) primary key,
    username varchar2(32) not null,
    userpsd varchar2(32) not null,
    atmmoney number not null
    
);
drop table Atm
insert into Atm values(1,123456,123456,4000.23);
insert into Atm values(2,111222,123456,1100.11);
insert into Atm values(3,222333,123456,2200.22);
insert into Atm values(4,333444,123456,3300.33);
insert into Atm values(5,444555,123456,4400.44);
select *from Atm
com.iss.demo.Menu

select username,userpsd from Atm where username =123456 and userpsd = 123456;
