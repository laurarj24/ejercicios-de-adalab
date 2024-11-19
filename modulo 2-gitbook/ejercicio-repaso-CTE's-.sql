-- Ejercicios CTE's

/* Ejercicio 1: Encuentra el nombre de los actores que han actuado en más películas y la cantidad de películas en las que han actuado. */

WITH actor_film AS (SELECT first_name,last_name, actor_id, film_id
FROM actor INNER JOIN film_actor USING (actor_id))
SELECT first_name, last_name, COUNT(DISTINCT film_id) AS Film_Number
FROM actor_film
GROUP BY actor_id
ORDER BY COUNT(film_id) DESC;

/* Ejercicio 2: Encuentra las categorías de películas con la mayor cantidad de películas y la cantidad de películas en cada categoría. */

WITH most_liked_categories AS (SELECT title, name, category_id
FROM film INNER JOIN film_category USING (film_id)
INNER JOIN category USING(category_id))
SELECT name, category_id, COUNT(name) AS Catergory_num
FROM most_liked_categories
GROUP BY name
ORDER BY COUNT(name) DESC;

/* Ejercicio 3: Encuentra los clientes que han alquilado más películas y la cantidad de películas alquiladas por cada cliente. */

WITH most_valued_customer AS (SELECT customer_id, rental_id
FROM customer INNER JOIN rental USING(customer_id))
SELECT customer_id, COUNT(customer_id) AS NumAlquileres FROM most_valued_customer
GROUP BY customer_id
ORDER BY COUNT(customer_id) DESC;


/* Ejercicio 4: Encuentra los actores que han actuado en películas de todas las categorías y muestra la cantidad de categorías en las que han actuado. */


WITH categories_actors AS (SELECT category_id, name AS categoria,COUNT(DISTINCT name) AS cantidad, actor_id, first_name, last_name 
FROM category 
INNER JOIN film_category 
USING(category_id) 
INNER JOIN film_actor 
USING(film_id)
INNER JOIN actor
USING(actor_id)
GROUP BY actor_id)
SELECT actor_id, first_name, last_name, cantidad
FROM categories_actors  
WHERE cantidad = (SELECT MAX(cantidad) FROM categories_actors);

