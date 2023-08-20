---
title: "Funciones"
output:
  html_document:
    df_print: paged
  word_document: default
autor: William sarti josé
---

Especialmente, cuando una compañía realiza procesos que serán llevados a producción, uno de los elementos más importantes es que, sus programas estén modularizados con **funciones**, de esta manera, se mejora la legibilidad del código, la velocidad, reusabilidad y aumenta la tolerancia a fallos del mismo.

En R para declarar una función se utiliza el comando **`function`**, como en cualquier lenguaje de programación, las funciones pueden recibir parámetros de **entrada** y parámetros de **salida**, se describirán algunos ejemplos para comprender estas dos metodologías.

En primer lugar, se realizará una función simple que reciba como parámetro de entrada un número y lo devuelva elevado al cubo. Para devolver cualquier valor de una función, será necesario utilizar la palabra reservada **return**.

```{r}
# Creamos la función
exp.test <- function(number){
  result <- number ^ 3
  return (result)
}

# Llamamos a la función
a <- exp.test(number = 3)
a
```

Realizando una modificación en el ejemplo anterior, es posible codificarlo para que el programa reciba dos números y, devuelva como resultado, el primer número elevado al segundo.

```{r}
# Creamos la función
exp.test <- function(number, pow){
  result <- number ^ pow
  return (result)
}

# Llamamos a la función
a <- exp.test(number = 3, pow = 4)
a
```

Por lo general, R está preparado para devolver un sólo valor en una función, no obstante, si devolvemos una estructura de datos como por ejemplo, una lista, posteriormente, podremos acceder por separado a sus ítems.

En el siguiente ejemplo, se desarrollará una función que reciba como parámetro de entrada un vector y, devuelva su valor máximo y mínimo.

```{r}
min.max <- function(v){
  # Inicializamos una lista vacía.
  my.list <- list()
  
  my.list$min <- min(v)
  my.list$max <- max(v)
  
  return (my.list)
}

results <- min.max(v = c(100, 20, 34, 8))

results$min
results$max
```

Existen una familia de funciones que sirven para automatizar una función sobre una secuencia de valores, de esta manera omitiendo el uso de bucles, estas funciones son todas derivadas de la función principal **`apply`**. Se mostrará un ejemplo de cada tipo de función:

* **`apply`**: Realiza una misma operación sobre los ejes, por ejemplo: Supongamos que se quiere obtener la suma de las columnas, la función apply recibirá como parámetros, los datos, la dirección ( filas o columnas) y la función a aplicar.
```{r}
m <- matrix(c(1:10), nrow = 5, ncol = 2)
m

apply(m, 2, sum)
```

Del mismo modo funcionará en las filas.
```{r}
apply(m, 1, sum)
```

* **`lapply`**: Misma función que apply, pero su funcionamiento está optimizado en listas. El resultado, lo devuelve también como una lista.
```{r}
v <- matrix(1:10, ncol = 2, nrow = 5)
v.2 <- matrix(5:15, ncol = 2, nrow = 5)

lista = list(v, v.2)
lista

# Obtenemos la multiplicación
lapply(lista, FUN = prod)
```

* **`sapply`**: Recibe una lista, aplica una función y, devuelve un vector.
```{r}
sapply(lista, sum)
```

* **`tapply`**: Realiza una operación, en función de un vector de factores, operación aconsejable para dataframes.
```{r}
v.num <- c(10:20)
v.fact <- c("PAR", "IMPAR", "PAR", "IMPAR", "PAR", "IMPAR",
            "PAR", "IMPAR", "PAR", "IMPAR", "PAR")

tapply(v.num, v.fact, sqrt)
tapply(v.num, v.fact, sum)
```

* **`mapply`**: Opera entre matrices o vectores y devuelve el resultado como una lista o vector, esto depende del número de iteraciones necesarias.
```{r}
mapply(sum, v, v.2, 1)

mapply(rep, 1:5, 5:1)
```

Se ha visto en secciones anteriores que, R dispone de una amplia variedad de funciones ya predefinidas que nos ahorran trabajo a la hora de procesar datos, en este punto, se mostrarán algunas de ellas, es muy importante que, siempre que quiera realizarse un tipo de acción específica, se investigue si R ya posee una función propia, ya que estará optimizada y, por supuesto, nos ahorrará trabajo.

* **`is.character`**: Devuelve un booleano en función de si la variable es o no caracter.
```{r}
a <- "hola"
is.character(a)

b <- 5
is.character(b)
```

* **`is.factor`**: Devuelve un booleano en función de si la varible es o no categórica.
```{r}
a <- "hola"
b <- as.factor("hola")

is.factor(a)
is.factor(b)
```

* **`is.numeric`**: Devuelve un booleano en función de si la variable es numérica o no.
```{r}
a <- 5
b <- 3.0
c <- "a"

is.numeric(a)
is.numeric(b)
is.numeric(c)
```

* **`as.character`**: Transforma una variable categórica o numérica a carácter.
```{r}
a <- factor(c("UNO", "DOS"))
levels(a)
class(a) 

new.a <- as.character(a)
class(new.a)
```
```{r}
as.character(3.23)
as.character(5)
```

* **`as.numeric`**: Transforma en variable numérica una variable categórica.
```{r}
a <- factor(c("POSITIVE", "NEGATIVE"))
levels(a)

as.numeric(a)
```

También es posible transformar en numérico cadenas de texto, si son explicitamente, números.
```{r}
as.numeric("58.45")
```

* **`as.factor`**: Permite transformar a factor un vector, ya se numérico o de caracteres. 
```{r}
a <- c(1,2,1,2)
b <- c("hola", "adios", "hola", "hola", "adios")

as.factor(a)
as.factor(b)
```

* **`table`**: Muestra la frecuencia de los valores únicos de una variable.
```{r}
table(b)

table(a)
```

* **`unique`**: Muestra los valores únicos de una variable.
```{r}
y <- c(1, 2, 3, 5, 9, 1, 2, 3, 9, 0)

unique(y)
```

* **`set.seed`**: Recibe como parámetro un número entero, replica siempre el mismo resultado (muy recomendable cuando trabajamos con aleatorios)
```{r}
set.seed(777)

sample(1:10, replace=T)
sample(1:10, replace=T)
sample(1:10, replace=T)
```


* **`data.frame`**: Permite crear de cero un dataframe, a través de vectores o matrices.
```{r}

df <- data.frame("ventas_q1" = v[ ,1], "ventas_q2" = v[ ,2],
                 "ventas_q3" = v.2[ ,1], "ventas_q4" = v.2[ ,2])

df

str(df)
names(df)
```






