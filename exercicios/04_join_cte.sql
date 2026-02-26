-- como foi a curva de Churn do curso de SQL?

-- errado
-- SELECT 
--         substr(DtCriacao,1,10) AS dtDia,
--         COUNT(DISTINCT idCliente) AS qtdeCliente
-- FROM transacoes
-- WHERE DtCriacao >= '2025-08-25'
-- AND DtCriacao < '2025-08-29'
-- GROUP BY dtDia



-- certo


WITH tb_clientes_d1 AS (
SELECT DISTINCT idCliente

FROM transacoes

WHERE DtCriacao >= '2025-08-25'
AND DtCriacao < '2025-08-26'
)

SELECT COUNT(DISTINCT t1.idCliente) AS qtdCliente,
       substr(t2.DtCriacao,1,10) AS dtDia

FROM tb_clientes_d1 AS t1

LEFT JOIN transacoes AS t2
ON t1.idCliente = t2.idCliente

WHERE t2.DtCriacao >= '2025-08-25'
AND t2.DtCriacao < '2025-08-30'
GROUP BY dtDia