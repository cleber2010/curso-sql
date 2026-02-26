SELECT idCliente, 
        qtdePontos,
        CASE 
            WHEN qtdePontos <= 500 THEN 'Ponei'
            WHEN qtdePontos > 500 AND qtdePontos <= 1000 THEN 'Ponei Premium'
            WHEN qtdePontos > 1000 AND qtdePontos <= 5000 THEN 'Mago Aprendiz'
            WHEN qtdePontos > 5000 AND qtdePontos <= 10000 THEN 'Mago Mestre'
            ELSE 'Mago Supremo'
        END AS NomeGrupo

FROM clientes

ORDER BY qtdePontos DESC;