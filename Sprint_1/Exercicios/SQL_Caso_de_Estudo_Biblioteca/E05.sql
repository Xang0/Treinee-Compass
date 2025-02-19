select distinct
    A.nome
from AUTOR A
    inner join LIVRO as L on L.autor = A.codAutor
    inner join EDITORA as ED on ED.codEditora = L.editora
    inner join ENDERECO as EN on EN.codEndereco = ED.endereco
where
    EN.estado not in ('PARANÁ','SANTA CATARINA','RIO GRANDE DO SUL')
order by A.nome