'''
Exercícios Parte 1
Calcule o valor mínimo, valor máximo, valor médio e a mediana da lista gerada na célula abaixo:
Obs.: Lembrem-se, para calcular a mediana a lista deve estar ordenada!

import random 
# amostra aleatoriamente 50 números do intervalo 0...500
random_list = random.sample(range(500),50)

Use as variáveis abaixo para representar cada operação matemática:

mediana
media
valor_minimo 
valor_maximo 

Importante: Esperamos que você utilize as funções abaixo em seu código:

random
max
min
sum
'''

import random

random_list = random.sample(range(500), 50)
random_list.sort()

mediana = 0
if len(random_list) % 2 == 0:
    indice = len(random_list) // 2
    mediana = (random_list[indice] + random_list[indice - 1]) / 2
else:
    mediana = random_list[(len(random_list) // 2) + 1]

media = sum(random_list) / len(random_list)
valor_minimo = min(random_list)
valor_maximo = max(random_list)

print('Media: {}, Mediana: {}, Mínimo: {}, Máximo: {}'.format(media, mediana, valor_minimo, valor_maximo))