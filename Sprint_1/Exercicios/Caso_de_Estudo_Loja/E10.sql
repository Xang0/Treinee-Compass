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
    
