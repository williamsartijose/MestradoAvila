---
title: "Estructuras de datos"
output:
  word_document: default
  html_document:
    df_print: paged
autor: William Sarti josé
---

Dentro de R, existen diferentes tipos de estructuras de datos con las que podemos trabajar, dentro de esta sección, explicaremos en qué consisten y mostraremos algunas de sus principales funciones:

* **Vectores**
* **Arrays**
* **Listas**
* **Factores**
* **Matrices**
* **Dataframes**

## Vectores

En R, un **vector** es una sucesión de elementos de una dimensión. Un vector puede soportar diferentes tipos de variables. Para su construcción, se utiliza la función **`c`**.

```{r}
a <- c(1, 3.0, 7, 'hola')

a
```

Podemos indexar un vector accediendo a sus posiciones.

```{r}
# Primera posición
a[1]

# Posición n
a[4]

# Rango de posiciones
a[2:4]

# Excluir elementos
a[-2] # Sin la posición 2

# A través de máscara booleana o vector lógico
a[c(T, F, F, T)]

```

Es **muy** importante resaltar que en los vectores cuando aplicamos una operación, la aplicamos a todos los elementos del vector, a no ser que especifiquemos lo contrario.

Para que podamos aplicar operaciones sobre un vector, todos sus elementos deben ser del mismo tipo, es decir, sobre nuestro vector actual no podríamos operar.

```{r}
# a+4
# Error in a + 4 : non-numeric argument to binary operator
```

```{r}
# Asignación de un nuevo vector
b <- c(1, 30, 4, 56, 9)

# Suma a todos los elementos de 4
b + 4

# Resta a todos los elementos de 3
b - 3

# Todos los elementos al cuadrado
b ^ 2
```

Si tenemos más de un vector del mismo tipo y longitud, podemos aplicar operaciones sobre ellos.
```{r}
# Resta de vectores
c <- c(3, 50, 4, 3, 0)

b - c

# Producto de vectores, elemento a elemento
c * b
```

Existen algunas funciones que son propias de los vectores, este caso, nos permiten realizar aritmética vectorial:

* **length**. Longitud de un vector
```{r}
length(b)
length(a)
length(c)
```
* **sum**. Realiza la suma de todos los elementos del vector
```{r}
sum(b)
```
* **prod**. Realiza el producto de todos los elementos del vector.
```{r}
prod(b)
```
* **min**. Devuelve el elemento mínimo de un vector.
```{r}
min(b)
```
* **max**. Devuelve el elemento máximo de un vector.
```{r}
max(b)
```
* **range**. Devuelve el rango del vector, es decir, de su elemento mínimo a máximo
```{r}
range(b)
```
* **mean**. Devuelve la media del vector.
```{r}
mean(b)
```
* **var**. Devuelve la varianza del vector.
```{r}
var(b)
```
* **sd**. Devuelve la desviación estándar del vector.
```{r}
sd(b)
```
* **cumsum**. Devuelve la suma acumulada elemento a elemento del vector
```{r}
cumsum(b)
```
* **cumprod**. Devuelve el producto acumulado del vector elemento a elemento.
```{r}
cumprod(b)
```
* **sqrt**. Raíz de todos los elementos del vector
```{r}
sqrt(b)
```

A través de vectores, podemos crear sucesiones, en algunas ocasiones partiendo de un vector de entrada o, creándolo de cero:

* Generar un vector a partir de un rango definido de n a m. A través del operador **:**
```{r}
1:20

4:8
```
* Generar secuencias a través de la función **seq**, esta función toma como parámetros, origen de la secuencia, máximo de la secuencia, elemento de división.
```{r}
seq(-10, 20, 2)  # -10 a 20 de dos en dos

seq(0, 1, 0.1)
```
* A través de la función **rep**. Podemos generar vectores de números repetidos, esta función toma como parámetros el número a repetir (o elemento) y el número de veces.
```{r}
# Un número 
rep(2, 200)
rep(0.5, 10)

# Secuencias de números
rep(1:10, 3)
```
* Mediante la función **sample**, que toma como parámetros el rango de valores, el número de elementos y si los valores se generaran con reemplazamiento o no.
```{r}
no.rep <- sample(1:10, 10, replace = F)
si.rep <- sample(30:45, 10, replace = T)

no.rep
si.rep
```

Otra forma de seleccionar sub-vectores dentro de un vector ya existente es a través de operaciones de comparación (expresiones booleanas), vemos algunos ejemplos.

```{r}
# Creamos un vector nuevo
z <- rep(1:20, 3)

# Vamos a asignar a todos los elementos del vector que sean menores de 7 el valor 1

z[z < 7] <- 1
z
```
```{r}
# Seleccionar todos los elementos del array que son diferentes de 19
z[z != 19]
```

