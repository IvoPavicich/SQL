SELECT artista.nombre, artista.id_artista, tema.id_artista, tema.nombre_tema
FROM `artista`
RIGHT JOIN `tema`
ON artista.id_artista = tema.id_artista;