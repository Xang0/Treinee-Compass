'''
Exercícios Parte 2

Implemente duas classes, Pato e Pardal , que herdam de uma superclasse chamada Passaro as habilidades de voar e emitir som.
Contudo, tanto Pato quanto Pardal devem emitir sons diferentes (de maneira escrita) no console, conforme o modelo a seguir.
Imprima no console exatamente assim:

Pato
Voando...
Pato emitindo som...
Quack Quack
Pardal
Voando...
Pardal emitindo som...
Piu Piu
'''

class Passaro:
    def __init__(self):
        pass

    def __str__(self):
        return 'Passaro'

    def voar(self):
        print(f'{self.__str__()}\nVoando...')

    def emitir_som(self):
        print(f'{self.__str__()} emitindo som...')


class Pato(Passaro):
    def __init__(self):
        super().__init__()

    def __str__(self):
        return 'Pato'
    
    def voar(self):
        super().voar()

    def emitir_som(self):
        super().emitir_som()
        print('Quack Quack')

class Pardal(Passaro):
    def __init__(self):
        super().__init__()

    def __str__(self):
        return 'Pardal'
    
    def voar(self):
        super().voar()

    def emitir_som(self):
        super().emitir_som()
        print('Piu Piu')


if __name__ == "__main__":
    pato = Pato()
    pato.voar()
    pato.emitir_som()
    pardal = Pardal()
    pardal.voar()
    pardal.emitir_som()