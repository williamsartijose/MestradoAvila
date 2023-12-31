---
title: "Dplyr"
author: "William Sarti josé"
output:
  word_document: default
  html_document:
    df_print: paged
---

Cuando se trabaja con un conjunto de datos, debemos saber qué queremos hacer con los datos, encontrar funciones o, saber qué paquetes importar para transformación y manipulación de datos. Gracias a **Dplyr**, podemos transformar los datos de una manera muy sencilla.

Su lógica se basa en el uso de *verbos*, que no son más que funciones que corresponden con la mayor parte de los procesos de manipulación de datos, lo cuál, hace que sea muy intuitivo el trabajo con esta librería y saber qué función utilizar para una transformación específica.

**Dplyr**, no es un paquete que ya venga instalado en nuestra distribución de R, por lo tanto, es necesaria su instalación.

```{r}
# Instalamos
# install.packages("dplyr")
```

```{r}
# Carga de un paquete en nuestra sesión de trabajo
library(dplyr)
```

En el presente notebook se explicaran las siguientes funciones de dplyr:

* **`filter`**
* **`select`**
* **`Operador Pipe %>%`**
* **`mutate`**
* **`transmute`**
* **`summarise`**
* **`group_by`**
* **`distinct`**
* **`rename`**
* **`arrange`**
* **`sample_n`**
* **`sample_frac`**

Utilizaremos el siguiente dataset para trabajar. **`storms`**. Importante, para poder trabajar con este dataset, previamente debe tenerse cargado dplyr, ya que es un dataset que viene preinstalado con la librería, si se quieren conocer otros datasets pre-cargados en R, utilizar el comando **`data()`**

```{r}
head(storms)
```

Realizamos una pequeña exploración sobre los datos.
```{r}
summary(storms)
```

```{r}
str(storms)
```

```{r}
colnames(storms)
```
```{r}
apply(is.na(storms),2,sum)
```

```{r}
apply(is.na(storms),2,sum)/(length(storms)*100)
```

## Filter

La función **filter** selecciona columnas, en función del valor de sus filas. Por ejemplo, seleccionaremos sólo las filas con valor -65.9 en la columna 'long'.

```{r}
# Seleccionaremos sólo las filas con valor -65.9 en la columna 'long'.

filter(storms, long == -65.9 )
```

Vemos que es mucho más sencillo este tipo de selección que realizar `storms[storms$long == -65.9, ]`. Se mostrará un nuevo ejemplo, además de seleccionar solamente las filas con valor 'long' -65.9, también será requerimiento que el valor de 'year' sea 1981.

```{r}
filter(storms, long == -65.9 , year == 1981)
```

Esto, es mucho más legible que: `storms[(storms$long == -65.9 & storms$year == 1981), ]`

## Select

De una manera similar a las bases de datos relacionales, con la función **select**, seleccionamos las columnas que queremos utilizar, por ejemplo, seleccionaremos del dataframe las columnas: 'name' y 'status'.

```{r}
select(storms, name, status) # Equivalente: storms[, c("name", "status")]
```

Puede apreciarse que, no es necesario utilizar el operador **$** para seleccionar las columnas, basta con que el primer argumento sea el dataframe y, los siguientes, los nombres de las columnas.

También podemos seleccionar rangos, por ejemplo, se tomarán las columnas desde: 'year' a 'hour' (ambas inclusive).

```{r}
select(storms, year:hour)
```

Del mismo modo, también podemos seguir indexando por filas, por ejemplo, realizando una selección de las 5 primeras.

```{r}
select(storms[0: 5, ], year:hour)
```

Existen además parámetros muy interesantes y de gran ayuda cuando no conocemos exactamente el nombre de la columna que queramos seleccionar en cuestión. Estos parámetros son:

* **`starts_with`**: Selecciona columnas que comienzan con una cadena de texto.
```{r}
head(select(storms, starts_with("y")), 2)
```
* **`ends_with`**: Selecciona columnas que finalizan con una cadena de texto.
```{r}
head(select(storms, ends_with("y")), 2)
```
* **`contains`**: Selecciona columnas que contienen una cadena de texto.
```{r}
head(select(storms, contains("on")), 2)
```

## Pipe %>%

