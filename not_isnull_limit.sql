-- not example (find employees whose salary is not between 4000 and 7000 but also whose job_id is different than 16 )

select *
from employees
where not (salary between 4000 and 7000)
	and not job_id = 16


-- isnull kullanımı

select *
from employees
where phone_number isnull

-- limit kullanımı 

select first_name , last_name , salary    -- en yüksek maaşlı çalışanı bulur.
from employees as e 
order by salary desc
limit 1








