use sakila;
-- How many distinct (different) actors' last names are there?
select distinct first_name from actor;
-- In how many different languages where the films originally produced? (Use the column language_id from the film table)
select distinct language_id from film;
-- 3. How many movies were released with "PG-13" rating?
select *  from sakila.film where rating = 'PG-13';
-- 4. Get 10 the longest movies from 2006.
select * from sakila.film where release_year = '2006' order by length desc
limit 10;
-- 5. How many days has been the company operating (check DATEDIFF() function)?
select datediff(curdate(), min(last_update)) as operating_days
from rental;
-- 6. Show rental info with additional columns month and weekday. Get 20.
select *, month(rental_date) AS 'month', dayname(rental_date) AS 'weekday'
from rental
limit 20;
-- 7. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update,
       month(rental_date) as 'month', DAYNAME(rental_date) as 'weekday', case when DAYOFWEEK(rental_date) in (1, 7) then 'weekend' else 'workday' end as day_type
from rental;
-- 8. How many rentals were in the last month of activity?
select count(*) as rental_count
FROM rental
where rental_date >= date_sub(curdate(), interval 1 month);