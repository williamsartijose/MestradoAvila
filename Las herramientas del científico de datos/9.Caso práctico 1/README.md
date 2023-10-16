---
title: "9. Caso práctico 1"
author: "William Sarti josé"
output:
  word_document: default
  html_document:
    df_print: paged
---

# Ejercicio 1 - Python



## Contexto
El Informe Mundial de la Felicidad es una encuesta histórica sobre el estado de la felicidad global. El primer informe se publicó en 2012, el segundo en 2013, el tercero en 2015 y el cuarto en la actualización de 2016. El World Happiness 2017, que clasifica a 155 países según sus niveles de felicidad, se lanzó en las Naciones Unidas en un evento que celebra el día internacional de la felicidad el 20 de marzo. El informe continúa ganando reconocimiento mundial a medida que los gobiernos, las organizaciones y la sociedad civil utilizan cada vez más los indicadores de felicidad para informar de sus decisiones de formulación de políticas. Los principales expertos en todos los campos (economía, psicología, análisis de encuestas, estadísticas nacionales, salud, políticas públicas y más) describen cómo las mediciones de bienestar se pueden usar de manera efectiva para evaluar el progreso de las naciones.

## Contenido
Los puntajes y clasificaciones de felicidad utilizan datos de la encuesta mundial Gallup. Las puntuaciones se basan en las respuestas a la pregunta principal de evaluación de la vida formulada en la encuesta. Esta pregunta, conocida como la escalera de Cantril, les pide a los encuestados que piensen en una escalera con la mejor vida posible para ellos con un 10 y la peor vida posible con un 0 y que califiquen sus propias vidas actuales en esa escala. Las puntuaciones provienen de muestras representativas a nivel nacional para los años 2013-2016 y utilizan los pesos de Gallup para hacer que las estimaciones sean representativas. Las columnas que siguen la puntuación de felicidad estiman el grado en que cada uno de los seis factores (producción económica, apoyo social, esperanza de vida, libertad, ausencia de corrupción y generosidad) contribuyen a que las evaluaciones de vida sean más altas en cada país que en la distopía, un país hipotético que tiene valores iguales a los promedios nacionales más bajos del mundo para cada uno de los seis factores. No tienen impacto en el puntaje total reportado para cada país, pero sí explican por qué algunos países tienen una clasificación más alta que otros.

## ¿Qué es la distopía?
La distopía es un país imaginario que tiene las personas menos felices del mundo. El propósito de establecer la distopía es tener un punto de referencia con el que todos los países puedan ser comparados favorablemente (ningún país tiene un desempeño más pobre que la distopía) en términos de cada una de las seis variables clave, lo que permite que cada barra sea de ancho positivo. Las puntuaciones más bajas observadas para las seis variables clave, por lo tanto, caracterizan la distopía. La vida sería muy desagradable en un país con los ingresos más bajos del mundo, la esperanza de vida más baja, la generosidad más baja, la mayoría de la corrupción, la menor libertad y el menor apoyo social, en contraste con la utopía.



Toda la información del dataset puede ser ampliada desde el siguiente enlace: 

https://www.kaggle.com/unsdsn/world-happiness


# SE PIDE:


Sobre los informes de felicidad de 2015 y 2016, realizar las siguientes exploraciones:

- Cargar los dos CSV como datasets.
- Identificra las columnas de ambos datasets: ¿hay diferencias entre ambos?
- Une ambos dataframes, sin importar que los dos compartan las mismas diferencias.
- Revisa el número de nulos que hay por cada columna, así como su porcentaje.
- Cambia los valores nulos de las columnas "Lower Confidence Interval" y "Upper Confidence
 Interval" por un número aleatorio entre el valor mínimo y máximo de la misma columna (un único número, no es necesario uno diferente para cada fila con valor nulo).
- Cambia los valores nulos de la columna "Standard Error" por su media al cuadrado.
- Obtén un resumen estadístico del dataframe sin valores nulos.
- Muestra de forma gráfica la relación entre la familia y la salud.
- Muestra de forma gráfica la relación entre la puntuación de felicidad y la confianza (corrupción del gobierno).
- Muestra la matriz de correlación del daframe.
- Tras unir los dataframes, los países aparecerán más de una vez. Muestra agrupado el dataframe por  país con el valor máximo de felicidad, sin importar el año.
- ¿Tiene relación la felicidad con la generosidad? Muéstralo gráficamente a través de la puntuación de libertad.
- Muestra la distribución del grado de distopía en función de la región.

## OBLIGATORIO: realizar la entrega desde un notebook en formato .ipynb.
## OPCIONAL: de forma opcional, puede hacerse entrega del notebook como HTML.


