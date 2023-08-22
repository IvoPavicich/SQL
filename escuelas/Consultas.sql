'SINTAXIS BÁSICA: SELECT…FROM + USO DE WHERE, AND, OR, BETWEEN'
/*1) Seleccionar todos los datos de la tabla alumnos:*/
SELECT * FROM alumnos;
SELECT * FROM escuelas;
/*2) Seleccionar solamente el legajo y el nombre de los alumnos:*/
SELECT legajo,nombre FROM alumnos;
/*3) Mostrar todos los datos de aquellos alumnos aprobados (con notas mayores o iguales a 7)*/
SELECT * FROM alumnos
WHERE nota >=7;
/*4) Mostrar el id y el nombre de aquellas escuelas cuya capacidad sea inferior a 200 (no mostrar la columna capacidad).*/
SELECT id,nombre FROM escuelas 
WHERE capacidad <200;
/*5) Mostrar el nombre y la nota de aquellos alumnos cuya nota se encuentre entre 8 y 10*/
SELECT nombre,nota FROM alumnos
WHERE nota>=8 AND nota <=10; 
/*6) Repetir el ejercicio anterior, utilizando BETWEEN*/
SELECT nombre,nota FROM alumnos
WHERE nota BETWEEN 8 AND 10; 
/*7)Mostrar el nombre, la localidad y la provincia de aquellas escuelas situadas en Buenos Aires o Jujuy*/
SELECT nombre,localidad,provincia FROM escuelas
WHERE provincia='Buenos Aires' OR provincia='Jujuy' ;

'SINTAXIS BÁSICA: SELECT…FROM + USO DE LIKE, NOT LIKE Y %'
/*8) Mostrar todos los datos de los alumnos llamados Pedro González*/
SELECT * FROM alumnos
WHERE nombre LIKE 'Pedro González'; 

/*9) Repetir el ejercicio anterior, pero con aquellos que no se llamen Pedro González*/
SELECT * FROM alumnos
WHERE nombre NOT LIKE 'Pedro González'; 

/*10) Mostrar todos los datos de los alumnos cuyo nombre comience con R*/
SELECT * FROM alumnos
WHERE nombre LIKE 'R%'; 

/*11) Mostrar todos los datos de los alumnos cuyo nombre termine con A*/
SELECT * FROM alumnos
WHERE nombre LIKE '%A';

/*12) Mostrar todos los datos de los alumnos cuyo nombre contenga una M'*/

SELECT * FROM alumnos
WHERE nombre LIKE '%M%';

'USOS DE JOIN Y ALIAS PARA TABLAS Y CAMPOS'
/*13) Mostrar el legajo, el nombre del alumno y el nombre de la escuela de todos los alumnos*/
SELECT alumnos.legajo,alumnos.nombre,escuelas.nombre 
FROM alumnos INNER JOIN escuelas 
ON alumnos.id_escuela=escuelas.id;

/*14) Modificar el ejercicio anterior utilizando alias de columnas de modo tal que los datos se muestren de esta manera:*/
SELECT alumnos.legajo AS 'Nro legajo',alumnos.nombre AS 'Nombre y Apellido', escuelas.nombre AS 'Escuela' 
FROM alumnos INNER JOIN escuelas 
ON alumnos.id_escuela=escuelas.id;

/*15) Mostrar todos los alumnos, tengan o no escuela asignada.*/
SELECT alumnos.legajo AS 'Nro legajo',alumnos.nombre AS 'Nombre y Apellido', escuelas.nombre AS 'Escuela' 
FROM alumnos LEFT JOIN escuelas
ON alumnos.id_escuela=escuelas.id;

/*16) Mostrar todas las escuelas con el nombre de cada alumno (aunque no tengan escuela asignada).*/
SELECT alumnos.nombre AS 'Nombre y Apellido', escuelas.nombre AS 'Escuela' 
FROM alumnos RIGHT JOIN escuelas
ON alumnos.id_escuela=escuelas.id;

'USO DE IS NULL / IS NOT NULL'
/*17) Mostrar todos los datos de los alumnos que tengan notas.*/
SELECT * FROM alumnos
WHERE nota IS NOT NULL;
SELECT * FROM alumnos
WHERE nota IS NULL;

