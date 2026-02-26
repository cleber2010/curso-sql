-- -- lista de transações com apenas 1 ponto
-- SELECT * FROM transacoes WHERE QtdePontos = 1;

-- -- Lista de pedidos realizados no fim de semana
-- SELECT
--   IdTransacao,
--   DtCriacao,
--   strftime('%w', substr(DtCriacao, 1, 19)) AS dow
-- FROM transacoes
-- WHERE strftime('%w', substr(DtCriacao, 1, 19)) IN ('6','0');

-- -- Lista de clientes com 0 (zero) pontos;
-- SELECT * FROM clientes WHERE qtdePontos = 0;

-- -- Lista de clientes com 100 a 200 pontos (inclusive ambos)
-- SELECT * FROM clientes WHERE qtdePontos BETWEEN 100 AND 200;

-- -- Lista de produtos com nome que começa com "Venda de"
-- SELECT * FROM produtos WHERE DescNomeProduto LIKE 'Venda de%';

-- --lista de produtos com nome que termina com "Lover"
-- SELECT * FROM produtos WHERE DescNomeProduto LIKE '%Lover';

-- --lista de produtos que são chapéu
-- SELECT * FROM produtos WHERE DescNomeProduto LIKE '%chapéu%';

--Lista de transações com o produto "Resgatar Ponei"
SELECT DescNomeProduto, IdTransacao 
FROM transacao_produto AS tp 
INNER JOIN produtos AS p 
ON tp.IdProduto = p.IdProduto 
WHERE DescNomeProduto = 'Resgatar Ponei';

-- -- Listar todas as transações adicionando uma coluna
-- -- nova sinalizando "Alto", "medio" e "baixo" 
-- -- para o valor dos pontos [<10; <500; >=500] 
-- SELECT
--   QtdePontos,
--   CASE
--     WHEN QtdePontos < 10 THEN 'Baixo'
--     WHEN QtdePontos < 500 THEN 'Medio'
--     ELSE 'Alto'
--   END AS faixa_pontos
-- FROM transacoes;

-- -- quantos clientes tem email cadastrado?
-- SELECT COUNT(*)
--  from clientes WHERE flEmail > 0;

-- -- Qual cliente juntou mais pontos positivos em 2025-05
-- SELECT idCliente, SUM(qtdePontos) AS total_pontos

-- FROM transacoes 

-- WHERE DtCriacao >= '2025-05-01'
--   AND DtCriacao <  '2025-06-01' 
--   AND qtdePontos > 0

-- GROUP BY idCliente
-- ORDER BY total_pontos DESC
-- LIMIT 1
-- ;

-- -- qual cliente fez mais transações no ano de 2024?
-- SELECT 
--       idCliente,
--       COUNT(IdTransacao) AS Total_transacao
 
-- From transacoes

-- WHERE DtCriacao LIKE '2024%'
-- GROUP BY idCliente
-- ORDER BY Total_transacao DESC
-- LIMIT 1
-- ;

-- -- quantos produtos são de rpg?
-- SELECT COUNT(DescCategoriaProduto) AS Total_produtos_rpg 
-- from produtos 
-- WHERE DescCategoriaProduto 
-- LIKE '%rpg%'; 


-- -- Qual o valor médio de pontos positivos por dia?
-- SELECT 
--         ROUND(AVG(qtdePontos), 2) AS mediaPontos, 
--       datetime(substr(DtCriacao, 1, 10)) AS DtCriacaoNova

-- from transacoes
-- WHERE qtdePontos > 0

-- GROUP BY DtCriacaoNova
-- ORDER BY DtCriacaoNova
-- ;

-- -- Qual dia da semana tem mais pedidos em 2025
-- SELECT 
-- COUNT(IdTransacao) AS totalTransacao,
-- strftime('%w', datetime(substr(DtCriacao, 1, 19))) AS diaSemana
-- FROM transacoes
-- GROUP BY diaSemana
-- ORDER BY totalTransacao DESC;

-- -- Qual o produto mais transacionado?
-- SELECT
--   IdProduto,
--   COUNT(IdProduto) AS totalTransacoes
-- FROM transacao_produto
-- GROUP BY IdProduto
-- ORDER BY totalTransacoes DESC
-- ;

-- -- Qual o produto com mais pontos transacionado

-- SELECT
--   IdProduto,
--   SUM(QtdeProduto) AS total_qtde,
--   SUM(QtdeProduto * vlProduto) AS total_valor
-- FROM transacao_produto
-- GROUP BY IdProduto
-- ORDER BY total_valor DESC
-- LIMIT 1;