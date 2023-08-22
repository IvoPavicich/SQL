CREATE DATABASE inmobiliaria;

USE inmobiliaria;

CREATE TABLE IF NOT EXISTS duenios(
    dni VARCHAR(20) NOT NULL PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    telefono VARCHAR(20) DEFAULT  NULL
);

CREATE TABLE IF NOT EXISTS inmuebles(
    codigo INT(11) NOT NULL ,
    direccion VARCHAR(80) NOT NULL,
    tipo VARCHAR(20) DEFAULT NULL,
    dni VARCHAR(20) NOT NULL,
    PRIMARY KEY(codigo),
    FOREIGN KEY(dni) REFERENCES duenios(dni)
);



CREATE TABLE IF NOT EXISTS inquilinos(
    dni VARCHAR(10) NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    garantia VARCHAR(15) NOT NULL,
    codigo INT(11) NOT NULL,
    PRIMARY KEY(dni),
    FOREIGN KEY (codigo) REFERENCES inmuebles(codigo)
);