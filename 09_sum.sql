SELECT 
    SUM(qtdePontos) ,

    SUM (CASE 
        WHEN qtdePontos > 0 THEN qtdePontos 
        END) AS qtdePontosPositivos,

    SUM (CASE 
        WHEN qtdePontos < 0 THEN qtdePontos
        ELSE 0
        END) AS qtdePontosNegativos,

    COUNT (CASE 
        WHEN qtdePontos < 0 THEN qtdePontos
        END) AS qtdeTransacoesNegativos

FROM transacoes 

WHERE DtCriacao >= '2025-07-01' 
AND DtCriacao < '2025-08-01'
ORDER BY qtdePontos;