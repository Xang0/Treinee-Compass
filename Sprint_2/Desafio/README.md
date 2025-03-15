# Desafio da Sprint 1

## Enunciado

O seu objetivo é ler o arquivo de estatísticas da Loja da Google googleplatstore.csv, processar e gerar gráficos de análise. Para isso será necessário:
- Etapa 1: certifique-se que a biblioteca pandas e matplotlib estejam instaladas. Caso não estejam, instale-as.
- Etapa 2: leia o arquivo csv googleplatstore.csv e utilizando as bibliotecas Pandas e Matplotlib, realize as seguintes atividades sobre o dataset
    1. Remova as linhas duplicadas
    2. Faça um gráfico de barras contendo os top 5 apps por número de instalação
    3. Faça um gráfico de pizza (pie chart) mostrando as categorias de apps existentes no dataset de acordo com a frequência em que elas aparecem
    4. Mostre qual o app mais caro existente no dataset
    5. Mostre quantos apps são classificados como 'Matuure +17'
    6. Mostre o top 10 apps por número de reviews bem como o respectivo número de reviews. Ordene a lista de forma descrescente por número de reviews
    7. Crie pelo menos mais 2 cálculos sobre o dataset e apresente um em formato de lista e outra em formato devalor. Por exemplo: "top 10 apps por número de reviews" e "o app mais caro existente no dataset"
    8. Crie pelo menos outras 2 formas gráficas de exibição dos indicadores acima utilizando a biblioteca Matplotlib.

## Códigos Fonte

- [Script .IPYNB da resolução do desafio](/Sprint_2/Desafio/desafio.ipynb)

## Etapa 1

Para a verificação se as bibliotecas Pandas e Matplotlib, eu escrevi "import pandas as pd" e "import matplotlib.pyplot as plt" com intuito de já fazer a importação dos dados e se compilador de python verifica a não existência dessas bibliotecas. Como eu estou utilizando o Anaconda no VScode para realizar o desafio, ambas as bibliotecas já vem instaladas.

````python
import pandas as pd
import matplotlib.pyplot as plt
````

## Etapa 2

Para a leitura dos arquivos, foi utilizado a função **read_csv()** do Pandas para a leitura dos dados e a função **drop_duplicates()** para a remoção das linhas repetidas como mostrado a seguir:

````python
dados = pd.read_csv('googleplaystore.csv')

dados = dados.drop_duplicates()
````

O resto do dasafio foi feito da seguinte forma:

### 2. Faça um gráfico de barras contendo os top 5 apps por número de instalação:

Para a resolução desse exercício eu filtrei o dataset para trabalhar apenas com as colununas 'App' e 'Installs', fiz o tratamento dos dados da coluna Installs para que eu consiga transformar os valores dela em números inteiros, ordenei de forma descrescente e finalmente peguei os 5 primeiros valores.

Com os dados prontos, eu fiz a plotagem deles em um gráfico de barras horizontais, pois dessa forma é mais fácil visualizar os dados e o que eles representam:

````python
# Filtrando o dataset pelas colunas 'App' e 'Installs'
top_apps_installs = dados[['App', 'Installs']]

# Limpeza dos dados para melhor visualização
top_apps_installs = top_apps_installs.apply(lambda x: x.str.replace('+', ''))
top_apps_installs = top_apps_installs.apply(lambda x: x.str.replace(',', ''))
top_apps_installs['Installs'] = top_apps_installs['Installs'].astype(int)

# Ordenação dos dados e seleção dos 5 primeiros
top_apps_installs = top_apps_installs.sort_values(['Installs'], ascending=False)
top_apps_installs = top_apps_installs.head(6)

# Criação do gráfico de barras horizontais
plt.title('Top 5 Apps por Número de Instalações')
plt.barh(top_apps_installs['App'], top_apps_installs['Installs'], color='skyblue')
plt.xlabel('Quantidade de Instalações (centena de milhão)')
plt.show()
````

### 3. Faça um gráfico de pizza (pie chart) mostrando as categorias de apps existentes no dataset de acordo com a frequência em que elas aparecem:

