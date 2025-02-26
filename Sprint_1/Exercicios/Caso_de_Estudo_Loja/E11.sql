/*
E11
Apresente a query para listar o código e nome cliente com maior gasto na loja.
As colunas presentes no resultado devem ser cdcli, nmcli e gasto, esta última representando o
somatório das vendas (concluídas) atribuídas ao cliente.
*/

select
    cdcli,
    nmcli,
    sum(qtd * vrunt) as gasto
from TBVENDAS
where status = 'Concluído'
group by
    cdcli,
    nmcli
order by sum(qtd * vrunt) desc
limit 1

/*
Resultado:

cdcli	nmcli	gasto
9	Cliente BCA	1237250
*/