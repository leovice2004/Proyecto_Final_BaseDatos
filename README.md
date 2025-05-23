# Estrellas de la NBA, ¿De dónde vienen y a dónde van?
###### Por: Leonardo Villarreal Cerda, Fernando Mejía Álvarez, Bernardo Pérez de la Torre, Francisco Pérez Trofimoff

En este proyecto se utilizará un set de datos referente a el básquetbol. La base de datos utilizada, almacena los datos bigráficos, biométricos y estadísticos de los jugadores de la liga de baloncesto profesional de los Estados Unidos, NBA (National Basketball Association) del año 1996 a 2022. Los datos almacenados en esta base de información nos dan una perspectiva completa del perfil de los que eran y son protagonistas de la liga de baloncesto más competitiva e importante del mundo, además de que se pueden hacer proyecciones de rendimiento y desempeño con base a las estadísticas.

![1_7OmCmTMBu1adOhD6vP9BFw](https://github.com/user-attachments/assets/72a563dd-0630-4aa0-9a29-18056c872493)


## Origen de recolección de los datos
Desde el año 2019, la información almacenada en esta base de datos, se ha recolectado por Justinas Cirtautas, científico de datos de origen inglés que a través de una API ha recoletado las estadísticas y datos de el sitio NBA.com, el cual es un sitio oficial de la liga de baloncesto de los Estados Unidos, en el cual se muestra y recolecta información personal y desempeño de los jugadores profesionales de básquetbol en cada temporada y en cada partido.

[Ver perfil de Justinas Cirtautas](https://www.kaggle.com/justinas)

## Propósito de su recolección de los datos
Como aficionado al baloncesto de toda la vida, Cirtautas, siempre quiso combinar su entusiasmo por el baloncesto con la pasión por la analítica deportiva para poder así analizar tendencias acerca de la edad, peso y altura que afecten el desempeño de los jugadores, así como observar la influencia que juega el país o universidad de origen en el posicionamiento y desempeño de los jugadores a lo largo de su carrera profesional.

## ¿De dónde se encuentra la base de datos?
La base de datos se encuentra en: https://www.kaggle.com/datasets/justinas/nba-players-data

## Frecuencia de actualización de datos
Los datos se han actualizado cada año desde 2020 hasta 2023.

## Tuplas y atributos set de datos
El set de datos cuenta con al rededor de 12,800 tuplas y 22 atributos. Los atributos con su tipo son: 
                
| Nombre atributo  | Tipo de dato | Tipo de atributo |
| ------------- | ------------- | ------------- |
| Nombre  | String  | Texto       |
| Equipo  | String  | Texto       |
| Edad  | int  | Numérico       |
| Estatura  | double  | Numérico       |
| Peso  | double  | Numérico       |
| Altura | double  | Numérico       |
| Universidad  | String  | Texto       |
| País de origen  | String  | Texto       |
| Año de drafteo  | date  | Temporal       |
| Ronda de drafteo  | int  | Numérico       |
| Número de drafteo  | int  | Numérico       |
| Juegos jugados en temporada  | int  | Numérico       |
| Promedio de puntos  | double  | Numérico       |
| Promedio rebotes  | double  | Numérico        |
| Promedio asistencias  | double  | Numérico        |
| Diferencial de puntos del equipo por 100 posesiones mientras el jugador está en la cancha  | double  | Numérico        |
| Porcentaje de rebotes ofensivos disponibles que atrapó el jugador mientras estaba en la cancha  | double  | Numérico        |
| Porcentaje de rebotes defensivos disponibles que capturó el jugador mientras estaba en la cancha | double  | Numérico        |
| Porcentaje de jugadas de equipo utilizadas por el jugador mientras estaba en la cancha | double  | Numérico        |
| Medida de la eficacia en tiro del jugador que tiene en cuenta los tiros libres, tiros de 2 y 3 puntos  | double  | Numérico        |
| Porcentaje de tiros de campo de compañeros de equipo que el jugador asistió mientras estaba en la cancha | double | Numérico        |
| Temporada  | date  | Temporal       |


## Objetivos del proyecto
+ Utilzar el set de datos para encontrar correlaciones entre los distintos atributos y el desempeño del jugador para poder así realizar predicciones y posibles patrones estratégicos que conduzcan al éxito deportivo.

+ Encontrar patrones de comportamiento de distintos tipos de jugadores para modelar perfiles respecto a sus atributos.

+ Recabar información acerca de los jugadores profesionales del balancesto en Estados Unidos y sus características. 

## Consideraciones Éticas
Como consideraciones éticas se debe tomar en cuenta la imagen de los jugadores de los cuales utilizaremos su información en el sentido de que no se debe hacer mal uso de esta información, así como no difamar o dañar la imagen de cualquiera de los jugadores, instituciones o países involucrados en la base de datos. El aspecto más importante de estas considerciones éticas es la repercución que pueden tener los resultados obtenidos respecto a la edad de los jugadores ya que estos resultados afectan a individuos. Por otro lado el citado correcto de fuentes de información y dar crédito a autores externos es fundamental.


## Carga inicial set de datos

[Ver script carga inicial](https://github.com/leovice2004/Proyecto_Final_BaseDatos/blob/13923b309c1ecee4aedbcf212962a897cd3a6ff7/src/esquema_carga_inicial)

Para cargar el set de datos de los jugadores de la NBA se deben realizar los siguientes pasos:

1. Descargar el archivo CSV de los jugadores de la NBA.

2. En la línea de comandos de psql se debe crear la base de datos.
```
CREATE DATABASE jugadores; 
```
3. Una vez creada la base de datos en la línea de comandos de psql, ésta se conecta al sistema de gestión de datos elegido (en este caso se utilizará PostgreSQL) para poder realizar el script del esquema de carga inicial del set de datos. En este esquema de carga inicial la creación de la tabla debe contener los tipos de atributos más permisivos, pues no hemos examinado a profundidad la base de datos. Como es la carga inicial también se creará un esquema “raw” que contenga los datos brutos. (Script de carga inicial y creación de tabla anexado en folder "src"). 

4. Una vez creado el esquema de carga inicial, se debe poblar la base de datos desde el archivo CSV. Para esto, se debe utilizar el comando "\copy" en la línea de comandos de psql. 

```
\copy     
raw.jugadores(id,nombre_jugador,abreviacion_equipo,edad,estatura,peso,universidad,pais_nacimiento,anio_drafteo,ronda_drafteo,pick_dentro_ronda,partidos_jugados_temporada,promedio_puntos,promedio_rebotes,promedio_asistencias,difpuntosx100_posesiones_en_cancha,porcentaje_rebotes_ofen_de_posibles,porcentaje_rebotes_defen_de_posibles,porcentaje_participacion_jugadas,eficiencia_tiro,porcentaje_asistencias,temporada) 

FROM “ruta_a_archivo_CSV_descargado”

WITH (FORMAT CSV, HEADER true, DELIMITER ',');
```

Una vez que se ha poblado la base de datos, se pueden hacer consultas, modificaciones e inserciones.

## Análisis exploratorio

[Ver script de análisis exploratorio](https://github.com/leovice2004/Proyecto_Final_BaseDatos/blob/41f34abb1aaf4ab8fab1dd17991c38fe8e695719/src/analisis_exploratorio.sql)

En el análisis exploratorio de los datos se buscaron las columnas con valores únicos, mínimos y máximos de fechas, mínimos, máximos y promedios de valores numéricos, conteo de valores nulos y las inconsistencias del set de datos.

En estos resultados se encontró que la columna de id es la única que tiene valores únicos, es por eso que se puede categorizar como llave primaria de este set de datos. Por otro lado, las fechas de drafteo  de los jugadores van desde el año 1963 hasta el año 2022 y se tiene información de estos jugadores desde la temporada 1996-97 hasta la temporada 2022-23. 

En cuanto a la edad, estatura y peso de los jugadores, se encontró que las edades van desde los 18 años hasta los 44 años con un promedio de 27 años, las estaturas van desde 1.60m hasta 2.31m con promedio de 2m y los pesos van desde los 60 kg hasta los 163 kg con promedio de 100 kg.

![Muggsy Bogues y Manute Bol](https://github.com/user-attachments/assets/9260571e-a91e-4872-8bed-991212c058b1)

Por último en cuanto a los partidos jugados, promedio de puntos, promedio de asistencias y promedio de rebotes se obtuvo que el número de partidos jugados por temporada va desde 1 hasta 85 con promedio de 51 partidos, los promedios de puntos van desde 0 hasta 36.1 con promedio de 8 puntos por partido, el promedio de asistencias va desde 0 hasta 11.7 con promedio de 1 asistencia por partido y el promedio de rebotes va desde 0 hasta 16 con promedio de 3 rebotes por partido. 

En cuanto a los valores nulos, se encontró que el set de datos cuenta con valores nulos en las columnas de año drafteo, ronda drafteo, pick drafteo y universidad, pero en lugar de ser valores nulos, se insertó el valor “Undrafted” en las columnas de año drafteo, ronda drafteo y pick drafteo y "None" en la columna de universidad. Además, en cuanto a el conteo de valores nulos, se puede observar que varía con el tiempo, ya que algunos jugadores dejan de tener presencia en los datos por su retiro y otros más empiezan a aparecer, lo que hace que estos valores nulos varíen. 

En cuanto a inconsistencias del set de datos, se encontró que en la columna de eficiencia de tiro el rango no va de 0 a 1 (con 1 como el 100% de eficiencia de tiro), sino que va desde 0 hasta 1.5, donde se rompe toda lógica de eficiencia. 

Por último, es importante notar que en la columna nombre_jugador los nombres de los jugadores se van repitiendo y pueden ser insertados nuevos, pues los jugadores se van retirando o van debutando y continúan en la NBA durante varios años y sus estadísticas son almacenadas en cada una de las temporadas desde 1996 hasta 2022.

¡¡Todos los scripts de expolarción se encuentran en la carpeta src!!

## Limpieza

[Ver script limpieza](https://github.com/leovice2004/Proyecto_Final_BaseDatos/blob/74e0482a45901908a82c72716a2747392683f70d/src/limpieza.sql)

Para la limpieza se creó un nuevo esquema llamado limpieza:
```
DROP SCHEMA IF EXISTS limpieza;
CREATE SCHEMA IF NOT EXISTS limpieza;
```
Después de crear el esquema de limpieza, se crea una nueva tabla dentra de ese esquema agregando algunas restricciones a los atributos de lo que se pudo deducir de las exploraciones, en este caso se cambiaron algunos tipos de atributos a tipos más restrictivos:

| Atributo | Se cambió a: | Razón: |
| ------------- | -------------|-----------|
| id | Primary Key  | Se observaron valores únicos |
| nombre_jugador  | varchar(100)  | Strings no son de gran longitud |
| abreviacion_equipo  | varchar(100)  | Strings no son de gran longitud |
| edad | smallint  | Es de tipo entero y valores menores a 50|
| estatura  | real  | Es de tipo decimal |
| peso | real | Es de tipo decimal |
| universidad  | varchar(100)  | Strings no son de gran longitud |
| pais_nacimiento  | varchar(100)  | Strings no son de gran longitud |
| anio_drafteo  | varchar(100)  | Strings no son de gran longitud y hay valores tipo texto ‘Undrafted’|
| ronda_drafteo | varchar(100)  | Strings no son de gran longitud y hay valores tipo texto ‘Undrafted’|
| pick_dentro_de_ronda | varchar(100)  | Strings no son de gran longitud y hay valores tipo texto ‘Undrafted’|
| partidos_jugados_temporada  | smallint | Es de tipo entero y valores menores a 85|
| promedio_puntos  | real | Es de tipo decimal |
| promedio_rebotes  | real  | Es de tipo decimal |
| promedio_asistencias  | real  | Es de tipo decimal |
| difpuntosx100_posesiones_en_cancha  | real  | Es de tipo decimal |
| porcentaje_rebotes_ofen_de_posibles | real  | Es de tipo decimal |
| porcentaje_rebotes_defen_de_posibles  | real  | Es de tipo decimal |
| porcentaje_participacion_jugadas  | real  | Es de tipo decimal |
| eficiencia_tiro  | real  | Es de tipo decimal |
| porcentaje_asistencias | real  | Es de tipo decimal |
| temporada  | varchar(100) | Strings no son de gran longitud y deben ser texto pues es de tipo 19**-**|

También se agregaron restricciones NOT NULL, CONSTRAINT y CHECK a algunos atributos que se dedujeron que debían existir por las exploraciones, estas se pueden visualizar en el script de limpieza.

Posteriormente, se pobló la tabla con los datos previamente almacenados en la tabla de jugadores del esquema raw con el comando INSERT.

Para empezar la limpieza de los datos verificamos el número de nombres distintos que almacena la base de datos y encontramos que son 2551 nombres distintos, aunque estos se repiten por que un jugador puede jugar más de una temporada. 

Posteriormente se sustituyó la palabra “Undrafted” en anio_drafteo, ronda_drafteo y pick_dentro_de_ronda por null para poder así cambiar el tipo de dato de esos atributos a integer y la inconsistencia de la eficiencia de tiro, en el cual aparecían valores mayores a 1, se corrigió. Además se sustituyó la abreviación “USA” en país_nacimiento por “United States of America” ya que los demás países no estaban abreviados. 

Por último se aplicó la función Trim() a todos los atributos de tipo texto.

## Normalización

[Ver script normalización](https://github.com/leovice2004/Proyecto_Final_BaseDatos/blob/main/src/normalizacion.sql)

Para la limpieza se creó un nuevo esquema llamado limpieza:
```
DROP SCHEMA IF EXISTS normalizacion;
CREATE SCHEMA IF NOT EXISTS normalizacion;
```
Después de crear el esquema de normalización se buscaron dependencias funcionales y multivaluadas dada la naturaleza de los datos. En esta búsqueda se encontró que el diseño sólo contaba con dos dependencias funcionales las cuales son:

(nombre_jugador)---------> (universidad, pais_nacimiento, anio_drafteo, ronda_drafteo, pick_dentro_ronda)
(nombre, temporada)-------> (equipo, todas las estadísticas de una temporada)

Como el diseño inicial no se encontraba en 4ta forma normal, se descompusieron los datos en las siguientes relvars con los siguientes atributos:

| Relvar |  Atributos |
| ------------- | -----------|
| jugadores | id, nombre_jugador, universidad_id, pais_nacimiento_id, anio_drafteo, ronda_drafteo, pick_dentro_ronda|
| estadisticas_jugador_temporada  | id, jugador_id, equipo_id, edad, esatura, peso, estadísticas_temporada, temporada|
| equipos  | id, equipo|
| pais_nacimiento  | id, pais_nacimiento|
| universidades  | id, universidad|

Una vez descompuesto el diseño inicial, se puede verificar que la base de datos se encuentra en 4ta forma normal por que todas las dependencias funcionales encontradas estan implicadas por las llaves y el diseño es intuitivo, pues no presenta anomalías de inserción, modificación o de eliminación. 

El diagrama entidad resultante, despues de la normalización es el siguiente: 

![e376e243-ea70-4bd6-acc3-97194ffda0af](https://github.com/user-attachments/assets/e0499ccd-529a-48fd-b4bd-402f7afd6b97)


## Análisis de datos

[Ver script análisis](https://github.com/leovice2004/Proyecto_Final_BaseDatos/blob/main/src/analisis.sql)

En el análisis de datos se obtivieron resultados muy interesantes para futuras proyecciones. Algunos de los datos obtenidos sirven para obtener estadísticas acerca de dónde vienen la mayoría de los jugadores respecto a su universidad de orígen o país de orígen. Por otro lado se obtuvieron los máximos anotadores de puntos desde 1996 hasta 2022, los mayores asistidores, los mayores reboteros, los jugadores con 0 puntos en su carrera, los jugadores con mayor cantidad de partidos jugados, los jugadores con mayor eficiencia de tiro que hayan jugado más de 20 partidos, el jugador más pesado, el mas delgado, el más alto, el más bajo, el más jóven, el más viejo etc. 

| Búsqueda |  Resultados |
| ------------- | -----------|
| Universidades de dónde llegan más jugadores a la NBA | Los resultados encontrados arrojaron que la mayoría de jugadores que llegan a la NBA provienen de ninguna universidad con el 13%, seguido por Kentucky con el 3% y Duke con el 2%|
| Páises de dónde vienen más jugadores  | Los resultado arrojaron que la mayoría de los jugadores que llegn a la NBA provienen de Estados Unidos con el 84%, seguido de Canadá con el 1.7% y Francia con el 1.45%|
| Máximos anotadores | Los máximos anotadores de la NBA de 1996-2022 son LeBron James: 38648 pts, Kobe Bryant: 33633 pts y Dirk Nowitzky: 31561 pts|
| Máximos asistidores  | Los máximos asistidores de la NBA de 1996-2022 son Chris Paul: 11508 ast, Jason Kidd: 10720 ast y LeBron James: 10415 ast|
| Máximos reboteros  | Los máximos reboteros de la NBA de 1996-2022 son Tim Duncan: 15083 reb, Dwight Howard: 14623 reb y Kevin Garnett: 14145 reb|
| Mayor cantidad de partidos  | Los jugadores con mayor cantidad de partidos de la NBA de 1996-2022 son Vince Carter: 1541 part, Dirk Nowitzky:1522 part y LeBron James:1421 part|
| Mayor eficiencia de tiro  | El jugador con mayor eficiencia de tiro es Jericho Sims: 0.78|
| Jugador más pesado  | Sim Bhullar: 163.3 kg|
| Jugador más delgado  | Spud Webb: 60.3 kg|
| Jugador más alto  | Gheorghe Muresan: 231.14 cm |
| Jugador más bajo  | Muggsy Boges: 160.02 cm|
| Jugador más viejo  | Kevin Willis: 44 años |
| Jugador más jóven  | Kobe Bryant: 18 años|
| Cantidad de jugadores con cero puntos en la NBA | 63 jugadores|

Algunas gráfcas de los resultados son:

![094CC567-97B3-46A3-8188-B0F8ABEF2286](https://github.com/user-attachments/assets/62e0e964-92a0-4e75-bfab-6b46979930dc)

![020BDE7C-F5A5-467B-819D-5241F75EAF0B](https://github.com/user-attachments/assets/ac210cb6-3048-467d-b750-f3c9b08fe873)







                

