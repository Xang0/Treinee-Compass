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