```python
!pip install plotnine 

```

    Requirement already satisfied: plotnine in d:\anaconda3\lib\site-packages (0.12.3)
    Requirement already satisfied: matplotlib>=3.6.0 in d:\anaconda3\lib\site-packages (from plotnine) (3.7.1)
    Requirement already satisfied: mizani<0.10.0,>0.9.0 in d:\anaconda3\lib\site-packages (from plotnine) (0.9.3)
    Requirement already satisfied: numpy>=1.23.0 in d:\anaconda3\lib\site-packages (from plotnine) (1.24.3)
    Requirement already satisfied: pandas>=1.5.0 in d:\anaconda3\lib\site-packages (from plotnine) (1.5.3)
    Requirement already satisfied: patsy>=0.5.1 in d:\anaconda3\lib\site-packages (from plotnine) (0.5.3)
    Requirement already satisfied: scipy>=1.5.0 in d:\anaconda3\lib\site-packages (from plotnine) (1.10.1)
    Requirement already satisfied: statsmodels>=0.14.0 in d:\anaconda3\lib\site-packages (from plotnine) (0.14.0)
    Requirement already satisfied: contourpy>=1.0.1 in d:\anaconda3\lib\site-packages (from matplotlib>=3.6.0->plotnine) (1.0.5)
    Requirement already satisfied: cycler>=0.10 in d:\anaconda3\lib\site-packages (from matplotlib>=3.6.0->plotnine) (0.11.0)
    Requirement already satisfied: fonttools>=4.22.0 in d:\anaconda3\lib\site-packages (from matplotlib>=3.6.0->plotnine) (4.25.0)
    Requirement already satisfied: kiwisolver>=1.0.1 in d:\anaconda3\lib\site-packages (from matplotlib>=3.6.0->plotnine) (1.4.4)
    Requirement already satisfied: packaging>=20.0 in d:\anaconda3\lib\site-packages (from matplotlib>=3.6.0->plotnine) (23.0)
    Requirement already satisfied: pillow>=6.2.0 in d:\anaconda3\lib\site-packages (from matplotlib>=3.6.0->plotnine) (9.4.0)
    Requirement already satisfied: pyparsing>=2.3.1 in d:\anaconda3\lib\site-packages (from matplotlib>=3.6.0->plotnine) (3.0.9)
    Requirement already satisfied: python-dateutil>=2.7 in d:\anaconda3\lib\site-packages (from matplotlib>=3.6.0->plotnine) (2.8.2)
    Requirement already satisfied: tzdata in d:\anaconda3\lib\site-packages (from mizani<0.10.0,>0.9.0->plotnine) (2023.3)
    Requirement already satisfied: pytz>=2020.1 in d:\anaconda3\lib\site-packages (from pandas>=1.5.0->plotnine) (2022.7)
    Requirement already satisfied: six in d:\anaconda3\lib\site-packages (from patsy>=0.5.1->plotnine) (1.16.0)
    


```python
import pandas as pd
import numpy as np
from plotnine import *
from matplotlib import pyplot as plt
%matplotlib inline
import seaborn as sns
```

## Cargar los dos CSV como datasets.



