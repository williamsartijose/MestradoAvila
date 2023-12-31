---
title: "GGPLOT2"
author: "William Sarti josé"
output:
  word_document: default
  html_document:
    df_print: paged
---

Basado en el libro *The Grammar of Graphics* https://www.amazon.com/Grammar-Graphics-Statistics-Computing/dp/0387245448/ref=as_li_ss_tl?ie=UTF8&qid=1477928463&sr=8-1&keywords=the+grammar+of+graphics&linkCode=sl1&tag=ggplot2-20&linkId=f0130e557161b83fbe97ba0e9175c431, **Ggplot2** es una librería de visualización de datos que trabaja a nivel de capa, es decir, nos permite ir añadiendo nuevos elementos estéticos a nuestra visualización de datos.

Este paquete está disponible en dos formatos, desde **tidyverse** o directamente descargando **ggplot2**, para explicar las bondades de esta librería, se utilizará esta segunda opción. 

```{r}
# install.packages("ggplot2")

library(ggplot2)
```

Por regla general, comenzaremos pasando nuestro dataset a la función **`ggplot`**, las variables que intenvendrán en la gráfica a través del argumento **aes**. Posteriormente, iremos añadiendo capas.

No obstante, además de toda la parametrización que permite ggplot, podemos crear gráficas de forma muy simple con la función **`qplot`** que creará gráficas rápidas, *quick plots*.

Para comenzar nuestro trabajo en ggplot2, una vez se ha importado la librería, tomaremos el dataset **`midwest`** que viene pre-cargado en dicha librería.

```{r}
summary(midwest)
str(midwest)
head(midwest)
```

Ordenamos los datos.
```{r}
library(tidyr)
library(dplyr)

df <- gather(midwest, "pop_category", "population", c(5:11, 17, 21))
df <- gather(df, "per_category", "pervalue", 5:17)

# La gran mayoría de estas variables podrían dejarse como as.character sin problema.
df <- df %>% transmute(
  PID = as.factor(PID),
  county = as.factor(county),
  state = as.factor(state),
  area = area,
  inmetro = inmetro,
  category = as.factor(category),
  pop_category = as.factor(pop_category),
  population = population,
  per_category = as.factor(per_category),
  pervalue = pervalue
)
summary(df)
colnames(df)
```

Como primera gráfica tomaremos un diagrama de dispersión, la capa encargada de esta función es **`geom_point`**.

```{r}
ggplot(data = df) +
  geom_point(mapping = aes(x = pervalue, y = population))
```

Ante la primera gráfica es importante destacar los componentes más importantes de una capa:

* **mapping**: Se definen los componentes estéticos **aes** *aesthetics*.
* **data**: Dataframe de origen.
* **geom_**: Capas de interacción gráfica.

Lo siguiente que puede realizarse sobre la gráfica anterior es agregar color a la nube de puntos, para ello, utilizamos el parámetro **color**. 

```{r}
ggplot(data = df) +
  geom_point(mapping = aes(x = pervalue, y = population, color = state))
```

También podemos utilizar un color cualquiera que no pertenezca a las variables, por lo tanto, utilizamos el parámetro **color** fuera de **aes**

```{r}
ggplot(data = df) +
  geom_point(mapping = aes(x = pervalue, y = population), color = "dodgerblue4")
```

Si en lugar de mostrar el color por país, queremos mostrar el tamaño de punto en función del país, utilizamos el parámetro **size**.

```{r}
ggplot(data = df) +
  geom_point(mapping = aes(x = pervalue, y = population, size = state))
```

Existen otros parámetros que modifican la forma y el color de nuestra gráfica como son: **aplha** y **shape**

```{r}
ggplot(data = df) +
  geom_point(mapping = aes(x = pervalue, y = population, alpha = state))
```

```{r}
ggplot(data = df) +
  geom_point(mapping = aes(x = pervalue, y = population, shape = state))
```

La anterior gráfica, debido a la densidad de los puntos no es muy reveladora, por lo tanto, podemos hacer uso las funciones de dplyr para obtener una muestra más reducida.

