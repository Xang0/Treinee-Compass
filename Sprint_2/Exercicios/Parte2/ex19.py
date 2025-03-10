'''
Exercícios Parte 2
Crie uma classe Avião que possua os atributos modelo, velocidade_maxima, cor e capacidade.
Defina o atributo cor de sua classe , de maneira que todas as instâncias de sua classe avião sejam da cor “azul”.
Após isso, a partir de entradas abaixo, instancie e armazene em uma lista 3 objetos da classe Avião.
Ao final, itere pela lista imprimindo cada um dos objetos no seguinte formato:
“O avião de modelo “x” possui uma velocidade máxima de “y”, capacidade para “z” passageiros e é da cor “w”.
Sendo x, y, z e w cada um dos atributos da classe “Avião”.

Valores de entrada:

modelo BOIENG456: velocidade máxima 1500 km/h: capacidade para 400 passageiros: Cor Azul
modelo Embraer Praetor 600: velocidade máxima 863km/h: capacidade para 14 passageiros: Cor Azul
modelo Antonov An-2: velocidade máxima de 258 Km/h: capacidade para 12 passageiros: Cor Azul
'''

class Aviao:
    # atributo estático
    cor = 'azul'

    def __init__(self, string):
        atributos = self.tratamento_entrada(string)
        self.modelo = atributos[0]
        self.velocidade_maxima = atributos[1]
        self.capacidade = atributos[2]

    def tratamento_entrada(self, string):
        # Separa a string em partes de acordo com o atributo o qual se referem
        atributos = string.split(': ')

        # Atributo modelo
        # 7 é o índice onde começa o valor do atributo
        modelo = atributos[0][7::]

        # Atributo velocidade_máxima
        # Removo os valores km/h e Km/h substituindo-os por ' ' e chamado o método .strip()
        # Dessa forma, o valor da velocidade estará na última possição da lista quando utilizar o método .split(' ')
        aux = atributos[1].replace('km/h', ' ').replace('Km/h', ' ').strip().split(' ')
        velocidade_maxima = int(aux[len(aux) - 1])

        # Atributo capacidade
        # Na parte da entrada referente à capacidade do avião, o valor está na posição de índice 2
        aux = atributos[2].split(' ')
        capacidade = int(aux[2])

        return [modelo,velocidade_maxima, capacidade]
    
    def __str__(self):
        return f'O avião de modelo {self.modelo} possui uma velocidade máxima de {self.velocidade_maxima}, ' + \
            f'capacidade para {self.capacidade} passageiros e é da cor {self.cor}'
    

if __name__ == '__main__':
    avioes = [
        Aviao('modelo BOIENG456: velocidade máxima 1500 km/h: capacidade para 400 passageiros: Cor Azul'),
        Aviao('modelo Embraer Praetor 600: velocidade máxima 863km/h: capacidade para 14 passageiros: Cor Azul'),
        Aviao('modelo Antonov An-2: velocidade máxima de 258 Km/h: capacidade para 12 passageiros: Cor Azul')
    ]

    for aviao in avioes:
        print(aviao)