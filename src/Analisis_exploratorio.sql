--Conteo total tuplas
SELECT COUNT(*) as conteo_jugadores
FROM raw.jugadores;

----Consultar si id es valor único
SELECT id, COUNT(*)
FROM raw.jugadores
GROUP BY id
HAVING COUNT(*)>1;

----Consultar si nombre_jugador es único
SELECT nombre_jugador, COUNT(*)
FROM raw.jugadores
GROUP BY nombre_jugador
HAVING COUNT(*)>1;

----Consultar abreviacion equipo es único
SELECT abreviacion_equipo, COUNT(*)
FROM raw.jugadores
GROUP BY abreviacion_equipo
HAVING COUNT(*)>1;

--Min y max de años de drafteo
SELECT MIN(anio_drafteo::BIGINT) as anio_min_drafteo, MAX(anio_drafteo::BIGINT) as anio_maximo_drafteo
FROM raw.jugadores
WHERE anio_drafteo != 'Undrafted';

--Min y max años temporadas
SELECT Min(SUBSTRING(temporada, 1, 4)::BIGINT) as temporada_min, MAX(SUBSTRING(temporada, 1, 4)::BIGINT) as temporada_max 
FROM raw.jugadores;

-- Min, max  y promedio edad
SELECT MIN(edad) as min_edad, MAX(edad) as max_edad, AVG(edad) as promedio_edad
from raw.jugadores;

-- Min, max  y promedio estatura
SELECT MIN(estatura) as min_estatura, MAX(estatura) as max_estatura, AVG(estatura) as promedio_estatura
FROM raw.jugadores;

-- Min, max  y promedio peso 
SELECT MIN(peso) as min_peso, MAX(peso) as max_peso, AVG(peso) as promedio_peso
FROM raw.jugadores;

-- Min, max  y promedio partidos jugados temporada
SELECT MIN(partidos_jugados_temporada) as min_partidos_jugados, MAX(partidos_jugados_temporada) as max_partidos_jugados, AVG(partidos_jugados_temporada) as promedio_partidos_jugados
FROM raw.jugadores;

-- Min, max  y promedio promedio puntos
SELECT MIN(promedio_puntos) as min_promedio_puntos, MAX(promedio_puntos) as max_promedio_puntos, AVG(promedio_puntos) as promedio_promedio_puntos
FROM raw.jugadores;

-- Min, max  y promedio promedio asistencias
SELECT MIN(promedio_asistencias) as min_promedio_asist, MAX(promedio_asistencias) as max_promedio_asist, AVG(promedio_asistencias) as promedio_pormedio_asist
FROM raw.jugadores;

-- Min, max  y promedio promedio rebotes
SELECT MIN(promedio_rebotes) as min_promedio_reb, MAX(promedio_rebotes) as max_promedio_reb, AVG(promedio_rebotes) as promedio_promedio_rebot
FROM raw.jugadores;

-- Min, max  y promedio dif puntos x 100 posesiones
SELECT MIN(difpuntosx100_posesiones_en_cancha) as min_dif_puntos, MAX(difpuntosx100_posesiones_en_cancha) as max_dif_puntos, AVG(difpuntosx100_posesiones_en_cancha) as promedio_difpuntos_posesiones
FROM raw.jugadores;

--- Min, max  y promedio porcentaje rebotes ofensivos
SELECT MIN(porcentaje_rebotes_ofen_de_posibles) as min_porcen_reb_of, MAX(porcentaje_rebotes_ofen_de_posibles) as max_porcen_reb_of, AVG(porcentaje_rebotes_ofen_de_posibles) as promedio_reb_of
FROM raw.jugadores;

-- Min, max  y promedio porcentaje rebotes defensivos
SELECT MIN(porcentaje_rebotes_defen_de_posibles) as min_porcen_reb_def, MAX(porcentaje_rebotes_ofen_de_posibles) as max_porcen_reb_def, AVG(porcentaje_rebotes_defen_de_posibles) as promedio_reb_def
FROM raw.jugadores;

-- Min, max  y promedio porcentaje participacion
SELECT MIN(porcentaje_participacion_jugadas) as min_participacion, MAX(porcentaje_participacion_jugadas) as max_participacion, AVG(porcentaje_participacion_jugadas) as promedio_porcentaje_part
FROM raw.jugadores;

-- Min, max  y promedio eficiencia tiro
SELECT MIN(eficiencia_tiro) as min_eficiencia_tiro, MAX(eficiencia_tiro) as max_eficiencia_tiro, AVG(eficiencia_tiro) as promedio_eficiencia_tiro
FROM raw.jugadores;