Para a resolução desse exercício, eu faço o cálculo da frequência relativa de cada categoria no dataset e crio uma lista com esses valores em ordem decrescente usando a função **sort_values()**. Porém, com a quantidade de categorias de apps existente no dataset, o gráfico de pizza ficaria confuso e muito cheio de informação. Portanto, eu cria duas listas: top_categorias que possui as categorias com maior frequência e outros_percent que vai possuir a soma da frequência do resto das categorias para ser usado como o valor "Outros" no gráfico.

Após isso, eu concateno as duas variáveis de forma que agora eu tenho uma lista com as principais categorias e uma chamado "Outros" para a plotagem dos dados:

````python
# Crio uma serie com a frequência relativa de cada categoria no dataset
categorias = dados['Category'].value_counts(ascending=False, normalize=True)

# Defino as categorias principais e a porcentagem de outras categorias
top_categorias = categorias.head(4)
resto = categorias.iloc[4:]
outros_percent = resto.sum()

# Adiciono a porcentagem de outras categorias ao top_categorias
if outros_percent > 0:
    categorias_agrupadas = pd.concat([top_categorias, pd.Series([outros_percent], index=['Outros'])])
else:
    categorias_agrupadas = top_categorias

# Plotagem dos dados em um gráfico de pizza
plt.title('Porcentagem de Apps por Categoria')
plt.pie(
    categorias_agrupadas,
    labels=categorias_agrupadas.index,
    autopct='%1.1f%%',
    startangle=90
)
plt.show()
````

### 4. Mostre qual o app mais caro existente no dataset:

Para a resolução deste exercício, primeiro eu fiz o tratamento dos dados retirando o caractere '$' dos valores da coluna 'Price' para defini-los como números flutuantes. Dessa forma, eu consigo fazer a ordenação dos preços dos aplicativos em ordem decrescente para pegar o primeiro valor da coluna, ou seja, o app mais caro do dataset:

````python
# Tratamento dos dados para a visualização
dados['Price'] = dados['Price'].apply(lambda x: x.replace('$', ''))
dados['Price'] = dados['Price'].astype(float)

# Cálculo do aplicativo mais caro do dataset
mais_caro = dados['Price'].sort_values(ascending=False).head(1)
mais_caro = dados.loc[mais_caro.index[0]]

print("O aplicativo mais caro do dataset é o {} com o valor de US${}".format(mais_caro['App'], mais_caro['Price']))
````

### 5. Mostre quantos apps são classificados como 'Matuure +17':

Para a resolução deste exercício, utilizando a função **loc[]**, eu seleciono todas as linhas que possui 'Mature 17+' como valor na coluna 'Content Rating' e faço o print do tamanho do dataframe utilizando utilizando a função **len()**:

````python
# Crio uma serie com a contagem de aparições da categoria Mature 17+ no dataset
mature = dados.loc[dados['Content Rating'] == 'Mature 17+']
print("A quantidade de aplicativos para maiores de 17 anos é {}".format(len(mature)))
````

### 6. Mostre o top 10 apps por número de reviews bem como o respectivo número de reviews. Ordene a lista de forma descrescente por número de reviews:

Para a resolução deste exercício, eu primeiro ordeno os dados pela coluna 'Reviews' em ordem decrescente para então filtrar os dados pelas colunas 'App' e 'Reviews'. 
    
Após isso, bastou pegar as 10 primeiras linhas do dataframe formado e apresenta-las:

````python
# Ordenando o dataset pela quantidade de reviews e selecionando os 10 primeiros
top_apps_reviws = dados.sort_values(['Reviews'], ascending=False)
top_apps_reviws = top_apps_reviws[['App', 'Reviews']]
top_apps_reviws = top_apps_reviws.head(10)
top_apps_reviws
````

### 7. Crie pelo menos mais 2 cálculos sobre o dataset e apresente um em formato de lista e outra em formato devalor. Por exemplo: "top 10 apps por número de reviews" e "o app mais caro existente no dataset":

