select sum(return_date - rental_date) 
from rental

select rental_date , return_date , return_date::date - rental_date::date as duration
from rental

select sum(return_date::date - rental_date::date) as duration
from rental

select count(amount) as amount_count
from payment
where amount is null

select count(distinct rating)
from film

select 
	count(*) as all_rows,
	count(postal_code) as pcİsnotnull,
	count(distinct district) as differentDistrict
from address


select *
from payment

select
	(select first_name || ' ' || last_name from customer as c where c.customer_id = p.customer_id) as cust_name_surname,
	sum(amount) ,
	count(*)
from payment as p 
group by customer_id
order by customer_id

select rating ,
	sum(rental_duration) as sum_rent_duration,
	sum(length) as sum_length,
	sum(replacement_cost) as sum_replac_cost,
	count(*) as count_film
from film
group by rating
order by rating asc


-- write a query that finds the number of rentals , first rental dates , and last rental dates for each customers

select *
from rental

select *
from customer

select (select first_name || ' ' || last_name 
		from customer as c 
		where c.customer_id = r.customer_id
		) as customer_name,
	count(*) as rental_count,
	min(rental_date) :: date as first_rental_date,
	max(rental_date) :: date as last_rental_date
from rental as r 
group by customer_id

-----------------------------------------------
-- customer with amount greater than 150$

select (select first_name || ' ' || last_name 
		from customer as c 
		where c.customer_id = p.customer_id
		) as customer_name,
	   sum(amount) as sum_amount
from payment as p
group by customer_name
having sum(amount) > 150
	   
-----------------------------------------------
-- write a query that returns a list of customers who have rented more than 35 films.

select *
from rental
select *
from staff

select (select first_name || ' ' || last_name 
		from customer as c 
		where c.customer_id = r.customer_id
		) as customer_name,
	   count(*) as rent_film
from rental as r
group by customer_id
having count(*) > 35

select (select first_name || ' ' || last_name 
		from customer as c 
		where c.customer_id = r.customer_id
		) as customer_name,
		(select first_name || ' ' || last_name
		 from staff as s 
		 where s.staff_id = r.staff_id
		) as staff_name,
	   count(*) as rent_film
from rental as r
group by customer_name , staff_name
having count(*) > 20






































