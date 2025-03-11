'''
Exercícios Parte 3
Um determinado sistema escolar exporta a grade de notas dos estudantes em formato CSV.
Cada linha do arquivo corresponde ao nome do estudante, acompanhado de 5 notas de avaliação, no intervalo [0-10].
É o arquivo estudantes.csv de seu exercício.

Precisamos processar seu conteúdo, de modo a gerar como saída um relatório em formato textual contendo as seguintes informações:

Nome do estudante
Três maiores notas, em ordem decrescente
Média das três maiores notas, com duas casas decimais de precisão

O resultado do processamento deve ser escrito na saída padrão (print), ordenado pelo nome do estudante e obedecendo
ao formato descrito a seguir:

Nome: <nome estudante> Notas: [n1, n2, n3] Média: <média>

Exemplo:

Nome: Maria Luiza Correia Notas: [7, 5, 5] Média: 5.67
Nome: Maria Mendes Notas: [7, 3, 3] Média: 4.33

Em seu desenvolvimento você deverá utilizar lambdas e as seguintes funções:

round
map
sorted
'''

arquivo = open('estudantes.csv', 'r')
estudantes = arquivo.readlines()

estudantes = map(lambda x: x.split(','), estudantes)
estudantes = map(lambda x: [x[0]] + list(map(int, x[1:])), estudantes)
estudantes = map(lambda x: [x[0]] + sorted(x[1:], reverse=True), estudantes)

estudantes = sorted(estudantes, key=lambda x: x[0])

for estudante in estudantes:
    print('Nome: {} Notas: {} Média: {}'. format(estudante[0], estudante[1:4], round(sum(estudante[1:4]) / 3, 2)))
