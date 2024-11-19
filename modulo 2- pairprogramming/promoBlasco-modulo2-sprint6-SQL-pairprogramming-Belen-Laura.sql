CREATE SCHEMA ejercicio_clase_invertida;

USE ejercicio_clase_invertida;

CREATE TABLE t1 (a INTEGER, b CHAR(10));

ALTER TABLE t1
RENAME t2;

ALTER TABLE t2
MODIFY COLUMN a TINYINT NOT NULL;

ALTER TABLE t2
MODIFY COLUMN b CHAR(20);

ALTER TABLE t2
MODIFY COLUMN b CHAR(10);

ALTER TABLE t2
CHANGE c b CHAR (10);

ALTER TABLE t2
CHANGE b c CHAR(20);

ALTER TABLE t2
ADD COLUMN d TIMESTAMP; 

ALTER TABLE t2 
DROP COLUMN c;

CREATE TABLE t3 LIKE t2;

DROP TABLE IF EXISTS t2;

ALTER TABLE t3
RENAME t1;

USE tienda;

CREATE TABLE IF NOT EXISTS customers_mod 
SELECT * 
FROM customers;

ALTER TABLE customers DROP FOREIGN KEY customers_ibfk_1;

ALTER TABLE customers DROP FOREIGN KEY customers_ibfk_1;

ALTER TABLE employees DROP FOREIGN KEY employees_ibfk_1;
ALTER TABLE employees DROP FOREIGN KEY employees_ibfk_2;

ALTER TABLE customers
ADD CONSTRAINT fk_customers_employees
FOREIGN KEY (sales_rep_employee_number)
REFERENCES employees(employee_number)
ON DELETE CASCADE
ON UPDATE CASCADE;

/* INSERT INTO customers (customer_number, customer_name, contact_last_name, contact_first_name,phone, address_line1, address_line2, city, state, postal_code, country, sales_rep_employee_number, credit_limit)
	VALUES (343, "Adalab", "Rodriguez", "Julia", "672986373", "Calle Falsa 1", "Puerta 42", "Madrid", "España", "28000", "España", 15, 20000000);
    
    Esto no puedo hacerlo porque el sales_rep_employee_number no se corresponde con un employee creado */
    
INSERT INTO employees (employee_number, last_name, first_name, extension, email, office_code,reports_to, job_title)
	VALUES (15, "Romero", "Laura", "x205", "laurarrr@hotmail.com", "1", 1008, "Sales Rep");

INSERT INTO customers (customer_number, customer_name, contact_last_name, contact_first_name,phone, address_line1, address_line2, city, state, postal_code, country, sales_rep_employee_number, credit_limit)
	VALUES (343, "Adalab", "Rodriguez", "Julia", "672986373", "Calle Falsa 1", "Puerta 42", "Madrid", "España", "28000", "España", 15, 20000000);

INSERT INTO employees (employee_number, last_name, first_name, extension, email, office_code,reports_to, job_title)
	VALUES (10, "Jimenez", "Elena", "x265", "elenajjj@hotmail.com", "3", 1068, "Sales Rep");
 
/* Como ya existe el customer 344 hay que borrarlo y crearlo de nuevo, o se podría modificar todo)*/

DELETE FROM customers WHERE customer_number=344; 
INSERT INTO customers (customer_number, customer_name, contact_last_name, contact_first_name,phone, address_line1, address_line2, city, state, postal_code, country, sales_rep_employee_number, credit_limit)
	VALUES(344,"La pegatina After", "Santiago", "Maricarmen", "00000000", "Travesía del rave", NULL, "Palma de Mallorca", NULL, "07005", "España", 10, 45673453);

ALTER TABLE customers

/* Para poder añadir 5 filas sin tener que meter customer_number es necesario modificar la primary key y decirle que se autoincremente*/

MODIFY COLUMN customer_number INT AUTO_INCREMENT;

INSERT INTO customers (customer_name, contact_last_name, contact_first_name,phone, address_line1, address_line2, city, state, postal_code, country, sales_rep_employee_number, credit_limit)
	VALUES("Interdental", "Garcia", NULL, "01234568", "Travesía costra brava", NULL, "Palma de Mallorca", NULL, "07005", "España", 10, 45673453),
	      ("Opticas Rubio", "Smiths", NULL, "12345678", "Calle Belgica", NULL, "Palma de Mallorca", NULL, "07005", "España", 10, 45673453),
          ("La fiesta flamenca", "Costa", NULL, "23456781", "Calle Delfin", NULL, "Palma de Mallorca", NULL, "07005", "España", 10, 45673453),
          ("Restaurante las gaviotas", "Sanz", "Esther", "34567891", "Avenida de Jerusalen", NULL, "Palma de Mallorca", NULL, "07005", "España", 10, 45673453),
          ("Marketplace Lerele", "Delgado", "Fatima", "45678912", "Corregidor Francisco Nieto", NULL, "Palma de Mallorca", NULL, "07005", "España", 10, 45673453);







