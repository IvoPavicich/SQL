USE db_prueba;

'ALTER TABLE temas DROP CONSTRAINT temas_ibfk_1;  desenganchar las tablas para poder eliminar' 

CREATE TABLE artistas(
  id_artista INTEGER PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL
);


CREATE TABLE temas (
  id_tema INTEGER PRIMARY KEY,
  nombre_tema VARCHAR(50) NOT NULL,
  id_artista INTEGER,
  FOREIGN KEY(id_artista) REFERENCES
  artistas(id_artista)
);

