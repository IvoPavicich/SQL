SELECT * FROM artista;
ALTER TABLE temas DROP CONSTRAINT temas_ibfk_1;
UPDATE artista SET nombre='Beyonce' WHERE id_artista=1;

DELETE FROM artistas WHERE nombre='Prince';