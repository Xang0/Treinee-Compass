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
