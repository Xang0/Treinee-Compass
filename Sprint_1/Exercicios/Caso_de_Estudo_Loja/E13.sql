/*
E13
Apresente a query para listar os 10 produtos menos vendidos pelos canais de E-Commerce ou Matriz
(Considerar apenas vendas concluídas).  As colunas presentes no resultado devem ser cdpro, nmcanalvendas,
nmpro e quantidade_vendas.
*/

select
    cdpro,
    nmcanalvendas,
    nmpro,
    sum(qtd) as quantidade_vendas
from TBVENDAS
where
    status = 'Concluído'
    AND nmcanalvendas = 'Ecommerce'
    
group by
    cdpro,
    nmcanalvendas,
    nmpro

union all

select
    cdpro,
    nmcanalvendas,
    nmpro,
    sum(qtd) as quantidade_vendas
from TBVENDAS
where
    status = 'Concluído'
    AND nmcanalvendas = 'Matriz'
group by
    cdpro,
    nmcanalvendas,
    nmpro
    
order by sum(qtd)
limit 10