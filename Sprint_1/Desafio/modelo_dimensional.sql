-- Desafio do Sprint 1

/* Criação do Modelo Dimensional a partir do Modelo Relacional
 * 
 * O modelo dimensional normalmente é criado de duas formas diferentes: ou em um outro banco de dados 
 * após serem lidos em uma stage_area ou por meio de views no mesmo banco de dados que vão representar os fatos e dimensões.
 * No caso dessa etapa do desafio, a forma que seria possível criar um modelo dimensional a partir de um relacional seria por meio de views.
 * 
 * Dessa forma, como o modelo dimensional busca tornar as querias mais leves para suportar um alto volume de acesso aos dados por elas,
 * o schema mais comum de ser utilizado é o Star Schema o qual possuí apenas conexões de tabelas fatos com tabelas dimensões. Portanto,
 * o script a seguir cria 4 views: fato_locacao que vai apresentar os dados da tabela f_locacao, dim_vendedor que apresenta os dados da tabela d_vendedor,
 * dim_cliente que apresenta os dados da tabela d_cliente e dim_carro que apresenta os dados das tabelas d_carro e d_combustivel.
 * 
 * */

-- Criação das views
-- Criação da view fato_locacao
CREATE VIEW fato_locacao AS
SELECT
	idLocacao AS ID_LOCACAO,
	cliente AS ID_CLIENTE,
	carro AS ID_CARRO,
	dataLocacao AS DATA_LOCACAO,
	horaLocacao AS HORA_LOCACAO,
	qtdDiaria AS QTD_DIARIA,
	vlrDiaria AS VLR_DIARIA,
	dataEntrega AS DATA_ENTREGA,
	horaEntrega AS HORA_ENTREGA,
	vendedor AS ID_VENDEDOR
FROM f_locacao;

-- Criação da view dim_vendedor
CREATE VIEW dim_vendedor AS
SELECT
	vendedor AS ID_VENDEDOR,
	nomeVendedor AS NOME,
	sexoVendedor AS SEXO,
	estadoVendedor AS ESTADO_VENDEDOR
FROM d_vendedor;

-- Criação da view dim_cliente
CREATE VIEW dim_cliente AS
SELECT
	cliente AS ID_CLIENTE,
	nomeCliente AS NOME,
	cidadeCliente AS CIDADE_CLIENTE,
	estadoCliente AS ESTADO_CLIENTE,
	paisCliente AS PAIS_CLIENTE
FROM d_cliente;

-- Criação da view dim_carro
CREATE VIEW dim_carro AS
SELECT
	D.carro AS CARRO,
	D.classiCarro AS CLASSI_CARRO,
	D.marcaCarro AS MARCA_CARRO,
	D.modeloCarro AS MODELO_CARRO,
	D.anoCarro AS ANO_FABRICACAO,
	kmCarro AS KM_CORRIDO,
	D.idCombustivel AS ID_COMBUSTIVEL,
	C.tipoCombustivel AS COMBUSTIVEL
FROM d_carro D
INNER JOIN d_combustivel AS C ON D.idCombustivel = C.combustivel;