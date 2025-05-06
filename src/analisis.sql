
-- Consultar que porcentaje de jugadores de la NBA viene de cada Universidad
with cte_num_jugadores_por_universidad as(
SELECT  jugadores.universidad_id, COUNT(*) as num_jugadores_universidad
FROM normalizacion.jugadores
LEFT JOIN normalizacion.universidades ON jugadores.universidad_id = universidades.id
GROUP BY universidad_id
ORDER BY num_jugadores_universidad DESC)

SELECT id, universidad, num_jugadores_universidad, (num_jugadores_universidad/(SELECT COUNT(*) FROM normalizacion.jugadores)::REAL)*100 as porcentaje_jugadores_origen
FROM normalizacion.universidades
LEFT JOIN cte_num_jugadores_por_universidad ON normalizacion.universidades.id = cte_num_jugadores_por_universidad.universidad_id
ORDER BY num_jugadores_universidad DESC;

--- Consultar que porcentaje de jugadores de la NBA viene de cada pais

with cte_num_jugadores_por_pais AS(
SELECT  jugadores.pais_nacimiento_id, COUNT(*) as num_jugadores_pais
FROM normalizacion.jugadores
LEFT JOIN normalizacion.paises_nacimiento ON jugadores.pais_nacimiento_id = paises_nacimiento.id
GROUP BY pais_nacimiento_id
ORDER BY num_jugadores_pais DESC)

SELECT id, pais_nacimiento, num_jugadores_pais, (num_jugadores_pais/(SELECT COUNT(*) FROM normalizacion.jugadores)::REAL)*100 as porcentaje_jugadores_origen
FROM normalizacion.paises_nacimiento
LEFT JOIN cte_num_jugadores_por_pais ON normalizacion.paises_nacimiento.id = cte_num_jugadores_por_pais.pais_nacimiento_id
ORDER BY num_jugadores_pais DESC;

-- Consultar 3 maximos anotadores de puntos desde 1996-2022
with cte_puntos_por_jugador as (
SELECT jugador_id, SUM(promedio_puntos*partidos_jugados_temporada) as puntos_totales_en_todas_temporadas
FROM normalizacion.estadisticas_jugador_temporada
LEFT JOIN normalizacion.jugadores ON normalizacion.jugadores.id = normalizacion.estadisticas_jugador_temporada.jugador_id
GROUP BY jugador_id
ORDER BY puntos_totales_en_todas_temporadas DESC)

SELECT nombre_jugador, puntos_totales_en_todas_temporadas:: INTEGER
FROM normalizacion.jugadores
LEFT JOIN cte_puntos_por_jugador ON jugadores.id = cte_puntos_por_jugador.jugador_id
ORDER BY puntos_totales_en_todas_temporadas DESC
LIMIT 3;

-- Consultar jugadores con 0 puntos anotados desde 1996-2022
with cte_puntos_por_jugador as (
SELECT jugador_id, SUM(promedio_puntos*partidos_jugados_temporada) as puntos_totales_en_todas_temporadas
FROM normalizacion.estadisticas_jugador_temporada
LEFT JOIN normalizacion.jugadores ON normalizacion.jugadores.id = normalizacion.estadisticas_jugador_temporada.jugador_id
GROUP BY jugador_id
ORDER BY puntos_totales_en_todas_temporadas DESC)

SELECT nombre_jugador, puntos_totales_en_todas_temporadas:: INTEGER
FROM normalizacion.jugadores
LEFT JOIN cte_puntos_por_jugador ON jugadores.id = cte_puntos_por_jugador.jugador_id
WHERE puntos_totales_en_todas_temporadas =0;

-- Consultar 3 maximos asistidores desde 1996-2022
with cte_asistencias_por_jugador as (
SELECT jugador_id, SUM(promedio_asistencias*partidos_jugados_temporada) as asistencias_totales_en_todas_temporadas
FROM normalizacion.estadisticas_jugador_temporada
LEFT JOIN normalizacion.jugadores ON normalizacion.jugadores.id = normalizacion.estadisticas_jugador_temporada.jugador_id
GROUP BY jugador_id
ORDER BY asistencias_totales_en_todas_temporadas DESC)

SELECT nombre_jugador, asistencias_totales_en_todas_temporadas:: INTEGER
FROM normalizacion.jugadores
LEFT JOIN cte_asistencias_por_jugador ON jugadores.id = cte_asistencias_por_jugador.jugador_id
ORDER BY asistencias_totales_en_todas_temporadas DESC
LIMIT 3;

