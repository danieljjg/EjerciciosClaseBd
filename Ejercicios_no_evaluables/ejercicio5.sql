/* 1. Mostrar el titulo de los episodios y su duración de la serie Breaking Bad. */

SELECT e.titulo, e.duracion, s.titulo AS nombre_serie
FROM episodios e
INNER JOIN series s
ON e.serie_id = s.serie_id
WHERE s.titulo = 'Breaking bad';

/* 2. Muestra los personajes que interpretan cada actor y a que serie pertenecen. */

SELECT ac.nombre, actu.personaje, s.titulo
FROM actores ac
INNER JOIN actuaciones actu
ON ac.actor_id = actu.actor_id
INNER JOIN series s
ON actu.serie_id = s.serie_id;

/* 3. Muestrame el título de todos los episodios de Stranger Things de la temporada 1.*/

SELECT e.titulo, s.titulo AS nombre_serie, e.temporada
FROM episodios e
INNER JOIN series s
ON e.serie_id = s.serie_id
WHERE s.titulo = 'Stranger Things'
AND e.temporada = 1;

/* 4. Mostrar todos los episodios qe pertenezcan a una serie de ciencia ficción.*/
SELECT e.titulo AS capitulo, s.genero, s.titulo AS titulo_serie
FROM episodios e
JOIN series s
ON s.serie_id = e.serie_id
WHERE s.genero = 'ciencia ficción';

/* 5. Obtener que personaje interpreta cada actor en la serie THE CROWN*/
SELECT a.nombre , ac.personaje , s.titulo
FROM actores a 
INNER JOIN actuaciones ac 
ON a.actor_id = ac.actor_id
INNER JOIN series s
ON s.serie_id = ac.serie_id
WHERE s.titulo = 'The Crown';

/* 6. Muestrame los personajes y que actor lo interpreta de todos los episodios que tengan más de 9,5 de rating*/
SELECT actu.personaje, ac.nombre AS actor, e.titulo AS titulo_episodio, s.titulo AS titulo_serie, e.rating_imdb
FROM actuaciones actu
INNER JOIN actores ac
ON actu.actor_id = ac.actor_id
INNER JOIN episodios e
ON actu.serie_id = e.serie_id
INNER JOIN series s
ON e.serie_id = s.serie_id
WHERE e.rating_imdb > 9.5;

/* 7. Obten las series lanzadas después del 2015 las cuales tengan actores nacidos después de 1990.*/

SELECT s.titulo, s.año_lanzamiento, a.nombre, a.fecha_nacimiento
FROM series s
INNER JOIN actuaciones actu
ON s.serie_id = actu.serie_id
INNER JOIN actores a
ON actu.actor_id = a.actor_id
WHERE s.año_lanzamiento > 2015
AND YEAR(a.fecha_nacimiento) > 1990;

/* 8. Muestrame que episodios y que actores actúan en ellos de las series que sean del género drama histornico. Los episodios a mostrar deben de tener una duración superior a 55 minutos*/

SELECT e.titulo, ac.nombre, s.titulo AS 'nombre_serie', s.genero
FROM episodios e
INNER JOIN series s
ON e.serie_id = s.serie_id
INNER JOIN actuaciones actu
ON s.serie_id = actu.serie_id
INNER JOIN actores ac
ON actu.actor_id = ac.actor_id
WHERE e.duracion > 55
AND s.genero = 'drama historico';


/* 9. Quiero ver las series que se estrenaron entre 2010 y 2020, que tengan capítulos de más de una hora y con una puntuación mayor a 8.5. Además, quiero saber qué actor interpreta a cada personaje*/

SELECT s.titulo AS 'nombre serie', s.año_lanzamiento, e.titulo AS 'nombre episodio', e.duracion, e.rating_imdb, ac.nombre, actu.personaje
FROM episodios e
INNER JOIN series s
ON e.serie_id = s.serie_id
INNER JOIN actuaciones actu
ON s.serie_id = actu.serie_id
INNER JOIN actores ac
ON actu.actor_id = ac.actor_id
WHERE s.año_lanzamiento BETWEEN 2010 AND 2020
AND e.duracion > 60
AND e.rating_imdb > 8.5;



/* 10. Encontrar información completa de actores que trabajan en series de diferentes géneros, mostrando solo episodios con rating superior a 9.0, incluyendo datos de la serie, episodio, temporada y fecha de estreno*/
/* NO HACE FALTA*/

