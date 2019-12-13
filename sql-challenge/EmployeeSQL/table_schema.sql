drop table if exists departments
drop table if exists employees
drop table if exists dept_manager
drop table if exists salaries
drop table if exists titles
drop table if exists dept_emp


create table if not exists departments(
dept_no varchar primary key,
dept_name varchar not null
)

create table if not exists employees(
emp_no varchar primary key,
birth_date date not null,
first_name varchar not null,
last_name varchar not null,
gender varchar(10) not null check (gender in ('M','F','m','f')),
hire_date date not null	
)

create table if not exists dept_manager(
dept_no varchar not null,
foreign key(dept_no) references departments(dept_no),
emp_no varchar not null,
foreign key(emp_no) references employees(emp_no),
from_date date not null,
to_date date not null
)

create table if not exists salaries(
emp_no varchar not null,
foreign key(emp_no) references employees(emp_no),
salary bigint not null,
from_date date not null,
to_date date not null
)

create table if not exists titles(
emp_no varchar not null,
foreign key(emp_no) references employees(emp_no),
title varchar not null,
from_date date not null,
to_date date not null
)

create table if not exists dept_emp(
emp_no varchar not null,
foreign key(emp_no) references employees(emp_no),
dept_no varchar not null,
foreign key(dept_no) references departments(dept_no),
from_date date not null,
to_date date not null
)

select * from departments
select * from employees
select * from dept_manager
select * from salaries
select * from titles
select * from dept_emp


