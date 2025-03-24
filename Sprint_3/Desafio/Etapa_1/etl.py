import pandas as pd

# Extraindo os dados e removendo duplicatas
dados = pd.read_csv('concert_tours_by_women.csv')
dados = dados.drop_duplicates()

# Removendo colunas desnecessárias
dados = dados.drop(columns=['Peak', 'All Time Peak', 'Ref.'])

# Criando as Start year e End year
start_year = []
end_year = []
for ano in dados['Year(s)'].str.split('-'):
    if len(ano) > 1:
        start_year.append(int(ano[0]))
        end_year.append(int(ano[1]))
    else:
        start_year.append(int(ano[0]))
        end_year.append(int(ano[0]))

dados['Start year'] = start_year
dados['End year'] = end_year

# Removendo a coluna Year(s)
dados = dados.drop(columns=['Year(s)'])

# Tratando dos valores numéricos
dados['Actual gross'] = dados['Actual gross'].apply(lambda x: x.replace('$',''))
dados['Actual gross'] = dados['Actual gross'].apply(lambda x: x.replace(',',''))
dados['Actual gross'] = dados['Actual gross'].apply(lambda x: x.replace('[b]',''))
dados['Actual gross'] = dados['Actual gross'].apply(lambda x: x.replace('[e]',''))
dados['Actual gross'] = dados['Actual gross'].astype(float)

dados['Adjustedgross (in 2022 dollars)'] = dados['Adjustedgross (in 2022 dollars)'].apply(lambda x: x.replace('$',''))
dados['Adjustedgross (in 2022 dollars)'] = dados['Adjustedgross (in 2022 dollars)'].apply(lambda x: x.replace(',',''))
dados['Adjustedgross (in 2022 dollars)'] = dados['Adjustedgross (in 2022 dollars)'].astype(float)

dados['Average gross'] = dados['Average gross'].apply(lambda x: x.replace('$',''))
dados['Average gross'] = dados['Average gross'].apply(lambda x: x.replace(',',''))
dados['Average gross'] = dados['Average gross'].astype(float)

# Exportando o arquivo
dados.to_csv('csv_limpo.csv', index=False)

