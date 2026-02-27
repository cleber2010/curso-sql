--Quantidade de usuarios cadastrados (absoluto e acumulado) ao longo do tempo

WITH tb_clientes AS (
SELECT  COUNT(idCliente) AS qtdeUsuarios,
        substr(DtCriacao,1,10) AS dtDia
 FROM clientes

GROUP BY dtDia
ORDER BY dtDia
),


tb_acum AS (
    SELECT *,
            sum(qtdeUsuarios) OVER (ORDER BY dtDia) AS qtdeUsuariosAcum

    FROM tb_clientes
)

SELECT * FROM tb_acum ORDER BY dtDia
