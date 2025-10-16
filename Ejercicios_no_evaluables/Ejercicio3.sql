/* 1. HAZ UNA CONSULTA QUE DEVUELVA CUANTOS EPISODIOS TIENEN CADA UNA DE LAS SERIES */

SELECT serie_id, COUNT(titulo) FROM episodios GROUP BY serie_id;

/* 2. HAZ UNA CONSULTA QUE DEVUELVA EL EPISODIO CON MAYOR DURACIÓN DE CADA UNA DE LAS SERIES */

SELECT serie_id, MAX(duracion) FROM episodios GROUP BY serie_id;

/* 3. ESCRIBE UNA CONSULTA QUE DEVUELVA CUANTAS SERIES FUERON LANZADAS EN CADA AÑO */

SELECT año_lanzamiento, COUNT(serie_id) FROM series GROUP BY año_lanzamiento;

/* 4. ESCRIBE UNA CONSULTA SQL QUE SUME LA DURACIÓN TOTAL DE LOS EPISODIOS DE LAS TEMPORADAS DONDE LA DURACIÓN TOTAL SUPERE LOS 400 MINUTOS UNICAMENTE DE LA SERIE 2 */

SELECT temporada, SUM(duracion) 
FROM episodios 
WHERE serie_id = 2 
GROUP BY temporada
HAVING SUM(duracion) > 400;

/* 5. ESCRIBE UNA CONSULTA SQL QUE DEVUELVA LAS MEDIAS DE LAS SERIES 2 Y 3 ÚNICAMENTE EN LAS TEMPORADAS 1 Y 2(cada una) 
y siempre y cuando igualen o superen el 9 de media
*/

SELECT serie_id, temporada , AVG(rating_imdb) 
FROM episodios 
WHERE (temporada = 1 OR temporada = 2)
AND (serie_id = 1 OR serie_id = 2)
GROUP BY serie_id, temporada
HAVING AVG(rating_imdb) >= 9;