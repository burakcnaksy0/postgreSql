-- between örnek

select * 
from staff

-- who was working in the office on '2022-05-01'

select *
from staff
where '2022-05-01' between hire_date and departure_date