```python
df_2015 = pd.read_csv("Informe_Felicidad_2015.csv")
df_2015.head(3)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Country</th>
      <th>Region</th>
      <th>Happiness Rank</th>
      <th>Happiness Score</th>
      <th>Standard Error</th>
      <th>Economy (GDP per Capita)</th>
      <th>Family</th>
      <th>Health (Life Expectancy)</th>
      <th>Freedom</th>
      <th>Trust (Government Corruption)</th>
      <th>Generosity</th>
      <th>Dystopia Residual</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Switzerland</td>
      <td>Western Europe</td>
      <td>1</td>
      <td>7.587</td>
      <td>0.03411</td>
      <td>1.39651</td>
      <td>1.34951</td>
      <td>0.94143</td>
      <td>0.66557</td>
      <td>0.41978</td>
      <td>0.29678</td>
      <td>2.51738</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Iceland</td>
      <td>Western Europe</td>
      <td>2</td>
      <td>7.561</td>
      <td>0.04884</td>
      <td>1.30232</td>
      <td>1.40223</td>
      <td>0.94784</td>
      <td>0.62877</td>
      <td>0.14145</td>
      <td>0.43630</td>
      <td>2.70201</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Denmark</td>
      <td>Western Europe</td>
      <td>3</td>
      <td>7.527</td>
      <td>0.03328</td>
      <td>1.32548</td>
      <td>1.36058</td>
      <td>0.87464</td>
      <td>0.64938</td>
      <td>0.48357</td>
      <td>0.34139</td>
      <td>2.49204</td>
    </tr>
  </tbody>
</table>
</div>




```python
df_2016 = pd.read_csv("Informe_Felicidad_2016.csv")
df_2016.head(3)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Country</th>
      <th>Region</th>
      <th>Happiness Rank</th>
      <th>Happiness Score</th>
      <th>Lower Confidence Interval</th>
      <th>Upper Confidence Interval</th>
      <th>Economy (GDP per Capita)</th>
      <th>Family</th>
      <th>Health (Life Expectancy)</th>
      <th>Freedom</th>
      <th>Trust (Government Corruption)</th>
      <th>Generosity</th>
      <th>Dystopia Residual</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Denmark</td>
      <td>Western Europe</td>
      <td>1</td>
      <td>7.526</td>
      <td>7.460</td>
      <td>7.592</td>
      <td>1.44178</td>
      <td>1.16374</td>
      <td>0.79504</td>
      <td>0.57941</td>
      <td>0.44453</td>
      <td>0.36171</td>
      <td>2.73939</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Switzerland</td>
      <td>Western Europe</td>
      <td>2</td>
      <td>7.509</td>
      <td>7.428</td>
      <td>7.590</td>
      <td>1.52733</td>
      <td>1.14524</td>
      <td>0.86303</td>
      <td>0.58557</td>
      <td>0.41203</td>
      <td>0.28083</td>
      <td>2.69463</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Iceland</td>
      <td>Western Europe</td>
      <td>3</td>
      <td>7.501</td>
      <td>7.333</td>
      <td>7.669</td>
      <td>1.42666</td>
      <td>1.18326</td>
      <td>0.86733</td>
      <td>0.56624</td>
      <td>0.14975</td>
      <td>0.47678</td>
      <td>2.83137</td>
    </tr>
  </tbody>
</table>
</div>



## Identificra las columnas de ambos datasets: ¿hay diferencias entre ambos?



```python
# Ver columnas
df_2015.columns#.sort_values(ascending=True)
```




    Index(['Country', 'Region', 'Happiness Rank', 'Happiness Score',
           'Standard Error', 'Economy (GDP per Capita)', 'Family',
           'Health (Life Expectancy)', 'Freedom', 'Trust (Government Corruption)',
           'Generosity', 'Dystopia Residual'],
          dtype='object')




```python
# Ver cantidad de filas y columnas
df_2015.shape
```




    (158, 12)




```python
# Ver columnas
df_2016.columns#.sort_values(ascending=True)
```




    Index(['Country', 'Region', 'Happiness Rank', 'Happiness Score',
           'Lower Confidence Interval', 'Upper Confidence Interval',
           'Economy (GDP per Capita)', 'Family', 'Health (Life Expectancy)',
           'Freedom', 'Trust (Government Corruption)', 'Generosity',
           'Dystopia Residual'],
          dtype='object')




```python
# Ver cantidad de filas y columnas
df_2016.shape
```




    (157, 13)



## Une ambos dataframes, sin importar que los dos compartan las mismas diferencias.


```python
df = pd.concat([df_2015, df_2016], ignore_index=True, join='outer')
df.head(5)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Country</th>
      <th>Region</th>
      <th>Happiness Rank</th>
      <th>Happiness Score</th>
      <th>Standard Error</th>
      <th>Economy (GDP per Capita)</th>
      <th>Family</th>
      <th>Health (Life Expectancy)</th>
      <th>Freedom</th>
      <th>Trust (Government Corruption)</th>
      <th>Generosity</th>
      <th>Dystopia Residual</th>
      <th>Lower Confidence Interval</th>
      <th>Upper Confidence Interval</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Switzerland</td>
      <td>Western Europe</td>
      <td>1</td>
      <td>7.587</td>
      <td>0.03411</td>
      <td>1.39651</td>
      <td>1.34951</td>
      <td>0.94143</td>
      <td>0.66557</td>
      <td>0.41978</td>
      <td>0.29678</td>
      <td>2.51738</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Iceland</td>
      <td>Western Europe</td>
      <td>2</td>
      <td>7.561</td>
      <td>0.04884</td>
      <td>1.30232</td>
      <td>1.40223</td>
      <td>0.94784</td>
      <td>0.62877</td>
      <td>0.14145</td>
      <td>0.43630</td>
      <td>2.70201</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Denmark</td>
      <td>Western Europe</td>
      <td>3</td>
      <td>7.527</td>
      <td>0.03328</td>
      <td>1.32548</td>
      <td>1.36058</td>
      <td>0.87464</td>
      <td>0.64938</td>
      <td>0.48357</td>
      <td>0.34139</td>
      <td>2.49204</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Norway</td>
      <td>Western Europe</td>
      <td>4</td>
      <td>7.522</td>
      <td>0.03880</td>
      <td>1.45900</td>
      <td>1.33095</td>
      <td>0.88521</td>
      <td>0.66973</td>
      <td>0.36503</td>
      <td>0.34699</td>
      <td>2.46531</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Canada</td>
      <td>North America</td>
      <td>5</td>
      <td>7.427</td>
      <td>0.03553</td>
      <td>1.32629</td>
      <td>1.32261</td>
      <td>0.90563</td>
      <td>0.63297</td>
      <td>0.32957</td>
      <td>0.45811</td>
      <td>2.45176</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
  </tbody>
</table>
</div>



## Revisa el número de nulos que hay por cada columna, así como su porcentaje.


```python
def nulos(df):
    # Cantidad de nulos
    total = df.isnull().sum()
    # Porcentaje de nulos
    porcentaje = total/len(df)*100
    return total, porcentaje
