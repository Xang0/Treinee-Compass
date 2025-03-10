'''
Exercícios Parte 2
Crie uma classe  Calculo  que contenha um método que aceita dois parâmetros, X e Y, e retorne a soma dos dois.
Nessa mesma classe, implemente um método de subtração, que aceita dois parâmetros, X e Y, e retorne a subtração
dos dois (resultados negativos são permitidos).

Utilize os valores abaixo para testar seu exercício:

x = 4 
y = 5
imprima:

Somando: 4+5 = 9
Subtraindo: 4-5 = -1
'''

class Calculo:
    def __init__(self):
        pass

    def somar(self, x, y):
        return x + y

    def subtrair(self, x, y):
        return x - y
    

if __name__ == '__main__':
    x = 4
    y = 5
    calculo = Calculo()
    print(f'Somando: {x}+{y} = {calculo.somar(x, y)}')
    print(f'Subtraindo: {x}-{y} = {calculo.subtrair(x, y)}')