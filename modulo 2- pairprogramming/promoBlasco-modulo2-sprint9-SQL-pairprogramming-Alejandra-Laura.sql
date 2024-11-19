USE tienda;

/* Ejercicio 1: Realiza una consulta SELECT que obtenga el número 
identificativo de cliente más bajo de la base de datos.*/

SELECT MIN(customer_number) AS id_min
FROM customers;

/* Ejercicio 2: 
Selecciona el limite de crédito medio para los clientes de España.*/

SELECT AVG(credit_limit) AS credit_limit_avg
FROM customers
WHERE country = "Spain";

/* Ejercicio 3: Selecciona el numero de clientes en Francia.*/

SELECT COUNT(*) 
FROM customers
WHERE country = "France";


/* Ejercicio 4: Selecciona el máximo de crédito que tiene 
cualquiera de los clientes del empleado con número 1323.*/

SELECT MAX(credit_limit) AS credit_limit_max
FROM customers
WHERE sales_rep_employee_number = 1323;

/* Ejercicio 5: ¿Cuál es el número máximo de empleado de la tabla customers? */

SELECT MAX(sales_rep_employee_number)
FROM customers;

/* Ejercicio 6: 
Realiza una consulta SELECT que seleccione el número de cada empleado de ventas, 
así como el numero de clientes distintos que tiene cada uno. */

SELECT COUNT(customer_name) AS customers_quantity, sales_rep_employee_number
FROM customers
GROUP BY sales_rep_employee_number;

/* Ejercicio 7: 
Selecciona el número de cada empleado de ventas que tenga más de 7 clientes distintos. */

SELECT sales_rep_employee_number, COUNT(customer_name)
FROM customers
GROUP BY sales_rep_employee_number
HAVING COUNT(customer_name) > 7;

/* Ejercicio 8: 
Selecciona el número de cada empleado de ventas, así como el numero de clientes distintos 
que tiene cada uno. Asigna una etiqueta de "AltoRendimiento" a aquellos empleados con mas de 
7 clientes distintos. */

SELECT sales_rep_employee_number,
CASE
	WHEN COUNT(customer_number) > 7 THEN "AltoRendimiento"
    ELSE "BajoRendimiento"
    END AS best_employees
FROM customers
GROUP BY sales_rep_employee_number;

/* Ejercicio 9: Selecciona el número de clientes en cada pais. */

SELECT COUNT(customer_number), country
FROM customers
GROUP BY country;

/* Ejercicio 10: 
Selecciona aquellos países que tienen clientes de más de 3 ciudades diferentes.*/

SELECT country, COUNT(city)
FROM customers
GROUP BY country
HAVING COUNT(city) > 3;

