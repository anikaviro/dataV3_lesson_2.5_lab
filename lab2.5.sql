-- Lab | SQL Queries - Lesson 2.5
-- 1.Select all the actors with the first name ‘Scarlett’
USE sakila;
SELECT * FROM sakila.actor
WHERE first_name = 'Scarlett';

-- 2. How many physical copies of movies are available for rent in the store's inventory? 
-- How many unique movie titles are available?
-- JUST THE AMOUNT OF MOVIES IN THEIR CATALOGUE
SELECT count(inventory_id) FROM sakila.rental;
 
SELECT count(DISTINCT (inventory_id)) FROM sakila.rental;

-- 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.

SELECT min(length) as min_duration, max(length) as max_duration FROM sakila.film;

-- 4. What's the average movie duration expressed in format (hours, minutes)?

SELECT AVG(length) FROM sakila.film;
SELECT CONCAT(floor(AVG(length)/60),'h,', Floor(AVG(length)%60), 'm') as average_length FROM sakila.film;

-- 5. How many distinct (different) actors' last names are there?

SELECT count(Distinct(last_name)) FROM sakila.actor;

-- 6. How many days was the company operating? Assume the last rental date was their closing date. (check DATEDIFF() function)

SELECT DATEDIFF(max(rental_date),min(rental_date)) FROM sakila.rental; 

-- 7. Show rental info with additional columns month and weekday. Get 20 results.

SELECT *, date_format((rental_date), '%M') as 'month',  date_format((rental_date), '%W') as 'weekday' FROM sakila.rental
LIMIT 20;

-- 8. Display an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

-- if day of the week 1-5 then weekday else weekend

USE sakila;
SELECT *,
CASE 
WHEN date_format((rental_date), '%w') > 0 AND date_format((rental_date), '%w') < 6 THEN 'workday' #aquí ve que después del AND debes volver a poner la variable que estás evaluando, no puedes obviarla aunque sea la misma
WHEN date_format((rental_date), '%w') = 0 THEN 'weekend'
WHEN date_format((rental_date), '%w') = 6 THEN 'weekend'
END AS day_type 
FROM sakila.rental;

-- 9. Get release years.
SELECT release_year FROM sakila.film;

-- 10. Get all films with ARMAGEDDON in the title. (OPTIONAL)

SELECT title FROM sakila.film WHERE title regexp 'ARMAGEDDON';

-- 11. Get all films which title ends with APOLLO. (OPTIONAL)
SELECT title FROM sakila.film WHERE title regexp 'APOLLO*';

-- 12. Get 10 the longest films.

SELECT length, title FROM sakila.film
ORDER BY length DESC
LIMIT 10; 

-- 13. How many films include Behind the Scenes content?

SELECT Count(special_features) FROM sakila.film
WHERE special_features = 'Behind the Scenes';


