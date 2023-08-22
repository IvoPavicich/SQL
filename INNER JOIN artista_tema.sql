SELECT artista.nombre, artista.id_artista, tema.id_artista, tema.nombre_tema
FROM `artista`
INNER JOIN `tema`
ON artista.id_artista = tema.id_artista;
