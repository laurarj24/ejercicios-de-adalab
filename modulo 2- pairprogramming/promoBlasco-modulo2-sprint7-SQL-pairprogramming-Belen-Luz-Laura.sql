USE tienda;

SELECT customer_name, phone, address_line1, address_line2
FROM customers;

SELECT phone, address_line1, address_line2
FROM customers
WHERE country = "USA";

SELECT contact_first_name, contact_last_name
FROM customers
WHERE address_line2 IS NULL;

SELECT *
FROM customers
WHERE state IS NOT NULL;

SELECT *
FROM customers
WHERE country = "USA" AND state IS NULL;

SELECT country
FROM customers
WHERE credit_limit > 10000;


SELECT DISTINCT country
FROM customers 
WHERE credit_limit > 10000;







