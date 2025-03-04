/* Desafio da Sprint 1 */

/* Normalizando a tabela tb_locacao
 * 
 * Neste primeiro momento do desafio eu dividi a tabela tb_locacao nas tabelas d_cliente, que se refere à dimensão cliente;
 * d_carro, que se refere à dimensão carro; d_combustivel, que se refere à dimensão combustível e d_vendedor, que se refere à
 * dimensão vendedor.
 * 
 * Isso foi feito pela necessidade de: 
 * - Retirar os atributos ou grupos repetitivos, que define a primeira forma normal;
 * - Retirar dependências parciais da tabela fatos ao criar novas tabeles referentes apenas às entidades que os dados se referem,
 * como na divisão da tb_locacao em várias tabelas dimenções e uma tabela fato, que define a segunda forma normal;
 * - Retirar as dependências transitivas das tabelas tanto dimensões quanto fatos, o que define a terceira forma normal.
 * 
 * Para realizar a normalização, portanto, foi utilizado o script SQL a seguir:
 * */

/* Criação da tabela d_cliente*/
CREATE TABLE d_cliente (
	cliente int primary key,
	nomeCliente varchar,
	cidadeCliente varchar,
	estadoCliente varchar,
	paisCliente
)

-- Inserção dos dados
INSERT INTO d_cliente (
	cliente,
	nomeCliente,
	cidadeCliente,
	estadoCliente,
	paisCliente
)
SELECT DISTINCT
	idCliente,
	nomeCliente,
	cidadeCliente,
	estadoCliente,
	paisCliente
FROM tb_locacao;


/* Criação da tabela d_combustivel */
CREATE TABLE d_combustivel (
	combustivel int primary key,
	tipoCombustivel varchar
)

-- Inserção dos dados
INSERT INTO d_combustivel (
	combustivel,
	tipoCombustivel
)
SELECT DISTINCT 
	idcombustivel,
	tipoCombustivel 
FROM tb_locacao;


/* Criação da tabela d_carro */
CREATE TABLE d_carro (
	carro int primary key,
	classiCarro varchar,
	marcaCarro varchar,
	modeloCarro varchar,
	anoCarro int,
	kmCarro int,
	idCombustivel int,
	-- Criação da chave estrangeira que vai referenciar a chave primaria da tabela d_combustivel
	CONSTRAINT fk_combustivel
		FOREIGN KEY (idCombustivel)
		REFERENCES d_combustivel(combustivel)
)

-- Inserção dos dados
INSERT INTO d_carro (
	carro,
	classiCarro,
	marcaCarro,
	modeloCarro,
	anoCarro,
	kmCarro,
	idCombustivel
)
SELECT DISTINCT
	idcarro,
	classiCarro,
	marcaCarro,
	modeloCarro,
	anoCarro,
	MAX(kmCarro),
	idcombustivel
FROM tb_locacao
GROUP BY idcarro, classiCarro, marcaCarro, modeloCarro, anoCarro, idcombustivel;


/* Criação da tabela d_vendedor*/
CREATE TABLE d_vendedor (
	vendedor int primary key,
	nomeVendedor varchar,
	sexoVendedor smallint,
	estadoVendedor varchar
)

-- Inserção dos dados
INSERT INTO d_vendedor (
	vendedor,
	nomeVendedor,
	sexoVendedor,
	estadoVendedor
)
SELECT DISTINCT 
	idVendedor,
	nomeVendedor,
	sexoVendedor,
	estadoVendedor
FROM tb_locacao;


/*Criação da tabela f_locacao*/
CREATE TABLE f_locacao (
	idLocacao int primary key,
	cliente int,
	carro int,
	dataLocacao datetime,
	horaLocacao time,
	qtdDiaria int,
	vlrDiaria decimal,
	dataEntrega date,
	horaEntrega time,
	vendedor int,
	
	-- Criação das chaves estrangeiras que vão referenciar as chaves primarias das tabelas d_cliente, d_carro e d_vendedor
	CONSTRAINT fk_cliente
		FOREIGN KEY (cliente)
		REFERENCES d_cliente(cliente),
	CONSTRAINT fk_carro
		FOREIGN KEY (carro)
		REFERENCES d_carro(carro),
	CONSTRAINT fk_vendedor
		FOREIGN KEY (vendedor)
		REFERENCES d_vendedor(vendedor)
)

-- Inserção dos dados
INSERT INTO f_locacao (
	idLocacao,
	cliente,
	carro,
	dataLocacao,
	horaLocacao,
	qtdDiaria,
	vlrDiaria,
	dataEntrega,
	horaEntrega,
	vendedor
)
SELECT DISTINCT
	idLocacao,
	idCliente,
	idCarro,
	dataLocacao,
	horaLocacao,
	qtdDiaria,
	vlrDiaria,
	dataEntrega,
	horaEntrega,
	idVendedor
FROM tb_locacao;