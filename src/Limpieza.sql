----Crear esquema limpieza
DROP SCHEMA IF EXISTS limpieza;
CREATE SCHEMA IF NOT EXISTS limpieza;

----crear tabla con nuevas restricciones y tipos de atributos
DROP TABLE IF EXISTS limpieza.jugadores;
CREATE TABLE IF NOT EXISTS limpieza.jugadores (
	id bigserial PRIMARY KEY,
	nombre_jugador VARCHAR(100) NOT NULL,
	abreviacion_equipo VARCHAR(10) NOT NULL,
	edad SMALLINT NOT NULL CONSTRAINT edad_mayor_cero CHECK (edad>0),
	estatura REAL NOT NULL CONSTRAINT estatura_mayor_cero CHECK (estatura>0),
	peso REAL NOT NULL CONSTRAINT peso_mayor_cero CHECK (peso>0),
	universidad VARCHAR(100),
	pais_nacimiento VARCHAR(100) NOT NULL,
	anio_drafteo VARCHAR(100),
	ronda_drafteo VARCHAR(100),
	pick_dentro_ronda VARCHAR(100),
	partidos_jugados_temporada SMALLINT CONSTRAINT partidos_mayor_cero CHECK (partidos_jugados_temporada>=0),
	promedio_puntos REAL CONSTRAINT promedio_punt__mayor_cero CHECK (promedio_puntos>=0),
	promedio_rebotes REAL CONSTRAINT promedio_reb_mayor_cero CHECK (promedio_rebotes>=0),
	promedio_asistencias REAL CONSTRAINT promedio_asis_mayor_cero CHECK (promedio_asistencias>=0),
	difpuntosx100_posesiones_en_cancha REAL NOT NULL,
	porcentaje_rebotes_ofen_de_posibles REAL NOT NULL CONSTRAINT porcentaje_rebo_ofen CHECK (porcentaje_rebotes_ofen_de_posibles>=0 AND porcentaje_rebotes_ofen_de_posibles<=1),
	porcentaje_rebotes_defen_de_posibles REAL NOT NULL CONSTRAINT porcentaje_rebo_defen CHECK (porcentaje_rebotes_defen_de_posibles>=0 AND porcentaje_rebotes_defen_de_posibles<=1),
	porcentaje_participacion_jugadas REAL NOT NULL CONSTRAINT porcentaje_part_jugadas CHECK (porcentaje_participacion_jugadas>=0 AND porcentaje_participacion_jugadas<=1),
	eficiencia_tiro REAL NOT NULL,
	porcentaje_asistencias REAL not NULL CONSTRAINT porcentaje_asist CHECK (porcentaje_asistencias>=0 AND porcentaje_asistencias<=1),
	temporada VARCHAR(100)	
);

---Poblamos la tabla con datos de esquema raw
INSERT INTO limpieza.jugadores (nombre_jugador, abreviacion_equipo, edad, estatura, peso, universidad, pais_nacimiento, anio_drafteo, ronda_drafteo,pick_dentro_ronda, partidos_jugados_temporada, promedio_puntos, promedio_rebotes, promedio_asistencias, difpuntosx100_posesiones_en_cancha, porcentaje_rebotes_ofen_de_posibles, porcentaje_rebotes_defen_de_posibles, porcentaje_participacion_jugadas,eficiencia_tiro,porcentaje_asistencias,temporada) (SELECT nombre_jugador, abreviacion_equipo, edad, estatura, peso, universidad, pais_nacimiento, anio_drafteo, ronda_drafteo,pick_dentro_ronda, partidos_jugados_temporada, promedio_puntos, promedio_rebotes, promedio_asistencias, difpuntosx100_posesiones_en_cancha, porcentaje_rebotes_ofen_de_posibles, porcentaje_rebotes_defen_de_posibles, porcentaje_participacion_jugadas,eficiencia_tiro,porcentaje_asistencias,temporada FROM raw.jugadores); 

--- Verificamos nombres posibles
SELECT nombre_jugador 
FROM limpieza.jugadores
GROUP BY nombre_jugador;

--Creamos nueva columna apellido 
ALTER TABLE limpieza.jugadores ADD COLUMN apellido_jugador VARCHAR(100); 

--Poblamos columna apellido 
UPDATE limpieza.jugadores SET apellido_jugador = TRIM(split_part(nombre_jugador, ' ', 2));

--Creamos nueva columna nombre 
ALTER TABLE limpieza.jugadores ADD COLUMN nombre_jugador1 VARCHAR(100); 

--Poblamos columna nombre 
UPDATE limpieza.jugadores SET nombre_jugador = TRIM(split_part(nombre_jugador, ' ', 1));

--Dropeamos columna de union de ambos
ALTER TABLE limpieza.jugadores DROP COLUMN nombre_jugador;

--Cambiamos el nombre de columna nombre_jugador1 a nombre_jugador
ALTER TABLE limpieza.jugadores RENAME COLUMN nombre_jugador1 TO nombre_jugador;

--Cambiamos undrafted a null 
UPDATE limpieza.jugadores SET anio_drafteo = NULL WHERE anio_drafteo='Undrafted';
UPDATE limpieza.jugadores SET ronda_drafteo = NULL WHERE ronda_drafteo='Undrafted';
UPDATE limpieza.jugadores SET pick_dentro_ronda = NULL WHERE pick_dentro_ronda='Undrafted';

--Cambiamos tipo de dato en columna creando nuevas columnas y poblandolas
ALTER TABLE limpieza.jugadores ADD COLUMN anio_drafteo1 INTEGER;
UPDATE limpieza.jugadores SET anio_drafteo1 = anio_drafteo::INTEGER;
ALTER TABLE limpieza.jugadores ADD COLUMN ronda_drafteo1 INTEGER;
UPDATE limpieza.jugadores SET ronda_drafteo1 = ronda_drafteo::INTEGER;
ALTER TABLE limpieza.jugadores ADD COLUMN pick_dentro_ronda1 INTEGER;
UPDATE limpieza.jugadores SET pick_dentro_ronda1 = pick_dentro_ronda::INTEGER;

--Dropeamos columnas viejas y cambiamos nombre otra vez
ALTER TABLE limpieza.jugadores DROP COLUMN anio_drafteo;
ALTER TABLE limpieza.jugadores DROP COLUMN ronda_drafteo;
ALTER TABLE limpieza.jugadores DROP COLUMN pick_dentro_ronda;
ALTER TABLE limpieza.jugadores RENAME COLUMN anio_drafteo1 to anio_drafteo;
ALTER TABLE limpieza.jugadores RENAME COLUMN ronda_drafteo1 to ronda_drafteo;
ALTER TABLE limpieza.jugadores RENAME COLUMN pick_dentro_ronda1 to pick_dentro_ronda;

--Corregimos inconsistencia de eficiencia de tiro
UPDATE limpieza.jugadores SET eficiencia_tiro = 1 WHERE eficiencia_tiro >1;

--Sustituimos USA por United States
UPDATE limpieza.jugadores SET pais_nacimiento = 'United States of America' WHERE pais_nacimiento = 'USA';

--Trim a todo tipo texto

UPDATE limpieza.jugadores set abreviacion_equipo = TRIM(abreviacion_equipo);
UPDATE limpieza.jugadores set universidad = TRIM(universidad);
UPDATE limpieza.jugadores set pais_nacimiento = TRIM(pais_nacimiento);
UPDATE limpieza.jugadores set temporada = TRIM(temporada);
UPDATE limpieza.jugadores set apellido_jugador= TRIM(apellido_jugador);
UPDATE limpieza.jugadores set nombre_jugador = TRIM(nombre_jugador);






