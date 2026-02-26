SELECT t1.*,
        t2.*
FROM transacao_produto AS t1
LEFT JOIN produtos AS t2
on t1.IdProduto = t2.IdProduto 
LIMIT 10;


-- Qual categoria tem mais produtos vendidos?
SELECT
        COUNT(DISTINCT t1.IdTransacao) AS sumQtdProduto,
        t2.DescCategoriaProduto
FROM transacao_produto AS t1
LEFT JOIN produtos AS t2
on t1.IdProduto = t2.IdProduto
GROUP BY t2.DescCategoriaProduto
ORDER BY sumQtdProduto DESC;

-- em 2024, quantas transações de Lovers tivemos
SELECT
        COUNT( DISTINCT t1.IdTransacao) AS qtdTransacaoLover,
        t3.DescCategoriaProduto

FROM transacoes AS t1
LEFT JOIN transacao_produto AS t2
ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos AS t3
ON t2.IdProduto = t3.IdProduto

WHERE t1.DtCriacao >= '2024-01-01'
AND t1.DtCriacao < '2025-01-01'
AND t3.DescCategoriaProduto LIKE "%Lover%"
;

--Qual mes tivemos mais lista de presença assinada
SELECT 
        COUNT(DISTINCT t1.IdTransacao) AS qtdTransacao,
        t3.DescNomeProduto,
        strftime('%m', datetime(substr(t1.DtCriacao, 1, 19))) AS mes

FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos AS t3
ON t2.IdProduto = t3.IdProduto

WHERE t3.DescNomeProduto = 'Lista de presença'
GROUP BY mes
ORDER BY COUNT(DISTINCT t1.IdTransacao) DESC
;