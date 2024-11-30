select * from customer

select first_name || ' ' || last_name as full_name   -- as :  kolon adını değiştirir.
from customer

select title,
	length as length_minute,
	round(length::decimal / 60 ,2) as lenght_hour,
	(2024 - release_year) as pass_year
from film

