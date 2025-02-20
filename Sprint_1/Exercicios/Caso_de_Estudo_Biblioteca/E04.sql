/*
E04
Apresente a query para listar a quantidade de livros publicada por cada autor.
Ordenar as linhas pela coluna nome (autor), em ordem crescente.
Além desta, apresentar as colunas codautor, nascimento e quantidade (total de livros de sua autoria).
*/

SELECT
    A.nome,
    A.codAutor,
    A.nascimento,
    CASE WHEN L.quantidade isnull
        THEN 0
        ELSE L.quantidade
    END AS quantidade

FROM AUTOR A
LEFT JOIN (
    SELECT
        COUNT(cod) AS quantidade,
        autor
    FROM LIVRO
    GROUP BY autor
) AS L ON L.autor = A.codAutor
ORDER BY A.nome
