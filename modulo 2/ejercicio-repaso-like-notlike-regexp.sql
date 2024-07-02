-- Ejercicios like, not like y regexp

USE sakila;


/* Ejercicio 1: Encuentra todas las películas que comienzan con la letra "A" en su título.*/

SELECT film_id, title
FROM film
WHERE title
LIKE 'A%';

/* Ejercicio 2: Encuentra todas las películas que tienen al menos una vocal en su título.*/

SELECT film_id, title
FROM film
WHERE title
REGEXP '[aeiou]';


/* Ejercicio 3: Encuentra todas las películas que tienen una longitud de título de al menos 10 caracteres.*/

SELECT film_id, title
FROM film
WHERE title
LIKE '__________%';


/* Ejercicio 4: Encuentra todas las películas cuyo título contiene la palabra "The."*/

SELECT film_id, title
FROM film
WHERE title
LIKE '%The%';

/* Ejercicio 5: Encuentra todas las películas cuyo título comienza con la letra "S."*/

SELECT film_id, title
FROM film
WHERE title
LIKE 'S%';