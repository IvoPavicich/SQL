/*A.  Listar todos los registros de la tabla, visualizando las columnas type, title_content, country, rating, duration, listed_in.*/
USE netflix;
SELECT type,title_content, country, rating, duration, listed_in
FROM content;

SELECT * FROM content;
/*B.  Mostrar todas las filas de la tabla, presentando las columnas id_content, title_production, genre, runtime, imdb_Score.*/

SELECT id_content, title_production, genre, runtime, imdb_score FROM production;

/*C.  Generar un listado de todas las películas en las que participe Argentina, mostrando las columnas id_content, type, title_content, director, cast, rating, duration, listed_in.*/
SELECT id_content,type, title_content, director, cast, rating, duration, listed_in 
FROM content
WHERE type LIKE 'Movie' AND country LIKE 'Argentina';

/*D.  Presentar un listado con las columnas id_production, title_production, genre, language, imdb_score de los registros de la tabla en las que el imdb_score sea superior a 7.5.*/
SELECT id_production, title_production, genre, language, imdb_score
FROM production
WHERE imdb_score > 7.5;

/*E.  Mostrar las columnas id_content, type, title_content, listed_in de los registros en los que el rating público general o admitido para todas las edades.*/
SELECT id_content, type, title_content, listed_in, rating FROM content
WHERE rating LIKE 'G';

/*F.  Obtener una lista con las columnas id_production, title_production, genre de los registros en que duration sea menor o igual a 105 minutos pero que además tenga una duración de al menos 60 minutos.*/
SELECT id_production, title_production, genre,runtime AS duration
FROM production
WHERE runtime BETWEEN 60 AND 105;

/*G.  Obtener la cantidad de registros discriminando por type y rating, ordenados alfabéticamente por rating y por type.*/

SELECT type, rating, COUNT(title_content) AS cantidad_registros
FROM content
WHERE rating IS NOT NULL
GROUP BY type, rating
ORDER BY type,rating;

SELECT DISTINCT rating FROM content;


/*H.  Mostrar la cantidad  de películas en los idiomas portugués, francés, alemán, italiano y español, ordenados por cantidad, de mayor a menor.*/

SELECT language AS Idioma, COUNT(*) AS cantidad_peliculas
FROM production
WHERE language IN ('Portuguese', 'French', 'German', 'Italian', 'Spanish')
GROUP BY language
ORDER BY cantidad_peliculas DESC;

DESCRIBE content;

SELECT COUNT(*) AS numero_columnas
FROM information_schema.columns
WHERE table_name = 'production';
SELECT COUNT(*) AS numero_filas
FROM production;


SELECT COUNT(*) FROM production WHERE id_content NOT NULL;

SELECT COUNT(*) AS cantidad_nulos
FROM content
WHERE id_content IS NULL;

SELECT COUNT(*) AS cantidad_No_nulos
FROM content
WHERE release_year IS NOT NULL;

SELECT COUNT(DISTINCT description) AS cantidad_distintos
FROM content;

SELECT COUNT(*) AS cantidad_vacios
FROM content
WHERE  id_content =' ';

SELECT * FROM content;


/*Clase*/
/*SELECT TABLE_NAME, COUNT(COLUMN_NAME) AS 'Cantidad de columnas'
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'netflix'
GROUP BY TABLE_NAME;
 
SELECT COUNT(*) AS 'Nota Valores' 
FROM alumnos 
WHERE nota IS NOT NULL;

SELECT COUNT(*) AS 'Cantidad de Filas' FROM alumnos;

SELECT COUNT(*) AS 'Nota Null' 
FROM alumnos 
WHERE nota IS NULL;

SELECT COUNT(DISTINCT nota) FROM alumnos;

SELECT COUNT(DISTINCT nota) FROM alumnos WHERE nota IS NOT NULL;

SELECT COUNT(email) AS 'Email vacios' FROM alumnos WHERE email LIKE '';*/