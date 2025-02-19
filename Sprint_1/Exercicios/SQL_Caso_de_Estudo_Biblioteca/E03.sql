SELECT
    L.quantidade,
    ED.nome,
    EN.estado,
    EN.cidade
FROM EDITORA ED
INNER JOIN ENDERECO AS EN ON EN.codEndereco = ED.endereco
INNER JOIN (
    SELECT
        COUNT(cod) AS quantidade,
        editora
    FROM LIVRO
    GROUP BY EDITORA
) AS L ON L.editora = ED.codEditora
ORDER BY L.quantidade DESC
LIMIT 5