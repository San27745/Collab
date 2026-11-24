SELECT * FROM college.employee;
-- DML Commands-
-- insert command
insert into employee values (101,"sanika","kale",21,"HR"),(102,"sneha","malyal",20,"IT");
insert into empeloyee values(103,"sejal","mane",23,NULL);
insert into employee values(104,"bhumi","joshi",NULL,"South");
insert into employee values(105,"Amit","joshi",45,"East");
-- update command  
update employee set ezone="east" where eid=103;
update employee set age=30 where eid=104;
update employee set age=32,ezone="east" where eid=104;
update employee set ezone="south" where eid=104;
update employee set ezone="north" where eid=102;
update employee set ezone="west" where eid=101;
-- delete command 
delete from employee where eid=104;
delete from employee where eid=105;
desc employee;
select eid,firstname from employee;
-- truncate delete all the rows in the table
truncate employee;  
-- SQL constraints Primary key,Not NULL,Unique,Foreign key,check constraint
/*
Following constraints are commonly used in SQL
NOT NULL-Ensures that column cannot have a NULL value
UNIQUE - Ensures that all values in the column are unique
always  remember a table can have many unique constraint
PRIMARY KEY-a combinationn of not null and unique uniquelt identifies each row in table
FOREIGN KEY-prevents actions that would destriy links between tables
CHECK-ensures that the value in  a column satisfies a specific condition
*/ 
-- NOT NULL constraint
create database company_db;
use company_db;
show databases;
create table Employee(eid int Not NULL,firstname varchar(45),lastname varchar(45), age int, ezone varchar(45));
select * from Employee;
insert into Employee values(NULL,"Sanika","kale",23,"east");	-- it will show error because we have given NOT NULL
insert into Employee values(1,"Sanika","kale",23,"east");

-- unique key constraint
create table Employee1(eid int Not NULL,firstname varchar(45),lastname varchar(45), Unique(eid));
select * from Employee1;
-- insert into Employee1 values(NULL,"Sanika","kale");		-- id cannot be null error 
insert into Employee1 values(1,"Sanika","kale");
insert into Employee1 values(1,"sejal","Mane");		-- duplicate entry error for this
insert into Employee1 values(2,"sejal","Mane");	
desc Employee1;

-- check constraint
 create table Employee2(eid int Not NULL,firstname varchar(45),lastname varchar(45),age int check(age>20));
 select * from Employee2;
 -- insert into Employee2 values(1,"sanika","kale",17);	-- gives error because it check age >20 
  insert into Employee2 values(1,"sanika","kale",21);
 alter table Employee2  add column salary int;
 alter table Employee2  drop column salary;
 alter table Employee2 add column salary int,add check(salary>=5000);
insert into Employee2 values(2,"sejal","mate",21,4000); -- gives error because it check salary >5000
insert into Employee2 values(2,"sejal","mate",21,6000);
 desc Employee2;
 show create table Employee2;
 Alter table Employee2 drop check CONSTRAINT_1;
 
 -- NOT NULL check and primary key constraint
create table Employee3(eid int Not NULL,firstname varchar(45),lastname varchar(45),age int ,check(age>20),primary key(eid));
  select * from Employee3;
insert into Employee3 values(1,"sanika","kale",21);
insert into Employee3 values(1,"sanika","kale",21);  --  duplicate entry of id which is unique
insert into Employee3 values(2,"sanika","kale",21);
  
-- check constraint on multiple columns
create table Employee4(eid int primary key ,firstname varchar(45),lastname varchar(45),age int ,salary int);
-- insert into Employee4 values(1,"sanika","Kale", 20,3000);
select * from Employee4;
-- to allow naming and definin check constraint on multiple columns 
Alter table Employee4 add constraint chek_empAge_sal check(age>20 AND salary >=5000);
show create table Employee4;
 drop table Employee4;
 
 -- default  constarint set a default value for a column if no other value specified
 create table Employee5(eid int NOT NULL,firstname varchar(45),lastname varchar(45),dept varchar(45) Default 'Operation');
 desc Employee5;

-- Index 
select * from Employee;
create Index DemoIndex on Employee(firstname);
show index from Employee;

create Index DemoIndex2 on Employee(firstname,lastname);
drop index DemoIndex on Employee;
drop index DemoIndex2 on Employee;

-- Auto Increment
create table Persons(pid int NOT NULL auto_increment,
lastname varchar(255) NOT NULL,
firstname varchar(255),
age int,
primary key(pid));
select * from Persons;
desc Persons;
-- it automatically generate id using auto increment 
insert into Persons(lastname,firstname,age) values('kale','sanika',21),('gund','ashwini',22),('prathma','deshmane',23);

