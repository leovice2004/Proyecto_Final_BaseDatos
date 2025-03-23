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

En el análisis exploratorio de los datos se buscaron las columnas con valores únicos, mínimos y máximos de fechas, mínimos, máximos y promedios de valores numéricos, conteo de valores nulos y las inconsistencias del set de datos.

En estos resultados se encontró que la columna de id es la única que tiene valores únicos, es por eso que se puede categorizar como llave primaria de este set de datos. Por otro lado, las fechas de drafteo  de los jugadores van desde el año 1963 hasta el año 2022 y se tiene información de estos jugadores desde la temporada 1996-97 hasta la temporada 2022-23. 

En cuanto a la edad, estatura y peso de los jugadores, se encontró que las edades van desde los 18 años hasta los 44 años con un promedio de 27 años, las estaturas van desde 1.60m hasta 2.31m con promedio de 2m y los pesos van desde los 60 kg hasta los 163 kg con promedio de 100 kg.

![Muggsy Bogues y Manute Bol](https://github.com/user-attachments/assets/9260571e-a91e-4872-8bed-991212c058b1)

Por último en cuanto a los partidos jugados, promedio de puntos, promedio de asistencias y promedio de rebotes se obtuvo que el número de partidos jugados por temporada va desde 1 hasta 85 con promedio de 51 partidos, los promedios de puntos van desde 0 hasta 36.1 con promedio de 8 puntos por partido, el promedio de asistencias va desde 0 hasta 11.7 con promedio de 1 asistencia por partido y el promedio de rebotes va desde 0 hasta 16 con promedio de 3 rebotes por partido. 

En cuanto a los valores nulos, se encontró que el set de datos cuenta con valores nulos en las columnas de año drafteo, ronda drafteo y pick drafteo, pero en lugar de ser valores nulos, se insertó el valor “Undrafted”. Además, en cuanto a el conteo de valores nulos, se puede observar que varía con el tiempo, ya que algunos jugadores dejan de tener presencia en los datos por su retiro y otros más empiezan a aparecer, lo que hace que estos valores nulos varíen. 

En cuanto a inconsistencias del set de datos, se encontró que en la columna de eficiencia de tiro el rango no va de 0 a 1 (con 1 como el 100% de eficiencia de tiro), sino que va desde 0 hasta 1.5, donde se rompe toda lógica de eficiencia. 

Por último, es importante notar que en la columna nombre_jugador los nombres de los jugadores se van repitiendo y pueden ser insertados nuevos, pues los jugadores se van retirando o van debutando y continúan en la NBA durante varios años y sus estadísticas son almacenadas en cada una de las temporadas desde 1996 hasta 2022.

¡¡Todos los scripts de expolarción se encuentran en la carpeta src!!





                

