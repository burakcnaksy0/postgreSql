-- subqueries examples 

--1  employees with more than average salary.

select first_name , salary from employees
where salary > (select avg(salary) from employees)

select 
	first_name , last_name,
	(select department_name from departments d
	 where d.department_id = e.department_id
	) as dept_name,
	( 
		select job_title from jobs j where j.job_id = e.job_id
	) as job_name
from employees e

-- find the names of the children and their parents using a subquery. Show by combining the parent's name and surname.

select * from dependents

select 
	d.first_name , d.last_name ,
	(select e.first_name || ' ' || e.last_name from employees e
	 where d.employee_id = e.employee_id
	) parent_name
from dependents d 

select 
	d.first_name , d.last_name ,
	(select e.first_name || ' ' || e.last_name from dependents e
	 where d.employee_id = e.employee_id
	) child_name
from employees d 

-- IT bölümünden daha çok çalışanı olanı bölümler nelerdir? 

select * from departments
select * from employees

select 
	first_name ,
	( select department_name from departments d
	where d.department_id = e.department_id  
	) as dept_name 
from employees e

















