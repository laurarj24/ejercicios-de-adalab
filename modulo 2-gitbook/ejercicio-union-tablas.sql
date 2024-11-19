USE Northwind;

-- Ejercicio 1: Desde las oficinas en UK nos han pedido con urgencia que realicemos una consulta a 
-- la base de datos con la que podamos conocer cuántos pedidos ha realizado cada empresa cliente de UK. 
-- Nos piden el ID del cliente y el nombre de la empresa y el número de pedidos.

SELECT customer_id, company_name, COUNT(order_id) AS Orders_by_customer
FROM customers 
INNER JOIN orders
USING(customer_id)
WHERE country = 'UK'
GROUP BY customer_id;


-- Ejercicio 2: Desde Reino Unido se quedaron muy contentas con nuestra rápida respuesta a su petición anterior
-- y han decidido pedirnos una serie de consultas adicionales. La primera de ellas consiste en una query que nos sirva 
-- para conocer cuántos objetos ha pedido cada empresa cliente de UK durante cada año. Nos piden concretamente conocer el 
-- nombre de la empresa, el año, y la cantidad de objetos que han pedido. Para ello hará falta hacer 2 joins.

SELECT customer_id, company_name, SUM(quantity) AS Orders_by_customer, YEAR(order_date)
FROM customers 
INNER JOIN orders
USING(customer_id)
INNER JOIN order_details
USING(order_id)
WHERE country = 'UK'
GROUP BY customer_id, YEAR(order_date); 


-- Ejercicio 3: Lo siguiente que nos han pedido es la misma consulta anterior pero con la adición de la cantidad de dinero que han 
-- pedido por esa cantidad de objetos, teniendo en cuenta los descuentos, etc. Ojo que los descuentos en nuestra tabla nos salen en porcentajes, 
-- 15% nos sale como 0.15.

SELECT customer_id, company_name, SUM(quantity) AS Objects_by_customer, YEAR(order_date), SUM(quantity * unit_price * (1-discount)) AS DineroTotal
FROM customers 
INNER JOIN orders
USING(customer_id)
INNER JOIN order_details
USING(order_id)
WHERE country = 'UK'
GROUP BY customer_id, YEAR(order_date); 


-- Ejercicio 4: Después de estas solicitudes desde UK y gracias a la utilidad de los resultados que se han obtenido, desde la central 
-- nos han pedido una consulta que indique el nombre de cada compañia cliente junto con cada pedido que han realizado y su fecha.

SELECT order_id, company_name, order_date
FROM orders
INNER JOIN customers
USING(customer_id);


-- Ejercicio 5: Ahora nos piden una lista con cada tipo de producto que se han vendido, sus categorías, nombre de la categoría y el 
-- nombre del producto, y el total de dinero por el que se ha vendido cada tipo de producto (teniendo en cuenta los descuentos).

SELECT category_id, category_name, product_name, SUM(quantity * order_details.unit_price *(1-discount)) AS ProductSales
FROM categories
INNER JOIN products
USING(category_id)
INNER JOIN order_details
USING(product_id)
GROUP BY product_id;


-- Ejercicio 6: Lo primero que queremos hacer es obtener una consulta SQL que nos devuelva el nombre de todas las empresas cliente,
-- los ID de sus pedidos y las fechas.

SELECT order_id, company_name, order_date
FROM orders
INNER JOIN customers
USING(customer_id);


-- Ejercicio 7: Desde la oficina de Reino Unido (UK) nos solicitan información acerca del número de pedidos que ha realizado 
-- cada cliente del propio Reino Unido de cara a conocerlos mejor y poder adaptarse al mercado actual. Especificamente nos 
-- piden el nombre de cada compañía cliente junto con el número de pedidos.

SELECT company_name, COUNT(order_id) AS Orders_by_customer
FROM customers 
INNER JOIN orders
USING(customer_id)
WHERE country = 'UK'
GROUP BY customer_id;


-- Ejercicio 8: También nos han pedido que obtengamos todos los nombres de las empresas cliente de Reino Unido 
-- (tengan pedidos o no) junto con los ID de todos los pedidos que han realizado y la fecha del pedido. 

SELECT c.company_name, o.order_id, o.order_date
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id
WHERE country = 'UK';


-- Ejercicio 9: Ejercicio de SELF JOIN: Desde recursos humanos nos piden realizar una consulta que muestre por pantalla 
-- los datos de todas las empleadas y sus supervisoras. Concretamente nos piden: la ubicación, nombre, y apellido tanto 
-- de las empleadas como de las jefas. Investiga el resultado, ¿sabes decir quién es el director?

SELECT e1.city, e1.first_name AS NombreEmpleado, e1.last_name AS ApellidoEmpleado, e2.city, e2.first_name AS NombreJefe, e2.last_name AS ApellidoJefe
FROM employees AS e1, employees AS e2
WHERE e1.reports_to = e2.employee_id;


-- Ejercicio 10: Selecciona todos los pedidos, tengan empresa asociada o no, y todas las empresas tengan pedidos asociados o no. 
-- Muestra el ID del pedido, el nombre de la empresa y la fecha del pedido (si existe).

SELECT o.order_id, c.company_name, o.order_date
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id
UNION
SELECT o.order_id, c.company_name, o.order_date
FROM customers AS c
RIGHT JOIN orders AS o
ON c.customer_id = o.customer_id;




