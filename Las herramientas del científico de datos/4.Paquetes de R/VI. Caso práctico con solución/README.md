---
title: "EJERCICIO_1_SOLUCION"
author: "William Sarti josé"
output:
  word_document: default
  html_document:
    df_print: paged
---

En el siguiente ejercicio se trabajará con el dataset `relig_income` que es perteneciente de la librería **tidyr**, por lo que como punto de partida tendremos cargada dicha librería. Sobre el dataset mencionado anteriormente, el alumno deberá realizar las siguientes transformaciones:

* Agrupar todas las variables que tengan que ver con la cuantía monetaria desde *<$10k* hasta *Don't know/refused* en dos variables: "Income", "N_People".
* Convierte a factor las variables: religion e Income.
* Agrupa el dataset resultante por religion, sobre esta agrupación, muestra la estadística "media_creyentes" que contenga la media de la variable "N_People", finalmente, ordena de forma descendente dicha media.
* Crea una nueva variable en el dataset con nombre "media_creyentes" cuyo valor sea: el valor de "N_People" entre la longitud del vector (redondea la columna a dos decimales).
* Obtén un nuevo dataset, que sea el resultado de filtrar la variable "N_People" por todos los valores de la media de sí misma y que además la variable "Income" no contenga el valor "Don't know/refused". Tras filtrar el dataset, obtén una muestra del 30%.
* Finalmente, sobre el dataset anterior, selecciona las columnas "Income" y "religion", agrupa estas variables por la variable "Income", sobre esta agrupación, muestra el número de todas las religiones diferentes para cada valor de "Income", en último lugar, ordena el valor de la estadística realizada de menor a mayor.

```{r}
library(dplyr)
library(tidyr)
```

```{r}
head(relig_income)
```

```{r}
# Agrupar todas las variables que tengan que ver con la cuantía monetaria desde *<$10k* hasta* *Don't know/refused* en dos variables: "Income", "N_People".

tidy.df <- gather(relig_income, "Income", "N_People", 2:ncol(relig_income))
```

```{r}
# Convierte a factor las variables: religion e Income.

tidy.df$religion <- as.factor(tidy.df$religion)
tidy.df$Income <- as.factor(tidy.df$Income)
```

```{r}
# Agrupa el dataset resultante por religion, sobre esta agrupación, muestra la estadística "media_creyentes" que contenga la media de la variable "N_People", finalmente, ordena de forma descendente dicha media.

tidy.df %>% group_by(religion) %>%
  summarise(media_creyentes = mean(N_People)) %>% arrange(., desc(media_creyentes))
```

```{r}
# Crea una nueva variable en el dataset con nombre "media_creyentes" cuyo valor sea: el valor de "N_People" entre la longitud del vector (redondea la columna a dos decimales).

tidy.df <- mutate(tidy.df, media_creyentes = round(N_People/n(),2))
```
```{r}
summary(tidy.df)
```

```{r}
# Obtén un nuevo dataset, que sea el resultado de filtrar la variable "N_People" por todos los valores de la media de sí misma y que además la variable "Income" no contenga el valor "Don't know/refused". Tras filtrar el dataset, obtén una muestra del 30%.

new.relig <- filter(tidy.df, N_People > mean(N_People), Income != "Don't know/refused") %>% sample_frac(.,size = 0.3)
```
```{r}
new.relig
```

```{r}
# Finalmente, sobre el dataset anterior, selecciona las columnas "Income" y "religion", agrupa estas variables por la variable "Income", sobre esta agrupación, muestra el número de todas las religiones diferentes para cada valor de "Income", en último lugar, ordena el valor de la estadística realizada de menor a mayor.

new.relig %>% select(Income, religion) %>% 
  group_by(Income) %>% 
  summarise(income_religiones=n()) %>% 
  arrange(income_religiones)
```

