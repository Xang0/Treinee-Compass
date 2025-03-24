import pandas as pd
import matplotlib.pyplot as plt

# Extraindo os dados e removendo duplicatas
dados = pd.read_csv(r'../Etapa_1/csv_limpo.csv')
dados = dados.drop_duplicates()

# Criando/abrindo o arquivo respostas.txt
respostas = open('respostas.txt','+w')

# Questão 1: Qual é a artista que mais aparece nessa lista e possui a maior média de seu faturamento bruto (Actual gross) ?
repeticoes = dados['Artist'].value_counts()
maior_media = dados[['Artist', 'Actual gross']].groupby(['Artist']).mean().sort_values(['Actual gross'], ascending=False).iloc[0]
repeticoes = repeticoes.filter(like=maior_media.name, axis=0)

respostas.write("Q1:\n")
respostas.write(f"A artista que mais aparece na lista é {maior_media.name} aparecendo {repeticoes.iloc[0]} " + \
                f"vezes e com uma média de faturamento {maior_media['Actual gross']}\n")

# Questão 2: Das turnês que aconteceram em um ano, apresente a turnê com a maior média de faturamento bruto (Average gross)
turnes = dados.loc[dados['Start year'] == dados['End year']]
turnes = turnes.sort_values(['Average gross'], ascending=False).iloc[0]

respostas.write("\nQ2:\n")
respostas.write(f"A turne de um ano com a maior média de faturamento bruto foi a turne {turnes['Tour title']} com um faturamento médio de {turnes['Average gross']}\n")

# Questão 3: Quais são as 3 artistas que possuem o show (unitário) mais lucrativo, dentro de uma turnê ? Cite também o nome dessas turnês para cada artista.
# Utilize a coluna "Adjusted gross (in 2022 dollars)". Caso necessário, crie uma coluna nova para essa conta.
turnes = dados[['Adjustedgross (in 2022 dollars)', 'Artist', 'Tour title', 'Shows']]
turnes['Gross per show'] = dados['Adjustedgross (in 2022 dollars)'] / dados['Shows']
turnes = turnes.sort_values(['Gross per show'], ascending=False).head(4)

respostas.write("\nQ3:\n")
respostas.write(
    f"1. {turnes.iloc[0]['Artist']} com o show no valor de {turnes.iloc[0]['Gross per show']} na turne {turnes.iloc[0]['Tour title']}\n"+ \
    f"2. {turnes.iloc[1]['Artist']} com o show no valor de {turnes.iloc[1]['Gross per show']} na turne {turnes.iloc[1]['Tour title']}\n"+ \
    f"3. {turnes.iloc[3]['Artist']} com o show no valor de {turnes.iloc[3]['Gross per show']} na turne {turnes.iloc[3]['Tour title']}"
)

# Fechando o arquivo
respostas.close()

# Questão 4: Para a artista que mais aparece nessa lista e que tenha o maior somatório de faturamento bruto, crie um gráfico de linhas que mostre o faturamento
# por ano da turnê (use a coluna Start Year).
