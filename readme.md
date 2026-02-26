# ETL - Feature Store (SQLite + Pandas)

Projeto de prática de SQL + ETL: gera uma **feature store por cliente** (`feature_store_cliente`) a partir das tabelas de clientes, transações e produtos em um banco SQLite.

## Créditos (importante)
Este repositório foi construído como estudo/prática com base no curso de SQL do **Téo Me Why (Téo Calvo)** e utiliza o dataset público **TeoMeWhy Loyalty System** disponibilizado no Kaggle.  
- Curso/playlist: Téo Me Why — *Aprenda SQL - Primeiras Magias na Linguagem dos Dados* :contentReference[oaicite:0]{index=0}  
- Dataset: *TeoMeWhy Loyalty System* (Kaggle / teocalvo) :contentReference[oaicite:1]{index=1}

## Como funciona

- `etl_projeto.sql`: query principal (parametrizada por `{date}` como data de referência).
- `etl.py`: executa a query para várias datas e grava o resultado na tabela `feature_store_cliente`.

## Pré-requisitos

- Python 3.10+
- SQLite 3.25+ (para `ROW_NUMBER()` / window functions)
- Dados em CSV (do Kaggle) e um banco `database.db` (gerado localmente)

## Setup

```bash
python -m venv .venv
# Windows:
.venv\Scripts\activate
# Linux/Mac:
source .venv/bin/activate

pip install -r requirements.txt