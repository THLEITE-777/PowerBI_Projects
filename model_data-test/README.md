# 📊 Projeto de Transforma e Modelagem de Dados - Power BI

## 📌 Visão Geral do Projeto
Este repositório contém a documentação e os artefatos do projeto de Business Intelligence desenvolvido no Power BI. O objetivo principal deste projeto foi realizar o tratamento, limpeza e estruturação dos dados brutos, transformando-os em um modelo dimensional otimizado (Star Schema / Snowflake) para análises de negócios eficientes.

O contexto de execução foi como parte do desafio do módulo 5 do bootcamp "Primeiros Passos com PowerBi" oferecido pela plataforma DIO.

---

## 🛠️ Processo de Transformação de Dados (ETL)

O processo de transformação foi realizado no **Power Query** e no ambiente do **Power BI**, onde os dados brutos foram estruturados nas seguintes tabelas Fato e Dimensão:

### 1. Tabelas Dimensão (Dimensions)
As tabelas dimensão foram criadas e limpas para fornecer contexto às métricas de negócios:
* **`Dim_Produtos`**: Contém detalhes descritivos dos produtos (categorias, subcategorias, custos, preços unitários). Passou por remoção de duplicatas e padronização de textos.
* **`Dim_Clientes`**: Contém informações cadastrais dos clientes. Foram ajustados os tipos de dados e limpos os campos vazios/nulos.
* **`Dim_Lojas` / `Dim_Vendedores`**: Tabelas de apoio para análise geográfica e operacional do desempenho das vendas.

### 2. Tabelas Fato (Facts)
As tabelas fato armazenam os eventos de negócios e os valores mensuráveis (métricas):
* **`Fato_Vendas`**: Registra cada transação efetuada. Contém as chaves estrangeiras (*Foreign Keys*) para conectar com as dimensões, além das métricas numéricas como **Quantidade**, **Valor Total**, **Desconto** e **Custo**.

---

## 📅 Criação e Detalhamento da Tabela Calendário (`dCalendario`)

### **Por que a Tabela Calendário é necessária?**
No Power BI, dependemos de análises temporais robustas (*Time Intelligence*, como YTD, MTD, Same Period Last Year). A utilização de uma tabela calendário dedicada e independente traz diversos benefícios:
1. **Integridade de Datas**: Garante uma sequência contínua de datas sem lacunas (dias sem vendas ou feriados), essencial para o funcionamento correto das funções DAX temporais.
2. **Otimização do Modelo**: Substitui o recurso de "Auto Date/Time" do Power BI, reduzindo consideravelmente o tamanho do arquivo `.pbix`.
3. **Flexibilidade de Análise**: Permite agrupar e filtrar dados por Ano, Mês, Trimestre, Dia da Semana, Ano Fiscal e Semestre de forma padronizada para todas as tabelas fato.

### **Como foi criada?**
A tabela `dCalendario` foi gerada via código **DAX** (ou Power Query) cobrindo todo o intervalo de datas do modelo (da menor data de venda à maior data prevista). 

*(Observação: O código DAX/M utilizado para criar a tabela encontra-se anexado nos arquivos do repositório).*

---

## 🔗 Relacionamento entre as Tabelas

O modelo de dados segue a arquitetura **Star Schema** (Esquema em Estrela), priorizando a performance e a simplicidade na criação de medidas DAX.

![Modelo de Relacionamento](./imagem_relacionamento.png) *(Substitua o caminho da imagem se necessário)*

### **Detalhamento das Conexões:**

* **`dCalendario[Data]` 1 ─── * `Fato_Vendas[Data_Venda]`**
  * **Tipo**: Um para Muitos ($1 : *$) | **Filtro**: Unidirecional.
  * **Por quê?**: Cada data da calendário é única, enquanto a fato pode registrar diversas vendas em um mesmo dia.

* **`Dim_Clientes[ID_Cliente]` 1 ─── * `Fato_Vendas[ID_Cliente]`**
  * **Tipo**: Um para Muitos ($1 : *$) | **Filtro**: Unidirecional.
  * **Por quê?**: Cada cliente possui um único cadastro na dimensão, mas pode realizar múltiplas compras na tabela fato.

* **`Dim_Produtos[ID_Produto]` 1 ─── * `Fato_Vendas[ID_Produto]`**
  * **Tipo**: Um para Muitos ($1 : *$) | **Filtro**: Unidirecional.
  * **Por quê?**: Permite analisar as vendas por categorias, marcas e produtos específicos.

* **Direção do Filtro (Unidirecional):** Mantida de $1 \to *$ para garantir a integridade do contexto de filtro, evitar ambiguidade nos cálculos e otimizar a performance do motor VertiPaq.

---

## 📂 Arquivos Anexados no Repositório

Neste repositório você encontrará:
1. `README.md`: Documentação explicativa do projeto.
2. `projeto_dashboard.pbix`: Arquivo completo do Power BI contendo o modelo de dados e relatórios.
3. `relacionamento_tabelas.png`: Captura de tela do diagrama de modelo de dados.
4. `codigo_tabela_calendario.dax`: Script utilizado para geração automatizada da tabela calendário.
