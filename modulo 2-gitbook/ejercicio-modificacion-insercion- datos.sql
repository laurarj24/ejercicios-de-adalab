-- Ejercicio 1: En este ejercicio vamos a corregir los errores que hemos encontrado en nuestras tablas.

USE tienda_zapatillas;

ALTER TABLE Zapatillas
ADD COLUMN marca VARCHAR(45) NOT NULL,
ADD COLUMN talla INT NOT NULL;

ALTER TABLE Empleados
MODIFY COLUMN salario FLOAT NOT NULL;


ALTER TABLE Clientes
DROP COLUMN pais;

ALTER TABLE Facturas
ADD COLUMN total FLOAT;


-- Ejercicio 2: Vamos a insertar datos en nuestra BBDD.

/* Como el id es AUTOINCREMENTAL no pongo ningun valor, porque irá poniendome los id en orden automaticamente */

INSERT INTO Zapatillas (modelo, color, marca, talla)
VALUES ('XQYUN', 'Negro', 'Nike', 42),
	   ('UOPMN', 'Rosas', 'Nike', 39),
       ('OPNYT', 'Verdes', 'Adidas', 35);


INSERT INTO Empleados (nombre, tienda, salario, fecha_incorporacion)
VALUES ('Laura', 'Alcobendas', 25987, '2010/09/03'),
	   ('Maria', 'Sevilla', NULL, '2001/04/11'),
       ('Ester', 'Oviedo', 30165.98, '2000/11/29');       


-- Como no me deja poner nulo el salario voy a modificar la tabla para permitir que salario sea nulo

ALTER TABLE Empleados
MODIFY COLUMN salario FLOAT NULL;


INSERT INTO Empleados (nombre, tienda, salario, fecha_incorporacion)
VALUES ('Laura', 'Alcobendas', 25987, '2010/09/03'),
	   ('Maria', 'Sevilla', NULL, '2001/04/11'),
       ('Ester', 'Oviedo', 30165.98, '2000/11/29');       


INSERT INTO Clientes (nombre, num_telefono, email, direccion, ciudad, provincia, codigo_postal)
VALUES ('Monica', 1234567289, 'monica@email.com', 'Calle Felicidad', 'Mostoles', 'Madrid', '28176'),
	   ('Lorena', 289345678, 'lorena@email.com', 'Calle Alegria', 'Barcelona', 'Barcelona', '12346'),
       ('Carmen', 298463759, 'carmen@email.com', 'Calle del Color', 'Vigo', 'Pontevedra', '23456');


INSERT INTO Facturas (numero_factura, fecha, id_zapatilla, id_empleado, id_cliente,total)
VALUES ('123', '2001/12/11', 1, 2, 1, 54.98),
	   ('1234', '2005/05/23', 1, 1, 3, 89.91),
       ('12345', '2015/09/18', 2, 3, 3, 76.23);
       

-- Ejercicio 3: Vamos a modificar datos ya insertados en nuestra BBDD

UPDATE zapatillas
SET color = 'Amarillas' 
WHERE color = 'Rosas';


UPDATE empleados
SET tienda = 'A Coruña'
WHERE nombre = 'Laura';


UPDATE clientes
SET num_telefono = 123456728
WHERE nombre = 'Monica';


UPDATE facturas
SET total = 89.91 
WHERE id_zapatilla = 2

































       