-- Consultar 3 maximos reboteros desde 1996-2022
with cte_rebotes_por_jugador as (
SELECT jugador_id, SUM(promedio_rebotes*partidos_jugados_temporada) as rebotes_totales_en_todas_temporadas
FROM normalizacion.estadisticas_jugador_temporada
LEFT JOIN normalizacion.jugadores ON normalizacion.jugadores.id = normalizacion.estadisticas_jugador_temporada.jugador_id
GROUP BY jugador_id
ORDER BY rebotes_totales_en_todas_temporadas DESC)

SELECT nombre_jugador, rebotes_totales_en_todas_temporadas:: INTEGER
FROM normalizacion.jugadores
LEFT JOIN cte_rebotes_por_jugador ON jugadores.id = cte_rebotes_por_jugador.jugador_id
ORDER BY rebotes_totales_en_todas_temporadas DESC
LIMIT 3;

-- Consultar 3 jugadores con mayor cantidad de partidos desde 1996-2022
with cte_partidos_por_jugador as (
SELECT jugador_id, SUM(partidos_jugados_temporada) as partidos_totales_en_todas_temporadas
FROM normalizacion.estadisticas_jugador_temporada
LEFT JOIN normalizacion.jugadores ON normalizacion.jugadores.id = normalizacion.estadisticas_jugador_temporada.jugador_id
GROUP BY jugador_id
ORDER BY partidos_totales_en_todas_temporadas DESC)

SELECT nombre_jugador, partidos_totales_en_todas_temporadas:: INTEGER
FROM normalizacion.jugadores
LEFT JOIN cte_partidos_por_jugador ON jugadores.id = cte_partidos_por_jugador.jugador_id
ORDER BY partidos_totales_en_todas_temporadas DESC
LIMIT 3;

-- Consultar jugadores con mayor eficiencia de tiro despues de 20 partidos por lo menos
SELECT nombre_jugador, eficiencia_tiro
FROM normalizacion.estadisticas_jugador_temporada
LEFT JOIN normalizacion.jugadores on jugadores.id = estadisticas_jugador_temporada.jugador_id
WHERE partidos_jugados_temporada > 20
ORDER BY eficiencia_tiro DESC;

--Jugador más pesado

SELECT nombre_jugador, peso
FROM normalizacion.estadisticas_jugador_temporada
JOIN normalizacion.jugadores ON estadisticas_jugador_temporada.jugador_id=jugadores.id
WHERE peso = (SELECT MAX(peso) FROM normalizacion.estadisticas_jugador_temporada);

--Jugador más delgado
SELECT nombre_jugador, peso
FROM normalizacion.estadisticas_jugador_temporada
JOIN normalizacion.jugadores ON estadisticas_jugador_temporada.jugador_id=jugadores.id
WHERE peso = (SELECT MIN(peso) FROM normalizacion.estadisticas_jugador_temporada);

--Jugador más alto
SELECT nombre_jugador, estatura
FROM normalizacion.estadisticas_jugador_temporada
JOIN normalizacion.jugadores ON estadisticas_jugador_temporada.jugador_id=jugadores.id
WHERE estatura = (SELECT MAX(estatura) FROM normalizacion.estadisticas_jugador_temporada)
LIMIT 1;

--Jugador más pequeño
SELECT nombre_jugador, estatura
FROM normalizacion.estadisticas_jugador_temporada
JOIN normalizacion.jugadores ON estadisticas_jugador_temporada.jugador_id=jugadores.id
WHERE estatura = (SELECT MIN(estatura) FROM normalizacion.estadisticas_jugador_temporada)
LIMIT 1;

--Jugador más viejo
SELECT nombre_jugador, edad
FROM normalizacion.estadisticas_jugador_temporada
JOIN normalizacion.jugadores ON estadisticas_jugador_temporada.jugador_id=jugadores.id
WHERE edad = (SELECT MAX(edad) FROM normalizacion.estadisticas_jugador_temporada);

--Jugador más jóven
SELECT nombre_jugador, edad
FROM normalizacion.estadisticas_jugador_temporada
JOIN normalizacion.jugadores ON estadisticas_jugador_temporada.jugador_id=jugadores.id
WHERE edad = (SELECT MIN(edad) FROM normalizacion.estadisticas_jugador_temporada);





