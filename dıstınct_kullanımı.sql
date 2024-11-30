-- distinct kullanımı

select special_features from film    -- kolandaki aynı olan değerleri tekrar etmeden gösterir. 

select DISTINCT special_features 
from film

select * from address

select DISTINCT district 
from address
order by district

select * from inventory

select distinct film_id , store_id 
from inventory
order by film_id










