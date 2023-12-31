---
title: "9. Caso práctico 2"
author: "William Sarti josé"
output:
  word_document: default
  html_document:
    df_print: paged
---

# Ejercicio 2: R



## Enunciado
Se dispone del siguiente archivo CSV (descárgalo al final del enunciado) con información sobre los Air Bnb de la ciudad de Milán en 2019. En el dataset, solamente aparecen apartamentos completos. El dataset original y la explicación de todas las columnas está disponible en el siguiente enlace:



https://www.kaggle.com/antoniokaggle/milan-airbnb-open-data-only-entire-apartments



## Con esta información, alumno debe realizar los siguientes procesos de analítica:



- Cargar el archivo “Airbnb_Milan.csv” como dataframe.

- Crear un nuevo dataframe que contenga únicamente las siguientes columnas:

- “host_is_superhost”
 - “host_identity_verified”
- “bathrooms”
- “bedrooms”
- “daily_price”
- “security_deposit”
- “minimum_nights”
 - “number_of_reviews”
 - “review_scores_rating”
- Cambiar los factores de la variable “host_is_superhost” de 0, 1 a: “SI” y, “NO”. (investigar la función recode).

-  Cambiar los factores de la variable “host_identity_verified” de 0, 1 a: “VERIFICA” y “NO VERIFICA”.

- Mostrar un resumen estadístico de los datos.

- Filtrar el dataset por apartamentos cuyo mínimo de noches sea igual o menor que siete.

-  ¿Cuál es el precio medio por día de una habitación en función de si el anfitrión tiene verificado o no su perfil?

-  Quién tiene más número de reseñas, ¿un super host o no super host?

-  Sobre la estadística anterior ¿quién tiene la puntuación media más alta?

-  Crea un vector categórico llamado “CATEGORÍA”, en función de que, si para la puntuación de las reseñas tiene de 0 a 49, sea “NO ACONSEJABLE”; de 50 a 75 sea “ESTÁNDAR”; y de 76 a 100 sea “TOP”.

-  Mostrar las frecuencias de la variable CATEGORÍA.

-  Obtener el histograma del precio por día.

-  Estudiar la relación entre los dormitorios y baños de forma gráfica.

-  Mostrar un histograma del número de reseñas en función de si es un usuario verificado o no.

- Mostrar un histograma por cada valor de “CATEGORÍA” en el que se enseñe la cuantía del depósito de seguridad en función de si el anfitrión es super host o no.

---
title: "AirBnb Milan - R Notebook"
output: html_document
---

```{r}

#install.packages("dplyr")
#install.packages("tidyr")
#install.packages("ggplot2")

library(dplyr)
library(tidyr)
library(ggplot2)

```

Cargar el archivo “Airbnb_Milan.csv” como dataframe.

```{r}
df <- read.csv("Airbnb_Milan.csv")
head(df,10)
```

Crear un nuevo dataframe que contenga únicamente las siguientes columnas: “host_is_superhost”, “host_identity_verified”, “bathrooms”, “bedrooms”, “daily_price”,	“security_deposit”, “minimum_nights”, “number_of_reviews”, “review_scores_rating”


```{r}

df <- subset(df, select=c("host_is_superhost",
                          "host_identity_verified", 
                          "bathrooms",
                          "bedrooms",
                          "daily_price",
                          "security_deposit",
                          "minimum_nights",
                          "number_of_reviews",
                          "review_scores_rating"))
head(df,10)

```

Cambiar los factores de la variable “host_is_superhost” de 0, 1 a: “SI” y, “NO”. (investigar la función recode).

```{r}

df$host_is_superhost <- recode(df$host_is_superhost, `0` = "NO", `1` = "SI")
df$host_is_superhost <- as.factor(df$host_is_superhost)
head(df,10)
class(df$host_is_superhost)

```

Cambiar los factores de la variable “host_identity_verified” de 0, 1 a: “VERIFICA” y “NO VERIFICA”.

```{r}

df$host_identity_verified <- recode(df$host_identity_verified, `0` = "NO VERIFICA", `1` = "VERIFICA")
df$host_identity_verified <- as.factor(df$host_identity_verified)
head(df,10)
class(df$host_identity_verified)

```

Mostrar un resumen estadístico de los datos.

```{r}

summary(df)

```

Filtrar el dataset por apartamentos cuyo mínimo de noches sea igual o menor que siete.

```{r}

df_filtrado <- filter(df, minimum_nights<=7)
head(df_filtrado,10)

```

¿Cuál es el precio medio por día de una habitación en función de si el anfitrión tiene verificado o no su perfil?

```{r}

df %>% group_by(host_identity_verified) %>% summarise(precio_medio=mean(daily_price))

```

Quién tiene más número de reseñas, ¿un super host o no super host?

```{r}

df %>% group_by(host_is_superhost) %>% summarise(number_of_reviews=n())

```

Sobre la estadística anterior ¿quién tiene la puntuación media más alta?

```{r}

df %>% group_by(host_is_superhost) %>% summarise(number_of_reviews=n(), review_scores_rating=mean(review_scores_rating))

```

Crea un vector categórico llamado “CATEGORÍA”, en función de que, si para la puntuación de las reseñas tiene de 0 a 49, sea “NO ACONSEJABLE”; de 50 a 75 sea “ESTÁNDAR”; y de 76 a 100 sea “TOP”.

```{r}

df <- mutate(df, categoria = case_when(
        between(df$review_scores_rating, 0, 49) ~ "NO ACONSEJABLE",
        between(df$review_scores_rating, 50, 75) ~ "ESTÁNDAR",
        between(df$review_scores_rating, 76, 100) ~ "TOP"
      ))

head(df,10)

```

Mostrar las frecuencias de la variable CATEGORÍA.

```{r}

table(df$categoria)

```

Obtener el histograma del precio por día.

```{r}

ggplot(df) + 
geom_histogram(
  mapping = aes(daily_price),
  colour = "white",
  fill = "pink",
  alpha = 0.8
) + ggtitle("Histograma de precios diarios") +
xlab("Precio diario") +
ylab("Cantidad")

```

Estudiar la relación entre los dormitorios y baños de forma gráfica.

```{r}

ggplot(df) +
geom_point(
  mapping = aes(x=bedrooms, y=bathrooms),
  colour = "purple",
  size = 3,
  alpha = 0.8
) + ggtitle("Relación entre dormitorios y baños") +
xlab("Dormitorios") +
ylab("Baños") +
geom_smooth(aes(bedrooms, bathrooms),
            colour = "yellow")


```

Mostrar un histograma del número de reseñas en función de si es un usuario verificado o no.

```{r}

ggplot(df) + 
geom_histogram(
  mapping = aes(daily_price, fill = host_identity_verified),
  colour = "white",
  alpha = 0.8
) + ggtitle("Histograma de reseñas por verificación de usuario") +
xlab("Número de reseñas") +
ylab("Cantidad") +
scale_fill_discrete(name = "Tipo de usuario")

```

Mostrar un histograma por cada valor de “CATEGORÍA” en el que se enseñe la cuantía del depósito de seguridad en función de si el anfitrión es super host o no.

```{r}

ggplot(df) + 
geom_histogram(
  mapping = aes(security_deposit, fill = host_identity_verified),
  colour = "white",
  alpha = 0.8
) + facet_wrap(~categoria, ncol = 1, scales = "free_y") +
ggtitle("Histograma de cuantía del depósito según categoría y anfitrión") +
xlab("Depósito de cuantía") +
ylab("Cantidad") +
scale_fill_discrete(name = "Tipo de usuario") 


```