```


```python
# Cantidad de valores nulos por columna
print("Cantidad de valores nulos por columna")
nulos(df)[0]
```

    Cantidad de valores nulos por columna
    




    Country                            0
    Region                             0
    Happiness Rank                     0
    Happiness Score                    0
    Standard Error                   157
    Economy (GDP per Capita)           0
    Family                             0
    Health (Life Expectancy)           0
    Freedom                            0
    Trust (Government Corruption)      0
    Generosity                         0
    Dystopia Residual                  0
    Lower Confidence Interval        158
    Upper Confidence Interval        158
    dtype: int64




```python
# Porcentaje de valores nulos por columna
print("Porcentaje de valores nulos por columna")
nulos(df)[1]
```

    Porcentaje de valores nulos por columna
    




    Country                           0.00000
    Region                            0.00000
    Happiness Rank                    0.00000
    Happiness Score                   0.00000
    Standard Error                   49.84127
    Economy (GDP per Capita)          0.00000
    Family                            0.00000
    Health (Life Expectancy)          0.00000
    Freedom                           0.00000
    Trust (Government Corruption)     0.00000
    Generosity                        0.00000
    Dystopia Residual                 0.00000
    Lower Confidence Interval        50.15873
    Upper Confidence Interval        50.15873
    dtype: float64



## Cambia los valores nulos de las columnas "Lower Confidence Interval" y "Upper Confidence Interval" por un número aleatorio entre el valor mínimo y máximo de la misma columna (un único número, no es necesario uno diferente para cada fila con valor nulo)


```python
max = df['Lower Confidence Interval'].max()
min = df['Lower Confidence Interval'].min()
df['Lower Confidence Interval'] = df['Lower Confidence Interval'].fillna(np.random.randint(min, max))
```


```python
max = df['Upper Confidence Interval'].max()
min = df['Upper Confidence Interval'].min()
df['Upper Confidence Interval'] = df['Upper Confidence Interval'].fillna(np.random.randint(min, max))
```


```python
nulos(df)[0]

```




    Country                            0
    Region                             0
    Happiness Rank                     0
    Happiness Score                    0
    Standard Error                   157
    Economy (GDP per Capita)           0
    Family                             0
    Health (Life Expectancy)           0
    Freedom                            0
    Trust (Government Corruption)      0
    Generosity                         0
    Dystopia Residual                  0
    Lower Confidence Interval          0
    Upper Confidence Interval          0
    dtype: int64



## Cambia los valores nulos de la columna "Standard Error" por su media al cuadrado.


```python
media = df['Standard Error'].mean()**2
df['Standard Error'] = df['Standard Error'].fillna(media)
```


```python
nulos(df)[0]

