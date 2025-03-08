'''
Exercícios Parte 1
Escreva uma função que recebe uma lista e retorna uma nova lista sem elementos duplicados
 Utilize a lista a seguir para testar sua função.

['abc', 'abc', 'abc', '123', 'abc', '123', '123']
'''

lista = ['abc', 'abc', 'abc', '123', 'abc', '123', '123']
nova_lista = set()
nova_lista.add(lista[0])

for i in lista:
    if i not in nova_lista:
        nova_lista.add(i)

nova_lista = list(nova_lista)

print(nova_lista)