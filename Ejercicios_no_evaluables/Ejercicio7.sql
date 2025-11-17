
/*1.  Muestra el título y año de lanzamiento de las series que se estrenaron después del año promedio de lanzamiento de todas las series.*/


SELECT s.titulo, s.año_lanzamiento
FROM series s
WHERE s.año_lanzamiento > ( /* Selecciono la media de los años de lanzamiento de las series */
	SELECT AVG(s.año_lanzamiento)
	FROM series s
);




/*2.  Encuentra los episodios que tienen un rating en IMDB superior al rating promedio de todos los episodios.*/

SELECT * 
FROM episodios e
WHERE e.rating_imdb > ( /* Selecciono la media del rating_imdb de todos los episodios */
	SELECT AVG(rating_imdb) 
    FROM episodios e
);





/*3.  Muestra todas las series que son del mismo género que la serie "Breaking Bad"*/

SELECT s.titulo, s.genero
FROM series s
WHERE s.genero IN ( /* Selecciono todas las series del género breaking bad */

	SELECT genero 
	FROM series s 
	WHERE s.titulo  = 'Breaking bad'

);



/*4.  Lista los nombres de los actores que nacieron después del año 1990. */

SELECT a.nombre, a.fecha_nacimiento
FROM actores a
WHERE YEAR(a.fecha_nacimiento) > 1990;

/*5. Muestra las series que tienen más episodios que el promedio de episodios por serie. */

SELECT s.serie_id, count(e.titulo), s.titulo
FROM series s
INNER JOIN episodios e
ON s.serie_id = e.serie_id
GROUP BY s.serie_id
HAVING count(e.titulo)  > ( /* Selecciono la media de episodios por serie */
	SELECT AVG(cuenta_episodios)
	FROM( /* Selecciono la cantidad de episodios por cada serie */
        SELECT count(e.titulo) AS cuenta_episodios
        FROM episodios e
        GROUP BY serie_id
    ) AS episodios_por_serie
);

/*6.  Encuentra los episodios cuya duración es mayor al promedio de duración, pero solo de series que sean del género "Acción".*/

SELECT e.titulo, e.duracion, e.serie_id, s.titulo
FROM episodios e
INNER JOIN series s
ON e.serie_id = s.serie_id
WHERE e.duracion > ( /* Selecciono la media de duración de los episodios */

	SELECT avg(e.duracion)
	FROM episodios e

)
AND s.serie_id IN ( /* Selecciono todas las series que su género sea drama */

	SELECT s.serie_id
    FROM series s
    WHERE s.genero = 'drama'

);



/*7.  Muestra los nombres de los actores que han actuado en más series que el promedio de series por actor.*/

SELECT a.actor_id, a.nombre, COUNT(actu.actor_id)
FROM actores a
INNER JOIN actuaciones actu
on a.actor_id = actu.actor_id
INNER JOIN series s
ON actu.serie_id = s.serie_id
GROUP BY a.actor_id, a.nombre
HAVING COUNT(actu.actor_id) > ( /*Selecciono la media de veces que aparece cada actor en cada serie.*/

	SELECT AVG(total_actores) 
    FROM ( /* Selecciono la cantidad de veces que aparece cada actor en alguna serie. */
    
		SELECT COUNT(actu.actor_id) AS total_Actores
        FROM actuaciones actu
        GROUP BY actu.actor_id
    
    ) AS media_actores

);

/*8.  Lista las series donde NINGUNO de sus episodios tiene un rating inferior a 7.0 en IMDB.*/

SELECT s.titulo, s.serie_id
FROM series s
WHERE s.serie_id NOT IN( /* Selecciono los episodios que tienen un rating inferior a 7 */

	SELECT e.serie_id
    FROM episodios e
    WHERE e.rating_imdb < 7

);



/*9.  Muestra los nombres de los actores que han participado en series cuyo rating promedio de episodios es superior al rating promedio general de todos los episodios de todas las series. */



SELECT a.nombre, s.titulo
FROM actores a
INNER JOIN actuaciones actu
ON a.actor_id = actu.actor_id
INNER JOIN series s
ON actu.serie_id = s.serie_id
WHERE s.serie_id IN (  /* Agrupo por serie_id de episodio.*/

		SELECT e.serie_id
		FROM episodios e
		GROUP BY e.serie_id
		HAVING AVG(e.rating_imdb) > ( /* Selecciono la media de rating de todas las series */

			SELECT AVG(media_series)
			FROM ( /* Selecciono la media de rating por cada serie */

				select e.serie_id, AVG(rating_imdb) AS media_series
				FROM episodios e
				GROUP BY e.serie_id

			) as resultado
			
		)

);

/*10. Encuentra los episodios de temporadas específicas cuya duración promedio por episodio en esa temporada es mayor que la duración promedio de TODOS los episodios de su propia serie.*/



SELECT 
    e.serie_id,
    e.episodio_id,
    e.titulo,
    e.temporada,
    t.avg_temporada,
    s.avg_serie
FROM Episodios e
JOIN ( /* Selecciono la media de cada temporada de cada serie */
    SELECT serie_id, temporada, AVG(duracion) AS avg_temporada
    FROM Episodios
    GROUP BY serie_id, temporada
) t ON e.serie_id = t.serie_id AND e.temporada = t.temporada
JOIN ( /* Selecciono la media duración de cada una de las series */
    SELECT serie_id, AVG(duracion) AS avg_serie
    FROM Episodios
    GROUP BY serie_id
) s ON e.serie_id = s.serie_id
WHERE t.avg_temporada > s.avg_serie
ORDER BY e.serie_id, e.temporada, e.episodio_id;





