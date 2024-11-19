
SELECT inventory_id
FROM inventory
WHERE film_id = (
SELECT film_id
FROM film_text
WHERE title = 'ACADEMY DINOSAUR'
);
-- Obtenemos el inventory_id de nuestra película

SELECT MIN(rental_date)
FROM rental
WHERE inventory_id IN (	-- Sacamos el film_id de la película
SELECT inventory_id
FROM inventory
WHERE film_id = (
SELECT film_id
FROM film_text
WHERE title = 'ACADEMY DINOSAUR'
));

SELECT inventory_id, film_id
FROM rental
INNER JOIN inventory
USING (inventory_id)
WHERE rental_date > (
SELECT MIN(rental_date)
FROM rental
WHERE inventory_id IN (	-- Sacamos el film_id de la película
SELECT inventory_id
FROM inventory
WHERE film_id = (
SELECT film_id
FROM film_text
WHERE title = 'ACADEMY DINOSAUR'
)));
-- Estamo obteniendo el inventory_id y el film_id de las películas que cumplen con la condición del enunciado

SELECT actor_id, first_name, last_name, inventory_id
FROM actor
INNER JOIN film_actor
USING (actor_id)
INNER JOIN inventory
USING (film_id);
-- Obtenemos el nombre y el apellido de los actores e inventory_id

SELECT DISTINCT actor_id, first_name, last_name
FROM actor
INNER JOIN film_actor
USING (actor_id)
INNER JOIN inventory
USING (film_id)
WHERE inventory_id IN(

SELECT inventory_id
FROM rental
INNER JOIN inventory
USING (inventory_id)
WHERE rental_date > (
SELECT MIN(rental_date)
FROM rental
WHERE inventory_id IN (	-- Sacamos el film_id de la película
SELECT inventory_id
FROM inventory
WHERE film_id = (
SELECT film_id
FROM film_text
WHERE title = 'ACADEMY DINOSAUR'
))));   
   
   
SELECT inventory_id, film_id
FROM rental
INNER JOIN inventory
USING (inventory_id)
WHERE rental_date > (
SELECT MIN(rental_date)
FROM rental
WHERE inventory_id IN (	-- Sacamos el film_id de la película
SELECT inventory_id
FROM inventory
WHERE film_id = (
SELECT film_id
FROM film_text
WHERE title = 'ACADEMY DINOSAUR'
)));  
        
