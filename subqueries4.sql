select * 
from country

select *
from city as ct
where country_id = (select country_id from country where country = 'Japan' )

select city , country
from city as ct
inner join country as cy
	on ct.country_id = cy.country_id
where country = 'Japan'
--------------------------------------------------------
select customer_id , first_name || ' ' || last_name as fullname
from customer 
where address_id in (
	select address_id 
	from address
	where city_id in (
		select city_id
		from city
		where country_id = (
			select country_id 
			from country
			where country = 'Japan'
		)
	)
)
--------------------------------------------------------
select film_id , title , rating
from film
where film_id in (
	select film_id 
	from inventory as i
	inner join rental as r 
		on r.inventory_id = i.inventory_id
		where r.rental_date between '2005-05-25' and '2005-05-26' 
)
--------------------------------------------------------
select film_id , title , rating
from film as f 
where f.film_id in (
	select film_id 
	from inventory as i
	where i.inventory_id in (
		select inventory_id
		from rental as r
		where r.rental_date between '2005-05-25' and '2005-05-26' 
	)
		
)

--------------------------------------------------------

select film_id , title ,length
from film
where length < all (
	select round(avg(length),2)
	from film
	group by rating
)
order by 3 desc
--------------------------------------------------------
-- EXİST op usage
select first_name , last_name
from customer as c 
where exists (
	select 1
	from payment as p
	where c.customer_id = p.customer_id
)

-- without EXİST op

select first_name , last_name
from customer as c 
where customer_id in (
	select customer_id
	from payment as p
)






