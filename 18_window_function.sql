-- Cria uma CTE (tabela temporária) com o resumo de transações por dia
WITH tb_sumario_dias AS (

    SELECT 
        -- Extrai apenas a parte da data (YYYY-MM-DD), ignorando hora
        substr(DtCriacao,1,10) AS dtDia,

        -- Conta quantas transações distintas ocorreram no dia
        COUNT(DISTINCT IdTransacao) AS qtdeTransacoes
        
    FROM transacoes

    -- Filtra apenas o período desejado
    WHERE DtCriacao >= '2025-08-25'
      AND DtCriacao <  '2025-08-30'

    -- Agrupa para calcular a quantidade por dia
    GROUP BY dtDia
)

-- Seleciona o resumo diário
SELECT *,

       -- Calcula o acumulado ao longo dos dias
       -- A função janela soma progressivamente seguindo a ordem das datas
       SUM(qtdeTransacoes) OVER (ORDER BY dtDia) 
       AS qtdeTransacoesAcumulada

FROM tb_sumario_dias;