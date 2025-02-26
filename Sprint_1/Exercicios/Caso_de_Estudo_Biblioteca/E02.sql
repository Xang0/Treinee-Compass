/*
E02
Apresente a query para listar os 10 livros mais caros. Ordenar as linhas pela coluna valor, em ordem decrescente. 
Atenção às colunas esperadas no resultado final:  titulo, valor.
*/

SELECT
    titulo,
    valor
FROM LIVRO
ORDER BY valor DESC
LIMIT 10

/*
Resultado:

titulo	valor
Princâpios de fisiologia animal	515.64
Fundamentos de eletrônica	515.04
O verào das rosas	514.7
Artesào de saberes	512.22
O texto estranho	511.84
Limitaciones y usos del derecho de construir	496.59
Agente penitenciário	489.27
O casamento da Bruxa Onilda	480.81
Direito social na Uniào Européia e Mercosul	480.8
Machinapolis e a caosmologia do ser	479.9
*/