Finalmente, mostraremos cómo ordenar un vector a través de la función **sort**.
```{r}
# Generamos vector
no.rep.dos <- sample(30:60, 10, replace = F)

# Mostramos el vector ordenado
sort(no.rep.dos, decreasing = T)
```

## Arrays

A diferencia de los vectores, en un **array**, todos sus elementos deben ser del mismo tipo, también son indexables. Para crear un array, haremos uso de la función **`array`**.

```{r}
# Definimos un nuevo array
my.arr <- array(data = c(1,2,3,4), dim = c(2,2))

my.arr
```

Podemos ver la dimensión de un array a través de la función **`dim`**
```{r}
dim(my.arr) # Dos dimensiones de dos elementos
```

También es posible crear un array a través de un vector ya existente:
```{r}
no.rep.dos
length(no.rep.dos) # Divisible entre 2 y 5

dim(no.rep.dos) <- c(5,2)
```

```{r}
no.rep.dos # Vector transformado en array
```

A continuación, mostraremos diferentes maneras de seleccionar elementos de un array.
```{r}
new.arr <- array(1:40, c(5, 4, 2))

new.arr

print(dim(new.arr))
```

```{r}
# Sólo primera dimensión.
new.arr[,,1]

# Columna 2 de las dos dimensiones
new.arr[,2,1:2]

# Fila 4 de la segunda dimensión.
new.arr[4, ,2]

# Elementos en tercera y cuarta posición de la quinta fila, de ambas dimensiones
new.arr[5,c(3,4) , ]

# Todas las filas de la segunda columna en adelante de la primera dimensión
new.arr[ , 2:length(new.arr[1,,1]), 1]
```

Análogamente, también es posible indexar un array a través de otro array.
```{r}
index <- array(c(2, 1:3, 1:2), c(2,3))

index
```
```{r}
new.arr[index]
```

Del mismo modo que los vectores, sobre los arrays también podemos aplicar operaciones aritméticas, como las descritas anteriormente, mostramos algunos ejemplos:
```{r}
# Suma
sum(new.arr)

# Media
mean(new.arr)

# Rango
range(new.arr)

# Máximo
max(new.arr)

# ...
```

Evidentemente, estas operaciones también funcionan a nivel de dimensión, fila, columna de los arrays
```{r}
sum(new.arr[2, , 1]) #Suma de los elementos de la segunda fila de la primera dimensión.
```

No obstante, existen operaciones especiales para los arrays que funcionan a nivel de eje (fila x columna), que son las que se muestran a continuación:
```{r}
# Suma de columnas 
colSums(new.arr, dims = 1) # Suma de todas las columnas por fila
colSums(new.arr, dims = 2) # Suma de todas las columnas por columna

# Suma de filas
rowSums(new.arr, dims = 1) # Suma de todas las filas por fila
rowSums(new.arr, dims = 2) # Suma de todas las filas por columna

# Media de columnas
colMeans(new.arr, dims = 1) # Media de columnas por columna
colMeans(new.arr, dims = 2) # Media de columnas por dimensión

rowMeans(new.arr, dims = 1) # Media de filas por fila
rowMeans(new.arr, dims = 2) # Media de filas por dimensión
```

Si se quieren permutar las dimensiones de un array, se puede hacer uso de la función **`aperm`**
```{r}
aperm(new.arr)
```

Los arrays, también tienen una clase única.
```{r}
class(new.arr)
```

## Listas

Con cierta similaridad a un vector, una **lista**, es una colección de objectos, indexable a través del operador **`[[ ]]`** (doble corchete). Soporta desde el mismo tipo de dato a, diferentes tipos de datos, la declaración de una lista se realiza desde la función **`list`**.

```{r}
my.list <- list(c(1:40))
my.list

my.list[1] # Solamente tiene un elemento la lista, que es un vector

my.list[[1]][5] # Accedemos al primer elemento de la lista, posición 5 del vector.
```

Algo que es siempre aconsejable para poder identificar los diferentes campos o elementos de una lista, es utilizar nombres.
```{r}
new.list <- list(alumnos=c("Juan", "María", "Alfredo"),
                calificaciones=c(7, 4,5, 9))
```

Podemos acceder a sus elementos además de con doble corchetes con un operador especial de R y, que veremos muy comúnmente en dataframes, el operador **`$`**

```{r}
new.list$alumnos

new.list[["alumnos"]]
```

Si un elemento no existe en un componente de la lista, simplemente se agrega. 
```{r}
new.list$alumnos <- c(new.list$alumnos, "Nuevo alumno")
new.list$alumnos

new.list$edad <- c(15, 16, 17, 15)

new.list
```

Las listas tienen su clase propia
```{r}
class(new.list)
```

