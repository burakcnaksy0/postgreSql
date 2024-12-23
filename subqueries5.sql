select first_name || '' || last_name as name,
		department_name
from employees as e 
inner join departments as d
	on e.department_id = d.department_id
order by name
-----------------------------------------------
select first_name || ' ' || last_name as name,
	(
		select department_name
		from departments as d
		where e.department_id = d.department_id
	) as dept,
	(
		select job_title
		from jobs as j
		where e.job_id = j.job_id
	) as job
from employees as e 
-----------------------------------------------
select
	(
		select department_name 
		from departments 
		where departments.department_id  =  employees.department_id
	) as dept_name, 
	  count(*) as emp_num
from employees 
group by department_id
having count(*) > 
		(
			select count(*) 
			from employees as e
			where e.department_id = (select department_id from departments as d where d.department_name = 'IT')
		)

-----------------------------------------------

select street_address , city , postal_code ,
		(
			select country_name
			from countries as c
			where c.country_id = l.country_id
		) as country
from locations as l

-----------------------------------------------

select first_name || ' ' || last_name as child_name,
		(
			select first_name || ' ' || last_name as parents_name
			from employees as e
			where d.employee_id = e.employee_id
		)
from dependents as d 

-----------------------------------------------

select first_name || ' ' || last_name as parents_name,
		(
			select first_name || ' ' || last_name as child_name
			from dependents as d
			where d.employee_id = e.employee_id
		)
from employees as e 

-----------------------------------------------

	
	select e.first_name || ' ' || e.last_name , dl.department_name , dl.city , dl.state_province
	from employees as e , 
			(
				select d.department_name ,d.department_id, l.city , l.state_province
				from departments as d , locations as l
				where d.location_id = l.location_id
			) as dl
	
	where e.department_id  = dl.department_id
-----------------------------------------------
SELECT 
    e.first_name || ' ' || e.last_name AS full_name,
    d.department_name,
    l.city,
    l.state_province
FROM employees AS e
INNER JOIN departments AS d ON e.department_id = d.department_id
INNER JOIN locations AS l ON d.location_id = l.location_id;
-----------------------------------------------
-- cocugu olan çalışanları listele ( IN operatoru kullanarak)
 
select employee_id , first_name || ' ' || last_name as childparents
from employees 
where employee_id in(
	select employee_id 
	from dependents
)
-- inner join kullanarak 
select e.employee_id , e.first_name || ' ' || e.last_name as childparents
from employees as e
inner join dependents as d
	on d.employee_id = e.employee_id

-----------------------------------------------
select first_name , last_name , salary
from employees 
where salary < any (
	select salary
	from employees 
	where job_id = (
		select job_id 
		from jobs
		where job_title = 'Programmer'
	)
)
-- any olmadan yaz 
SELECT first_name, last_name, salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
    WHERE job_id = (
        SELECT job_id
        FROM jobs
        WHERE job_title = 'Programmer'
    )
);
-- any olmadan yaz 
select first_name , last_name , salary
from employees 
where salary <  (
	select max(salary)
	from employees 
	where job_id = (
		select job_id 
		from jobs
		where job_title = 'Programmer'
	)
)
-----------------------------------------------
-- ALL op. usage
select first_name , last_name , salary
from employees
where salary > all (
	select salary 
	from employees
	where manager_id = 1
)
-- without ALL op.
select first_name , last_name , salary
from employees
where salary > (
	select max(salary) 
	from employees
	where manager_id = 1
)
-----------------------------------------------
select * 
from employees
where job_id in (
	select job_id 
	from jobs
	where lower(job_title) like '%manager%'
)
--exists op. usage
select * 
from employees as e 
where exists(
	select 1 
	from jobs as j
	where 1=1
	and e.job_id  = j.job_id
	and lower(job_title) like '%manager%'
)




