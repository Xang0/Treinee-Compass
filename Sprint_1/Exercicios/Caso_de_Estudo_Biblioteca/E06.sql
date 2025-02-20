/*
E06
Apresente a query para listar o autor com maior número de livros publicados.
O resultado deve conter apenas as colunas codautor, nome, quantidade_publicacoes.
*/

select
    A.codAutor,
    A.nome,
    L.quantidade as quantidade_publicacoes
from AUTOR A
    inner join (
        select
            autor,
            count(cod) as quantidade
        from LIVRO
        group by autor
    ) as L on L.autor = A.codAutor
order by L.quantidade DESC
limit 1