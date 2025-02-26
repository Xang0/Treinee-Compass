/*
E16
Apresente a query para listar a quantidade média vendida de cada produto agrupado por estado da federação.
As colunas presentes no resultado devem ser estado e nmprod e quantidade_media.
Considere arredondar o valor da coluna quantidade_media na quarta casa decimal.
Ordene os resultados pelo estado (1º) e nome do produto (2º).

Obs: Somente vendas concluídas.
*/

select
    estado,
    nmpro,
    round(avg(qtd),4) as quantidade_media
from TBVENDAS
where status = 'Concluído'

group by estado, nmpro
order by estado, nmpro

/*
Resultado:

estado	nmpro	quantidade_media
Alagoas	Produto A	20500.0
Bahia	Produto A	13590.9091
Ceará	Produto A	11772.7273
Ceará	Produto C	14666.6667
Goiás	Produto A	12500.0
Mato Grosso do Sul	Produto E	9639.0909
Minas Gerais	Produto A	10050.0
Paraíba	Produto A	23250.0
Piauí	Produto SL	12916.6667
Rio Grande do Norte	Produto A	12107.1429
Rio Grande do Sul	Produto CH	13363.3333
Rio de Janeiro	Produto C	25250.0
Santa Catarina	Produto A	14000.0
São Paulo	Produto C	15250.0
Tocantins	Produto TN  	33178.5714
*/