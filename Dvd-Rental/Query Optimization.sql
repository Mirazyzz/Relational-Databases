select film_id, title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating, last_update, special_features, fulltext
from "public"."film"
where title = 'Chamer Italian';

create index concurrently title_idx on "public"."film" using btree(title);
-- took 214 msec

/*
normal query: ~340 msec
optimized : ~173 msec
*/


select *
from "public"."film" as f
inner join "public"."film_category" as fc on f.film_id = fc.film_id
inner join "public"."category" as c on c.category_id = fc.category_id
where (c.name = 'Action' or c.name = 'Animation') 
and f.title like 'A%' and f.title like '%s';

create index name_idx on "public"."category" using btree(name);
create index title_idx on "public"."film" using btree(title);

drop index name_idx;
drop index title_idx;
/* 
normal execution: ~~250 msec
optimized: ~400 msec (or queries are the worst to optimize)
*/

select customer_id, first_name, store_id, address_id
from "public"."customer"
where first_name = 'Jamie' and store_id = 2;

create index cust_idx on "public"."customer" using btree(first_name, store_id, customer_id, address_id);

/*
normal execution: ~800 msec
optimized: ~250 msec
*/


select *
from "public"."category"
order by last_update desc, name
limit 50;

create index cat_idx on "public"."category" using btree(last_update desc, name);

/*
normal execution: ~303 msec
optimized: ~200 msec
*/

select f.film_id, f.title, f.release_year, c.name
from "public"."film" as f
inner join "public"."film_category" fc on f.film_id = fc.film_id
inner join "public"."category" c on c.category_id = fc.category_id
where c.name = 'Action' or f.release_year > 2006
order by f.title limit 20;


create index film_idx on "public"."film" using btree(title asc);
create index film_rel_ix on "public"."film" using btree(release_year);
create index cat_idx on "public"."category" using btree(name);

/*
normal execution: ~450 msec
optimized: ~200 msec

*/


select title, length
from "public"."film"
where lower(title) = 'clueless bucket' and length > 100;

create index title_lower_idx on "public"."film" using btree(lower(title));

/*
normal execution: ~300 msec
optimized: ~180 msec
*/
	
