/* Ejercicio 1
Objetivo: Obtener el número total de episodios por cada serie.*/

SELECT serie_id, COUNT(titulo) AS total_episodios FROM episodios GROUP BY serie_id;

/* Ejercicio 2
Objetivo: Calcular la duración promedio de los episodios de cada serie. */

SELECT serie_id, AVG(duracion) media_duracion_episodios FROM episodios GROUP BY serie_id;

/* Ejercicio 3
Objetivo: Contar cuántos actores diferentes han participado en cada serie. */

SELECT serie_id, COUNT(actor_id) AS actores_diferentes FROM actuaciones GROUP BY serie_id;

/* Ejercicio 4
Objetivo: Encontrar el episodio más largo y el más corto por cada serie. */

SELECT serie_id, MAX(duracion) AS episodio_mas_largo, MIN(duracion) AS episodio_mas_corto 
FROM episodios 
GROUP BY serie_id;

/* Ejercicio 5
Objetivo: Obtener el rating promedio de IMDB por temporada de cada serie. */

SELECT serie_id, temporada, AVG(rating_imdb) AS ranking_medio FROM episodios GROUP BY serie_id, temporada ORDER BY serie_id, temporada;

/* Ejercicio 6
Objetivo: Contar cuántos episodios hay en cada temporada de cada serie. */

SELECT serie_id, temporada, COUNT(titulo) AS cantidad_episodios FROM episodios GROUP BY serie_id, temporada ORDER BY serie_id, temporada;

/* Ejercicio 7
Objetivo: Calcular la duración total de episodios por cada serie. */

SELECT serie_id, SUM(duracion) AS duracion_total FROM episodios GROUP BY serie_id;

/* Ejercicio 8
Objetivo: Contar cuántas series hay de cada género. */

SELECT genero, COUNT(serie_id) AS series_totales FROM series GROUP BY genero;

/* Ejercicio 9
Objetivo: Encontrar cuántos personajes diferentes ha interpretado cada actor. */

SELECT actor_id, COUNT(personaje) FROM actuaciones GROUP BY actor_id;

/* Ejercicio 10
Objetivo: Obtener el año de lanzamiento y contar cuántas series se lanzaron en cada año. */

SELECT año_lanzamiento, COUNT(titulo) AS series_emitidas FROM series GROUP BY año_lanzamiento;

/* Ejercicio 11
Objetivo: Calcular la duración total y promedio de episodios por temporada. */

SELECT serie_id, temporada, SUM(duracion), AVG(duracion) FROM episodios GROUP BY serie_id, temporada;

/* Ejercicio 12
Objetivo: Identificar las temporadas que tienen un rating IMDB mínimo superior a 8. */

SELECT serie_id, temporada, AVG(rating_imdb) AS media_rating FROM episodios GROUP BY serie_id, temporada HAVING media_rating > 8;

/* Ejercicio 13
Objetivo: Contar cuántas series hay por cada combinación de género y año de lanzamiento. */

SELECT genero, año_lanzamiento, COUNT(*) AS cantidad_serie FROM series GROUP BY genero, año_lanzamiento;

/* Ejercicio 14
Objetivo: Encontrar el rating máximo de cada serie. */

SELECT serie_id, MAX(rating_imdb) AS maximo_valor FROM episodios GROUP BY serie_id;

/* Ejercicio 15
Objetivo: Contar cuántas actuaciones tiene cada actor en total. */

SELECT actor_id, COUNT(*) FROM actuaciones GROUP BY actor_id;

/* EJERCICIO 16
	¿ Quien es el actor o actriz que ha participado en la mayor cantidad de series ?
*/

SELECT actor_id, COUNT(*) FROM actuaciones GROUP BY actor_id ORDER BY COUNT(*) DESC LIMIT 1;