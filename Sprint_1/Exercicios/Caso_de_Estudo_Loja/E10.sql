/*
E10
A comissão de um vendedor é definida a partir de um percentual sobre o total de vendas (quantidade * valor unitário)
por ele realizado. O percentual de comissão de cada vendedor está armazenado na coluna perccomissao, tabela tbvendedor. 

Com base em tais informações, calcule a comissão de todos os vendedores, considerando todas as vendas armazenadas
na base de dados com status concluído.

As colunas presentes no resultado devem ser vendedor, valor_total_vendas e comissao. O valor de comissão deve ser
apresentado em ordem decrescente arredondado na segunda casa decimal.
*/

select
    V.nmvdd as vendedor,
    sum(VEN.valor) as valor_total_vendas,
    round(sum(V.perccomissao * VEN.valor) / 100, 2)  as comissao
    
from TBVENDEDOR V
    left join (
        select
            cdvdd,
            qtd * vrunt as valor
        from TBVENDAS
        where status = 'Concluído'
    ) as VEN on VEN.cdvdd = V.cdvdd
    
group by V.nmvdd
order by sum(V.perccomissao * VEN.valor)/100 desc
    
/*
Resultado:

vendedor	valor_total_vendas	comissao
Vendedor 2  	2472020.0	24720.2
Vendedor 8	1237250	6186.25
Vendedor 10	747250	3736.25
Vendedor 5	270122.5	1350.61
Vendedor 1	121530.0	1215.3
Vendedor 3	57630.0	576.3
Vendedor 7	69700.0	348.5
Vendedor 6  	50830.0	254.15
Vendedor 4	42908.0	214.54
Vendedor 9	39100.0	195.5
*/