# Databricks notebook source
# MAGIC %md **PREGUNTAS CASO NEGOCIO SPARK**

# COMMAND ----------

# MAGIC %md Para la resolución de los ejercicios del Caso de Negocio, se partirá de las tablas iniciales que se han guardado en Hive al comienzo de la práctica resuelta

# COMMAND ----------

# Se realizan todos los imports necesarios
from pyspark.sql.functions import *
from pyspark.sql.types import *
from pyspark.sql.window import Window

# COMMAND ----------

# MAGIC %md **1. Mostrar por pantalla el número TOTAL de clientes que tenían en el mes anterior más de un contrato con la compañía**

# COMMAND ----------



# COMMAND ----------

# MAGIC %md **2. Generar un nuevo dataframe de facturas del mes actual que asigne un 7% de descuento a todos los contratos de clientes que ya existían en el mes anterior (los contratos de los clientes nuevos seguirán con el mismo importe). Mantener la columna "importe" y crear una nueva columna "importe_dto" con el nuevo importe, casteada a 2 decimales. Mostrar además el resultado ordenado por los campos id_cliente ascendente, importe descendente. **

# COMMAND ----------



# COMMAND ----------

# MAGIC %md **3. Por problemas de saturación en la red debido al incremento en el uso de datos por el confinamiento debido a la COVID-19, se decide limitar el uso de datos este mes subiendo la tarifa de todas las ofertas que incluyan "datos ilimitados" en un 15%. Obtener un DF con las mismas columnas que el DF de facturas del mes actual y a mayores la columna "importe_dto"**.

# COMMAND ----------



# COMMAND ----------

# MAGIC %md **4. Crear una nueva variable "grupo_edad" que agrupe a los clientes, tanto del mes_actual como del mes_anterior en 4 rangos según su edad asignando valores del 1 - 4 segun el rango al que pertenezcan (18-25 (1), 26-40 (2), 41-65 (3), >65 (4)). Obtener una tabla resumen que extraiga para cada para cada uno de los 4 grupos identificados la MEDIA de consumo de datos, sms enviados, minutos_movil, minutos_fijo, con todos los campos casteados a 2 decimales y ordenar el DF por grupo_edad ascendente. Extraer conclusiones.**

# COMMAND ----------



# COMMAND ----------

# MAGIC %md **5. Se quiere realizar un estudio por Sexo para analizar si son las mujeres o los hombres quiénes consumen más datos durante el fin de semana y hacen más llamadas desde el móvil. Para ello se deberá, sin ayuda de un calendario, extraer el día de la semana al que corresponde cada una de las fechas del mes de
# MAGIC Agosto para saber cuáles son fin de semana (se consideran días de fin de semana el viernes, sábado y domingo). </br> El DF a obtener deberá tener 2 registros con las columnas: sexo, total_mins_movil_finde, total_datos_moviles_finde. </br> Extraer conclusiones tras presentar el DF resultante.**

# COMMAND ----------



# COMMAND ----------

# MAGIC %md **6. Obtener un DF que contenga 4 registros, que serán el cliente de cada grupo edad que más datos móviles ha consumido durante los 15 primeros días del mes de Agosto (día 15 incluido en el cálculo). El DF deberá contener las columnas: nombre, edad, grupo_edad, datos_moviles_total_15, max_sms_enviados_15** </br> (max_sms_enviados_15 contiene el máximo de sms enviados en un día por el cliente con más datos_moviles consumidos de cada grupo_edad durante esos 15 primeros días del mes). </br>
# MAGIC **Extraer conclusiones en cuanto a datos consumidos y sms enviados por cada grupo_edad.**

# COMMAND ----------



# COMMAND ----------

# MAGIC %md **7. Nos interesa averiguar los minutos de llamadas de los clientes que son nuevos este mes para realizar un estudio del impacto que tendrán en caso de producirse un pico de volumen de llamadas en la red. </br> Obtener un DF que contenga sólo a los clientes nuevos de este mes con 4 columnas: nombre_cliente_nuevo, edad, importe_total_mes_actual, total_minutos. </br> Se ordenará el DF resultante por la columna "total_minutos" que contiene el total de minutos de llamadas fijas y móviles durante este mes para cada cliente, ordenándolos de manera que el primer cliente nuevo que aparezca sea el que menos minutos de llamadas ha realizado en el mes de Agosto.</br>** NOTAS: Si hay solo 2 clientes nuevos, el DF a obtener tendrá sólo 2 registros. </br> Tener presente que a la hora de hacer un join, la clave de unión debe ser única en la tabla de la derecha o de otra manera se multiplicarán los registros resultantes de manera descontrolada.
# MAGIC </br> Tener en cuenta que si un cliente nuevo tiene 2 ofertas contratadas, la columna importe_mes_actual deberá contener la suma de los importes de ambas ofertas.

