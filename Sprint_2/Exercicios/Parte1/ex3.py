'''
Exercícios Parte 1
Dada as listas a seguir:

primeirosNomes = ['Joao', 'Douglas', 'Lucas', 'José']
sobreNomes = ['Soares', 'Souza', 'Silveira', 'Pedreira']
idades = [19, 28, 25, 31]

Faça um programa que imprima o dados na seguinte estrutura: "índice - primeiroNome sobreNome está com idade anos".
Obs: Você deve Utilizar a função enumerate().

Exemplo:

0 - João Soares está com 19 anos
'''

primeirosNomes = ['Joao', 'Douglas', 'Lucas', 'José']
sobreNomes = ['Soares', 'Souza', 'Silveira', 'Pedreira']
idades = [19, 28, 25, 31]

saida = []

for i in range(len(primeirosNomes)):
    saida.append("{} {} está com {} anos".format(primeirosNomes[i], sobreNomes[i], idades[i]))

saida = dict(enumerate(saida))

for k, v in saida.items():
    print("{} - {}".format(k, v))