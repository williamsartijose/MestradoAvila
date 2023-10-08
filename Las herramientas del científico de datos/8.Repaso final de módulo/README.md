---
title: "Repaso final de módulo"
author: "William Sarti josé"
output:
  word_document: default
  html_document:
    df_print: paged
---

ENUNCIADO
Se han obtenidos dos datasets relacionados con la adquisición y fundación de startups a nivel global. El dataset original puede consultarse en el siguiente enlace.

Dentro de las diferentes funciones de R dedicadas a obtener gráficos existen tres grupos principales:

SE PIDE
El objetivo general es realizar un análisis exploratorio de datos sobre los elementos comunes de ambos datasets. Estos son los objetivos para realizar:

- 1- Convertir los archivos funds.csv y funding_rounds.csv a Pandas dataframes (los enlaces de descarga de los archivos se encuentran más abajo).
- 2- Buscar un elemento común de ambos dataframes y convertirlos en uno solo.
- 3- Eliminar las columnas “id”, “source_url”, “source_description” y “updated_at”.
- 4- Mostrar el número de nulos que tiene cada columna del dataframe y qué porcentaje supone dentro de cada columna el número de nulos.
- 5- Modificar todos los valores de “raised_currency_dode” nulos a USD.
- 6- Eliminar el resto de nulos del dataset.
- 7- Mostrar el porcentaje de los diferentes valores de “raised_currency_dode”.
- 8- Crear un subconjunto sin el valor USD y visualizar un diagrama de barras.
- 9- Crear un nuevo subconjunto filtrando del dataset todas las filas por debajo de 10 millones y visualizar el histograma.
- 10- Con el conjunto del apartado anterior, investigar sobre la función “contains” y filtrar el dataset por las fechas de creación de las startup en 2000.
- 11- Sobre el conjunto filtrado por fecha, visualizar la cuantía obtenida explicada por el tipo de moneda.
