-- Quem iniciou o curso no primeiro dia, 
-- em média assistiu quantas aulas?

-- WITH tb_primeiro_dia AS (

--     SELECT DISTINCT idCliente 
--     FROM transacoes
--     WHERE substr(dtCriacao,1,10) = '2025-08-25'
-- ),

-- tb_dias_curso AS (

--     SELECT DISTINCT 
--             IdCliente, 
--             substr(dtCriacao,1,10)  AS presenteDia

--     FROM transacoes
--     WHERE substr(dtCriacao,1,10) >= '2025-08-25'
--     AND substr(dtCriacao,1,10) < '2025-08-30'
--     ORDER BY idCliente, presenteDia
-- ),

-- tb_cliente_dias AS (

-- SELECT t1.idCliente,
--         count(t2.presenteDIa) AS qtdDias
-- FROM tb_primeiro_dia AS t1

-- LEFT JOIN tb_dias_curso AS t2
-- ON t1.idCliente = t2.IdCliente
-- GROUP BY t1.idCliente
-- )

-- -- calcula media

-- SELECT avg(qtdDias),
--         MAX(qtdDias),
--         MIN(qtdDias)
-- FROM tb_cliente_dias


-- Dentre os cliente de janeiro/2025, 
-- quantos assistiram o curso de SQL?

-- 1) Cria a lista de clientes cadastrados em janeiro/2025.
-- 2) Cria a lista de clientes que tiveram alguma transação entre 25 e 29/08/2025.
-- 3) Faz o JOIN dessas duas listas e conta quantos clientes distintos de jan/2025 aparecem nas transações desse período.

WITH tb_cliente_janeiro AS (
  SELECT DISTINCT idCliente
  FROM transacoes
  WHERE DtCriacao >= '2025-01-01'
    AND DtCriacao <  '2025-02-01'
),
tb_transacoes AS (
  SELECT DISTINCT IdCliente
  FROM transacoes
  WHERE substr(DtCriacao,1,10) >= '2025-08-25'
    AND substr(DtCriacao,1,10) <  '2025-08-30'
)
SELECT
  COUNT(DISTINCT c.idCliente) AS clientesJaneiro,
  COUNT(DISTINCT t.IdCliente) AS clientesJaneiro_que_transacionaram_em_agosto
FROM tb_cliente_janeiro c
LEFT JOIN tb_transacoes t
  ON t.IdCliente = c.idCliente;