CREATE SCHEMA ejercicios_2;

USE ejercicios_2;

CREATE TABLE empleadas (
	id_empleada INT NOT NULL AUTO_INCREMENT,
    salario INT,
    nombre VARCHAR(20),
    apellidos VARCHAR(40),
    PRIMARY KEY (id_empleada)
);

CREATE TABLE empleadas_en_proyectos (
	id_proyecto INT NOT NULL,
    id_empleada INT NOT NULL,
    PRIMARY KEY (id_empleada, id_proyecto),
    FOREIGN KEY (id_empleada)
    REFERENCES empleadas (id_empleada)
    ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE personas (
	id INT NOT NULL,
    apellido VARCHAR(40),
    nombre VARCHAR(20),
    edad INT,
    CONSTRAINT `min_edad`
		CHECK (edad > 16),
    ciudad VARCHAR (20) DEFAULT 'Madrid'
    );

CREATE SCHEMA creacion_tienda;

USE creacion_tienda;

CREATE TABLE customers
	(
    id_customer INT AUTO_INCREMENT,
    nombre VARCHAR (20),
    apellido VARCHAR (40),
    direccion VARCHAR (255),
    email VARCHAR (30) UNIQUE,
    id_employee INT (3),
    edad INT,
    CONSTRAINT `min_edad`
		CHECK (edad > 18),
	total_pedido FLOAT UNSIGNED,    
    PRIMARY KEY (id_customer),
    CONSTRAINT `FK customer_employees`
    FOREIGN KEY (id_employee)
    REFERENCES employees(id_employee)
    );

CREATE TABLE employees
	(
    id_employee INT AUTO_INCREMENT,
	nombre VARCHAR (20),
    apellido VARCHAR (40),
    salario FLOAT  UNSIGNED,
	PRIMARY KEY (id_employee)
    );
    
    
    
    
    
    
    
    