USE sakila;
# Data from Actor table
Select * FROM sakila.actor;


# Data from Film table
SELECT * FROM sakila.film;


# Data from Customer table
SELECT * FROM sakila.customer;


# Movie Titles
SELECT * FROM film
order by title;


# Sakila stores according to store_id
SELECT COUNT(store_id) FROM store;


# Sakila staff
SELECT COUNT(*) FROM staff;


# List of employee names
SELECT * FROM staff
order by staff_id;


# List of unique employee names
SELECT COUNT(distinct first_name) as distrct FROM staff;


# Distinct lastnames in 'actor' table
SELECT distinct last_name from actor;


# Movies that have "PG-13" rating
SELECT * from film where rating = 'PG-13';


# The "rental data" and two columns that show the month and the weekday
SELECT R.*, MONTH(rental_date) as month, weekday(rental_date) as weekday from RENTAL AS R;


# Rentals that happened in January & February
SELECT count(*) as rentals from rental
WHERE monthname(rental_date) in ('January','February');


# Query that shows store ID, city and country
SELECT store_id , city, country FROM store AS s
LEFT JOIN address AS a ON  a.address_id = s.address_id
LEFT JOIN city AS c ON c.city_id = a.city_id
LEFT JOIN country AS con ON con.country_id = c.country_id


# Top 10 most rented movies
SELECT f.title, count(distinct rental_id) rentals FROM rental as r
LEFT JOIN inventory as i ON i.inventory_id = r.inventory_id
LEFT JOIN film as f ON f.film_id = i.film_id
GROUP BY f.title 
ORDER BY rentals desc
LIMIT 10;


# Movies that are longer than 3 hours
SELECT COUNT(*)
FROM film
WHERE length > 180;


# List the movies that are longer than the average length of all movies
Select * from film WHERE length >(SELECT AVG (length) FROM film);


# Client_id the total_amount_spent of clients who have spent more than the average total_amount from all clients
SELECT * FROM payment WHERE amount > (SELECT AVG (amount) FROM payment);
 
 
# Longest and shortest rental period
Select DATEDIFF('2005-05-31 00:46:31', '2005-05-24 22:53:30');

Select MAX(datediff('2005-06-06 06:14:31' , '2005-05-31 00:46:31')) max_rental_duration,
MIN(datediff('2005-05-26 22:04:30', '2005-05-24 22:53:30')) min_rental_duration;
