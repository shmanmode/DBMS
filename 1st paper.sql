show databases;
use mydb76;
show tables;
select * from customers;
alter table customers add column date date;
update  customers set date='2201-12-08' where cnum = 2001;
update  customers set date= where cnum = 2004;
update  customers set salary = 32 where cnum = 2003;
update  customers set salary = 3205 where cnum = 2002;

update  customers set date='2256-02-08' where cnum = 2002;

update  customers set date='2201-12-08' where cnum = 2003;

update  customers set date='2201-02-08' where cnum = 2004;

update  customers set date='2201-05-07' where cnum = 2005;
update  customers set date='2201-04-17' where cnum = 2008;
update  customers set date='2000-03-07' where cnum = 2007;


set sql_safe_updates=0;
------------------------------------
paper
********************************************************
1.
	select salary from Customers where Cname = 'Liu';
    select * from customers where salary > (select salary from Customers where Cname = 'Grass');
    
    2.
    select left(Cname,3) from customers;
    
    3. 
    select distinct Rating,Cname  from customers;
    
    4.
        select * from customers order by salary desc limit 1,1;

5.
drop table City;

create table CITY(Cityid numeric(10) not null,Cityname varchar(100));
desc CITY;

6.

select Empname from table1 where in (select managername from table 2);
screenshort


7.
 select * from customers where salary = (select max(salary) from customers); 
 
 8. 
 select reverse(Cname) from customers;
 
 9
 select * from customers where salary is null; 
 
 
 10
 select Cname,month(date) from customers;
 
 
 11.
 
 
 
delimiter $$
	drop procedure if exists fibo$$
	create procedure fibo(IN no int)
		begin
            declare i int default 0 ;
			declare a int default 0 ;
            declare b int default 1;
			declare fibo int  default 0 ;
            
            declare Fibonacci varchar(152) default ' Fibonacci series is : ';
				while fibo<no
					do 
                    if i<1
                    then 
                    set Fibonacci = concat(Fibonacci, a,' ',b ,' ' );
                    end if;
					set fibo = a + b;
                    set a = b;
                    set b = fibo;
                    set i = i+1;
                    set Fibonacci = concat(Fibonacci,fibo,' ');
				end while;
                
			select Fibonacci;
		end$$
delimiter ; 

call fibo(8);


12.
  
  delimiter$$
  create procedure
  
  
  
  
  show databases;
use mydb76;

create table emp(eid int , ename varchar(30),deptid varchar(30),mgrid int);
desc emp
insert into emp values(1,'shubam',10, null);
insert into emp values(2,'ashish',30, 1);
insert into emp values(3,'gaurav',10, 2);


select * from emp;
update emp set where eid = 1; 

drop table emp;

-- delimiter $$
-- create trigger trig_emp after insert
-- on emp for each row
-- begin
-- insert into trig_logs values('a new row in emp table has been inserted');
-- end $$

create table trig_logs(logs varchar(200));
desc trig_logs;
select * from trig_logs;
insert into emp values(5,'kanchan',20,2);

select * from emp;


delimiter $$
create trigger trig_emp_update after update
on emp for each row
begin
insert into trig_logs values('a new row in emp table has been updated');
end $$


update emp set ename='krishna' where ename='shubham';
select * from trig_logs;

select * from emp;

 update emp set deptid=30 where deptid = 10;
 select * from trig_logs;
 
delimiter $$
create trigger trig_emp_delete after delete
on emp for each row
begin
insert into trig_logs values('a row in emp table has been deleted');
end $$

delete from trig_logs;
delete from emp where eid = 2;
select * from trig_logs;



insert 
-> fetch throug - NEW 

update 
OLD NEW

delete
OLD

drop trigger trig_emp_delete;
drop trigger trig_emp_insert;


delimiter $$
create trigger trig_emp_insert after insert
on emp for each row
begin
insert into trig_logs values(concat('you have inserted an employee with name ',NEW.ename));
end $$

insert into emp values(4,'madhava',10,1)  // in this way kit gone a work
NEW.eid = 4 NEW.enmae = madhva            // in this way kit gone a work

select * from emp;
insert into emp values(4,'madhavahahaah',10,1);
select * from trig_logs;
drop table trig_logs;
drop trigger trig_emp_insert;
insert into emp values(4,'hahah',10,1)


drop trigger trig_emp_update;
delete from trig_logs;


delimiter $$
create trigger trig_emp_update after update
on emp for each row
begin
insert into trig_logs values(concat('you have inserted an employee with name :',NEW.ename));
insert into trig_logs values(concat('you have removed an employee with name :', OLD.ename));
end $$

select * from emp;
update emp set ename = 'smallkid' where ename = 'gaurav';
select * from trig_logs;

drop trigger trig_emp_delete;

delimiter $$
create trigger trig_emp_delete after delete
on emp for each row
begin
insert into trig_logs values(concat('you have removed an employee with name :' , OLD.ename));
insert into trig_logs values(concat('you have removed an employee with name deptid :' , OLD.deptid));
insert into trig_logs values(concat('you have removed an employee with mgrid :' , OLD.mgrid));
end $$


delete from emp where eid = 2;
delete from trig_logs;
select * from trig_logs;

create table emp(eid int , ename varchar(30),deptid varchar(30),mgrid int);
desc emp

create table backup(eid int , ename varchar(30),deptid varchar(30),mgrid int);
desc backup;

delimiter $$
create trigger trig_emp_delete after delete
on emp for each row
begin
insert into backup values(OLD.eid,OLD.ename,OLD.deptid,OLD.mgrid);
end $$




create table insertBackup(eid int , ename varchar(30),deptid varchar(30),mgrid int);

drop trigger trig_emp_insert;
delimiter $$
create trigger trig_emp_insert after insert
on emp for each row
begin
insert into insertBackup values(NEW.eid,NEW.ename,NEW.deptid,NEW.mgrid);
end $$

delete from emp;