```




    Country                          0
    Region                           0
    Happiness Rank                   0
    Happiness Score                  0
    Standard Error                   0
    Economy (GDP per Capita)         0
    Family                           0
    Health (Life Expectancy)         0
    Freedom                          0
    Trust (Government Corruption)    0
    Generosity                       0
    Dystopia Residual                0
    Lower Confidence Interval        0
    Upper Confidence Interval        0
    dtype: int64



## Obtén un resumen estadístico del dataframe sin valores nulos.



```python
df.describe()

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Happiness Rank</th>
      <th>Happiness Score</th>
      <th>Standard Error</th>
      <th>Economy (GDP per Capita)</th>
      <th>Family</th>
      <th>Health (Life Expectancy)</th>
      <th>Freedom</th>
      <th>Trust (Government Corruption)</th>
      <th>Generosity</th>
      <th>Dystopia Residual</th>
      <th>Lower Confidence Interval</th>
      <th>Upper Confidence Interval</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>315.000000</td>
      <td>315.000000</td>
      <td>315.000000</td>
      <td>315.000000</td>
      <td>315.000000</td>
      <td>315.000000</td>
      <td>315.000000</td>
      <td>315.000000</td>
      <td>315.000000</td>
      <td>315.000000</td>
      <td>315.000000</td>
      <td>315.000000</td>
    </tr>
    <tr>
      <th>mean</th>
      <td>79.238095</td>
      <td>5.378949</td>
      <td>0.025161</td>
      <td>0.899837</td>
      <td>0.892647</td>
      <td>0.594054</td>
      <td>0.399896</td>
      <td>0.140532</td>
      <td>0.239957</td>
      <td>2.212032</td>
      <td>4.639162</td>
      <td>4.237048</td>
    </tr>
    <tr>
      <th>std</th>
      <td>45.538922</td>
      <td>1.141531</td>
      <td>0.025851</td>
      <td>0.410780</td>
      <td>0.286718</td>
      <td>0.240790</td>
      <td>0.150684</td>
      <td>0.115490</td>
      <td>0.130077</td>
      <td>0.558728</td>
      <td>1.033074</td>
      <td>1.478727</td>
    </tr>
    <tr>
      <th>min</th>
      <td>1.000000</td>
      <td>2.839000</td>
      <td>0.002293</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>0.328580</td>
      <td>2.732000</td>
      <td>3.000000</td>
    </tr>
    <tr>
      <th>25%</th>
      <td>40.000000</td>
      <td>4.510000</td>
      <td>0.002293</td>
      <td>0.594900</td>
      <td>0.739880</td>
      <td>0.419645</td>
      <td>0.295890</td>
      <td>0.061315</td>
      <td>0.151430</td>
      <td>1.884135</td>
      <td>4.000000</td>
      <td>3.000000</td>
    </tr>
    <tr>
      <th>50%</th>
      <td>79.000000</td>
      <td>5.286000</td>
      <td>0.018480</td>
      <td>0.973060</td>
      <td>0.937930</td>
      <td>0.640450</td>
      <td>0.413190</td>
      <td>0.106130</td>
      <td>0.218540</td>
      <td>2.211260</td>
      <td>4.000000</td>
      <td>3.000000</td>
    </tr>
    <tr>
      <th>75%</th>
      <td>118.500000</td>
      <td>6.269000</td>
      <td>0.043940</td>
      <td>1.229000</td>
      <td>1.087360</td>
      <td>0.787640</td>
      <td>0.516730</td>
      <td>0.178610</td>
      <td>0.311450</td>
      <td>2.563470</td>
      <td>5.231500</td>
      <td>5.408500</td>
    </tr>
    <tr>
      <th>max</th>
      <td>158.000000</td>
      <td>7.587000</td>
      <td>0.136930</td>
      <td>1.824270</td>
      <td>1.402230</td>
      <td>1.025250</td>
      <td>0.669730</td>
      <td>0.551910</td>
      <td>0.819710</td>
      <td>3.837720</td>
      <td>7.460000</td>
      <td>7.669000</td>
    </tr>
  </tbody>
</table>
</div>



## Muestra de forma gráfica la relación entre la familia y la salud.


```python
(
    ggplot(df) +
    geom_point(
        aes(x="Family", y="Health (Life Expectancy)"),
        color = 'purple',
        alpha = 0.5,
        size=3
    )
    + labs(title="Relación Familia vs Salud", x="Familia", y="Salud")
    + geom_smooth(
        aes(x="Family", y="Health (Life Expectancy)"),
        color = 'lightblue',
        alpha = 0
    )
)
```

    D:\anaconda3\Lib\site-packages\plotnine\stats\smoothers.py:330: PlotnineWarning: Confidence intervals are not yet implemented for lowess smoothings.
    


    
![png](output_27_1.png)
    





    <Figure Size: (640 x 480)>



## Muestra de forma gráfica la relación entre la puntuación de felicidad y la confianza (corrupción del gobierno).


