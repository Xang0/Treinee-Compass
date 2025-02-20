/*
E12
Apresente a query para listar código, nome e data de nascimento dos dependentes do vendedor com menor
valor total bruto em vendas (não sendo zero). As colunas presentes no resultado devem ser cddep, nmdep,
dtnasc e valor_total_vendas.

Observação: Apenas vendas com status concluído.
*/

select
    D.cddep,
    D.nmdep,
    D.dtnasc,
    VEN.valor as valor_total_vendas
    
from TBDEPENDENTE D
    inner join TBVENDEDOR as V on V.cdvdd = D.cdvdd
    inner join (
        select
            cdvdd,
            sum(qtd * vrunt) as valor
        from TBVENDAS
        where status = 'Concluído'
        group by cdvdd
        order by sum(qtd * vrunt)
        limit 1
    ) as VEN on VEN.cdvdd = V.cdvdd
    