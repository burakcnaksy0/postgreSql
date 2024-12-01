-- where operatörünün kullanımı

select * 
from actor
where first_name = 'Penelope'

select *
from customer
where store_id =1

select *
from film
where length >= 100
order by length asc

select *
from payment
where staff_id <> 2	    -- staff_id değerleri 2 den farklı olanlar.


-- logical operators (and , or , not)

select * 
from film
where length >100 
	and rental_rate < 4

select *
from address
where district = 'Adana'
	and city_id = 5

select *     -- seçilen kolonlardan ikisinde biri ya da ikisi de şartlı sağlar.
from payment
where staff_id = 2
	or amount > 5

-- between operators

select *     -- verilen sınırlarda listede gözükür. (<= , >=)
from film  
where length between 100 and 120

select *     -- 835
from film  
where not (length between 100 and 120)

select * 
from film
where length < 100 or length > 120


-- ın operators

select first_name , last_name
from customer
where first_name in ('Leslie','Kelly','Tracy')

select * 
from film
where rating in ('R','G')

select *
from address
where district in ('Alberta','Adana','Tokat')

select *
from customer
where address_id in ('7','5','32')


-- like operators

select first_name , last_name
from customer
where first_name like 'Ann%'

select *
from customer 
where first_name like 'B%'

select * 
from film
where title like '%r'
order by replacement_cost


select * 
from film
where title like '%r%'

select * 
from film
where title like '%u_'

select * 
from film
where title like '%a%v%'

select * 
from film
where title like '%A%v%'

-- like example -> find the list of customers whose 3 characters after the first character are 'her'
							-- for example S(her)ry T(her)esa
select *
from customer
where first_name like '_her%' 


-- not operators

select *
from customer
where address_id not in ('7','5','32')

select title ,rating ,length
from film as f
where not f.rating = 'G' and not f.length <100

select *
from actor
order by first_name , last_name
limit 5


select film_id , title 
from film
order by film_id
limit 10 offset 5


















