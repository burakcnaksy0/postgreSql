-- order by kullanımı

select * 
from film 
order by title

select district, address , city_id 
from address
order by district

select first_name ,last_name , email , address_id
from customer
order by first_name desc

-- order by : birden fazla kolon

select rating , length , title , rental_rate
from film
order by rating, length desc

select first_name , last_name , email , address_id
from customer
order by first_name , last_name 










