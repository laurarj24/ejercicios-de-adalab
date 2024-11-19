USE sakila;

-- EJERCICIOS JOINS

/* Ejercicio 1: Obtener los clientes y las películas que han alquilado.*/

SELECT title, first_name, last_name 
FROM customer
INNER JOIN rental
USING (customer_id)
INNER JOIN inventory
USING (inventory_id)
INNER JOIN film
USING (film_id)
ORDER BY customer_id;

-- Realmente no devuelve todas las filas, porque tenemos limitado a 1000 filas, de hecho, si no ponemos el order by nos va a mostrar 3 resultados solo de customer_id =1
-- Otra opcion es cambiar el limite a 50000, hay 16044 filas en total en esta query

SELECT customer_id, rental_id 
FROM customer
INNER JOIN rental
USING (customer_id)
INNER JOIN inventory
USING (inventory_id)
INNER JOIN film
USING (film_id);


/* Ejercicio 2: Obtener los actores y las películas en las que han actuado.*/

SELECT actor_id, first_name, last_name, film_id, title
FROM actor
LEFT JOIN film_actor
USING (actor_id)
LEFT JOIN film
USING(film_id)
ORDER BY actor_id;

/* Ejercicio 3: Obtener todas las películas y, si están disponibles en inventario, mostrar la cantidad disponible.*/

SELECT title, inventory_id, COUNT(film_id) AS CantidadPelicula
FROM film
LEFT JOIN inventory
USING (film_id)
GROUP BY film_id;

-- No puedo hacer un INNER JOIN porque no me muestra las pelis que no estan en inventario
-- Si hago un left join tengo que usar de tabla referencia la de films para que tenga acceso a todos sus registros, incluido 
-- las de aquellas pelis que no están en inventario. 

/* Ejercicio 4: Obtener todos los clientes y mostrar la cantidad de alquileres que han realizado, incluso si no han realizado ningún alquiler.*/

-- ahora voy a hacer un right join por probar, pero tengo que usar la tabla principal como referencia igualmente

SELECT Customer_id, first_name, last_name, COUNT(customer_id) AS NumeroAlquileres
FROM customer
RIGHT JOIN rental
USING (customer_id)
GROUP BY customer_id;

/* Ejercicio 5: Obtener todas las películas y mostrar los actores que han actuado en ellas, incluso si algunas películas no tienen actores asociados.*/

SELECT film_id, title, first_name, last_name
FROM film
LEFT JOIN film_actor
USING(film_id)
LEFT JOIN actor
USING(actor_id);

-- de nuevo hago left join tomando de referencia la base de dato que contiene todas las peliculas, para que me muestre también aquellas que no tienen actores asociados

/* Ejercicio 6: Obtener todos los actores y mostrar las películas en las que han actuado, incluso si algunos actores no han actuado en ninguna película.*/

SELECT first_name, last_name, title
FROM actor
LEFT JOIN film_actor
USING(actor_id)
LEFT JOIN film
USING(film_id);
