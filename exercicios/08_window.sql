-- Qual o dia da semana mais ativo de cada usuario?


WITH tb_cliente_semana AS (
SELECT idCliente,
        strftime('%w', substr(DtCriacao,1,10)) AS diaSemana,
        COUNT(DISTINCT idTransacao) AS qtdeTransacao

FROM transacoes
GROUP BY idCliente, diaSemana
),

tb_rn AS (
SELECT *,
        row_number() OVER (PARTITION BY idCliente ORDER BY qtdeTransacao DESC) AS rn
        FROM tb_cliente_semana
)

SELECT * FROM tb_rn WHERE rn=1
ORDER BY qtdeTransacao DESC