O primeiro cálculo feito foi sobre os top 10 apps pela nota recebida. Para isso, eu defino os valores da coluna 'Rating' como números flutuantes e ordeno o dataset de forma decrescnte de acordo com esses valores. Após isso bastou selecionar as 10 primeiras linhas do dataframe e apresenta-los:

````python
# Top 10 apps por Rating
# Ordenando o dataset pela coluna Rating e selecionando os 10 primeiros
top_rating = dados
top_rating['Rating'] = top_rating['Rating'].astype(float)
top_rating = dados.sort_values(['Rating'], ascending=False)
top_rating = top_rating.head(10)

print('Os aplicativos com as maiores notas são:')
for app in top_rating.values:
    print(f'{app[0]} com a nota {app[2]}')
````

O segundo cálculo feito foi sobre o aplicativo que teve a atualização mais recente. Para isso, eu transformo os valores da coluna 'Last Updated' para datatime e ordeno o dataframe em ordem decrescente de acordo com esses valores. Após isso, bastou pegar a primeira linha do dataframe e apresentar o nome do app utilizando a função **iloc[0]['App']**:

````python
# Aplicativo atualizado mais recentemente
ultima_atualizacao = dados
ultima_atualizacao['Last Updated'] = pd.to_datetime(ultima_atualizacao['Last Updated'])
ultima_atualizacao = ultima_atualizacao.sort_values(['Last Updated'], ascending=False).head(1)

print(f'O aplicativo atualizado mais recentemente foi {ultima_atualizacao.iloc[0]['App']}')
````

### 8. Crie pelo menos outras 2 formas gráficas de exibição dos indicadores acima utilizando a biblioteca Matplotlib.

O primeiro gráfico feito foi um gráfico de barras sobre a quantidade de aplicativos por versão de android exigida. Para isso, eu crio uma serie de dados utilizando o função **value_counts()** que calcula a frequência de cada valor em um dataframe. Porém, com a quantidade de valores distintos existntes na tabela, eu faço a média da frequência e seleciono apenas os aplicativos que possui uma repetição maior que essa média utilizando a função **loc[]**

Após isso, bastou fazer a plotagem dos dados usando a função **plt.barh()**:

````python
# Quantidade de aplicativos por versão de android necessária
versao_android = dados['Android Ver'].value_counts()

# Selecionando apenas aqueles que possuem uma quantidade maior que a média
media = versao_android.mean()
versao_android = versao_android.loc[versao_android > media]

# Plotagem dos dados em um gráfico de barras horizontais
plt.title('Quantidade de Apps por Versão do Android')
plt.barh(versao_android.keys(), versao_android,color='purple')
plt.show()
````

O segundo do gráfico se trata sobre um gráfico de dispersão entre a quantidade de vezes que um aplicativo foi instalado e seu preço. Para isso, eu crio duas variáves: installs que se trata sobre a coluna 'Installs' e prices que se trata sobre a coluna 'Price'.

Eu realizo o tratamento dos dados retirando os caracteres '+' e ',' da variável installs de forma que eu consigo definir seus valores como números inteiros e retiros o caractere '$' da variável prices de forma que eu consifa definir seus valores como números flutantes.

Após isso, bastou fazer a plotagem dos dados usando a função **plt.scatter()**:

````python
# Dispersão entre Instalações e Preço buscando encontrar alguma relação entre os dois

# Seleciono as colunas Installs e Price
installs = dados['Installs']
prices = dados['Price']

# Limpeza dos dados sobre Installs e Price para melhor visualização
installs = installs.apply(lambda x: x.replace('+', ' ').strip())
installs = installs.apply(lambda x: x.replace(',', ''))
installs = installs.astype(int)

prices = prices.apply(lambda x: x.replace('$', ''))
prices = prices.astype(float)

# Plotagem dos dados em um gráfico de dispersão
plt.title('Dispersão entre Instalações e Preço')
plt.scatter(prices, installs, color='red')
plt.xlabel('Preço (US$)')
plt.ylabel('Instalações')
plt.show()
````