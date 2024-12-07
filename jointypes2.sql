-- inner join örnek
-- write aq query that returns a list of employee names and department name.

select 
	first_name || ' ' || last_name as employ_name,
	department_name
from employees as e
inner join departments as d
	on e.department_id = d.department_id
order by employ_name

-- 2.çözüm

select 	
	first_name || ' ' || last_name as employ_name,
	department_name
from employees 
inner join departments using(department_id)
order by employ_name

-- 3.çözüm

select 	
	first_name || ' ' || last_name as employ_name,
	department_name
from employees as e , departments as d 
where e.department_id = d.department_id
order by employ_name


-- left join örnek

select 
	e.first_name,
	e.last_name,
	d.first_name as child_firstname,
	d.last_name as child_last_name
from employees as e 
left join dependents as d 
	on e.employee_id = d.employee_id
	-- where d.employee_id is null
	

-- right join  // herçocugun annesi babası vardır mantığından dolayı null değeri gelmez

select 
	e.first_name,
	e.last_name,
	d.first_name as child_firstname,
	d.last_name as child_last_name
from employees as e 
right join dependents as d 
	on e.employee_id = d.employee_id


-- natural join usage

select
	first_name || ' ' || last_name  as employee,
	d.department_name 
from employees as e
natural join departments as d 


















