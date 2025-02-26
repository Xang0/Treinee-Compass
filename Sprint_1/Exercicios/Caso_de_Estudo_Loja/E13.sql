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

/*
Resultado:

cdpro	nmcanalvendas	nmpro	quantidade_vendas
2	Ecommerce	Produto C	15250
3	Ecommerce	Produto E	19730
4	Ecommerce	Produto SL	72250
4	Matriz	Produto SL	82750
3	Matriz	Produto E	86300
5	Matriz	Produto CH	120270
6	Ecommerce	Produto TN  	232250
1	Ecommerce	Produto A	255700
2	Matriz	Produto C	444250
1	Matriz	Produto A	1102500
*/