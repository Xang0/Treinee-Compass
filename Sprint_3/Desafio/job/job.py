import pandas as pd
import matplotlib.pyplot as plt

# Extraindo os dados e removendo duplicatas
dados = pd.read_csv(r'/src/data/csv_limpo.csv')
dados = dados.drop_duplicates()


# Criando/abrindo o arquivo respostas.txt
respostas = open(r'/src/data/respostas.txt', 'w')


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
turnes = dados[['Adjustedgross (in 2022 dollars)', 'Artist', 'Tour title', 'Shows']].copy()
turnes['Gross per show'] = turnes['Adjustedgross (in 2022 dollars)'] / turnes['Shows']
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

maior_soma = dados[['Artist', 'Actual gross']].groupby(['Artist']).sum().nlargest(1, "Actual gross")
dados_filtrados = dados.loc[dados['Artist'] == maior_soma.index[0]].copy()

anos = dados_filtrados['Start year'].astype(str).tolist()
gross = dados_filtrados['Actual gross'].tolist()
label = dados_filtrados['Tour title'].tolist()

fig, ax = plt.subplots(figsize=(10,6))

ax.set_title("Faturamento por Ano da Turnê")
plt.bar(
    anos,
    gross,
    label=label,
    color=["red", "blue", "green", "orange"]
)
ax.set_xlabel("Ano da Turnê")
ax.set_ylabel("Faturamento")
ax.legend(title="Turnês", labels=label)

fig.savefig(r"/src/data/Q4.png", 
           bbox_inches='tight',
           dpi=100)
plt.close('all')
del fig, ax


# Questão 5: Faça um gráfico demonstrando as 5 artistas com mais shows na lista
top_5_artistas = dados[['Artist', 'Shows']].groupby(['Artist'], as_index=False).sum().nlargest(5, "Shows")

artistas = top_5_artistas['Artist'].tolist()
shows = top_5_artistas["Shows"].astype(int).tolist()

fig = plt.figure(figsize=(10, 6), tight_layout=True)
ax = fig.add_subplot(111)

ax.set_title("Top 5 Artistas por Quantidade de Shows")
ax.bar(
    artistas,
    shows,
    color=["red", "blue", "green", "orange", "purple"]
)
ax.set_xlabel("Artistas")
ax.set_ylabel("Qtd de Shows")

fig.savefig(r"/src/data/Q5.png", 
           bbox_inches='tight',
           dpi=100)
plt.close('all')
del fig, ax