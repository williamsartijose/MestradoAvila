---
title: "R Notebook"
author: "William Sarti josé"
output:
  word_document: default
  html_document:
    df_print: paged
---

# MI PRIMER NOTEBOOK

## FUNDAMENTOS DE R

### Elementos de Markdown

Esto, se muestra como una cadena de texto simple.

Ahora agreagamos una lista de elementos:

* Primer elemento
* Segundo elemento
* Tercer elemento

Ahora realizamos una lista numerada:

1. Uno
2. Dos
3. Tres

Lista con sub-elementos:

* Ítem 1
  + Sub-ítem 1
* Ítem 2
  + Sub-ítem 2

De esta forma añadimos texto en cursiva *my_function* , _my_function_

De esta otra forma añadimos texto en negrita **importante** , __importante__

NOTA: Recuerda que si pulsas: CNTRL + ALT + I, se agrega una nueva celda *chunk* de código R.
```{r}
# Mis variables

a <- 7 # Entero
b <- 5.33 # Double
c <- 'Mi cadena de texto' # Sirven tanto comillas simples...
d <- "Mi otra cadena de texto"# ... como comillas dobles
```

```{r}
print(a)
```
```{r}
print(b)
```
```{r}
print(c)
```
```{r}
print(d)
```

Para desplegar ayuda en R se puede realizar `help("nombre_func")`, utilizar el operador interrogante con el nombre de la función `?nombre_func` y también seleccionar el nombre de la función y pulsar **F1**

```{r}
help("print")
```

```{r}
?print
```

Existen dos funciones para establecer un entorno de trabajo (muy útil para cuando tenemos datasets en un ruta específica). **`setwd`** y **`getwd`**, a través de la primera establecemos desde la ruta del directorio en el que queramos trabajar, un entorno de trabajo y, con la segunda función obtenemos el entorno de trabajo actual
```{r}
getwd()
```

```{r}
setwd("C:/Users/JMMoreno/Downloads/") # REALIZAR EL CAMBIO EN CONSOLA
```


