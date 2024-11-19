-- EJERCICIO 1: Calcula el numero de clientes por cada ciudad.

USE tienda;

SELECT COUNT(customer_number) AS customer_by_city, city
FROM customers
GROUP BY city;

-- EJERCICIO 2: Usando la consulta anterior como subconsulta, selecciona la ciudad con el mayor numero de clientes.

SELECT city
FROM customers 
GROUP BY city
HAVING COUNT(customer_number) >= ALL (
	SELECT COUNT(customer_number)
	FROM customers
	GROUP BY city);

-- Ejercicio 3: Por último, usa todas las consultas anteriores para seleccionar el customerNumber, nombre y apellido de las 
-- clientas asignadas a la ciudad con mayor numero de clientas.

SELECT customer_number, contact_last_name, contact_first_name
FROM customers
WHERE customer_number IN (
	SELECT customer_number
	FROM customers 
	GROUP BY city
	HAVING COUNT(customer_number) >= ALL (
		SELECT COUNT(customer_number)
		FROM customers
		GROUP BY city));

/* EJERCICIO 4: Queremos ver ahora que empleados tienen algún contrato asignado con alguno de los clientes existentes. 
Para ello selecciona employeeNumber como 'Número empleado', firstName como 'nombre Empleado' y lastName como 'Apellido Empleado'*/

SELECT employee_number AS Numero_empleado, first_name AS Nombre_empleado, last_name AS Apellido_Empleado
FROM employees 
WHERE EXISTS (
	SELECT *
	FROM customers 
	WHERE employee_number = sales_rep_employee_number);


/* EJERCICIO 5: Queremos ver ahora en cuantas ciudades en las cuales tenemos clientes, no también una oficina de nuestra empresa 
para ello: Selecciona aquellas ciudades como 'ciudad' y los nombres de las empresas como 'nombre de la empresa ' de la tabla customers, 
sin repeticiones, que no tengan una oficina en dicha ciudad de la tabla offices.*/

SELECT city AS ciudad, customer_name AS nombre_de_la_empresa 
FROM customers
WHERE city NOT IN (
SELECT city 
FROM offices)