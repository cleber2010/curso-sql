SELECT IdProduto,
        COUNT(*)

from transacao_produto 

GROUP BY IdProduto;



SELECT idCliente, 
        SUM(qtdePontos),
        count(IdTransacao)
FROM transacoes 

WHERE  DtCriacao >= '2025-07-01' 

AND DtCriacao < '2025-08-01'
GROUP BY idCliente
-- HAVING é o "where" do GROUP BY
HAVING SUM(qtdePontos) >= 4000

ORDER BY SUM(qtdePontos) DESC
LIMIT 10;