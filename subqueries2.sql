--2 films that have the same length as a film

select title , length
from film 
where length = (select length from film where title = 'Iron Moon')

--3 find the cities of japan using a subquery

select * 
from city 
where country_id = (select country_id from country where country = 'Japan')


