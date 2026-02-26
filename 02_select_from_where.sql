SELECT *
FROM produtos
WHERE DescCategoriaProduto = 'rpg'
LIMIT 10;

-- exercicios --
-- Selecione todos os clientes com email cadastrado --
SELECT * FROM clientes WHERE flEmail >= 1;

-- Selecione todos transações de 50 pontos(exatos) --
SELECT * FROM transacoes WHERE QtdePontos = 50;

-- Selecione todos clientes com mais de 500 pontos --
SELECT * FROM clientes WHERE qtdePontos > 500;

-- Selecione produtos que contêm 'churn' no nome --
SELECT * FROM produtos WHERE DescNomeProduto LIKE '%churn%';
