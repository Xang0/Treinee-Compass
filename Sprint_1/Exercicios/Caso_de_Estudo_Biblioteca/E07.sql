/*
E07
Apresente a query para listar o nome dos autores com nenhuma publicação. Apresentá-los em ordem crescente.
*/

select distinct
    A.nome
from AUTOR A
    left join (
        select
            A.codAutor,
            case when count(L.cod) isnull
                then 0
                else count(L.cod)
            end as quantidade
        from AUTOR A
            left join LIVRO as L on A.codAutor = L.autor
        group by A.codAutor
    ) as qtde on qtde.codAutor = A.codAutor

where qtde.quantidade = 0
order by A.nome