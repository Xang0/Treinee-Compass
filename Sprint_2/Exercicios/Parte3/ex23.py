'''
Exercícios Parte 3
A função calcular_valor_maximo deve receber dois parâmetros, chamados de operadores e operandos.
Em operadores, espera-se uma lista de caracteres que representam as operações matemáticas suportadas (+, -, /, *, %),
as quais devem ser aplicadas à lista de operadores nas respectivas posições. Após aplicar cada operação ao respectivo
par de operandos, a função deverá retornar o maior valor dentre eles.

Veja o exemplo:

Entrada

operadores = ['+','-','*','/','+']
operandos  = [(3,6), (-7,4.9), (8,-8), (10,2), (8,4)]

Aplicar as operações aos pares de operandos

[ 3+6 , -7-4.9, 8*-8 , 10/2 , 8+4 ] 

Obter o maior dos valores

12

Na resolução da atividade você deverá aplicar as seguintes funções:

max
zip
map
'''

def calcular_valor_maximo(operadores,operandos) -> float:
    valores = zip(operadores, operandos)
    resultado = map(lambda x: eval(str(x[1][0]) + x[0] + str(x[1][1])), valores)

    return max(resultado)


operadores = ['+','-','*','/','+']
operandos  = [(3,6), (-7,4.9), (8,-8), (10,2), (8,4)]
print(calcular_valor_maximo(operadores,operandos)) # 12