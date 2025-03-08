'''
Exercícios Parte 1
Escreva uma função que recebe como parâmetro uma lista e retorna 3 listas: a lista recebida dividida em 3 partes iguais.
Teste sua implementação com a lista abaixo

lista = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
'''

def divide_lista(lista):
    tam = len(lista) // 3
    lista_dividida = []

    for i in range(0, len(lista), tam):
        lista_dividida.append(lista[i:i+tam])

    return lista_dividida


lista = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
lista_dividida = divide_lista(lista)

for i in range(len(lista_dividida)):
    if i != 2:
        print(lista_dividida[i], end=' ')
    else:
        print(lista_dividida[i])
