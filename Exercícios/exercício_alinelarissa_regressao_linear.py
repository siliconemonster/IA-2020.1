# -*- coding: utf-8 -*-
"""exercício_AlineLarissa_regressao_linear.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1mVRCmOeUYTXi6Ud0LwIlXDg-ULfct50H
"""

# Carregando Bibliotecas
import pandas as pd
import numpy as np  # biblioteca que suporta arrays e matrizes multidimensionais - https://numpy.org/
from sklearn import preprocessing # usado para preprocessar a base de dados (normalização)
import matplotlib.pyplot as plt # biblioteca para plotar gráficos
import seaborn as sns # biblioteca de visualização de dados
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error

from google.colab import drive
drive.mount('/content/drive')

"""Vamos usar o arquivo "exemplo.csv". Inicialmente, carregamos o arquivo e imprimimos o seu conteúdo e plotamos o gráfico."""

plt.rc("font", size=14)

sns.set(style="white")
sns.set(style="whitegrid", color_codes=True)

data = pd.read_csv('/content/drive/MyDrive/trab_regressão_linear/exemplo.csv',header=0)
print(data)

# gráfico de dispersão - pode usar plt.plot(data['X'],data['Y'],'ro')
plt.scatter(data['X'], data['Y'],cmap='red')

# rótulo dos eixos e salvando o arquivo com a imagem
plt.xlabel("Eixo X")
plt.ylabel("Eixo Y")
plt.savefig('pontos.png')
plt.show()

# transformando X e Y para numpy array. Ele precisa ser bidimensional (-1,1)
X = data.iloc[:, 0].values.reshape(-1, 1) 
Y = data.iloc[:, 1].values.reshape(-1, 1) 

print(X)
print(Y)

"""Vamos agora calcular a reta da regressão linear usando as fórmula apresentadas no vídeo 1 da aula 10:"""

mediaX  = np.mean(X)
mediaX2 = np.mean(X**2)
mediaY  = np.mean(Y)
mediaY2 = np.mean(Y**2)
mediaXY = np.mean(X*Y)

teta0 = (mediaY*mediaX2 - mediaX*mediaXY)/(mediaX2 - (mediaX)**2)
teta1 =(mediaXY - mediaX*mediaY)/(mediaX2 - (mediaX)**2)

print('media X:',np.mean(X))
print('media X²:',np.mean(X**2))
print('media Y:',np.mean(Y))
print('media Y²:',np.mean(Y**2))
print('media X*Y:',np.mean(X*Y))
print()
print('teta0:',teta0)
print('teta1:',teta1)
print()
print('Equação da Reta: Y =', teta0,' + ',teta1,'* X' )

# plotando os pontos previstos e a reta
Y_pred_media = teta0+teta1*X

plt.scatter(X, Y,marker='o',color='blue')  #pontos originais
plt.scatter(X, Y_pred_media,marker='+',color='red') #pontos previstos
plt.savefig('pontos_originais_previstos.png')
plt.show()

plt.scatter(X, Y,marker='o',color='blue')  #pontos originais
plt.scatter(X, Y_pred_media,marker='+',color='red') #pontos previstos
plt.plot(X, Y_pred_media, color='gray')
plt.savefig('reta_prevista.png')
plt.show()

"""<h2>1. Regressão Linear

<h3>a) Refaça o exemplo de regressão linear usando o modelo de regressão linear implementado pelo scikit (linear_model). Indique qual o erro quadrático médio.
"""

regressao = LinearRegression()
regressao.fit(X, Y)
yPrevisao = regressao.predict(X) # é a linha que indica os valores

# O score retorna o coeficiente de determinação R² da previsão (???)
print("Score:", regressao.score(X, Y))
# O erro quadrático médio é quão distante o ponto está da linha
print("Erro quadrático médio:", mean_squared_error(Y, yPrevisao))

"""<h3>b) Refaça o item (a), dividindo o arquivo de exemplos em treinamento (70%) e teste (30%). Indique qual o erro quadrático médio."""

