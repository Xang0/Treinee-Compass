# Desafio da Sprint 1

## Enunciado

O desafio é normalizar a base de dados concessionaria.sqlite, ou seja, aplicar as formas normais e depois converter o modelo relacional em um modelo dimensional. As etapas do desafio são:
- Aplique as formas normais nas tabelas, crie arquivos .SQL com a criação das estruturas e elabore um desenho explicativo do relacionamento.
- Montar o modelo dimensional com base no modelo relacional normalizado na secção anterior.

## Normalização da tabela

O schema concessionaria.sqlite possuia apenas a tabela tb_locacao que contêm o identificador das locações mais as informações dela como quando foi realizada e por quanto tempo o carro foi alugado, o identificador do cliente mais suas informação, o identificador do carro mais suas informações, o identificador do combustivel e o tipo que ele se refere e o identificador do vendedor mais suas informações.

Dessa forma, para colocar a tabela na 1FN e 2FN, que se referem, respectivamente, à retirar grupos e/ou atributos repetitivos e eliminar as dependências parcias deixando apenas na tabela aquilo que se refere a essa entidade, foi necessário dividir a tabela tb_locacao em:
- d_cliente que contêm os atributos cliente, nomeCliente, cidadeCliente, estadoCliente e paisCliente
- d_vendedor que contêm os atributos vendedor, nomeVendedor, sexoVendedor e estadoVendedor
- d_carro que contêm os atributos carro, classiCarro, marcaCarro, modeloCarro, anoCarro, idCombustivel e tipoCombustivel
- d_combustivel que contêm os atributos combustivel e tipoCombustivel
- f_locacao que contêm os atributos idLocacao, cliente, carro, kmCarro, dataLocacao, horaLocacao, horaLocacao, qtdDiaria, vlrDiaria, dataEntrega, horaEntrega e vendedor

E para colocar a tabela na 3FN, que se refere a retirar as dependências tarnsitivas, foi necessário criar a tabela d_combustivel que retira a dependência transitiva do atributo tipoCombustivel com a chave primaria carro.

Segue o código utilizado para normalizar os dados:

[Script SQL para normalização dos dados](/Sprint_1/Desafio/normalizacao.sql)

Como resultado do script, foi criado o seguinde modelo relacional:

![Modelo relacional normalizado](/Sprint_1/Evidencias/Desafio/concessionaria_modelo_relacional.png)

## Modelo Dimensional baseado no Modelo Relacional

