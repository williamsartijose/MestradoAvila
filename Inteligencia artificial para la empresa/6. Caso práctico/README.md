# 6. Caso práctico

Contenido de la actividad

Enunciado



Enunciado



El presente ejercicio es similar al caso práctico de repaso de optimización de campañas de marketing online ya realizado y lo que se pretende con este es asentar los conceptos relativos al algoritmo del bandido multibrazo, como son las ratios de explotación y exploración para la optimización de una campaña de marketing online.



Al igual que en el caso práctico de repaso, se tiene que hacer una campaña de marketing online para promocionar un determinado producto con la que se mostrará en una página web un banner con una imagen del producto que promocionar. Se han realizado cinco imágenes distintas del producto para poner en el banner con el objetivo de captar la atención del usuario para que pulse en el banner y acceda a la web con los detalles del producto que promocionar, pero, a diferencia del caso práctico de repaso, los resultados obtenidos serán diferentes, siendo otra imagen la que mayor valor de Q tenga calculado a partir de la siguiente fórmula:





Captura de pantalla 2022-01-27 111937.png




Sin saber a priori cuál es la imagen que captará mayor atención, se debe aprender con base en los clics que se realizan sobre el banner qué imagen será las más llamativa y conseguirá más visitas aplicando el método del bandido multibrazo.



El objetivo es encontrar la imagen que capte mayor atención de los usuarios, es decir que mayor número de clics obtenga:

Dado el método ya implementado en el notebook “multi_armed_bandit(num_games=1000, epsilon=0.1, verbose=False)”, se pide, modificando el valor de épsilon, responder a la siguientes preguntas para asentar los conceptos relativos al aprendizaje por refuerzo y, en particular, al algoritmo del bandido multibrazo:



¿Cuáles el valor de épsilon que maximiza la imagen con mayor número de clics?
¿Cuáles la imagen que más clics obtiene y cuántos?
Poniendo una ratio de explotación del 100%, ¿Qué resultado se obtiene?


Todas estas preguntas deben de ser contestadas en el propio notebook.

![Web 0](https://github.com/williamsartijose/MestradoAvila/blob/main/Inteligencia%20artificial%20para%20la%20empresa/6.%20Caso%20pr%C3%A1ctico/2.png)


```python
import numpy as np

# Função que simula a exibição de um banner e retorno de cliques
def exibir_banner(imagem):
    # Lógica simulada para calcular o valor de Q
    q_value = np.random.rand()  # Valor de Q simulado
    
    # Lógica simulada para decidir se o usuário clica ou não
    click = np.random.choice([0, 1], p=[0.8, 0.2])  # Simula 20% de chance de clique
    
    return q_value, click

# Função para simular o bandit de vários braços
def multi_armed_bandit(num_games, epsilon, verbose=False):
    q_values = np.zeros(5)  # Valor de Q para cada imagem
    total_clicks = np.zeros(5)  # Total de cliques para cada imagem
    
    for game in range(1, num_games + 1):
        # Escolher ação com base na política de exploração/exploração
        if np.random.rand() < epsilon:
            action = np.random.choice(5)  # Exploração aleatória
        else:
            action = np.argmax(q_values)  # Exploração com base no valor de Q
        
        # Simular exibição do banner e retorno de cliques
        q_value, click = exibir_banner(action)
        
        # Atualizar valor de Q para a ação escolhida
        q_values[action] = (q_values[action] * total_clicks[action] + q_value) / (total_clicks[action] + 1)
        total_clicks[action] += click
        
        # Exibir resultados periodicamente
        if verbose and game % 100 == 0:
            print(f"Jogo {game}: Q-Values = {q_values}, Cliques Totais = {total_clicks}")

    return q_values, total_clicks

# Modificar o valor de epsilon para responder às perguntas
epsilon = 0.1  # Altere conforme necessário

# Executar o bandit de vários braços com o valor de epsilon escolhido
q_values, total_clicks = multi_armed_bandit(num_games=1000, epsilon=epsilon, verbose=True)

# Responder às perguntas
indice_imagem_max_clicks = np.argmax(total_clicks)
max_clicks = total_clicks[indice_imagem_max_clicks]

print(f"\nValor de epsilon: {epsilon}")
print(f"Imagem com mais cliques: Imagem {indice_imagem_max_clicks + 1}")
print(f"Quantidade de cliques: {max_clicks}")

# Configurar uma taxa de exploração de 100%
q_values_exploitative, total_clicks_exploitative = multi_armed_bandit(num_games=1000, epsilon=0, verbose=False)
indice_imagem_max_clicks_exploitative = np.argmax(total_clicks_exploitative)
max_clicks_exploitative = total_clicks_exploitative[indice_imagem_max_clicks_exploitative]

print("\nCom taxa de exploração de 100%:")
print(f"Imagem com mais cliques: Imagem {indice_imagem_max_clicks_exploitative + 1}")
print(f"Quantidade de cliques: {max_clicks_exploitative}")

```

    Jogo 100: Q-Values = [0.47658712 0.35218324 0.03025533 0.38890348 0.39376933], Cliques Totais = [21.  0.  0.  0.  1.]
    Jogo 200: Q-Values = [0.52349995 0.39082219 0.45942469 0.19589871 0.37785638], Cliques Totais = [31.  4.  2.  0.  1.]
    Jogo 300: Q-Values = [0.5454311  0.34846148 0.30910511 0.16900086 0.47424043], Cliques Totais = [44.  6.  2.  0.  2.]
    Jogo 400: Q-Values = [0.48758327 0.46986267 0.47140292 0.40955248 0.44549026], Cliques Totais = [65.  8.  3.  2.  2.]
    Jogo 500: Q-Values = [0.49539489 0.43765201 0.45770967 0.40955248 0.43876107], Cliques Totais = [77.  8.  4.  2.  6.]
    Jogo 600: Q-Values = [0.52502871 0.47978355 0.50218674 0.38858991 0.43876107], Cliques Totais = [88.  9.  5.  3.  6.]
    Jogo 700: Q-Values = [0.48091351 0.40869626 0.43122597 0.35635359 0.41683607], Cliques Totais = [102.  14.   6.   4.   7.]
    Jogo 800: Q-Values = [0.5112819  0.36656419 0.44709722 0.35111174 0.46196492], Cliques Totais = [120.  14.   7.   4.   7.]
    Jogo 900: Q-Values = [0.50541098 0.37300407 0.46796129 0.41338282 0.40503044], Cliques Totais = [137.  14.   7.   5.   7.]
    Jogo 1000: Q-Values = [0.4884937  0.39629559 0.46796129 0.36322707 0.41880028], Cliques Totais = [152.  14.   7.   5.   7.]
    
    Valor de epsilon: 0.1
    Imagem com mais cliques: Imagem 1
    Quantidade de cliques: 152.0
    
    Com taxa de exploração de 100%:
    Imagem com mais cliques: Imagem 1
    Quantidade de cliques: 211.0
    


```python

```