# COMMAND ----------



# COMMAND ----------

# MAGIC %md **8. Obtener un DF que contenga, para los clientes que ya existían en el mes anterior y siguen dados de alta este mes, 3 columnas: nombre, edad, n_dias_sin_sms. La última columna se refiere a obtener el número de veces que cada cliente NO ha enviado ningún SMS en el mes de Agosto. Forzar a que el comando "show" muestre 30 valores.** </br> (Si en todo el mes el cliente "A" no envío SMS 3 días en todo el mes, esta columna deberá contener el valor 3. Si hubiera algún cliente que hubiese enviado al menos 1 sms todos los dias del mes, tendrá valor 0 en esta columna).

# COMMAND ----------



# COMMAND ----------

# MAGIC %md **9. Queremos obtener un Coeficiente de Ponderación que nos permita evaluar a cada cliente en función de su consumo para identificar los clientes más atractivos que forman parte de nuestra compañía. ESTE CÁLCULO SÓLO SE REALIZARÁ PARA LOS CLIENTES QUE TENGAN UNA SOLA OFERTA CONTRATADA CON LA COMPAÑÍA. </br> Este coeficiente se obtendrá en base a los consumos diarios, y por tanto sólo se tendrán en cuenta los clientes que existen en el mes de Agosto, ya que no tenemos datos de consumo del mes de Julio. </br> Las ponderaciones que se darán a cada uno de los consumos son las siguientes:** 
# MAGIC - 0.4 --> llamadas desde telefóno móvil.
# MAGIC - 0.3 --> datos_móviles_MB
# MAGIC - 0.2 --> llamadas desde teléfono fijo
# MAGIC - 0.1 --> SMS enviados </br> 

# COMMAND ----------

# MAGIC %md **Los pasos a seguir son los siguientes:**
# MAGIC   1. Obtener la suma de todos los días de cada uno de los 4 consumos para cada cliente.
# MAGIC   2. Obtener el máximo del cálculo anterior de todos los clientes para poder obtener un valor entre 0 y 1 para cada uno de los 4 consumos (recordar que sólo aplica para los clientes con UNA SOLA OFERTA CONTRATADA en el mes de Agosto. El cliente con mayor consumo de datos tendrá un valor de 1 en la columna 'datos_móviles_0_1')
# MAGIC   3. Multiplicar estas columnas obtenidas con valor entre 0 y 1 por su ponderación correspondiente (por ejemplo la columna "datos_moviles_0_1" se multiplicará por la ponderación de datos móviles 0.4).
# MAGIC   4. Por último se calculará la suma de las 4 ponderaciones obtenidas para calcular el Coeficiente de ponderación buscado (coeficiente_cliente), casteado a 3 decimales.
# MAGIC   5. Mostrar DF resultante ordenado por este coeficiente en sentido descendente, de manera que el primer registro corresponderá al cliente más atractivo. **El DF resultante tendrá 3 columnas: nombre, edad, coeficiente_cliente.**

# COMMAND ----------



# COMMAND ----------

# MAGIC %md **10. Queremos averiguar la fecha en la que entre los 3 clientes que más datos consumen de cada grupo_edad llegan a un consumo de 20 GB de datos móviles. En caso de que algún grupo_edad no llegue entre los 3 clientes a 20 GB en todo el mes, se asignará "null" como valor de esta columna (Recordar que 1 GB = 1024 MB). </br> Obtener un DF que contiene 4 registros, uno para cada grupo_edad y 3 columnas: grupo_edad, fecha_20_GB, datos_moviles_total_grupo_3_clientes.** (datos_moviles_total_grupo_3_clientes representa el total de datos consumidos en MB por los 3 clientes del grupo hasta final de mes)

# COMMAND ----------



# COMMAND ----------


