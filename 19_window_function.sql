-- CTE que resume as transações por cliente em cada dia
WITH tb_cliente_dia AS (

    SELECT 
        idCliente,

        -- Extrai apenas a data (remove horário)
        substr(DtCriacao,1,10) AS dtDia,

        -- Conta quantas transações distintas o cliente fez naquele dia
        COUNT(DISTINCT IdTransacao) AS qtdeTransacao

    FROM transacoes

    -- Filtra apenas o período desejado
    WHERE DtCriacao >= '2025-08-25'
      AND DtCriacao <  '2025-08-30'

    -- Agrupa para ter 1 linha por cliente por dia
    GROUP BY idCliente, dtDia
)

SELECT *,
    
    -- Calcula o acumulado de transações por cliente ao longo dos dias
    -- PARTITION BY separa o cálculo por cliente (um acumulado para cada cliente)
    -- ORDER BY dtDia define a ordem cronológica do acumulado
    SUM(qtdeTransacao) 
    OVER (PARTITION BY IdCliente ORDER BY dtDia) AS acum,
    lag(qtdeTransacao) OVER (PARTITION BY IdCliente ORDER BY dtDia) AS lagTransacao

FROM tb_cliente_dia;