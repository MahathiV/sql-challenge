--1 List the following details of each employee: employee number, last name, first name, gender, and salary.

select e.emp_no, e.last_name, e.first_name,e.gender, s.salary from employees as e  
left join salaries as s on
e.emp_no=s.emp_no


--where e.emp_no = '1'
--insert into salaries values
--('10012','60000','1987-06-27','1988-07-30')
--insert into salaries values
--('3','60000','1987-06-27','1988-07-30')
--insert into employees values
--('1','1954-09-03','x','y','M','1987-07-25')
--insert into employees values
--('2','1954-09-03','x','y','M','1987-07-25')

--select * from employees where emp_no = '1'
--select * from employees where emp_no = '2'
--select * from employees where emp_no = '10012'
--select * from salaries where emp_no = '10012'

------------------------------------------------------------------------------------
--2 List employees who were hired in 1986.

select * from employees
where extract(year from hire_date) = 1986

--(or)
select * from employees
where cast(employees.hire_date as varchar) like '1986%'

--(or)
select * from employees where 
hire_date >= '1986-01-01'
and
hire_date <= '1986-12-31'

--(or)
select * from employees
where date_trunc('year', employees.hire_date) = '1986-01-01'

--(or)
select * from employees
where hire_date between '1986-01-01' and '1986-12-31'

------------------------------------------------------------------------------------
--3 List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

select dept_no,emp_no,from_date,to_date from dept_manager
select dept_name from departments
select last_name,first_name from employees

--insert into departments values
--('1','x')

select d.dept_no, d.dept_name,m.emp_no as "Managers Employess",e.last_name,e.first_name,m.from_date as "Start Date",
m.to_date as "End Date" from dept_manager m
right join 
departments d
on d.dept_no=m.dept_no
left join
employees e
on m.emp_no = e.emp_no 
--------------------------------------------------------------------------------------------------

--4 List the department of each employee with the following information:
--employee number, last name, first name, and department name.


select d.dept_no,d.dept_name from departments d 
select e.emp_no,e.last_name,e.first_name from employees e 
select de.emp_no,de.dept_no from dept_emp de
select distinct(emp_no) from dept_emp

select e.emp_no,e.last_name,e.first_name,d.dept_name from employees e 
left join
dept_emp de
on 
e.emp_no = de.emp_no
left join departments d 
on de.dept_no = d.dept_no

--where e.emp_no = '1'
--where d.dept_no = '1'

-------------------------------------------------------------------------------------------------------------

--5 List all employees whose first name is "Hercules" and last names begin with "B."

select * from employees 
where (first_name = 'Hercules' or first_name = 'hercules')
and (last_name like 'B%' or last_name like 'b%')

------------------------------------------------------------------------------------------------------------------

--6 List all employees in the Sales department, including their employee number, last name, first name, and department name.

select d.dept_no,d.dept_name from departments d 
select e.emp_no,e.last_name,e.first_name from employees e 
select de.emp_no,de.dept_no from dept_emp de
select t.emp_no from titles t

select t.emp_no,e.last_name,e.first_name,d.dept_name from titles t 
left join 
dept_emp de
on 
de.emp_no = t.emp_no
right join 
departments d
on 
de.dept_no = d.dept_no
right join 
employees e
on e.emp_no = de.emp_no
where d.dept_name = 'Sales'

--where d.dept_name = 'x'
--where e.emp_no = '1'
--where t.emp_no = '100001'

--------------------------------------------------------------------------------------------------------------------

--7 List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

select t.emp_no,e.last_name,e.first_name,d.dept_name from titles t 
left join 
dept_emp de
on de.emp_no = t.emp_no
right join 
departments d
on 
de.dept_no = d.dept_no
right join 
employees e
on e.emp_no = de.emp_no
where d.dept_name = 'Sales' or d.dept_name = 'Development'

-------------------------------------------------------------------------------------------------------------------------

-- 8 In descending order, list the frequency count of employee last names,
--i.e., how many employees share each last name.

select last_name,count(last_name) as "Frequency_Count of last_names" from employees 
group by last_name
order by last_name desc

--order by "Frequency_Count of last_names" desc


--select * from employees
--where last_name = 'Zyda'

-----------------------------------------------------------------------------------------------------------------------------

--Evidence in hand, you march into your boss's office and present the visualization. 
--With a sly grin, your boss thanks you for your work. On your way out of the office, 
--you hear the words, "Search your ID number." 
--You look down at your badge to see that your employee ID number is 499942.

select * from employees where emp_no = '499942'