Similar al operador **|** en Linux, gracias a dplyr, podemos utilizar un operador que nos permite concatenar funciones **%>%**, es decir, a los resultados de una primera función, aplicar una nueva función, todo a través de una sola línea de código.

Para ejemplificar este operador, se tomará el ejemplo previo: Además de seleccionar solamente las filas con valor 'long' -65.9, también será requerimiento que el valor de 'year' sea 1981. A este ejemplo se añadirá la restricción de mostrar únicamente con las columnas: 'status' y 'category'.

```{r}
filter(storms, long == -65.9 , year == 1981) %>%
  select(status, category)
```

Es posible seguir añadiendo funciones, por ejemplo, cambiaremos las columnas a proyectar por 'wind' y 'pressure', el año a filtrar por 2001, finalmente mostraremos el resumen estadístico de los resultados.

```{r}
filter(storms, long == -65.9 , year == 2001) %>%
  select(wind, pressure) %>%
  summary
```

## Mutate

La función **mutate**, es utilizada para crear columnas en base a otras ya existentes. Además agrega la nueva columna al dataframe.

```{r}
mutate(storms, 
       presion_ratio = round(pressure / wind),2) %>% select(pressure, wind, presion_ratio) %>% head(., 5)


```

## Transmute

Es igual a **mutate**. Sin embargo, **transmute** realiza la operación, pero solamente devuelve las nuevas columnas.

```{r}
transmute(storms, 
          presion_ratio = round((pressure / wind),2) ,
          mean_ratio_wind = presion_ratio/mean(wind)) %>% head(.,10)
```

## Summarise

La función **summarise**, permite confeccionar resúmenes sobre los datos de forma personalizada mostrando estadísticas sobre variables. 

Para ayudar en la obtención de estadísticas, dplyr integra nuevas funciones que realizan las siguientes operaciones:

* **first**: Muestra el primer elemento de una columna del dataframe.
* **last**: Muestra el último elemento de una columna del dataframe.
* **n**: Elementos de la columna del dataframe.
* **n_distinct**: Número de elementos únicos de la columna del dataframe.

```{r}
storms %>% summarise(sum_pressure = sum(pressure),
                     min_wind = min(wind),
                     max_wind = max(wind),
                     range_wind = (max(wind) - min(wind)),
                     first_row_status = first(status),
                     last_row_status = last(status),
                     unique_categories = n_distinct(category),
                     total_rows = n())
```

## Group_by

Al igual que en SQL, a través de **group_by**, podemos mostrar el dataframe agrupado por variables o estadísticas de las mismas.

```{r}
storms %>% group_by(category, status) %>%
           summarise(media_viento = mean(wind),
                     total_category = n())
```

```{r}
storms %>%
  select(year, name, pressure) %>% 
  group_by(name, year) %>% 
  summarise(media_presion = round(mean(pressure), 2)) %>% 
  arrange(year)
```

## Distinct

Elimina filas duplicadas de un dataframe.

```{r}
df <- data.frame("col_uno"=c(1,2,3,4,5,6,6), "col_dos"= c(1,7,8,4,5,6,6))
df
```
```{r}
distinct(df)
```



## Rename

Su uso es muy sencillo, simplemente pasamos como argumento el dataframe y el nuevo nombre que utilizaremos para una columna determinada. Por ejemplo, se cambiará el nombre de la variable 'status' por 'tipo'.

```{r}
rename(storms, tipo = status)
```

## Arrange

La función **arrange**, se utiliza para ordenar un dataframe de dos formas diferentes: 1. De forma descendente con **desc**, 2. Ascendente (por defecto). En el siguiente ejemplo, se ordenará el dataframe por las columnas lat y long.

```{r}
arrange(storms, lat, long) %>% head(., 10)
```

En este otro ejemplo, se ordenará de forma descendente todo el dataframe por la columna 'year'
```{r}
arrange(storms, desc(year)) %>% head(., 10)
```

## Sample_n

Devuelve una muestra de n filas aleatorias, podemos utilizar `replace=T` para hacer muestreos.

```{r}
sample_n(storms, 5)
```


## Sample_frac

Devuelve una muestra aleatoria del dataframe de forma porcentual, podemos utilizar `replace=T` para hacer muestreos.

```{r}
sample_frac(storms, 0.01)
```



