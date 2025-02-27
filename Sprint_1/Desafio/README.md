# Desafio da Sprint 1

## Enunciado

O desafio é normalizar a base de dados concessionaria.sqlite, ou seja, aplicar as formas normais e depois converter o modelo relacional em um modelo dimensional. As etapas do desafio são:
- Aplique as formas normais nas tabelas, crie arquivos .SQL com a criação das estruturas e elabore um desenho explicativo do relacionamento.
- Montar o modelo dimensional com base no modelo relacional normalizado na secção anterior.

## Códigos Fonte

- [Modelo Relacional Normalizado](/Sprint_1/Desafio/normalizacao.sql)

- [Modelo Dimensional]()

## Normalização da tabela

O schema concessionaria.sqlite possuia apenas a tabela tb_locacao que contêm o identificador das locações mais as informações dela como quando foi realizada e por quanto tempo o carro foi alugado, o identificador do cliente mais suas informação, o identificador do carro mais suas informações, o identificador do combustivel e o tipo que ele se refere e o identificador do vendedor mais suas informações.

Dessa forma, para colocar a tabela na 1FN e 2FN, que se referem, respectivamente, à retirar grupos e/ou atributos repetitivos e eliminar as dependências parcias deixando apenas na tabela aquilo que se refere a essa entidade, foi necessário dividir a tabela tb_locacao em:
- d_cliente que contêm os atributos cliente, nomeCliente, cidadeCliente, estadoCliente e paisCliente
- d_vendedor que contêm os atributos vendedor, nomeVendedor, sexoVendedor e estadoVendedor
- d_carro que contêm os atributos carro, classiCarro, marcaCarro, modeloCarro, anoCarro, idCombustivel e tipoCombustivel
- d_combustivel que contêm os atributos combustivel e tipoCombustivel
- f_locacao que contêm os atributos idLocacao, cliente, carro, kmCarro, dataLocacao, horaLocacao, horaLocacao, qtdDiaria, vlrDiaria, dataEntrega, horaEntrega e vendedor

E para colocar a tabela na 3FN, que se refere a retirar as dependências tarnsitivas, foi necessário criar a tabela d_combustivel que retira a dependência transitiva do atributo tipoCombustivel com a chave primaria carro. Portanto, o script para a normalização dos dados envolve a criação das tabelas citadas como também a inserção dos dados presentes na tabela tb_locacao para as novas.

Para isso, foi utilizado os comando **CREATE TABLE nome_da_tabela ()** e **INSERT INTO nome_da_tabela()** como demonstrado no exemplo da tabela d_carro a seguir onde em sua criação já se define as chaves estrangeiras da tabela:

````sql
/* Criação da tabela d_carro */
CREATE TABLE d_carro (
	carro int primary key,
	classiCarro varchar,
	marcaCarro varchar,
	modeloCarro varchar,
	anoCarro int,
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
	idCombustivel
)
SELECT DISTINCT
	idcarro,
	classiCarro,
	marcaCarro,
	modeloCarro,
	anoCarro,
	idcombustivel
FROM tb_locacao;
````

Como resultado do script, foi criado o seguinde modelo relacional:

![Modelo relacional normalizado](/Sprint_1/Evidencias/Desafio/concessionaria_modelo_relacional.png)

## Modelo Dimensional baseado no Modelo Relacional

