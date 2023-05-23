use sakila;
-- How many distinct (different) actors' last names are there?
select distinct first_name from actor;
-- In how many different languages where the films originally produced? (Use the column language_id from the film table)
select distinct language_id from film;
select *  from sakila.film where rating = 'PG-13';
select * from sakila.film where release_year = '2006' order by length desc
limit 10;
-- Show rental info with additional columns month and weekday. Get 20.
select rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update,
       month(rental_date) AS 'month', DAYNAME(rental_date) AS 'weekday'
from rental
LIMIT 20;
-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update,
       month(rental_date) as 'month', DAYNAME(rental_date) as 'weekday', case when DAYOFWEEK(rental_date) in (1, 7) then 'weekend' else 'workday' end as day_type
from rental;
-- How many rentals were in the last month of activity?
SELECT COUNT(*) as rental_count
FROM rental
where rental_date >= 