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

/*
Resultado:

nome
ABBASCHIAN,  R
ABE, Jair Minoro
ABREU, Antônio Suárez
ACEVEDO MARIN, Rosa Elizabeth
ALEXANDER, Charles K
ALLEN, P. A
ALMEIDA, Fernando José De
ALTMANN, Wolfgang
ALVARENGA, Beatriz Gonçalves De
ALVES, José Jerônimo De Alencar
ALVES, William Pereira
AMADO, Nélia
AMALDI, U
AMARAL, Adriano Benayon Do
AMARAL, Luciano Do
ASTOLFI,  Jean-pierre
BARANENKOV, G. S
BARATA, Ronaldo
BARBALHO, Jader
BARBETTA, Pedro Alberto
BARBOSA,  Ruy  Madsen
BARDÁLEZ  HOYOS,  Juan  L
BARISON, Thiago
BARP, Wilson José
BARROS, Regina Mambeli
BARSANO, Paulo Roberto
*/