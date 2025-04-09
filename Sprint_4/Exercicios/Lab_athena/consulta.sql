WITH aggregated AS (
    SELECT 
        FLOOR(ano / 10) * 10 AS decada,
        nome,
        SUM(total) AS total_decada
    FROM nomes
    WHERE ano >= 1950
    GROUP BY FLOOR(ano / 10) * 10, nome
),
ranked AS (
    SELECT 
        decada,
        nome,
        total_decada,
        ROW_NUMBER() OVER (PARTITION BY decada ORDER BY total_decada DESC) AS posicao
    FROM aggregated
)
SELECT decada, nome, total_decada
FROM ranked
WHERE posicao <= 3
ORDER BY decada, posicao;