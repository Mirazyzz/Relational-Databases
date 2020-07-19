/* Show customers and film title who rented the same film more than 2 */

select c.first_name as "Customer", f.title as "Film", count(i.film_id) as "Number of rentals"
from public.customer c
inner join rental r on c.customer_id = r.customer_id
inner join inventory i on i.inventory_id = r.inventory_id
inner join film f on f.film_id = i.film_id
group by c.first_name, f.title
having count(f.film_id) > 1
order by c.first_name, f.title;


/* Show all films with titles sequence "TH" or "LL" */

select title as "Film"
from public.film
where title like '%th' or title like '%ll';


/* For each category show country with number of sales for that category */

select cat.name as Category, co.country as Country, count(r.rental_id) as "Number of rentals"
from category cat
inner join film_category fc on fc.category_id = cat.category_id
inner join film f on fc.film_id = f.film_id
inner join inventory i on f.film_id = i.film_id
inner join rental r on i.inventory_id = r.inventory_id
inner join customer c on r.customer_id = c.customer_id
inner join address a on c.address_id = a.address_id
inner join city ci on a.city_id = ci.city_id
inner join country co on ci.country_id = co.country_id
group by cat.name, co.country
order by co.country, count(r.rental_id) desc;


/* Find country where we have most of our sales */

select co.country as "Country", count(r.rental_id) as "Number of Customers"
from customer c
inner join rental r on r.customer_id = c.customer_id
inner join address a on a.address_id = c.address_id
inner join city ci on a.city_id = ci.city_id
inner join country co on ci.country_id = co.country_id
group by co.country 
having count (r.customer_id) = (select max(cus.customers)
							   from (select count(r1.customer_id) as customers
									  from rental r1
									  inner join customer c1 on r1.customer_id = c1.customer_id
									  inner join address a1 on c1.address_id = a1.address_id
									  inner join city ci1 on a1.city_id = ci1.city_id
									  inner join country co1 on ci1.country_id = co1.country_id
									  group by co1.country) as cus);
									  
									  
/* Show monthly sales for each store */

select to_char(p.payment_date, 'Mon') as Month,
		extract(year from p.payment_date) as Year,
		sum(p.amount) as Sales,
		a.district
from payment p
inner join rental r on p.rental_id = r.rental_id
inner join staff s on r.staff_id = s.staff_id
inner join store st on  st.store_id = s.store_id
inner join address a on st.address_id = a.address_id
group by 1, 2, st.store_id, a.district
order by 1, 2, a.district;


/* Show average income for each film category */

select c.name as Category, avg(p.amount) as "Average sales"
from category c
inner join film_category fc on c.category_id = fc.category_id
inner join film f on f.film_id = fc.category_id
inner join inventory i on i.film_id = f.film_id
inner join rental r on r.inventory_id = i.inventory_id
inner join payment p on p.rental_id = r.rental_id
group by c.name
order by c.name;


/* For each language find number of films */

select l.name, count(f.film_id) as "Number of films"
from language l
inner join film f on l.language_id = f.language_id
group by l.name;


/* Find the most popular film for each category */

select c.name, f.title, count(r.rental_id)
from category c, film_category fc, film f, inventory i, rental r
where c.category_id = fc.category_id and f.film_id = fc.film_id
 and i.film_id = f.film_id and i.inventory_id = r.inventory_id
group by c.name, f.title
having count(r.rental_id) = (select max(sales.fs)
							from (select count(r1.rental_id) as fs
								 from film_category fc1, film f1, category c1, inventory i1, rental r1
								 where fc1.film_id = f1.film_id and i1.film_id = i1.film_id 
								  and fc1.category_id = c1.category_id and i1.inventory_id = r1.inventory_id
								  and c1.category_id = c.category_id
								  group by c1.name, f1.title) as sales)
order by c.name, f.title;


/* Show name and store address of each store where staff have the highest number of sales */

select first_name, a.address, count(r.rental_id)
from address a, store s, staff st, rental r
where a.address_id = s.address_id and s.store_id = st.store_id and r.staff_id = st.staff_id
group by first_name, a.address, s.store_id
having count(r.rental_id) = (select max(sales.ss)
							from (select count(r1.rental_id) as ss
								 from rental r1, staff st1, store s1
								 where r1.staff_id = st1.staff_id and st1.store_id = s1.store_id 
								  and s1.store_id = s.store_id
								 group by st1.first_name, s1.store_id) as sales)
order by first_name, a.address;


/* Show films rented from Germany */

select f.title
from film f
inner join inventory i on f.film_id = i.film_id
inner join rental r on i.inventory_id = r.inventory_id
inner join customer c on c.customer_id = r.customer_id
inner join address a on c.address_id = a.address_id
where a.address IN (select a1.address
				   from address a1
				   inner join city c on a1.city_id = c.city_id
				   inner join country co on c.country_id = co.country_id
				   where co.country = 'Germany')
order by f.title;


/* Find actors who never played in horror and comedy */

select distinct(a.first_name), last_name
from actor a
inner join film_actor fa on a.actor_id = fa.actor_id
inner join film f on f.film_id = fa.film_id
inner join film_category fc on f.film_id = fc.film_id
inner join category c on c.category_id = fc.category_id
where c.name != 'Comedy' and c.name != 'Horror'
order by a.first_name;


/* Find top 2 most popular films */

select f.title, count(r.rental_id)
from film f, inventory i, rental r
where f.film_id = i.film_id and r.inventory_id = i.inventory_id
group by f.title
order by count(r.rental_id) desc
fetch first 2 rows only;


/* Find a movie which is rented less than 10 times in America */

select f.title
from film f
inner join inventory i on f.film_id = i.film_id
inner join rental r on i.inventory_id = r.inventory_id
inner join customer c on r.customer_id = c.customer_id
inner join address a on c.address_id = a.address_id
inner join city ci on a.city_id = ci.city_id
inner join country co on ci.country_id = co.country_id
where co.country = 'American Samoa'
group by f.title
having count(r.rental_id) < 1;



		  
