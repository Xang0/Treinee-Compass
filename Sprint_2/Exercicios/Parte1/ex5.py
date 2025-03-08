'''
Exercícios Parte 1
Leia o arquivo person.json, faça o parsing e imprima seu conteúdo.

Dica: leia a documentação do pacote json
'''

import json

arquivo = json.load(open('person.json'))
print(arquivo)