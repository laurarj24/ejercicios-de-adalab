USE northwind;

-- Conociendo a las empleadas

SELECT employee_id, first_name, last_name
FROM employees;


-- Conociendo los productos más baratos, cuyos precios oscilen entre 0 y 5 euros

SELECT product_id, product_name
FROM products
WHERE unit_price < 5; 

/* no haria falta poner el 0 porque los precios de los productos son positivos, 
si hubiera que ponerlo sería: */

SELECT product_id, product_name
FROM products
WHERE unit_price BETWEEN 0 AND 5; 


-- Conociendo los productos que no tienen precio

SELECT product_id, product_name
FROM products
WHERE unit_price IS NULL; /* No hay nulos*/


-- obtén los datos de aquellos productos con un precio menor a 15 dólares, pero sólo aquellos que tienen un ID menor que 20

SELECT product_id, product_name
FROM products
WHERE unit_price < 15 AND product_id < 20;

-- obten aquellos que tengan un precio superior a 15 dólares y un ID superior a 20, usando NOT

SELECT product_id, product_name
FROM products
WHERE NOT unit_price <  15 AND NOT product_id < 20;


-- Conociendo los paises a los que vendemos

SELECT DISTINCT country
FROM customers;

-- Conociendo el tipo de productos que vendemos en Northwind, mostrando id, nombre y precio de los primeros 10 productos

SELECT product_id, product_name, unit_price
FROM products
LIMIT 10;


-- Misma consulta pero mostrando los ultimos 10 productos ordenados de manera descentente

SELECT product_id, product_name, unit_price
FROM products
ORDER BY product_id DESC
LIMIT 10;


-- Que pedidos tenemos en nuestra BBDD. Mostrar los pedidos unicos usando la tabla order_details

SELECT DISTINCT order_id
FROM order_details;


-- Muestra los 3 pedidos que han supuesto un mayor ingreso para la empresa. Crea una columna en esta consulta con el alias ImporteTotal

SELECT (unit_price * quantity) AS ImporteTotal
FROM order_details
ORDER BY ImporteTotal DESC
LIMIT 3;


-- Los pedidos que están entre las posiciones 5 y 10 de nuestro ranking. Desde el departamento de Ventas nos piden seleccionar el ID de los pedidos 
-- situados entre la 5 y la 10 mejor posición en cuanto al coste económico total ImporteTotal.

SELECT (unit_price * quantity) AS ImporteTotal, order_id
FROM order_details
ORDER BY ImporteTotal DESC
LIMIT 5
OFFSET 5;


-- Qué categorías tenemos en nuestra BBDD. De cara a ver cómo de diversificado está el negocio, se nos solicita una lista de las categorías 
-- que componen los tipos de pedido de la empresa. Queremos que la lista de resultado sea renombrada como "NombreDeCategoria".

SELECT category_name AS NombreDeCategoria 
FROM categories;

-- Selecciona envios con retraso. Nos hacen llegar desde la dirección la preocupación acerca del cumplimiento de las fechas de envío. 
-- Últimamente se están dando retrasos en muchas entregas y por ello se busca realizar la acción preventiva de enviar los paquetes con 
-- varios días adicionales de antelacion. Para comenzar a planear esos envíos anticipados, nos piden conocer cuál sería la fecha de envío (ShippedDate) 
-- de los pedidos almacenados en la base de datos, si estos sufrieran un retraso de 5 días. Nos piden mostrar la nueva fecha renombrada como FechaRetrasada.


SELECT DATE_ADD(shipped_date, INTERVAL 5 DAY) AS FechaRetrasada
FROM orders;


-- Selecciona los productos más rentables. Gracias a un análisis realizado en los últimos meses en la empresa, se ha comprobado 
-- que el rango de productos que puede dar más beneficios parece ser el de aquellos con un precio mayor o igual a 15 dólares, pero menor 
-- o igual que 50 dólares. Selecciona los datos de ese rango de productos usando el operador BETWEEN.


SELECT * 
FROM products
WHERE unit_price BETWEEN 15 AND 50;


-- Selecciona los productos con unos precios dados. Queremos conocer los datos de los productos que tengan exactamente un precio de 18, 19 o 20 dólares 
-- (un rango muy concreto de precios del que la empresa quiere maximizar sus ventas en un futuro). Usa IN para conseguirlo de manera eficiente.

SELECT * 
FROM products
WHERE unit_price IN (18,19,20);







