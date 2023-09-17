import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from statsmodels.tsa.statespace.sarimax import SARIMAX
import random
import math
from scipy.stats import boxcox
from statsmodels.stats.diagnostic import acorr_ljungbox

# Carregue os dados
data = pd.read_csv('Electric_Production.csv')
data['DATE'] = pd.to_datetime(data['DATE'])
data.set_index('DATE', inplace=True)

# Visualize os dados
plt.figure(figsize=(12, 6))
plt.plot(data.index, data['IPG2211A2N'])
plt.title('Produção de Energia Mensal')
plt.xlabel('Ano')
plt.ylabel('Produção de Energia')
plt.grid(True)
plt.show()

# Aplicar transformação Box-Cox
data['Transformed'], _ = boxcox(data['IPG2211A2N'])

# Visualize a série transformada
plt.figure(figsize=(12, 6))
plt.plot(data.index, data['Transformed'])
plt.title('Série Temporal Transformada (Box-Cox)')
plt.xlabel('Ano')
plt.ylabel('Produção de Energia (Transformada)')
plt.grid(True)
plt.show()

# Função para calcular RMSE
def rmse(y_true, y_pred):
    return np.sqrt(np.mean((y_true - y_pred) ** 2))

# Função de Simulated Annealing
def simulated_annealing(data, max_iterations=30, initial_temperature=10):
    best_params = (1, 1, 1, 1)  # Inicialize os melhores parâmetros
    best_rmse = float('inf')  # Inicialize com um valor alto

    current_params = best_params
    current_rmse = best_rmse

    temperature = initial_temperature

    for _ in range(max_iterations):
        neighbor_params = tuple(random.choice([-1, 1]) * random.randint(0, 8) + current_params[i] for i in range(4))
        neighbor_params = tuple(max(0, x) for x in neighbor_params)  # Garante que não haja valores negativos

        model = SARIMAX(data['Transformed'], order=neighbor_params[:3], seasonal_order=(0, 0, 0, 0))
        result = model.fit(disp=False)
        predictions = result.get_forecast(steps=50).predicted_mean
        validation_data = data['Transformed'][-50:]
        neighbor_rmse = rmse(validation_data, predictions)

        if neighbor_rmse < current_rmse or random.random() < math.exp((current_rmse - neighbor_rmse) / temperature):
            current_params = neighbor_params
            current_rmse = neighbor_rmse

            if current_rmse < best_rmse:
                best_params = current_params
                best_rmse = current_rmse

        temperature *= 0.95  # Fator de redução de temperatura

    return best_params

# Execute o algoritmo de recocido simulado
best_params = simulated_annealing(data)
print('Melhores parâmetros SARIMA:', best_params)

# Construa o modelo SARIMA com os melhores parâmetros
model = SARIMAX(data['Transformed'], order=best_params[:3], seasonal_order=(0, 0, 0, 0))
result = model.fit(disp=False)

# Faça previsões para os próximos 50 pontos
predictions = result.get_forecast(steps=50).predicted_mean

# Desfaça a transformação Box-Cox nas previsões
predictions = np.exp(predictions)

# Avalie o modelo com RMSE
validation_data = data['IPG2211A2N'][-50:]
rmse_score = rmse(validation_data, predictions)
print('RMSE do modelo SARIMA:', rmse_score)
