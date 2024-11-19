USE tienda;


/* Ejercicio 1: Selecciona el ID, nombre, apellidos de las empleadas y el ID de cada cliente asociado a ellas, usando CROSS JOIN.*/
SELECT em.employee_number, em.first_name, em.last_name, ct.customer_number
FROM employees AS em
CROSS JOIN customers AS ct
WHERE ct.sales_rep_employee_number = em.employee_number
ORDER BY ct.customer_number;

/* Ejercicio 2: Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando CROSS JOIN.*/
SELECT em.employee_number, em.first_name, em.last_name
FROM employees AS em
CROSS JOIN customers AS ct
WHERE ct.sales_rep_employee_number = em.employee_number
GROUP BY em.employee_number
HAVING COUNT(DISTINCT ct.customer_number) >8
ORDER BY em.employee_number;

/* Ejercicio 3: Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando CROSS JOIN.*/
SELECT em.first_name, em.last_name
FROM employees AS em
CROSS JOIN customers AS ct
WHERE ct.sales_rep_employee_number = em.employee_number
GROUP BY em.first_name
HAVING COUNT(DISTINCT country) > 1;

/* Ejercicio 4: Selecciona el ID, nombre, apellidos de las empleadas y el ID de cada cliente asociado a ellas, usando INNER JOIN.*/

SELECT em.employee_number, em.first_name, em.last_name, ct.customer_number
FROM employees AS em
INNER JOIN customers AS ct
ON ct.sales_rep_employee_number = em.employee_number;

/* Ejercicio 5: Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando INNER JOIN.*/

SELECT em.employee_number, em.first_name, em.last_name
FROM employees AS em
INNER JOIN customers AS ct
ON ct.sales_rep_employee_number = em.employee_number
GROUP BY ct.sales_rep_employee_number
HAVING COUNT(DISTINCT ct.customer_number) >8; 


/* Ejercicio 6: Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando INNER JOIN.*/

SELECT em.first_name, em.last_name
FROM employees AS em
INNER JOIN customers AS ct
ON ct.sales_rep_employee_number = em.employee_number
GROUP BY em.first_name
HAVING COUNT(DISTINCT country) > 1;

/* Ejercicio 7: Selecciona el ID, nombre, apellidos de todas las empleadas y el ID de cada cliente asociado a ellas (si es que lo tienen).*/

SELECT em.employee_number, ct.sales_rep_employee_number, em.first_name, em.last_name, ct.customer_number
FROM customers AS ct
INNER JOIN employees AS em
ON em.employee_number = ct.sales_rep_employee_number; 
/* NO DEBERIA TENER QUE ESPECIFICAR QUE COLUMNAS SON COMUNES PORQUE sales_rep_employee_number es foreign key ligada a employee_number... */

/* Ejercicio 8: Selecciona el ID de todos los clientes, y el nombre, apellidos de las empleadas que llevan sus pedidos (si es que las hay).*/

SELECT ct.customer_number, em.first_name, em.last_name
FROM customers AS ct
INNER JOIN employees AS em
ON em.employee_number = ct.sales_rep_employee_number; 

/* Ejercicio 9: Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando LEFT JOIN.*/

SELECT ct.sales_rep_employee_number, em.first_name, em.last_name
FROM customers AS ct
LEFT JOIN employees AS em
ON ct.sales_rep_employee_number = em.employee_number
GROUP BY em.employee_number
HAVING COUNT(ct.customer_number) >8;

/* Ejercicio 10: Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando LEFT JOIN.*/

SELECT ct.sales_rep_employee_number, em.first_name, em.last_name
FROM customers AS ct
RIGHT JOIN employees AS em
ON ct.sales_rep_employee_number = em.employee_number
GROUP BY em.employee_number
HAVING COUNT(ct.customer_number) >8;

/* Ejercicio 11: Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando LEFT JOIN.*/

SELECT em.first_name, em.last_name
FROM employees AS em
LEFT JOIN customers AS ct
ON ct.sales_rep_employee_number = em.employee_number
GROUP BY em.first_name
HAVING COUNT(DISTINCT country) > 1;