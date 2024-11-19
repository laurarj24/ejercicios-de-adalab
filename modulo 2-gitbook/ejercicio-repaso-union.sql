-- Ejercicios union

/* Ejercicio 1: Encuentra todos los actores cuyos nombres comienzan con la letra "A" en la tabla actor, y encuentra todos los clientes 
cuyos nombres comienzan con la letra "B" en la tabla customer. Combina ambos conjuntos de resultados en una sola tabla. */

SELECT actor_id AS actor_customer_id, a.first_name, a.last_name
FROM actor AS a
WHERE a.first_name
LIKE 'A%'
UNION
SELECT customer_id, c.first_name, c.last_name
FROM customer AS c
WHERE c.first_name
LIKE 'B%';

-- Tambien funcionaria sin alias

SELECT actor_id AS actor_customer_id, first_name, last_name
FROM actor 
WHERE first_name
LIKE 'A%'
UNION
SELECT customer_id, first_name, last_name
FROM customer 
WHERE first_name
LIKE 'B%';

/* Encuentra todas las películas cuyos títulos contienen la palabra "Comedy" en la tabla film, y encuentra todas las películas cuyo título
comienza con la letra "D" en la misma tabla. Combina ambos conjuntos de resultados en una sola lista de películas.*/

SELECT film_id, title
FROM film
WHERE title
LIKE '%Comedy%'
UNION
SELECT film_id, title
FROM film
WHERE title
LIKE 'D%'

-- Creo que no hay ningun titulo que contenga comedy