USE escuelas;

CREATE TABLE `escuelas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `localidad` varchar(45) DEFAULT NULL,
  `provincia` varchar(45) DEFAULT NULL,
  `capacidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
);


CREATE TABLE `alumnos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_escuela` int(11) DEFAULT NULL,
  `legajo` int(11) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `nota` decimal(10,0) DEFAULT NULL,
  `grado` int(11) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_escuela`) REFERENCES `escuelas`(`id`)
);


INSERT INTO escuelas VALUES
(1, 'Normal 1', 'Quilmes', 'Buenos Aires', 250),
(2, 'Gral. San Martín','San Salvador', 'Jujuy', 100),
(3, 'Belgrano', 'Belgrano','Córdoba', 150),
(4, 'EET Nro 2', 'Avellaneda', 'Buenos Aires', 500),
(5, 'Esc.Nro 2 Tomás Santa Coloma', 'Capital Federal', 'Buenos Aires', 250),
(DEFAULT, 'Tecnica 2', 'Corrientes', 'Corrientes', 300);
  
INSERT INTO alumnos VALUES
(NULL,2,1000,'Ramón Mesa',8,1,'rmesa@rmail.com'),
(NULL,2,1002,'Tamara Smith',8,1,''),
(NULL,1,101,'Juan Pérez', 10,3,''),
(NULL,1,105,'Pedro González',9,3,''),
(NULL, 5,190, 'Roberto Luis Sánchez',8,3,'robertoluissanchez@rumail.com'),
(NULL,4,106, 'Martina Bossio', NULL,3,''),
(NULL, 4,100, 'Jaime Jaramillo',3,1,'jj2021@pirimail.com'),
(NULL, 4, 1234,'Susana Gómez',6,2,''),
(NULL, NULL,106, 'Martin Bossi', NULL,3,'');

DELETE FROM alumnos WHERE nombre='Martin Bossi';
INSERT INTO alumnos VALUES(NULL, NULL,106, 'Martin Bossi', NULL,3,'');
INSERT INTO escuelas VALUES(DEFAULT, 'Tecnica 2', 'Corrientes', 'Corrientes', 300);
SELECT * FROM alumnos;