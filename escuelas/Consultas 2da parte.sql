
'ALTER TABLE'
'19) Realizar lo siguiente:'
/*a. Agregar a través de Alter Table una en la tabla escuelas columna llamada “Partido”, a la derecha de Localidad con una cadena vacía como valor por defecto (armar la sentencia a través de Alter Table y ejecutar desde la consulta).*/
ALTER TABLE escuelas
ADD COLUMN partido VARCHAR(255) DEFAULT ''
AFTER localidad;
/*b. Ejecutar una consulta donde se vean todos los campos para confirmar que se ha agregado el campo “partido”.*/
SELECT * FROM escuelas;
DESCRIBE escuelas;
/*c. Eliminar esa columna utilizando Alter Tabla, no es necesario ejecutarlo desde la consulta.*/
ALTER TABLE escuelas
DROP COLUMN partido;

'INSERT STATEMENT (operación a nivel de registro)'
/*20) Agregar una nueva escuela utilizando Insert Statement (no agregar el ID). Ejecutar desde la consulta:*/
INSERT INTO escuelas (nombre, localidad, provincia,capacidad) VALUES 
('Esc.N°2 Tomás Santa coloma', 'Capital Federal', 'Buenos Aires',150);

'CREATE STATEMENT'
/*21) Utilizando Create Statement duplicar la tabla Alumnos.Analizar el código que se genera y responder: ¿Qué función cumple el Auto_increment de la última línea?'*/
CREATE TABLE alumnos_duplicada AS
SELECT * FROM alumnos;
/* "Auto_increment" sugiere que la tabla original "Alumnos" tiene una columna con autoincremento, 
que generalmente se utiliza para generar automáticamente valores únicos al agregar nuevos registros.
Si la tabla "Alumnos" tiene una columna autoincremental (por ejemplo, un ID), 
esta característica generará automáticamente nuevos valores incrementales para la columna autoincremental 
en la tabla "Alumnos_Duplicada". 
Esto asegura que los valores en esa columna sean únicos y se incrementen automáticamente cada vez que 
se inserta un nuevo registro en la tabla "Alumnos_Duplicada".*/


'LIMIT Y ORDER BY'
/*22) Obtener un ranking de las primeras 3 escuelas de mayor capacidad.*/

SELECT * FROM escuelas
ORDER BY capacidad DESC
LIMIT 3;

'FUNCIONES DE AGREGACIÓN Y AGRUPAMIENTO / USO DE IN'
/*23) Contar la cantidad de alumnos de la tabla homónima. Llamar a la columna “Cantidad de alumnos”.*/
SELECT COUNT(id) AS 'Cantidad de alumnos' FROM alumnos;

/*24) Repetir la consulta anterior consultando solamente cuya nota sea menor a 7.*/
SELECT COUNT(id) AS 'Cantidad de alumnos' FROM alumnos
WHERE nota<7;

SELECT * FROM alumnos;
SELECT * FROM escuelas;

/*25) Obtener la capacidad total de las escuelas de la provincia de Buenos Aires */
SELECT SUM(capacidad) AS 'Capacidad Total ("Buenos Aires")' FROM escuelas
WHERE provincia='Buenos Aires';/*LIKE*/ 
/*26) Repetir el ejercicio anterior pero solamente con las escuelas de Córdoba y Jujuy.*/
SELECT SUM(capacidad) AS 'Capacidad Total (Córdoba y Jujuy)' FROM escuelas
WHERE provincia IN ('Córdoba', 'Jujuy');/*OR*/

/*27) Obtener el promedio de notas de los alumnos aprobados con más de 7.*/
SELECT ROUND(AVG(nota),1) FROM alumnos
WHERE nota>7;

/*28) Obtener la capacidad máxima y la capacidad mínima de alumnos.*/
SELECT MAX(capacidad) AS 'Capacidad Máxima de alumnos',MIN(capacidad) AS 'Capacidad Minima de alumnos'
FROM escuelas;
/*29) Obtener el total de capacidad de las escuelas por provincia.*/
SELECT SUM(capacidad) AS 'Capacidad Total',provincia
FROM escuelas
GROUP BY provincia
ORDER BY provincia ASC;

/*30) Obtener la cantidad de alumnos por grado.*/
SELECT grado ,COUNT(grado) AS 'Alumnos por Grado'
FROM alumnos
GROUP BY grado
ORDER BY grado ASC;

'DIFERENCIAS ENTRE HAVING Y WHERE'
/*31) Comparar las diferencias entre el uso de WHERE y HAVING: Mostrar las escuelas y la nota máxima para cada una siempre y cuando sean mayores o iguales a 7.*/
'WHERE'
SELECT e.nombre AS escuela, MAX(a.nota) AS nota_maxima
FROM escuelas e INNER JOIN alumnos a 
ON e.id = a.id_escuela
WHERE a.nota >= 7
GROUP BY e.nombre;

'HAVING'
SELECT e.nombre AS escuela, MAX(a.nota) AS nota_maxima
FROM escuelas e INNER JOIN alumnos a
ON e.id = a.id_escuela
GROUP BY e.nombre
HAVING nota_maxima>=7;


'SUBCONSULTAS'
/*32) Mostrar la información de las escuelas cuyos alumnos tengan una nota igual a 10, utilizando una subconsulta.*/
SELECT *
FROM escuelas
WHERE id IN (SELECT id_escuela FROM alumnos WHERE nota = 10);