## Factores

Los factores son vectores especiales, que se utilizan únicamente, para la representación de variables **categóricas**, los variables categóricas son las que indican una cualidad o característica, como por ejemplo: Alto, Bajo, Medio, etc.

Para crear una una variable categórica, tenemos que pasar un vector de caracteres a la función **`factor`**

```{r}
var.cat <- factor(c("ENERO", "FEBRERO", "MARZO", "ABRIL"))
var.cat
```
Una variable categórica, se caracteriza porque cada categoría en R, se denomina como nivel *level*, podemos acceder a sus niveles a través de la función **`levels`**
```{r}
levels(var.cat)
```

Este tipo de vectores especiales, tienen su propia clase.
```{r}
class(var.cat)
```

Para eliminar un nivel de una variable categórica, se hará uso de la función **`droplevels`** que recibirá como parámetro la variable categórica y la categoría a eliminar

```{r}
var.cat = droplevels(x = var.cat, "MARZO")

var.cat
```


## Matrices

Previamente, hemos tratado con arrays multi-dimensionales, una matriz no es ni más ni menos que un array de dos dimensiones. No obstante, las matrices tienen algunos tipos de funciones especiales con las que podemos trabajar, se describirán posteriormente. 

Para crear una matriz se utiliza la función **`matrix`**, que recibe los datos de la propia matriz y, los parámetros **nrow** y **ncol**, adicionalmente, podremos especificar cómo queremos que se rellene la matriz a partir de los datos, por filas sí o no con el parámetro **byrow**

```{r}
# Creamos una matriz.
my.mat <- matrix(1:30, ncol = 6, nrow = 5, byrow = F) # Probar byrow TRUE
my.mat
```

Además de todas las funciones ya vistas que pueden realizarse en arrays y las formas disponibles de indexación, en matrices nos encontramos con las siguientes funciones propias:

* **`ncol`**: Devuelve el número de columnas.
```{r}
# Número de columnas
ncol(my.mat)
```

* **`nrow`**: Devuelve el número de filas.
```{r}
# Número de filas
nrow(my.mat)
```

* **`diag`**: Devuelve la diagonal de la matriz.
```{r}
# Diagonal
diag(my.mat)
```

* **`crossprod`**: Realiza el producto entre dos matrices.
```{r}
crossprod(x = my.mat, y = my.mat)
```

* **`t`**: Devuelve la traspuesta de una matriz.
```{r}
# Traspuesta
t(my.mat)
```

* **`svd`**: Valores singulares de una matriz.
```{r}
# Valores singulares
svd(my.mat)
```

* **`eigen`**: Realiza el cálculo de autovalores y autovectores (La matriz tiene que ser regular).
```{r}
# IMPORTANTE: Necesita una matriz regular
regular.mat <- matrix(1:9, ncol = 3, nrow = 3, byrow = F)

eigen(regular.mat)
```

Puede transformarse un vector como matriz a través de la función **`as.matrix`**.
```{r}
new.mat <- new.arr[, , 1]

as.matrix(new.mat)
class(new.mat)
```

Las matrices, al igual que el resto de estructuras de datos que se trabajan en esta lección tienen una clase propia
```{r}
class(my.mat)
```

## Dataframes

Para finalizar esta sección, se hablará sobre **dataframes**, de forma resumida, un dataframe puede tratarse como una matriz o una lista, ya que cada columna, por lo general, tendrá un nombre, en dataframes hablaremos de variables en lugar de columnas, es importante añadir que todos los registros que aparezcan en el dataframe compartirán el mismo índice a nivel de fila. Un dataframe acepta diferentes tipos de datos.

Para aprender las características y diferentes funcionalidades que ofrece un dataframe, trabajaremos directamente con un archivo csv, la función encargada de leer, cargar y transformar un archivo csv como dataframe es **`read.csv`**, es importante revisar otros parámetros como **sep**, **header** o, **na.strings** en el caso de que ya conozcamos de antemano que el dataset tiene valores nulos que son representados por otros valores o caracteres

```{r}
df <- read.csv("FB.csv")
```

De un modo similar a las listas, puede llamarse a las columnas a través de dobles corchetes, con el operador $ o, a través de indexación.
```{r}
df$Open
df[[2]]
df[["Open"]]
```

Los dataframes también tienen un tipo especial de clase
```{r}
class(df)
```

Para ahorrar trabajo y, no necesariamente tener que escribir siempre el nombre del dataframe cuando queremos trabajar con una variable, puede utilizarse la función **`attach`** y cargará todas las columnas como variables.

```{r}
attach(df)

Date
```

El resultado en todos los casos es un vector sobre el que podemos aplicar las mismas funciones de indexación y operaciones ya vistas en la sección de vectores.

