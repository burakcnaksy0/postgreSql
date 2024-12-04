-- min- max exercises
-- (finding the minimum , maximum and average number of letters of the names and surnames of the employees)

select * from employees

select 
	 min(length(first_name)) as minfirst_name ,
	 max(length(first_name)) as maxfirst_name ,
	 min(length(last_name)) as minlast_name ,
	 max(length(last_name)) as maxlast_name ,
	 ROUND(avg(length(first_name)) , 2) as avgfirst_name ,
	 ROUND(avg(length(last_name)) , 2) as avglast_name
from employees


select 
	(select job_title from jobs as j where j.job_id = e.job_id),
	count(*) as count_job,
	max(salary) as max_salary,
	min(salary) as min_salary
from employees as e 
group by job_id
order by job_id


select *
from departments

select 
	manager_id , (select department_name
				  from departments d 
				  where d.department_id = e.department_id
				 ) as dept_name,
	count(*) as countEmploy
from employees as e 
group by manager_id , dept_name
order by manager_id

-- how do we find departments with more than 5 employees

select *
from departments

select (select department_name 
		from departments as d 
		where d.department_id = e.department_id
		) as dept_name,
		count(*) as employees_count
from employees as e
group by dept_name
having count(*) > 5
















