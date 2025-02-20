/*
E05
Apresente a query para listar o nome dos autores que publicaram livros através de editoras NÃO situadas na região sul do Brasil.
Ordene o resultado pela coluna nome, em ordem crescente. Não podem haver nomes repetidos em seu retorno.
*/

select distinct
    A.nome
from AUTOR A
    inner join LIVRO as L on L.autor = A.codAutor
    inner join EDITORA as ED on ED.codEditora = L.editora
    inner join ENDERECO as EN on EN.codEndereco = ED.endereco
where
    EN.estado not in ('PARANÁ','SANTA CATARINA','RIO GRANDE DO SUL')
order by A.nome