-- Ejercicios subqueries y queries complejas

/* Ejercicio 1: Encuentra el nombre y apellido de los actores que han actuado en películas que se alquilaron después de que la película "ACADEMY DINOSAUR" 
se alquilara por primera vez. Ordena los resultados alfabéticamente por apellido.*/


SELECT  first_name, last_name
FROM actor
WHERE actor_id IN (
	SELECT actor_id 
    FROM rental 
    INNER JOIN inventory
	USING(inventory_id)
	INNER JOIN film_actor
	USING(film_id)
	INNER JOIN film
    WHERE rental_date > 
		(SELECT MIN(rental_date) 
		FROM rental 
        WHERE title = 'Academy Dinosaur'))
	ORDER BY last_name;


/* Ejercicio 2: Encuentra el título de las películas que han sido alquiladas por el cliente con el nombre "MARY SMITH" y que aún no se han devuelto. 
Ordena los resultados alfabéticamente por título de película */

SELECT title, film_id
FROM film
WHERE film_id IN (
	SELECT film_id
    FROM inventory
    INNER JOIN rental
    USING(inventory_id)
    INNER JOIN customer
    USING(customer_id)
    WHERE "Mary Smith" = CONCAT(first_name, ' ',last_name) 
    AND return_date IS NULL)
ORDER BY title;
    

/* Ejercicio 3: Encuentra los nombres de los clientes que han alquilado al menos 5 películas distintas. Ordena los resultados alfabéticamente por apellido.*/

SELECT first_name, last_name, title
FROM customer
WHERE customer_id IN (
	SELECT customer_id
    FROM rental
    INNER JOIN inventory
    USING(inventory_id)
    INNER JOIN film
    USING(film_id)
    GROUP BY title
    HAVING COUNT(DISTINCT title > 5));

/* Ejercicio 4: Encuentra los nombres de los actores que han actuado en al menos una película que pertenece a la categoría "Horror." 
Ordena los resultados alfabéticamente por apellido.*/

SELECT first_name, last_name, actor_id
FROM actor
WHERE actor_id IN (
	SELECT actor_id
    FROM film_actor
    WHERE film_id IN(
		SELECT film_id
        FROM film_category
        INNER JOIN category
        USING (category_id)
        WHERE name = 'Horror'))
ORDER BY last_name;
        


/* Ejercicio 5: Encuentra los nombres de las películas que tienen la misma duración que la película con el título "GATTACA." 
Ordena los resultados alfabéticamente por título de película. */

SELECT DISTINCT title
FROM film 
WHERE length IN (
	SELECT length
    FROM film
    WHERE title = 'Holiday Games')
ORDER BY title;

-- Pongo holiday Games porque no veo que exista la pelicula Gattaca en la base de datos
    