feature_cols = ['X']
X = data[feature_cols]
Y = data.Y

# 70% treinamento - 30% teste
X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size=0.3)

# Regressão linear
regressao = LinearRegression()
regressao.fit(X_train, Y_train)
yPrevisao = regressao.predict(X_test)

print("Score:", regressao.score(X_test, Y_test))
print("Erro quadrático médio:", mean_squared_error(Y_test, yPrevisao))

# Plotando o gráfico
plt.scatter(X_test, Y_test, color='blue')
plt.plot(X_test, yPrevisao, color='gray')
plt.savefig('reta_prevista.png')
plt.show()

"""<h3>c) Comente os resultados obtidos.

Em a) O valor do score foi de 0.9903992477649591, o que pareceu muito satisfatório, e o erro quadrático médio foi de 19.310387739177337.<br><br>
Já em b), o score em ambos fica na casa dos 0.99... também, mas sempre variando.
O erro quadrático médio varia muito, aproximadamente de 5 a 25.<br><br>
Julguei esses valores baixos, e por consequência, bons.

<h2>2. Considere a base de dados multi.csv. Ela contém dados com 4 features (X1,X2,X3 e X4) e um atributos alvo (X5).

<h3>a) Plote os gráficos para X1 x X5, X2 x X5, X3 x X5 e X4 x X5, e determine qual par de atributos (Xi,X5) possui uma relação linear.
"""

multi = pd.read_csv('/content/drive/MyDrive/trab_regressão_linear/multi.csv',header=0)
print(multi)

print("")
print("X1 x X5")
plt.scatter(multi['X1'], multi['X5'])
plt.xlabel("Eixo X1")
plt.ylabel("Eixo X5")
plt.savefig('X1xX5.png')
plt.show()

print("")
print("X2 x X5")
plt.scatter(multi['X2'], multi['X5'])
plt.xlabel("Eixo X1")
plt.ylabel("Eixo X5")
plt.savefig('X2xX5.png')
plt.show()

print("")
print("X3 x X5")
plt.scatter(multi['X3'], multi['X5'])
plt.xlabel("Eixo X1")
plt.ylabel("Eixo X5")
plt.savefig('X3xX5.png')
plt.show()

print("")
print("X4 x X5")
plt.scatter(multi['X4'], multi['X5'])
plt.xlabel("Eixo X4")
plt.ylabel("Eixo X5")
plt.savefig('X4xX5.png')
plt.show()

"""X4 x X5 parece ter a relação mais linear delas

<h3>b) Utilizando os atributos que possuem uma relação linear com X5, utilize a regressão linear para determinar os coeficientes da equação correspondentes. Utilize o modelo de regressão linear do scikit e todo o conjunto de dados no treinamento.
"""

feature_cols = ['X3', 'X4']
X = multi[feature_cols]
Y = multi.X5

regressao = LinearRegression()
regressao.fit(X, Y)
yPrevisao = regressao.predict(X)
print("Score:", regressao.score(X, Y))
print("Erro quadrático médio:", mean_squared_error(Y, yPrevisao))

"""<h3>c) Divida os dados em conjuntos de  treinamento (75%) e teste (25%)."""

feature_cols = ['X2', 'X3', 'X4']
X = multi[feature_cols]
Y = multi.X5

X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size=0.25)

regressao = LinearRegression()
regressao.fit(X_train, Y_train)
yPrevisao = regressao.predict(X_test)
print("Score: ", regressao.score(X_test, Y_test))
print("Erro quadrático médio: ", mean_squared_error(Y_test, yPrevisao))

"""Links:

https://scikit-learn.org/stable/auto_examples/linear_model/plot_ols.html#sphx-glr-auto-examples-linear-model-plot-ols-py

https://scikit-learn.org/stable/modules/generated/sklearn.linear_model.LinearRegression.html#sklearn.linear_model.LinearRegression.score

"""