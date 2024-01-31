# 6. Caso práctico

Contenido de la actividad

Enunciado



Para la resolución de la práctica, es aconsejable resolverlo en primer lugar desde la plataforma Databricks, pues se trabaja de forma mucho más visual y rápida, especialmente si se cuenta con máquinas con recursos limitados (menos de 12 GB de RAM).



Por ello, se incluye adjunto a esta práctica un notebook de Databricks (“PySpark_Telco_evaluacion_Databricks.py”), que contiene las 10 preguntas de evaluación, con una celda de separación entre ellas para que podáis aplicar los comandos que se crean oportunos para resolver cada caso.


### Caso 1:
Mostrar por pantalla el número total de clientes del mes anterior con más de un contrato con la compañía.

![Web 0](https://github.com/williamsartijose/MestradoAvila/blob/main/Tecnolog%C3%ADa%20y%20herramientas%20Big%20Data/1.%20Caso%20pr%C3%A1ctico/img/1.png)


### Caso 2:
Generar un nuevo dataframe de facturas del mes actual que asigne un 7% de descuento a todos los contratos de clientes que ya existían en el mes anterior (los contratos de los clientes nuevos seguirán con el mismo importe). Mantener la columna "importe" y crear una nueva columna "importe_dto" con el nuevo importe, casteada a dos decimales. Mostrar, además, el resultado ordenado por los campos “id_cliente” ascendente e importe descendente.

![Web 0](https://github.com/williamsartijose/MestradoAvila/blob/main/Tecnolog%C3%ADa%20y%20herramientas%20Big%20Data/1.%20Caso%20pr%C3%A1ctico/img/2.png) 

### Caso 3:
Por problemas de saturación en la red debido al incremento en el uso de datos por el confinamiento debido a la COVID-19, se decide limitar el uso de datos este mes subiendo la tarifa de todas las ofertas que incluyan "datos ilimitados" en un 15%. Obtener un DF con las mismas columnas que el DF de facturas del mes actual y, a mayores, la columna "importe_dto".
![Web 0](https://github.com/williamsartijose/MestradoAvila/blob/main/Tecnolog%C3%ADa%20y%20herramientas%20Big%20Data/1.%20Caso%20pr%C3%A1ctico/img/3.png) 

### Caso 4:
Crear una nueva variable "grupo_edad" que agrupe a los clientes, tanto del “mes_actual” como del “mes_anterior” en cuatro rangos según su edad asignando valores del uno al cuatro según el rango al que pertenezcan (18-25 (1), 26-40 (2), 41-65 (3), >65 (4)). 
Obtener una tabla resumen que extraiga para cada para cada uno de los cuatro grupos identificados la media de consumo de datos, SMS enviados, “minutos_movil”, “minutos_fijo”, con todos los campos casteados a dos decimales y ordenar el DF por “grupo_edad” ascendente. Extraer conclusiones.

![Web 0](https://github.com/williamsartijose/MestradoAvila/blob/main/Tecnolog%C3%ADa%20y%20herramientas%20Big%20Data/1.%20Caso%20pr%C3%A1ctico/img/4.png) 
![Web 0](https://github.com/williamsartijose/MestradoAvila/blob/main/Tecnolog%C3%ADa%20y%20herramientas%20Big%20Data/1.%20Caso%20pr%C3%A1ctico/img/4.1.png) 

### Caso 5:
Se quiere realizar un estudio por sexo para analizar si son las mujeres o los hombres quienes consumen más datos durante el fin de semana y hacen más llamadas desde el móvil. Para ello,se deberá, sin ayuda de un calendario, extraer el día de la semana al que corresponde cada una de las fechas del mes de agosto para saber cuáles son fin de semana (se consideran días de fin de semana el viernes, sábado y domingo). 
El DF a obtener deberá tener dos registros con las siguientes columnas: sexo, “total_mins_movil_finde”, “total_datos_moviles_finde”. Extraer conclusiones tras presentar el DF resultante.

![Web 0](https://github.com/williamsartijose/MestradoAvila/blob/main/Tecnolog%C3%ADa%20y%20herramientas%20Big%20Data/1.%20Caso%20pr%C3%A1ctico/img/5.png) 
![Web 0](https://github.com/williamsartijose/MestradoAvila/blob/main/Tecnolog%C3%ADa%20y%20herramientas%20Big%20Data/1.%20Caso%20pr%C3%A1ctico/img/5.1.png) 

### Caso 6:
Obtener un DF que contenga cuatro registros, que serán el cliente de cada grupo edad que más datos móviles ha consumido durante los 15 primeros días del mes de agosto (día 15 incluido en el cálculo). 
El DF deberá contener las columnas: nombre, edad, “grupo_edad”, “datos_moviles_total_15”, “max_sms_enviados_15” (“max_sms_enviados_15” contiene el máximo de sms enviados en un día por el cliente con más “datos_moviles” consumidos de cada “grupo_edad” durante esos 15 primeros días del mes). Extraer conclusiones en cuanto a datos consumidos y SMS enviados por cada “grupo_edad”.


![Web 0](https://github.com/williamsartijose/MestradoAvila/blob/main/Tecnolog%C3%ADa%20y%20herramientas%20Big%20Data/1.%20Caso%20pr%C3%A1ctico/img/6.png) 
![Web 0](https://github.com/williamsartijose/MestradoAvila/blob/main/Tecnolog%C3%ADa%20y%20herramientas%20Big%20Data/1.%20Caso%20pr%C3%A1ctico/img/6.1.png) 


### Caso 7:
Interesa averiguar los minutos de llamadas de los clientes que son nuevos este mes para realizar un estudio del impacto que tendrán en caso de producirse un pico de volumen de llamadas en la red. 
Obtener un DF que contenga solo a los clientes nuevos de este mes con cuatro columnas: “nombre_cliente_nuevo”, edad, “importe_total_mes_actual”, “total_minutos”. 
Se ordenará el DF resultante por la columna "total_minutos", que contiene el total de minutos de llamadas fijas y móviles durante este mes para cada cliente, ordenándolos de manera que el primer cliente nuevo que aparezca sea el que menos minutos de llamadas ha realizado en el mes de agosto.

![Web 0](https://github.com/williamsartijose/MestradoAvila/blob/main/Tecnolog%C3%ADa%20y%20herramientas%20Big%20Data/1.%20Caso%20pr%C3%A1ctico/img/7.png) 
![Web 0](https://github.com/williamsartijose/MestradoAvila/blob/main/Tecnolog%C3%ADa%20y%20herramientas%20Big%20Data/1.%20Caso%20pr%C3%A1ctico/img/7.1.png) 


### Caso 8:
Obtener un DF que contenga, para los clientes que ya existían en el mes anterior y siguen dados de alta este mes, tres columnas: nombre, edad, “n_dias_sin_sms”. La última columna se refiere a obtener el número de días en los que el cliente no ha enviado ningún SMS durante el mes de agosto. Forzar al comando show a que muestre 30 valores. Si en todo el mes el cliente "A" no envió SMS tres días, esta columna deberá contener el valor “3”. Si hubiera algún cliente que hubiese enviado al menos un SMS todos los días del mes, esta columna tendrá valor “0”).

![Web 0](https://github.com/williamsartijose/MestradoAvila/blob/main/Tecnolog%C3%ADa%20y%20herramientas%20Big%20Data/1.%20Caso%20pr%C3%A1ctico/img/8.png) 
![Web 0](https://github.com/williamsartijose/MestradoAvila/blob/main/Tecnolog%C3%ADa%20y%20herramientas%20Big%20Data/1.%20Caso%20pr%C3%A1ctico/img/8.1.png) 


### Caso 9:
Se desea obtener un coeficiente de ponderación que permita evaluar a cada cliente en función de su consumo para identificar los clientes más atractivos que forman parte de la compañía. 
Este cálculo solo se realizará para los clientes que tengan una sola oferta contratada con la compañía.
Este coeficiente se obtendrá en base a los consumos diarios y, por tanto, solo se tendrán en cuenta los clientes que existen en el mes de agosto, ya que no existen datos de consumo del mes de julio. Las ponderaciones que se darán a cada uno de los consumos son las siguientes:
- 0,4 → llamadas desde teléfono móvil.
- 0,3 → “datos_móviles_MB”.
- 0,2 → llamadas desde teléfono fijo.
- 0,1 → SMS enviados.

Los pasos a seguir son los siguientes:
1. Obtener la suma de todos los días de cada uno de los cuatro consumos para cada cliente.
2. Obtener el máximo del cálculo anterior de todos los clientes para poder obtener un valor entre cero y uno para cada uno de los cuatro consumos (recordar que solo aplica para los clientes con una sola oferta contratada en el mes de agosto. El cliente con mayor consumo de datos tendrá un valor de “1” en la columna “datos_móviles_0_1”).
3. Multiplicar estas columnas obtenidas con valor entre 0 y 1 por su ponderación correspondiente (por ejemplo, la columna "datos_moviles_0_1" se multiplicará por la ponderación de datos móviles 0,4).
4. Por último, se calculará la suma de las cuatro ponderaciones obtenidas para calcular el coeficiente de ponderación buscado (“coeficiente_cliente”), casteado a tres decimales.
5. Mostrar el DF resultante ordenado por este coeficiente en sentido descendente, de manera que el primer registro corresponderá al cliente más atractivo. 
El DF resultante tendrá tres columnas: nombre, edad, “coeficiente_cliente”.



![Web 0](https://github.com/williamsartijose/MestradoAvila/blob/main/Tecnolog%C3%ADa%20y%20herramientas%20Big%20Data/1.%20Caso%20pr%C3%A1ctico/img/9.png) 
![Web 0](https://github.com/williamsartijose/MestradoAvila/blob/main/Tecnolog%C3%ADa%20y%20herramientas%20Big%20Data/1.%20Caso%20pr%C3%A1ctico/img/9.1.png) 

### Caso 10:
Se desea averiguar la fecha en la que entre los tres clientes que más datos consum



"Etapa 1: Cargar los Datos"


![Web 0](https://github.com/williamsartijose/MestradoAvila/blob/main/Tecnolog%C3%ADa%20y%20herramientas%20Big%20Data/1.%20Caso%20pr%C3%A1ctico/img/10.png) 
![Web 0](https://github.com/williamsartijose/MestradoAvila/blob/main/Tecnolog%C3%ADa%20y%20herramientas%20Big%20Data/1.%20Caso%20pr%C3%A1ctico/img/10.1.png) 

# Autor

William Sarti José

https://www.linkedin.com/in/william-analistadesistema/