```{r}
ggplot(data = sample_frac(df, 0.001)) +
  geom_point(mapping = aes(x = pervalue, y = population, shape = state))
```

## Ejemplos de gráficas

Probamos con diferentes tipos de gráfica.

**Gráfico de barras**. Importante en este ejmplo destacar el uso de fill dentro de **aes** y **color** como parámetro mapping.
```{r}
ggplot(df) + 
  geom_bar(mapping = aes(state, fill = state), color = "black")
```

**Boxplot**. Podemos destacar los outliers con el parámetro **outlier.colour**, en cualquier gráfico si lo necesitamos podemos voltear los ejes con **`coord_flip`**
```{r}
ggplot(df) + 
  geom_boxplot(mapping = aes(x = pervalue, fill = state), outlier.colour = "red") + coord_flip()
```

**Diagrama de densidad**. En algunas gráficas el parámetro *color*, no estará disponible, pero sí **colour**, observamos también el uso de **alpha** que aumenta o disminuye la transparencia del interior de la gráfica.
```{r}
ggplot(df) +
  geom_density(mapping = aes(area), colour = "darkblue", fill = "darkblue", alpha = 0.4)
```

```{r}
ggplot(df) +
  geom_density(mapping = aes(area, fill=state), colour = "darkblue", alpha = 0.4)
```

**Histograma**
```{r}
ggplot(df) +
  geom_histogram(mapping = aes(area), color = "red", fill = "lightblue", alpha = 0.6)
```

Si pasamos una variable categórica como relleno, mostrará la frecuencia acumulada para cada barra del histograma.
```{r}
ggplot(df) +
  geom_histogram(mapping = aes(area, fill = state), color = "red" )
```

Con el parámetro **binwidth** podemos definir la anchura de cada barra.
```{r}
ggplot(df) +
  geom_histogram(mapping = aes(area), color = "blue", binwidth = 0.02)
```

Con el parámetro **bins** forzamos a un número fijo de barras verticales a mostrar.
```{r}
ggplot(df) +
  geom_histogram(mapping = aes(area), color = "blue", bins=100)
```

Podemos combinar un histograma con un diagrama de densidad, en estos casos, habrá una reestricción especial y es que en el histograma, tendremos que utilizar el tipo especial **y=..density..**
```{r}
ggplot(df, aes(area)) +
  geom_histogram(aes(y=..density..), color = "blue", bins=100) +
  geom_density(colour = "darkblue", fill = "pink", alpha = 0.4)
```

Si queremos que los valores de relleno, no se agrupen en forma de frecuencia acumulada, utilizaremos el parámetro **dodge** con el valor identity.
```{r}
ggplot(df) +
  geom_histogram(mapping = aes(area, fill=state), color = "blue", position = "dodge")
```

```{r}
ggplot(df) +
  geom_histogram(mapping = aes(inmetro, fill=state), color = "blue", position = "dodge")
```

También podemos mostrar que los elementos se super pongan la posición identity
```{r}
ggplot(df) +
  geom_histogram(mapping = aes(area, fill=state), color = "blue", position = "identity")
```

```{r}
ggplot(df) +
  geom_freqpoly(mapping = aes(area, colour=state)) # fill no funciona
```

**Añadiendo smooth** a una gráfica.
```{r}
ggplot(df) +
  geom_point(mapping = aes(population, area)) + geom_smooth(aes(population, area))
```

## Elementos de texto.

Principalmente, distinguiremos las siguientes capas para añadir texto sobre una gráfica:

* **`ggtitle`**
* **`xlab`**
* **`ylab`**

```{r}
ggplot(df) +
  geom_point(mapping = aes(population, area)) + geom_smooth(aes(population, area)) + 
  ggtitle("Población ~ área") + 
  xlab("Población") +
  ylab("Área")
```

## Facetting

Podemos descomponer una gráfica en tantas gráficas como valores tenga una variable, esto es muy recomendable, cuando tenemos variables categóricas, ya que podemos explicar una variable a través de una categoría.
```{r}
ggplot(df, mapping = aes(area)) +
  geom_bar(aes(fill=state)) +
  facet_wrap( ~ state)
```

