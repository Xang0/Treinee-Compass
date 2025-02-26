/*
E03
 Apresente a query para listar as 5 editoras com mais livros na biblioteca.
 O resultado deve conter apenas as colunas quantidade, nome, estado e cidade.
 Ordenar as linhas pela coluna que representa a quantidade de livros em ordem decrescente.
*/

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

/*
Resultado:

quantidade	nome	estado	cidade
138	 CBMM	PARANÁ	Guaratuba
30	 Ática	SÃO PAULO	São Paulo
*/