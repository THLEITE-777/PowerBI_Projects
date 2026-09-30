# 📊 Dashboard Gerencial para Tomada de Decisões - Power BI

[![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)](https://powerbi.microsoft.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

## 📌 Descrição do Projeto

Este projeto foi desenvolvido como parte do bootcamp/módulo de **Power BI** da [Digital Innovation One (DIO)](https://www.dio.me/), com foco em **Criando um Dashboard Gerencial para Tomada de Decisões**.

O objetivo principal é transformar dados brutos em inteligência de negócios por meio de um painel interativo e visualmente intuitivo. O dashboard foi construído para auxiliar gestores na análise de métricas-chave de desempenho (KPIs), facilitação de insights estratégicos e otimização do processo de tomada de decisão.

---

## 🎯 Objetivos

- **Tratamento e Modelagem de Dados:** Limpeza, transformação (ETL no Power Query) e relacionamento entre tabelas (Star Schema / Snowflake).
- **Criação de Métricas (DAX):** Desenvolvimento de fórmulas customizadas para medição de desempenho, faturamento, custos e margem de lucro.
- **Visualização de Dados:** Construção de visuais dinâmicos (gráficos, cartões, matrizes e mapas) com boa experiência do usuário (UX/UI).
- **Tomada de Decisão:** Permitir filtros por período, região, categoria de produto e vendedor para análise detalhada de resultados.

---

## 🛠️ Tecnologias e Ferramentas Utilizadas

* **Power BI Desktop:** Modelagem, DAX, Power Query e desenvolvimento dos visuais.
* **Power Query:** Extração, transformação e limpeza das bases de dados.
* **DAX (Data Analysis Expressions):** Criação de medidas calculadas e colunas personalizadas.
* **Excel / CSV:** Fonte primária de dados do projeto.

---

## 📐 Estrutura do Projeto e Modelagem

### 1. Processo de ETL (Power Query)
- Removidas colunas desnecessárias e duplicadas.
- Padronização de tipos de dados (Datas, Moeda, Texto, Inteiros).
- Criação da tabela **dCalendario** para análises temporais (*Time Intelligence*).

### 2. Modelagem de Dados (Star Schema)
O modelo foi estruturado em esquema estrela contendo tabelas fato e dimensão:
* **Fato:** `fVendas` (Registros de transações, quantidade, valores).
* **Dimensões:** `dProdutos`, `dClientes`, `dVendedores`, `dRegiao`, `dCalendario`.

---

## 📈 Principais Métricas e Visuais (KPIs)

- **Faturamento Total:** Valor bruto total de vendas.
- **Lucro Total e Margem de Lucro (%):** Rentabilidade das operações.
- **Total de Pedidos e Ticket Médio:** Indicadores do volume e perfil de compra.
- **Análise Temporal:** Evolução das vendas mensais e anuais.
- **Análise Geográfica:** Distribuição de faturamento por região/estado.
- **Top Produtos / Clientes:** Identificação dos itens mais vendidos e melhores clientes.

---


## 💡 Insights e Conclusões

A partir da análise dos visuais gerados, foi possível identificar:
1. **Sazonalidade das Vendas:** Picos de faturamento identificados em trimestres específicos.
2. **Produtos Mais Lucrativos:** Determinado grupo de produtos representa a maior fatia da margem de lucro, permitindo focar esforços de marketing.
3. **Desempenho Regional:** Determinadas regiões apresentam oportunidade de expansão devido à alta taxa de crescimento de novos clientes.

---

## 👤 Autor

Desenvolvido por **Thiago Viana Leite** durante os estudos no bootcamp da DIO.

- **LinkedIn:** [Seu LinkedIn](https://www.linkedin.com/in/seu-perfil)
- **GitHub:** [@THLEITE-777](https://github.com/THLEITE-777)
