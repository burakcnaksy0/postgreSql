select * 
from customer

select first_name,email 
from customer

select 8*5+4,   -- postgresql de from olmadan da sorgu yazabiliriz.
		120/4,
		current_date-2;

select title,
	length/60,
	2024 - release_year
from film

select customer_id || ': ' || first_name || ' ' || last_name   -- bu işlem kolonları birleştirmek için kullanılır.
from customer












