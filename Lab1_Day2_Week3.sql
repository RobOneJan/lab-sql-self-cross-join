#Get all pairs of actors that worked together.

select f.title,sub1.film_id, sub1.actor_id, sub2.actor_id
from film_actor as sub1
cross join film_actor as sub2
	on sub1.film_id = sub2.film_id
    and sub1.actor_id<> sub2.actor_id
join film as f
on f.film_id = sub1.film_id;




#Get all pairs of customers that have rented the same film more than 3 times.

    
	

select c1.customer_id as cus1,c2.customer_id as cus2,count(f1.title) as counts
from customer as c1
	join sakila.rental as r1 on c1.customer_id = r1.customer_id
	join sakila.inventory as i1 on r1.inventory_id=i1.inventory_id
	join sakila.film as f1 on i1.film_id=f1.film_id
    join sakila.inventory as i2 on i2.film_id=f1.film_id
    join sakila.rental as r2 on i2.inventory_id =r2.inventory_id
    join sakila.customer as c2 on r2.customer_id=c2.customer_id
    where c1.customer_id >c2.customer_id
	group by cus1,cus2
	Having counts>3
	order by counts desc;


#Get all possible pairs of actors and films.

select fa.actor_id,f.film_id
from film_actor as fa
cross join film as f

