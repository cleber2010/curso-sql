-- Pergunta de negócio:
-- Dos clientes que começaram no dia 25,
-- quantos ainda estavam ativos no dia 29?

SELECT COUNT(DISTINCT idCliente)
FROM transacoes AS t1

-- Mantemos apenas clientes que pertencem ao conjunto abaixo
WHERE t1.idCliente IN (

    -- Subquery = define o grupo inicial de clientes
    SELECT DISTINCT idCliente
    FROM transacoes
    
    -- Clientes que fizeram transação no "primeiro dia"
    WHERE substr(DtCriacao, 1, 10) = '2025-08-25'
)

-- Agora filtramos apenas as transações do "5° dia"
AND substr(t1.DtCriacao, 1, 10) = '2025-08-29';