```{r}
# Suma de la variable Open
sum(df$Open)

# Mostramos las posiciones 3 a 8 de la variable Open
df$Open[3:8]

# Filtramos la variable open por todos los valores superiores o iguales que 40
df[df$Open >= 40, ]

# Seleccionamos las filas 100 a 110 de todas las columnas a excepción de la segunda y tercera
df[100:110, -c(2,3)]
```

Cuando ha finalizado el trabajo con el dataframe, utilizaremos **`detach`** para que sea necesario declarar el nombre del dataframe, para trabajar con él.
```{r}
detach(df)
```

Algunas funciones principales que podemos realizar en un dataframe.

* **`summary`**: Devuelve un resumen estadístico de un dataframe.
```{r}
# Resumen estadístico de un dataframe
summary(df)
```

* **`str`**: Devuelve el tipo de variable del dataframe.
```{r}
# Estructura columnar de un dataframe
str(df)
```

* **`attributes`**: Devuelve el nombre de las filas y columnas.
```{r}
# Nombre de filas y columnas
attributes(df)
```

* **`dim`**: Dimensiones del dataframe filas x columnas
```{r}
# Dimensiones de un dataframe
dim(df)
```

* **`colnames`**: Nombre de las columnas del dataframe.
```{r}
# Nombre de las columnas de un dataframe
colnames(df)
```

* **`rownames`**: Nombre de las filas del dataframe.
```{r}
# Nombre de las filas
rownames(df)
```

* **`nrow`**: Número de filas.
```{r}
# Número de filas
nrow(df)
```

* **`ncol`**: Número de columnas.
```{r}
# Número de columnas
ncol(df)
```

* **`head`**: Primeras n posiciones del dataframe.
```{r}
# Primeras posiciones de un dataframe, por defecto
head(df)
```
```{r}
# Primeras 10 posiciones
head(df, 10)
```

* **`tail`**: Últimas n posiciones del dataframe.
```{r}
# Últimas posiciones de un dataframe, por defecto.
tail(df)
```

```{r}
# Últimas 4 posiciones
tail(df, 4)
```

Finalmente, se muestran algunas de las principales transformaciones que pueden aplicarse a un dataframe.

Mediante **`rbind`** se añade una nueva fila, por su parte, **`cbind`** añade una nueva columna.
```{r}
df <- rbind(df, c("2013-03-01", 35.12, 39.32, 32.75, 34.65, 57052800, 34.65), stringsAsFactors=T)

tail(df)
```
```{r}
index.list <- list(index=1:nrow(df))

df <- cbind(df, index.list)

head(df)
```

Otra forma de añadir una columna al dataframe simplemente es asignar el nombre a través del operador $ y un vector de la misma longitud.
```{r}
df$Nueva_Columna <- '^'(as.numeric(df$High),2)

head(df)
```

Si se desea eliminar una variable, aplicaremos **NULL** a la variable
```{r}
# Borramos la columna
df$index <- NULL
```

Para obtener un sub-conjunto del dataframe, empleamos **`subset`**, para seleccionar las columnas a tener en cuenta, aplicaremos el parámetro **select**
```{r}
muestra <- subset(df, select = c("High", "Low"))

muestra
```

Para ordenar un dataframe, disponemos de la función **`order`**
```{r}
ordered <- df[order(df$Open, decreasing = T), ]

head(ordered)
```

Si mediante la función **`names`**, accedemos a los nombres de las variables, es posible renombrar las columnas

```{r}
# Renombramos una columna
names(df)[2] <- "Precio-Apertura"

names(df)
```

Con la función **`as.data.frame`**, se pueden convertir vectores, matrices, listas y arrays como dataframes.
```{r}
# Tomamos un array anterior, importante, estudiar cómo se distribuyen las dimensiones.
new.df <- as.data.frame(new.arr)

new.df
```

Finalmente, es importante cómo gestionar los nulos en un dataframe. Primero, tomaremos una observación como valor nulo.
```{r}
new.df[3, 1] <- NA
```

Una forma inicial de comprobar si tenemos nulos en nuestro dataframe, es a través del comando summary
```{r}
summary(new.df) # Aparece un nulo en V1
```

Otra manera es utilizar la función **`is.na`**
```{r}
is.na(new.df)
```

Pueden detectarse las filas en las que hay nulos a través de **`complete.cases`**
```{r}
complete.cases(new.df)
```

Si se decide borrar los casos nulos haremos:
```{r}
new.df <- new.df[complete.cases(new.df), ]

new.df
```

Si, por el contrario, interesa reemplazar el valor nulo por otro valor.
```{r}
new.df <- as.data.frame(new.arr)
new.df[3, 2] <- NA

new.df$V2[which(is.na(new.df$V2))] <- 1000

new.df
```