```python
(
    ggplot(df) +
    geom_point(
        aes(x="Happiness Score", y="Trust (Government Corruption)"),
        color = 'blue',
        alpha = 0.5,
        size=3
    )
    + labs(title="Relación Felicidad vs Confianza (corrupción del gobierno)", x="Felicidad", y="Confianza (corrupción del gobierno)")
    + geom_smooth(
        aes(x="Happiness Score", y="Trust (Government Corruption)"),
        color = 'green',
        alpha = 0.8
    )
)
```

    D:\anaconda3\Lib\site-packages\plotnine\stats\smoothers.py:330: PlotnineWarning: Confidence intervals are not yet implemented for lowess smoothings.
    


    
![png](output_29_1.png)
    





    <Figure Size: (640 x 480)>



## Muestra la matriz de correlación del daframe.


```python
sns.heatmap(df.corr(), cmap="PuBuGn")
plt.title("Matriz de Correlación")
```

    C:\Users\ACER\AppData\Local\Temp\ipykernel_17208\489160218.py:1: FutureWarning: The default value of numeric_only in DataFrame.corr is deprecated. In a future version, it will default to False. Select only valid columns or specify the value of numeric_only to silence this warning.
    




    Text(0.5, 1.0, 'Matriz de Correlación')




    
![png](output_31_2.png)
    


## Tras unir los dataframes, los países aparecerán más de una vez. Muestra agrupado el dataframe por país con el valor máximo de felicidad, sin importar el año.



