'''
Exercícios Parte 1
Dada a seguinte lista:

a = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

Faça um programa que gere uma nova lista contendo apenas números ímpares.
'''

a = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
impares = []

for n in a:
    if (n % 2) != 0:
        impares.append(n)
        
print(impares)