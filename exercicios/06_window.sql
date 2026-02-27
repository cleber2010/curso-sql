-- Objetivo:
-- Calcular a quantidade de transações por dia
-- e depois calcular o acumulado ao longo do tempo (crescimento diário).

-- 🔹 PASSO 1: Criamos uma CTE para organizar os dados antes de calcular o acumulado.
-- A ideia aqui é simplificar: primeiro resumo diário, depois acumulado.
WITH tb_diario AS (

    SELECT 
        substr(DtCriacao,1,10) AS dtDia,

        -- COUNT(DISTINCT IdTransacao)
        -- Conta quantas transações únicas ocorreram no dia.
        -- DISTINCT evita contagem duplicada caso exista repetição.
        count(DISTINCT IdTransacao) AS qtdeTransacao

    FROM transacoes

    -- GROUP BY dtDia
    -- Agrupa os registros para que cada dia vire
    -- apenas UMA linha no resultado.
    GROUP BY dtDia
)

-- 🔹 PASSO 2: Agora usamos função janela para calcular o acumulado.
SELECT *,

    -- SUM(qtdeTransacao) OVER (ORDER BY dtDia)
    --
    -- Aqui começa a parte mais importante:
    -- A função janela não reduz linhas (como GROUP BY faz),
    -- ela calcula algo "linha a linha".
    --
    -- ORDER BY dtDia define a ordem cronológica.
    -- Isso faz com que o banco some progressivamente:
    --
    -- Dia 1 → valor do dia 1
    -- Dia 2 → dia 1 + dia 2
    -- Dia 3 → dia 1 + dia 2 + dia 3
    --
    -- Isso é chamado de soma acumulada (running total).
    --
    sum(qtdeTransacao) OVER (ORDER BY dtDia) AS qtdeTrasacaoAcum

FROM tb_diario;