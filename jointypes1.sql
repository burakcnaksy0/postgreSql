-- inner join usage
select 
	c.customer_id,
	first_name , last_name,
	amount , payment_date :: date
from customer as c 
inner join payment as p
	on c.customer_id = p.customer_id
order by p.payment_date

-- using usage -> iki tablodaki ortak kolonları baz alır.
select 
	customer_id,
	first_name , last_name,
	amount , payment_date :: date
from customer  
inner join payment using(customer_id)
order by payment_date

-- where li çözümü

select 
	c.customer_id,
	first_name , last_name,
	amount , payment_date :: date
from customer as c , payment as p 
where c.customer_id = p.customer_id	
order by p.payment_date


-- inner join örnek
-- write a query that joins the following 3 tables with the marked columns . ın the query , list the payment information
-- 	of customer number 341 and the information of the person receiving the payment as follows.

--1 
select 
	c.first_name , c.last_name,
	amount , 
	s.first_name , s.last_name
from customer as c 
inner join payment as p
	on c.customer_id = p.customer_id
inner join staff as s 
	on p.staff_id = s.staff_id
where c.customer_id = 341

--2

select 
	c.first_name , c.last_name,
	amount , 
	s.first_name , s.last_name
from customer as c , payment as p , staff as s 
where c.customer_id = p.customer_id 
	and p.staff_id = s.staff_id
 	and c.customer_id = 341

--3

select 
	c.first_name , c.last_name,
	amount , 
	s.first_name , s.last_name
from customer as c 
inner join payment as p using(customer_id)
inner join staff as s using(staff_id)
where c.customer_id = 341


-- left join usage 

select 
	f.film_id,
	title,
	inventory_id
from film as f
left join inventory as i
	on f.film_id = i.film_id
	--where inventory_id is null
order by title



































