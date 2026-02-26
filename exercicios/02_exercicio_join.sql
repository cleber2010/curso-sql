-- Quais clientes mais perderam pontos por Lover?


SELECT t1.idCliente,
        SUM(t1.qtdePontos) AS pontosPerdidos

from transacoes AS t1

LEFT JOIN transacao_produto AS t2
ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos AS t3
ON t2.IdProduto = t3.IdProduto

WHERE DescNomeProduto LIKE '%Lover%'
AND QtdePontos < 0
GROUP BY t1.idCliente
ORDER BY pontosPerdidos ASC
LIMIT 5
;

-- Quais clientes assinaram a lista de presença no dia 2025/08/25

SELECT
    t1.idCliente,
    t3.DescNomeProduto

FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos AS t3
ON t2.IdProduto = t3.IdProduto

WHERE t1.DtCriacao LIKE '2025-08-25%'
AND t3.DescNomeProduto = 'Lista de presença'
;


-- DO inicio ao fim do nosso curso (2025/08/25 a 2025/08/29), quantos
-- clientes assinaram a lista de presença?

SELECT
    COUNT(DISTINCT t1.idCliente) AS qtdClientesPresenca

FROM transacoes AS t1

INNER JOIN transacao_produto AS t2
ON t1.IdTransacao = t2.IdTransacao

INNER JOIN produtos AS t3
ON t2.IdProduto = t3.IdProduto

WHERE t1.DtCriacao >=  '2025-08-25'
AND t1.DtCriacao < '2025-08-30'
AND t3.DescNomeProduto = 'Lista de presença'

;


-- Clientes mais antigos, tem mais frequência de transação?
SELECT 
    COUNT(t2.IdTransacao),
CASE
    WHEN t1.DtCriacao < '2025-01-01' THEN 'Cliente Antigo'
    ELSE 'Cliente Novo'
    END AS categoriaCliente

from clientes AS t1

LEFT JOIN transacoes AS t2
ON t1.idCliente = t2.idCliente

GROUP BY categoriaCliente
;


SELECT t1.idCliente,
        CAST(julianday('now') - julianday(substr(t1.DtCriacao,1,19)) AS INT) AS idadeBase,
        COUNT(t2.IdTransacao) AS qtdTransacoes


FROM clientes AS t1

LEFT JOIN transacoes AS t2
ON t1.idCliente = t2.idCliente
GROUP BY t1.idCliente, idadeBase
;

-- quantidade de transações acumuladas ao longo do tempo?
SELECT COUNT(*) FROM transacoes;


qual dia da semana mais ativo de cada usuário?
SELECT idCliente, 
        COUNT(IdTransacao) AS qtdTransacao,
        MAX(strftime('%w', datetime(substr(DtCriacao, 1, 19)))) AS diaSemana
FROM transacoes
GROUP BY idCliente
;
