# Importar la biblioteca pandas como pd
import pandas as pd

# Importar la biblioteca matplotlib como plt 
import matplotlib.pyplot as plt

# Importar la biblioteca statsmodels como sm 
import statsmodels.api as sm

# Cargar los datos en un DataFrame
data = pd.read_csv('Electric_Production.csv')

# Mostrar las primeras filas del DataFrame
print(data.head())

# Verificar la información general del DataFrame
print(data.info())

# Resumen estadístico de las columnas numéricas
print(data.describe())
