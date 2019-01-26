show databases;
use mydb76;
show tables

select * from customers;
desc cus


2.
select concat('*****',cname,'******') from customers;

3.
select  Rating from customers group by Rating having count(Rating) = 3 ;

4.
 select Cname,date from customers where day(date) = 8 ;
 
 5.
 
 update  customers  set salary = 15000 where Cname group by Rating ;
 -- select rating from customers group by rating);
 
 
 select Rating from customers 
 
 select rating from customers group by Rating
 
 6.
 
  ////
 
 7.
 
select distinct rating from customers;


8.
 select Cname, concat( year(date), '-', month(date) )from customers;
 
 9.
 
 select salary from customers order by salary desc limit 1 and select salary from customers order by salary desc limit 1,2;
 
 11.
 
 select cname,max(salary) from customers;
 
 12.
 select right(cname,3) from customers;
 
 13.
 
 delimiter $$
 create procedure hahaha( IN stri varchar(123))
 -- declare str varchar default 0;
 begin
 select reverse(stri) ;
 end $$
 
 call hahaha('shubham')
 
 14.
 delimiter $$
 create procedure swap(in a int ,in b int )
 begin
declare temp int default 0;
 set temp = a;
 set a=b;
 set b=temp;
 select concat(a,' ' ,b);
 end $$
 
 
 call swap(5,8)
 
 
 15.
 
 
 select cname,salary from customers where salary>2;
 
 