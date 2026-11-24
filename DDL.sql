create database Institute;
USE Institute;
CREATE TABLE staff (
    staff_id INT,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    dob varchar(20),
    dept_id int
);

CREATE TABLE Department (
    dept_id INT,
    dept_name varchar(20),
    dept_location varchar(20)
   
);


desc staff;
desc department;


alter table staff add location varchar(20);
alter table staff add joinng_year int;
alter table staff add age int, add contact_no int(10);
alter table staff modify first_name text;
alter table staff drop column contact_no;
alter table staff modify last_name varchar(10);

alter table staff add primary key(staff_id);
alter table department add primary key(dept_id);

alter table staff drop primary key;

alter table staff add primary key(staff_id);

alter table staff add foreign key(dept_id) references department(dept_id);
alter table staff add constraint FK_Staff_department foreign key(dept_id) references department(dept_id);

alter table staff drop foreign key FK_Staff_department;

alter table staff rename staff1;
desc staff1;
alter table staff1 rename staff;