```python
# Ordenar dataframe por país para visualizar con mayor facilidad
df = df.sort_values("Country", axis=0)
df.head(10)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Country</th>
      <th>Region</th>
      <th>Happiness Rank</th>
      <th>Happiness Score</th>
      <th>Standard Error</th>
      <th>Economy (GDP per Capita)</th>
      <th>Family</th>
      <th>Health (Life Expectancy)</th>
      <th>Freedom</th>
      <th>Trust (Government Corruption)</th>
      <th>Generosity</th>
      <th>Dystopia Residual</th>
      <th>Lower Confidence Interval</th>
      <th>Upper Confidence Interval</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>152</th>
      <td>Afghanistan</td>
      <td>Southern Asia</td>
      <td>153</td>
      <td>3.575</td>
      <td>0.030840</td>
      <td>0.31982</td>
      <td>0.30285</td>
      <td>0.30335</td>
      <td>0.23414</td>
      <td>0.09719</td>
      <td>0.36510</td>
      <td>1.95210</td>
      <td>4.000</td>
      <td>3.000</td>
    </tr>
    <tr>
      <th>311</th>
      <td>Afghanistan</td>
      <td>Southern Asia</td>
      <td>154</td>
      <td>3.360</td>
      <td>0.002293</td>
      <td>0.38227</td>
      <td>0.11037</td>
      <td>0.17344</td>
      <td>0.16430</td>
      <td>0.07112</td>
      <td>0.31268</td>
      <td>2.14558</td>
      <td>3.288</td>
      <td>3.432</td>
    </tr>
    <tr>
      <th>266</th>
      <td>Albania</td>
      <td>Central and Eastern Europe</td>
      <td>109</td>
      <td>4.655</td>
      <td>0.002293</td>
      <td>0.95530</td>
      <td>0.50163</td>
      <td>0.73007</td>
      <td>0.31866</td>
      <td>0.05301</td>
      <td>0.16840</td>
      <td>1.92816</td>
      <td>4.546</td>
      <td>4.764</td>
    </tr>
    <tr>
      <th>94</th>
      <td>Albania</td>
      <td>Central and Eastern Europe</td>
      <td>95</td>
      <td>4.959</td>
      <td>0.050130</td>
      <td>0.87867</td>
      <td>0.80434</td>
      <td>0.81325</td>
      <td>0.35733</td>
      <td>0.06413</td>
      <td>0.14272</td>
      <td>1.89894</td>
      <td>4.000</td>
      <td>3.000</td>
    </tr>
    <tr>
      <th>195</th>
      <td>Algeria</td>
      <td>Middle East and Northern Africa</td>
      <td>38</td>
      <td>6.355</td>
      <td>0.002293</td>
      <td>1.05266</td>
      <td>0.83309</td>
      <td>0.61804</td>
      <td>0.21006</td>
      <td>0.16157</td>
      <td>0.07044</td>
      <td>3.40904</td>
      <td>6.227</td>
      <td>6.483</td>
    </tr>
    <tr>
      <th>67</th>
      <td>Algeria</td>
      <td>Middle East and Northern Africa</td>
      <td>68</td>
      <td>5.605</td>
      <td>0.050990</td>
      <td>0.93929</td>
      <td>1.07772</td>
      <td>0.61766</td>
      <td>0.28579</td>
      <td>0.17383</td>
      <td>0.07822</td>
      <td>2.43209</td>
      <td>4.000</td>
      <td>3.000</td>
    </tr>
    <tr>
      <th>298</th>
      <td>Angola</td>
      <td>Sub-Saharan Africa</td>
      <td>141</td>
      <td>3.866</td>
      <td>0.002293</td>
      <td>0.84731</td>
      <td>0.66366</td>
      <td>0.04991</td>
      <td>0.00589</td>
      <td>0.08434</td>
      <td>0.12071</td>
      <td>2.09459</td>
      <td>3.753</td>
      <td>3.979</td>
    </tr>
    <tr>
      <th>136</th>
      <td>Angola</td>
      <td>Sub-Saharan Africa</td>
      <td>137</td>
      <td>4.033</td>
      <td>0.047580</td>
      <td>0.75778</td>
      <td>0.86040</td>
      <td>0.16683</td>
      <td>0.10384</td>
      <td>0.07122</td>
      <td>0.12344</td>
      <td>1.94939</td>
      <td>4.000</td>
      <td>3.000</td>
    </tr>
    <tr>
      <th>29</th>
      <td>Argentina</td>
      <td>Latin America and Caribbean</td>
      <td>30</td>
      <td>6.574</td>
      <td>0.046120</td>
      <td>1.05351</td>
      <td>1.24823</td>
      <td>0.78723</td>
      <td>0.44974</td>
      <td>0.08484</td>
      <td>0.11451</td>
      <td>2.83600</td>
      <td>4.000</td>
      <td>3.000</td>
    </tr>
    <tr>
      <th>183</th>
      <td>Argentina</td>
      <td>Latin America and Caribbean</td>
      <td>26</td>
      <td>6.650</td>
      <td>0.002293</td>
      <td>1.15137</td>
      <td>1.06612</td>
      <td>0.69711</td>
      <td>0.42284</td>
      <td>0.07296</td>
      <td>0.10989</td>
      <td>3.12985</td>
      <td>6.560</td>
      <td>6.740</td>
    </tr>
  </tbody>
</table>
</div>




```python
# Obtener otro dataframe con la agrupación del país y la puntuación máxima de felicidad
df_max = df.groupby("Country", as_index=False).agg({'Happiness Score' : 'max'})
# Filtrar el dataframe con países duplicados por el dataframe con valores máximos
df = pd.merge(df,df_max, on=['Country', 'Happiness Score'], how='inner')
df.head(10)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Country</th>
      <th>Region</th>
      <th>Happiness Rank</th>
      <th>Happiness Score</th>
      <th>Standard Error</th>
      <th>Economy (GDP per Capita)</th>
      <th>Family</th>
      <th>Health (Life Expectancy)</th>
      <th>Freedom</th>
      <th>Trust (Government Corruption)</th>
      <th>Generosity</th>
      <th>Dystopia Residual</th>
      <th>Lower Confidence Interval</th>
      <th>Upper Confidence Interval</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Afghanistan</td>
      <td>Southern Asia</td>
      <td>153</td>
      <td>3.575</td>
      <td>0.030840</td>
      <td>0.31982</td>
      <td>0.30285</td>
      <td>0.30335</td>
      <td>0.23414</td>
      <td>0.09719</td>
      <td>0.36510</td>
      <td>1.95210</td>
      <td>4.000</td>
      <td>3.000</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Albania</td>
      <td>Central and Eastern Europe</td>
      <td>95</td>
      <td>4.959</td>
      <td>0.050130</td>
      <td>0.87867</td>
      <td>0.80434</td>
      <td>0.81325</td>
      <td>0.35733</td>
      <td>0.06413</td>
      <td>0.14272</td>
      <td>1.89894</td>
      <td>4.000</td>
      <td>3.000</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Algeria</td>
      <td>Middle East and Northern Africa</td>
      <td>38</td>
      <td>6.355</td>
      <td>0.002293</td>
      <td>1.05266</td>
      <td>0.83309</td>
      <td>0.61804</td>
      <td>0.21006</td>
      <td>0.16157</td>
      <td>0.07044</td>
      <td>3.40904</td>
      <td>6.227</td>
      <td>6.483</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Angola</td>
      <td>Sub-Saharan Africa</td>
      <td>137</td>
      <td>4.033</td>
      <td>0.047580</td>
      <td>0.75778</td>
      <td>0.86040</td>
      <td>0.16683</td>
      <td>0.10384</td>
      <td>0.07122</td>
      <td>0.12344</td>
      <td>1.94939</td>
      <td>4.000</td>
      <td>3.000</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Argentina</td>
      <td>Latin America and Caribbean</td>
      <td>26</td>
      <td>6.650</td>
      <td>0.002293</td>
      <td>1.15137</td>
      <td>1.06612</td>
      <td>0.69711</td>
      <td>0.42284</td>
      <td>0.07296</td>
      <td>0.10989</td>
      <td>3.12985</td>
      <td>6.560</td>
      <td>6.740</td>
    </tr>
    <tr>
      <th>5</th>
      <td>Armenia</td>
      <td>Central and Eastern Europe</td>
      <td>121</td>
      <td>4.360</td>
      <td>0.002293</td>
      <td>0.86086</td>
      <td>0.62477</td>
      <td>0.64083</td>
      <td>0.14037</td>
      <td>0.03616</td>
      <td>0.07793</td>
      <td>1.97864</td>
      <td>4.266</td>
      <td>4.454</td>
    </tr>
    <tr>
      <th>6</th>
      <td>Australia</td>
      <td>Australia and New Zealand</td>
      <td>9</td>
      <td>7.313</td>
      <td>0.002293</td>
      <td>1.44443</td>
      <td>1.10476</td>
      <td>0.85120</td>
      <td>0.56837</td>
      <td>0.32331</td>
      <td>0.47407</td>
      <td>2.54650</td>
      <td>7.241</td>
      <td>7.385</td>
    </tr>
    <tr>
      <th>7</th>
      <td>Austria</td>
      <td>Western Europe</td>
      <td>13</td>
      <td>7.200</td>
      <td>0.037510</td>
      <td>1.33723</td>
      <td>1.29704</td>
      <td>0.89042</td>
      <td>0.62433</td>
      <td>0.18676</td>
      <td>0.33088</td>
      <td>2.53320</td>
      <td>4.000</td>
      <td>3.000</td>
    </tr>
    <tr>
      <th>8</th>
      <td>Azerbaijan</td>
      <td>Central and Eastern Europe</td>
      <td>81</td>
      <td>5.291</td>
      <td>0.002293</td>
      <td>1.12373</td>
      <td>0.76042</td>
      <td>0.54504</td>
      <td>0.35327</td>
      <td>0.17914</td>
      <td>0.05640</td>
      <td>2.27350</td>
      <td>5.226</td>
      <td>5.356</td>
    </tr>
    <tr>
      <th>9</th>
      <td>Bahrain</td>
      <td>Middle East and Northern Africa</td>
      <td>42</td>
      <td>6.218</td>
      <td>0.002293</td>
      <td>1.44024</td>
      <td>0.94397</td>
      <td>0.65696</td>
      <td>0.47375</td>
      <td>0.25772</td>
      <td>0.17147</td>
      <td>2.27405</td>
      <td>6.128</td>
      <td>6.308</td>
    </tr>
  </tbody>
