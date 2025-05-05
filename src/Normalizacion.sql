DROP SCHEMA IF EXISTS normalizacion;
CREATE SCHEMA IF NOT EXISTS normalizacion;

----crear tabla normalizacion.jugadores
DROP TABLE IF EXISTS normalizacion.jugadores;
CREATE TABLE IF NOT EXISTS normalizacion.jugadores (
	id bigserial PRIMARY KEY,
	nombre_jugador VARCHAR(100) NOT NULL,
	abreviacion_equipo VARCHAR(10) NOT NULL,
	edad SMALLINT NOT NULL CONSTRAINT edad_mayor_cero CHECK (edad>0),
	estatura REAL NOT NULL CONSTRAINT estatura_mayor_cero CHECK (estatura>0),
	peso REAL NOT NULL CONSTRAINT peso_mayor_cero CHECK (peso>0),
	universidad VARCHAR(100),
	pais_nacimiento VARCHAR(100) NOT NULL,
	anio_drafteo BIGINT,
	ronda_drafteo BIGINT,
	pick_dentro_ronda BIGINT,
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

---Poblamos la tabla con datos de esquema limpieza
INSERT INTO normalizacion.jugadores (nombre_jugador,abreviacion_equipo, edad, estatura, peso, universidad, pais_nacimiento, anio_drafteo, ronda_drafteo,pick_dentro_ronda, partidos_jugados_temporada, promedio_puntos, promedio_rebotes, promedio_asistencias, difpuntosx100_posesiones_en_cancha, porcentaje_rebotes_ofen_de_posibles, porcentaje_rebotes_defen_de_posibles, porcentaje_participacion_jugadas,eficiencia_tiro,porcentaje_asistencias,temporada) (SELECT nombre_jugador, abreviacion_equipo, edad, estatura, peso, universidad, pais_nacimiento, anio_drafteo, ronda_drafteo,pick_dentro_ronda, partidos_jugados_temporada, promedio_puntos, promedio_rebotes, promedio_asistencias, difpuntosx100_posesiones_en_cancha, porcentaje_rebotes_ofen_de_posibles, porcentaje_rebotes_defen_de_posibles, porcentaje_participacion_jugadas,eficiencia_tiro,porcentaje_asistencias,temporada FROM limpieza.jugadores ORDER BY LEFT(temporada, 4)::BIGINT);

--Cambiamos nombre de primer jugadores
ALTER TABLE normalizacion.jugadores RENAME TO datos;

--Creamos tabla jugadores
DROP table if EXISTS normalizacion.jugadores;
CREATE TABLE if not EXISTS normalizacion.jugadores(
	id BIGSERIAL PRIMARY KEY,
	nombre_jugador VARCHAR(100) NOT NULL,
	universidad VARCHAR(100),
	pais_nacimiento VARCHAR(100),
	anio_drafteo BIGINT, 
	ronda_drafteo BIGINT,
	pick_dentro_ronda BIGINT
);
-- Poblamos nombre_jugador y hacemos update en los demas atributos
INSERT INTO normalizacion.jugadores (nombre_jugador) (SELECT DISTINCT nombre_jugador FROM normalizacion.datos);

UPDATE normalizacion.jugadores
SET universidad = datos.universidad
FROM normalizacion.datos AS datos
WHERE jugadores.nombre_jugador = datos.nombre_jugador;

UPDATE normalizacion.jugadores
SET pais_nacimiento = datos.pais_nacimiento
FROM normalizacion.datos AS datos
WHERE jugadores.nombre_jugador= datos.nombre_jugador;

ALTER TABLE normalizacion.jugadores ALTER COLUMN pais_nacimiento SET NOT NULL;

UPDATE normalizacion.jugadores
SET anio_drafteo = datos.anio_drafteo
FROM normalizacion.datos AS datos
WHERE jugadores.nombre_jugador= datos.nombre_jugador;

UPDATE normalizacion.jugadores
SET ronda_drafteo = datos.ronda_drafteo
FROM normalizacion.datos AS datos
WHERE jugadores.nombre_jugador= datos.nombre_jugador;

UPDATE normalizacion.jugadores
SET pick_dentro_ronda = datos.pick_dentro_ronda
FROM normalizacion.datos AS datos
WHERE jugadores.nombre_jugador= datos.nombre_jugador;

--Agregamos columna jugador_id en datos y dropeamos columnas de nombre, univ, pais_nac, anio_draf, ronda_draf, pick_ronda
ALTER TABLE normalizacion.datos ADD COLUMN jugador_id BIGINT REFERENCES normalizacion.jugadores (id) on DELETE CASCADE;

UPDATE normalizacion.datos SET jugador_id = (SELECT id FROM normalizacion.jugadores WHERE normalizacion.datos.nombre_jugador=normalizacion.jugadores.nombre_jugador);

ALTER TABLE normalizacion.datos DROP COLUMN nombre_jugador;
ALTER TABLE normalizacion.datos DROP COLUMN universidad;
ALTER TABLE normalizacion.datos DROP COLUMN pais_nacimiento;
ALTER TABLE normalizacion.datos DROP COLUMN anio_drafteo;
ALTER TABLE normalizacion.datos DROP COLUMN ronda_drafteo;
ALTER TABLE normalizacion.datos DROP COLUMN pick_dentro_ronda;
ALTER TABLE normalizacion.datos ALTER COLUMN jugador_id SET NOT NULL;

--Creamos tabla equipos en la liga y poblamos
DROP TABLE IF EXISTS normalizacion.equipos;
CREATE TABLE IF NOT EXISTS normalizacion.equipos (
	id BIGSERIAL PRIMARY KEY,
	equipo VARCHAR(100) unique NOT NULL 
);

INSERT INTO normalizacion.equipos (equipo) (SELECT DISTINCT abreviacion_equipo FROM normalizacion.datos);

--Creamos columna equipo_id en datos y poblamos

ALTER TABLE normalizacion.datos ADD COLUMN equipo_id BIGINT REFERENCES normalizacion.equipos (id);

UPDATE normalizacion.datos SET equipo_id = (SELECT id FROM normalizacion.equipos WHERE normalizacion.datos.abreviacion_equipo = normalizacion.equipos.equipo);

ALTER TABLE normalizacion.datos DROP COLUMN abreviacion_equipo;
ALTER TABLE normalizacion.datos ALTER COLUMN equipo_id SET NOT NULL;

----Creamos tabla universidades y poblamos
DROP TABLE IF EXISTS normalizacion.universidades;
CREATE TABLE IF NOT EXISTS normalizacion.universidades (
	id BIGSERIAL PRIMARY KEY,
	universidad VARCHAR(100) unique NOT NULL 
);

INSERT INTO normalizacion.universidades (universidad) (SELECT DISTINCT universidad FROM normalizacion.jugadores);

--Creamos columna universidad_id en jugadores y poblamos

ALTER TABLE normalizacion.jugadores ADD COLUMN universidad_id BIGINT REFERENCES normalizacion.universidades (id);
UPDATE normalizacion.jugadores SET universidad_id = (SELECT id FROM normalizacion.universidades WHERE normalizacion.jugadores.universidad=normalizacion.universidades.universidad);

ALTER TABLE normalizacion.jugadores DROP COLUMN universidad;

----Creamos tabla paises_nacimiento y poblamos
DROP TABLE IF EXISTS normalizacion.paises_nacimiento;
CREATE TABLE IF NOT EXISTS normalizacion.paises_nacimiento(
	id BIGSERIAL PRIMARY KEY,
	pais_nacimiento VARCHAR(100) unique NOT NULL 
);

INSERT INTO normalizacion.paises_nacimiento (pais_nacimiento) (SELECT DISTINCT pais_nacimiento FROM normalizacion.jugadores);

--Creamos columna pais_nacimiento_id en jugadores y poblamos

ALTER TABLE normalizacion.jugadores ADD COLUMN pais_nacimiento_id BIGINT REFERENCES normalizacion.paises_nacimiento (id);
UPDATE normalizacion.jugadores SET pais_nacimiento_id = (SELECT id FROM normalizacion.paises_nacimiento WHERE normalizacion.jugadores.pais_nacimiento=normalizacion.paises_nacimiento.pais_nacimiento);

ALTER TABLE normalizacion.jugadores DROP COLUMN pais_nacimiento;

--Renombramos tabla de datos a estadisticas_jugador_temporada

ALTER TABLE normalizacion.datos RENAME to estadisticas_jugador_temporada;






