
SELECT * FROM (


    SELECT * 
    FROM transacoes
    WHERE dtCriacao >= '2025-01-01'
)

WHERE dtCriacao < '2025-07-01'
;