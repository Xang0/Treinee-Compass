/*
E09
Apresente a query para listar o código e nome do produto mais vendido entre as datas de 2014-02-03 até 2018-02-02,
e que estas vendas estejam com o status concluída. As colunas presentes no resultado devem ser cdpro e nmpro.
*/

select
    T.cdpro,
    T.nmpro
from TBVENDAS T
    inner join (
        select
            cdpro,
            count(cdven) as quantidade
        from TBVENDAS
        where dtven >= '2014-02-03' and dtven <= '2018-02-02'
        group by cdpro
    ) as VENDAS on VENDAS.cdpro = T.cdpro
order by VENDAS.quantidade desc
limit 1

/*
Resultado:

cdpro	nmpro
1	Produto A
*/