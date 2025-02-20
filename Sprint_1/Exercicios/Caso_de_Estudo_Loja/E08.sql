/*
E08
Apresente a query para listar o código e o nome do vendedor com maior número de vendas (contagem),
e que estas vendas estejam com o status concluída.  As colunas presentes no resultado devem ser, portanto, cdvdd e nmvdd.
*/

select
    V.cdvdd,
    V.nmvdd
from TBVENDEDOR V
    inner join (
        select
            cdvdd,
            count(cdven) as quantidade
        from TBVENDAS
        group by cdvdd
    ) as VENDAS on VENDAS.cdvdd = V.cdvdd
order by VENDAS.quantidade DESC
limit 1