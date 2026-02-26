SELECT * 
FROM clientes
ORDER BY qtdePontos DESC LIMIT 3;

SELECT * 
FROM clientes
WHERE flTwitch = 1 
ORDER BY DtCriacao ASC, qtdePontos DESC;