select 
	title , review
from movies as m
full outer join movie_reviews as mov
	on m.movie_id = mov.movie_id
order by title

-----

select 
	fruit_a, fruit_b
from basket_a as a
full outer join basket_b as b
	on fruit_a= fruit_b