SELECT avg(qtdePontos),
        MIN(qtdePontos) AS minCarteira,
        MAX(qtdePontos) AS maxCarteira,
        SUM(flTwitch),
        SUM(flEmail)
FROM clientes;