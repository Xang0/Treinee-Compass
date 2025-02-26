/*
E15
Apresente a query para listar os códigos das vendas identificadas como deletadas. Apresente o resultado em ordem crescente.
*/

select
    cdven
from TBVENDAS
where deletado = '1'

/*
Resultado:

cdven
23
55
67
*/