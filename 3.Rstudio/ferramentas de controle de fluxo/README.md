---
title: "Herramientas de control de flujo"
output:
  word_document: default
  html_document:
    df_print: paged
autor: William Sarti josé
---


En cualquier lenguaje de programación es básico garantizar un correcto funcionamiento de un programa, concretamente, cuando trabajamos en ciencia de datos, tenemos que conseguir ejecutar scripts que no contengan errores y garanticen el correcto funcionamiento de todos los procesos que estén involucrados en cuanto al dato.

Para el correcto funcionamiento de un programa se utilizan **herramientas de control de flujo**, a lo largo de esta sección explicaremos algunas de las más importantes que son:

* **Condicionales**
* **Bucles**

## Condicionales

Las sentencias **condicionales** se emplean para derivar la ejecución de un programa hacia una acción u otra diferente en función de una expresión booleana, esto, traducido a un lenguaje de programación se basa en lo siguiente:

* Si (expresión booleana)
  + Realizar un acción
* Si no
  + Realizar otra acción
  
Para aplicar sentencias condicionales en R dispone de los siguientes comandos **if** y **else**. Se propondrá un primer ejemplo simple: Si un número es mayor que 5 lo multiplicamos por 2, si no, lo dividimos entre no

```{r}
number <- 6

if (number > 5){
  print(number * 2)
} else {
  print(number / 2)
}
```

Otro ejemplo: Dado un vector, que recoja su ítem máximo, si su valor máximo es el doble o más grande que el valor mínimo, mostramos el valor mínimo al cuadrado, si no, elevamos al cuadrado el valor máximo.

```{r}
# Creamos un vector
my.vec <- c(3, 4, 9, 10, 2, 20)

if (max(my.vec) >= (2*min(my.vec))) {
  
  # Elevamos al cuadrado el valor mínimo
  print(min(my.vec)^2)
  
} else {
  
  # Elevamos al cuadrado el valor máximo
  print(max(my.vec)^2)
  
}

```

En muchas ocasiones, es probable que existan múltiples restricciones para la realización de un programa, esto nos obligará a sub-dividir los bloques de condicionales, en **if-else anidados**, en otros casos **if-else apilados**, se mostrará primero un ejemplo de condicional anidado.

Dado un número, si es mayor que 10, si es par, devolver True, si no, False y, si no es mayor que 10, dividir el número entre dos

```{r}
# Tomamos un número
a <- 13

if (a > 10) {
  
  if (a %% 2 == 0) {
    
    print(TRUE)
    
  } else {
    
    print(FALSE)
    
  }
  
} else {
  
  print(a/2)
  
}
```
```{r}
a <- 12

if (a > 10) {
  
  if (a %% 2 == 0) {
    
    print(TRUE)
    
  } else {
    
    print(FALSE)
    
  }
  
} else {
  
  print(a/2)
  
}
```

En este siguiente ejemplo, estaremos trabajando con un if-ese apilado.

Dado un vector, tomar el valor máximo, si es impar, elevar el valor al cubo, si no, si el valor mínimo del vector es mayor a 10, devolvemos la suma del vector, si no, mostramos el producto del vector.

```{r}
vec <- c(3, 5, 13, 9, 5, 7, 8)

if (max(vec) %% 2 == 0) {
  
 print(max(vec)^3)
  
} else if (min(vec) > 10) {
  
  print(sum(vec))
  
} else {
  
  print(prod(vec))
  
}
```

## Bucles

Algo muy habitual cuando trabajamos con estructuras de datos, es tener que recorrer iterativamente sus elementos, para realizar esta acción, en R podemos elegir los siguientes tipos de **bucles**

* **`for`**: Recorre una secuencia, realizando una acción en cada elemento de la secuencia.
```{r}
for (i in 1:10){
  # Elevamos todos los valores al cubo
  print(i^3)
}
```

```{r}
my.mat <- matrix(1:30, nrow=3, ncol=3)

# Multipicamos cada valor de fila por el valor de columna

# Recorremos filas
for (fila in 1:dim(my.mat)[1]){
  # Recorremos columnas
  for (columna in 1:dim(my.mat)[2]){
    cat('Elemento: ', fila, ' ', columna, ' --> ', fila*columna, '\n')
  }
}
```

* **`while`**: Se necesita una expresión booleana, mientras dicha expresión se cumpla, se realiza la misma acción, hasta que no se cumpla dicha expresión booleana, esto supondrá una acción de parada.
```{r}
i <- 1

# Mientras el valor sea menor que 6, sumamos un valor
while (i < 6) {
  print(i)
  i <- i+1
}
```

```{r}
x <- c(100, 2, 3, 900, 4)

# Recorremos ítem a ítem un vector
index <- 1
while (index <= length(x)){
  # Multiplicamos cada valor del vector por el valor de índice
  print(x[index] * index)
  index <- index + 1 
}
```

* **`repeat`**: Repite constantemente una acción hasta que se cumple una condición de parada, esta condición de parada debe ser una expresión booleana, cuando esta condición se cumpla, finalizaremos la ejecución del bucle con **break** (break es aplicable al resto de bucles)
```{r}
x <- 1

repeat {
  
  print(x)
  x <- x+1
  if (x == 6){
    break
  }
}
```

En algunas ocasiones, cuando una expresión booleana se cumpla, simplemente no querremos hacer nada y pasar a la siguiente iteración, para este propósito, existe la operación **next**.

```{r}
v <- c(1, 20, 3, 4, 7, 9, 100, 133, 1000)

for (item in 1:length(v)){
  
  if (v[item] %% 2 == 0) {
    next
    
  } else {
    
    print(item * v[item])
    
  }
  
}
```

