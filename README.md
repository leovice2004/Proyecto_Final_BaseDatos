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






                

