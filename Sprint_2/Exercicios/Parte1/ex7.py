'''
Exercícios Parte 1
Escreva um programa que lê o conteúdo do arquivo texto arquivo_texto.txt e imprime o seu conteúdo.

Dica: leia a documentação da função open(...)
'''

with open('arquivo_texto.txt', 'r') as arquivo:
    for linha in arquivo:
        print(linha, end='')
    arquivo.close()