</table>
</div>



## ¿Tiene relación la felicidad con la generosidad? Muéstralo gráficamente a través de la puntuación de libertad.



```python
(
    ggplot(df) +
    geom_point(
        aes(x="Happiness Score", y="Generosity", colour="Freedom", size='Freedom'),
        alpha = 0.5
    )
    + labs(colour = 'Libertad', size='Libertad')
    + labs(title="Relación Felicidad vs Generosidad vs Libertad", x="Felicidad", y="Generosidad")
    + geom_smooth(
        aes(x="Happiness Score", y="Generosity"),
        color = 'purple',
        alpha = 0.8
    )
)
```

    D:\anaconda3\Lib\site-packages\plotnine\stats\smoothers.py:330: PlotnineWarning: Confidence intervals are not yet implemented for lowess smoothings.
    


    
![png](output_36_1.png)
    





    <Figure Size: (640 x 480)>



## Muestra la distribución del grado de distopía en función de la región.



```python
# Documentación de estilos para la gráfica: https://plotnine.readthedocs.io/en/stable/generated/plotnine.themes.theme.html

(
    ggplot(df)
    + geom_histogram(
        mapping=aes('Dystopia Residual', fill = 'Region'), color='white'
    )
    + facet_wrap('~Region', ncol = 2)
    + labs(x='Distopía', y='Grado')
    + theme(
        figure_size=(15, 10),
        panel_background=element_rect(fill="gray", alpha=0.05),
        panel_grid=element_line(color="gray", alpha=0.2, size=0.5)
    )
)
```

    D:\anaconda3\Lib\site-packages\plotnine\stats\stat_bin.py:109: PlotnineWarning: 'stat_bin()' using 'bins = 15'. Pick better value with 'binwidth'.
    


    
![png](output_38_1.png)
    





    <Figure Size: (1500 x 1000)>




```python

```
