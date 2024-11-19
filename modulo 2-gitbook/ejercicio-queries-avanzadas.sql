USE northwind;

-- Ejercicio 1: Desde la división de productos nos piden conocer el precio de los 
-- productos que tienen el precio más alto y más bajo. Dales el alias lowestPrice y highestPrice.

SELECT MAX(unit_price) AS highest_price
FROM products;

SELECT MIN(unit_price) AS lowest_price
FROM products;

-- Ejercicio 2: Adicionalmente nos piden que diseñemos otra consulta para 
-- conocer el número de productos y el precio medio de todos ellos (en general, no por cada producto).

SELECT COUNT(product_id) AS Num_of_products, AVG(unit_price) AS Average_price
FROM products;


-- Ejercicio 3: Nuestro siguiente encargo consiste en preparar una consulta que devuelva la máxima y mínima cantidad de 
-- carga para un pedido (freight) enviado a Reino Unido (United Kingdom).

SELECT MAX(freight) AS max_freight, MIN(freight) AS min_freight
FROM orders
WHERE ship_country = 'UK';


-- Ejercicio 4: Después de analizar los resultados de alguna de nuestras consultas anteriores, desde el departamento de Ventas 
-- quieren conocer qué productos en concreto se venden por encima del precio medio para todos los productos de la empresa, ya que 
-- sospechan que dicho número es demasiado elevado. También quieren que ordenemos los resultados por su precio de mayor a menor.

SELECT product_id, product_name, unit_price
FROM products
WHERE unit_price > 
(SELECT AVG(unit_price) FROM products)
ORDER BY unit_price DESC;


-- Ejercicio 5: De cara a estudiar el histórico de la empresa nos piden una consulta para conocer el número de productos que se han descontinuado. 
-- El atributo Discontinued es un booleano: si es igual a 1 el producto ha sido descontinuado.

SELECT COUNT(product_id)
FROM products
WHERE discontinued = 1;


-- Ejercicio 6: Adicionalmente nos piden detalles de aquellos productos no descontinuados, sobre todo el ProductID y ProductName. 
-- Como puede que salgan demasiados resultados, nos piden que los limitemos a los 10 con ID más elevado, que serán los más recientes. 
-- No nos pueden decir del departamento si habrá pocos o muchos resultados, pero lo limitamos por si acaso.

SELECT product_id, product_name
FROM products
WHERE discontinued = 1
ORDER BY product_id DESC
LIMIT 10; 


-- Ejercicio 7: Desde logística nos piden el número de pedidos y la máxima cantidad de carga de entre los mismos (freight) 
-- que han sido enviados por cada empleado (mostrando el ID de empleado en cada caso).

SELECT COUNT(order_id), MAX(freight), employee_id
FROM orders
GROUP BY employee_id;

-- Ejercicio 8: Una vez han revisado los datos de la consulta anterior, nos han pedido afinar un poco más el "disparo". 
-- En el resultado anterior se han incluido muchos pedidos cuya fecha de envío estaba vacía, por lo que tenemos que mejorar 
-- la consulta en este aspecto. También nos piden que ordenemos los resultados según el ID de empleado para que la visualización 
-- sea más sencilla.

SELECT COUNT(order_id), MAX(freight), employee_id, shipped_date
FROM orders
WHERE shipped_date <> 0
GROUP BY employee_id
ORDER BY employee_id;



-- Ejercicio 9: El siguiente paso en el análisis de los pedidos va a consistir en conocer mejor la 
-- distribución de los mismos según las fechas. Por lo tanto, tendremos que generar una consulta que nos 
-- saque el número de pedidos para cada día, mostrando de manera separada el día (DAY()), el mes (MONTH()) y el año (YEAR()).

SELECT COUNT(order_id), DAY(order_date), MONTH(order_date), YEAR(order_date)
FROM orders
GROUP BY order_date;

-- Ejercicio 10: La consulta anterior nos muestra el número de pedidos para cada día concreto, pero esto es demasiado detalle. 
-- Genera una modificación de la consulta anterior para que agrupe los pedidos por cada mes concreto de cada año.

SELECT COUNT(order_id), MONTH(order_date), YEAR(order_date)
FROM orders
GROUP BY MONTH(order_date), YEAR(order_date);

-- Ejercicio 11: Desde recursos humanos nos piden seleccionar los nombres de las ciudades con 4 o más empleadas de cara a estudiar 
-- la apertura de nuevas oficinas.

SELECT city
FROM employees
GROUP BY city
HAVING COUNT(employee_id) >= 4;

-- Ejercicio 12: Necesitamos una consulta que clasifique los pedidos en dos categorías ("Alto" y "Bajo") en función de la cantidad 
-- monetaria total que han supuesto: por encima o por debajo de 2000 euros.

SELECT SUM(unit_price * quantity), order_id,
CASE 
	WHEN unit_price * quantity > 2000 THEN 'Alto'
    ELSE 'Bajo'
    END AS Benefit
FROM order_details
GROUP BY order_id;












