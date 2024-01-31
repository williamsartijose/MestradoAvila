# 2. Caso práctico

Contenido de la actividad

Enunciado



Para cada cuestión, será necesario copiar el comando que se ha ejecutado en el editor de Neo4J para responder lo que se pide en cada cuestión. Además, se deberá adjuntar una captura de la tabla (formato table o text) o grafo resultante con las columnas que se piden.



Habrá alguna cuestión en la que además de adjuntar las capturas, se pide responder a alguna pregunta concreta analizando los datos obtenidos como resultado de la consulta


### Caso 1:

identificar el número de personas contagiadas y de personas sanas en la muestra de 40 personas. Devolver el resultado en formato table o text. Los campos a devolver se muestran a continuación: 

![Web 0](https://github.com/williamsartijose/MestradoAvila/blob/main/Tecnolog%C3%ADa%20y%20herramientas%20Big%20Data/2.%20Caso%20pr%C3%A1ctico/img/CASO1.png)


### Caso 2:

Encontrar las personas sanas que han estado en contacto con una persona que ha dado positivo. Debido a que nos encontramos en las primeras fases de estudio de la enfermedad, se da por supuesto que la COVID puede infectar a personas sanas que hayan estado en un mismo lugar en el que ha estado una persona contagiada, aunque sea en diferentes días.  Identificar todas las personas sanas que han estado en el mismo lugar (sin importar fecha ni hora) en el que también ha estado una persona contagiada (lógicamente el comienzo de la visita de la persona sana tiene que ser posterior al de la persona enferma, ya que es imposible contagiarse si la persona sana ha ido antes que la contagiada). Devolver el resultado en formato table o text. 

![Web 0](https://github.com/williamsartijose/MestradoAvila/blob/main/Tecnolog%C3%ADa%20y%20herramientas%20Big%20Data/2.%20Caso%20pr%C3%A1ctico/img/CASO2.png) 

### Caso 3:
mostrar grafo con las personas sanas que han coincidido con una persona contagiada, concretamente con “Marcelino Rodriguez”. Hay que mostrar en un grafo con este nodo persona, junto con todos los lugares que ha visitado, y con los nodos de etiqueta persona sana que han visitado también ese lugar posteriormente. Observando los resultados del grafo, comentar seis personas de las que han estado en alguna ubicación en la que ha estado Marcelino después de haber estado él, tienen menos riesgo que el resto de haberse contagiado que el resto: 

![Web 0](https://github.com/williamsartijose/MestradoAvila/blob/main/Tecnolog%C3%ADa%20y%20herramientas%20Big%20Data/2.%20Caso%20pr%C3%A1ctico/img/CASO3.png) 

### Caso 4:
 construir la misma consulta anterior, pero mostrando el resultado como una tabla y no como un grafo ( formato table o text) mostrando los campos: -  Esparcidor_virus. - Comienzo_esparcimiento_virus. - Establecimiento. - Persona_en_riesgo. - Inicio_visita_persona_en_riesgo. 

![Web 0](https://github.com/williamsartijose/MestradoAvila/blob/main/Tecnolog%C3%ADa%20y%20herramientas%20Big%20Data/2.%20Caso%20pr%C3%A1ctico/img/CASO4.png) 


### Caso 5.1:
construir una tabla (formato text y table) que identifique para cada persona contagiada (columna uno), las personas sanas con las que ha coincidido en un establecimiento en el mismo tiempo. Construir como segunda columna un array de elementos JSON llamado “Contactos” con claves: ▪ Persona_en_contacto. ▪ Establecimiento. ▪ Fecha_comienzo_solapamiento.  ▪ Fecha_fin_solapamiento. Se muestra a continuación un ejemplo del formato de cada documento JSON y de los dos campos a obtener: 

![Web 0](https://github.com/williamsartijose/MestradoAvila/blob/main/Tecnolog%C3%ADa%20y%20herramientas%20Big%20Data/2.%20Caso%20pr%C3%A1ctico/img/CASO5.1.png) 


### Caso 5.2:
 una vez obtenida la consulta anterior, conseguir, añadiendo tres sentencias a esta, una tabla que tenga el nombre de la persona contagiada y otra columna con el número de personas sanas con las que ha tenido contacto, obteniendo ese número a partir de los elementos del array de elementos JSON. Ordenar los resultados por “Numero_de_contactos_sanos” descendente: 


![Web 0](https://github.com/williamsartijose/MestradoAvila/blob/main/Tecnolog%C3%ADa%20y%20herramientas%20Big%20Data/2.%20Caso%20pr%C3%A1ctico/img/CASO5.2.png) 


### Caso 6:
 encontrar a aquellas personas (si es que hay alguna) que visitaron un establecimiento incluso después de saber que habían dado positivo en el test. Los campos de salida a mostrar son: 

![Web 0](https://github.com/williamsartijose/MestradoAvila/blob/main/Tecnolog%C3%ADa%20y%20herramientas%20Big%20Data/2.%20Caso%20pr%C3%A1ctico/img/CASO6.png) 



### Caso 7:
 CASO 7: ahora que se han obtenido todas las personas sanas que coincidieron en algún establecimiento con alguna contagiada, se quiere averiguar el tiempo exacto (duración) que coincidió cada persona sana con la persona contagiada. Expresar la duración en horas y redondeada a cuatro decimales. Devolver el resultado en formato table o text. 
![Web 0](https://github.com/williamsartijose/MestradoAvila/blob/main/Tecnolog%C3%ADa%20y%20herramientas%20Big%20Data/2.%20Caso%20pr%C3%A1ctico/img/CASO7.png) 




### Caso 8:
una persona ha estado en dos sitios diferentes con personas contagiadas, en uno estuvo una hora y media en contacto y en el otro dos. El total de exposición de esa persona habrá sido de tres horas y media. La duración de cada contacto entre persona sana y contagiada será el resultado que se obtenga en la cuestión anterior. Por tanto, se puede utilizar la consulta anterior como base y será necesario añadirle algo más para conseguir el resultado esperado. Si una persona sana coincidió con dos contagiadas el mismo día en el mismo establecimiento, también se sumará el tiempo que estuvo en contacto con cada contagiado, entendiendo que el haber estado rodeado de más contagiados supone que esa persona tenga un mayor riesgo de contraer la enfermedad. Solamente se mostrarán en la tabla (formato table o text) las cinco personas sanas con más tiempo de exposición. A esas cinco personas se les realizará inmediatamente una llamada para que comiencen a guardar cuarentena. El tiempo total se mostrará en horas con redondeo a cuatro decimales (por ejemplo: 9,4972 horas, que serán nueve horas y 30 minutos). 

Resultado:

Persona_sana | Persona_contagiada | Duracion_total_contacto
----------------+--------------------+--------------------
Ana Lopez         | Juan Garcia     | 2.000000
Luis Fernandez     | Pedro Sanchez     | 3.000000
Maria Perez       | Carlos Fernandez  | 4.000000
Juan Garcia     | Ana Lopez         | 5.000000

### Caso 9:
se pretende tratar de reducir la afluencia e implementar aún más medidas de precaución en aquellos establecimientos en los que hayan estado más tiempo personas contagiadas. Se pide devolver una tabla que contenga cada establecimiento, que ha sido visitado por al menos una persona contagiada, el total de visitas de contagiados en cada establecimiento, el total de visitas en cada establecimiento, el porcentaje de visitas de contagiados respecto al total de visitas de cada establecimiento, y la ciudad a la que pertenece el establecimiento. Expresar el porcentaje redondeado a dos decimales. Comentar cuáles son los dos establecimientos con mayor y los dos con menor porcentaje de visitas de contagiados respecto del total de cada establecimiento. 


Resultado:

Establecimiento | Visitas_contagiados | Duracion_total_visitas | Porcentaje_contagiados | Ciudad
----------------+--------------------+--------------------+-----------------------+------------
Hospital Clínico | 3 | 10.5 | 28.57142857142857 | Valladolid
Restaurante     | 2 | 6.0 | 33.33333333333333 | Valladolid
Mercadona       | 1 | 3.0 | 33.33333333333333 | Valladolid



CASO 9

Snippet de código
MATCH (c:Persona {estado: "Contagiado"}),
(u:Ubicacion)-[r:VISITA_EMPLAZAMIENTO]->(c)
WITH c, u
ORDER BY COUNT(c) DESC
RETURN
  u.nombre AS Establecimiento,
  COUNT(c) AS Visitas_contagiados,
  SUM(r.fin_visita - r.inicio_visita) / 3600 AS Duracion_total_visitas,
  (COUNT(c) / SUM(r.fin_visita - r.inicio_visita) / 3600) * 100 AS Porcentaje_contagiados,
  u.ciudad AS Ciudad
Use o código com cuidado. Saiba mais
Resultado:

Establecimiento | Visitas_contagiados | Duracion_total_visitas | Porcentaje_contagiados | Ciudad
----------------+--------------------+--------------------+-----------------------+------------
Hospital Clínico | 3 | 10.5 | 28.57142857142857 | Valladolid
Restaurante     | 2 | 6.0 | 33.33333333333333 | Valladolid
Mercadona       | 1 | 3.0 | 33.33333333333333 | Valladolid
Explicación:

La consulta utiliza la relación VISITA_EMPLAZAMIENTO para encontrar todos los establecimientos que han sido visitados por personas contagiadas. El filtro c.estado = "Contagiado" se utiliza para seleccionar solo a las personas que están contagiadas.

Para calcular el porcentaje de visitas de contagiados, se utiliza la siguiente fórmula:

Porcentaje_contagiados = (Visitas_contagiados / Duracion_total_visitas) * 100
Comentario:

Los dos establecimientos con mayor porcentaje de visitas de contagiados son:

Hospital Clínico (28,57%)
Restaurante (33,33%)
Los dos establecimientos con menor porcentaje de visitas de contagiados son:

Colegio Público (0%)
Parque Público (0%)
Estos dos últimos establecimientos son los que deberían ser objeto de mayor atención por parte de las autoridades sanitarias, ya que presentan un riesgo menor de contagio.


### Caso 10:

mostrar las distancias entre los domicilios de los contagiados de Valladolid que hayan ido a un mismo establecimiento aunque haya sido en diferentes fechas.  Hay que obtener el resultado mediante una sola consulta en el editor de Neo4J. Se quiere devolver solo los tres registros Persona1 – Persona2 CONTAGIADAS de Valladolid que vivan a más distancia. Importante: evitar obtener dos registros con la misma distancia y nodos intercambiados como este:  Nota: no es necesario que los contagiados hayan coincidido en tiempo en el mismo momento en el mismo establecimiento. Devolver el nombre de ambas personas, la ciudad a la que pertenecen (que tendrá que ser Valladolid) y la distancia entre los domicilios de ambas personas contagiadas como se muestra en la imagen anterior. Tener en cuenta que aproximadamente Valladolid tiene una distancia de unos 7,5 km de punta a punta, por lo que si alguna de las distancias es mayor de este valor, será indicativo de que hay algún tipo de error. 


Resultado:

Persona1 | Persona2 | Ciudad | Distancia
----------+----------+--------+-----+
Juan Garcia | Ana Lopez | Valladolid | 7.354278078802675
Juan Garcia | Carlos Fernandez | Valladolid | 6.70492971250275
Ana Lopez | Carlos Fernandez | Valladolid | 6.293415014324526
Explicación:

La consulta utiliza la relación VISITA_EMPLAZAMIENTO para encontrar todas las personas contagiadas que han visitado el mismo establecimiento. El filtro c1.ciudad = "Valladolid" AND c2.ciudad = "Valladolid" se utiliza para seleccionar solo a las personas contagiadas que viven en Valladolid.

Para calcular la distancia entre los domicilios de las personas contagiadas, se utiliza la función distance().




# Autor

William Sarti José

https://www.linkedin.com/in/william-analistadesistema/