-- Min, max  y promedio porcentaje asistencas
SELECT MIN(porcentaje_asistencias) as min_por_asist, MAX(porcentaje_asistencias) as max_por_asist, AVG(porcentaje_asistencias) as promedio_porcentaje_asist
FROM raw.jugadores;

--Conteo valores nulos nombre
SELECT COUNT(*) as valores_nulos_nombre
FROM raw.jugadores
WHERE nombre_jugador is NULL;

--Conteo valores nulos equipo
SELECT COUNT(*) as valores_nulos_equipo
FROM raw.jugadores
WHERE abreviacion_equipo is NULL;

--Conteo valores nulos edad
SELECT COUNT(*) as valores_nulos_edad
FROM raw.jugadores
WHERE edad is NULL;

--Conteo valores nulos estatura
SELECT COUNT(*) as valores_nulos_estatura
FROM raw.jugadores
WHERE estatura is NULL;

--Conteo valores nulos peso
SELECT COUNT(*) as valores_nulos_peso
FROM raw.jugadores
WHERE peso is NULL;

--Conteo valores nulos universidad
SELECT COUNT(*) as valores_nulos_universidad
FROM raw.jugadores
WHERE universidad is NULL;

--Conteo valores nulos pais_nac
SELECT COUNT(*) as valores_nulos_pais_nac
FROM raw.jugadores
WHERE pais_nacimiento is NULL;

--Conteo valores nulos anio drafteo
SELECT COUNT(*) as valores_nulos_anio_drafteo
FROM raw.jugadores
WHERE anio_drafteo is NULL or anio_drafteo ILIKE 'Undrafted';

--Conteo valores nulos ronda drafteo
SELECT COUNT(*) as valores_nulos_ronda_drafteo
FROM raw.jugadores
WHERE ronda_drafteo is NULL or ronda_drafteo ILIKE 'Undrafted';

--Conteo valores nulos pick dentro ronda
SELECT COUNT(*) as valores_nulos_pick_dentro_ronda
FROM raw.jugadores
WHERE pick_dentro_ronda is NULL or pick_dentro_ronda ILIKE 'Undrafted';

--Conteo valores nulos partidos jugados
SELECT COUNT(*) as valores_nulos_partidos_jugados
FROM raw.jugadores
WHERE partidos_jugados_temporada IS NULL;

--Conteo valores nulos promedio puntos
SELECT COUNT(*) as valores_nulos_promedio_puntos
FROM raw.jugadores
WHERE promedio_puntos IS NULL;

--Conteo valores nulos promedio rebotes
SELECT COUNT(*) as valores_nulos_promedio_reb
FROM raw.jugadores
WHERE  promedio_rebotes IS NULL;


--Conteo valores nulos promedio asist
SELECT COUNT(*) as valores_nulos_promedio_asist
FROM raw.jugadores
WHERE  promedio_asistencias IS NULL;


--Conteo valores nulos promedio rebotes
SELECT COUNT(*) as valores_nulos_partidos_jugados
FROM raw.jugadores
WHERE  partidos_jugados_temporada IS NULL;


--Conteo valores nulos promedio dif puntos
SELECT COUNT(*) as valores_nulos_dif_puntos
FROM raw.jugadores
WHERE  difpuntosx100_posesiones_en_cancha IS NULL;


--Conteo valores nulos porcentaje reb of
SELECT COUNT(*) as valores_nulos_porcentaje_reb_of
FROM raw.jugadores
WHERE porcentaje_rebotes_ofen_de_posibles IS NULL;


--Conteo valores nulos porcentaje reb def
SELECT COUNT(*) as valores_nulos_porcentaje_reb_def
FROM raw.jugadores
WHERE porcentaje_rebotes_defen_de_posibles IS NULL;

--Conteo valores nulos porcentaje part juga
SELECT COUNT(*) as valores_nulos_porcentaje_part_jugad
FROM raw.jugadores
WHERE porcentaje_participacion_jugadas IS NULL;

--Conteo valores nulos eficiencia tiro
SELECT COUNT(*) as valores_nulos_eficiencia_tiro
FROM raw.jugadores
WHERE eficiencia_tiro IS NULL;

--Conteo valores nulos porcentaje asist
SELECT COUNT(*) as valores_nulos_porcentaje_asist
FROM raw.jugadores
WHERE porcentaje_asistencias IS NULL;

--Valores repetidos atributo categórico
SELECT nombre_jugador, COUNT(nombre_jugador)
FROM raw.jugadores
GROUP BY nombre_jugador;









