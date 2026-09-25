# Integrando Dados com Azure SQL e Power BI

## Objetivo

Projeto desenvolvido com o objetivo de criar uma base de dados em nuvem utilizando Azure SQL Database, realizar a integração com Power BI e aplicar transformações de dados utilizando Power Query.

---

## Arquitetura da Solução

Azure SQL Database
↓
Tabelas Relacionais
↓
Power Query
↓
Modelagem de Dados
↓
Dashboard Power BI

---

## Tecnologias Utilizadas

- Azure SQL Database
- SQL Server
- Microsoft Power BI Desktop
- Power Query
- GitHub

---

## Banco de Dados

Foram criadas as seguintes tabelas:

- employee
- departament
- dependent
- dept_locations
- project
- works_on

Relacionamentos implementados:

- Employee → Employee (Supervisor)
- Employee → Dependent
- Employee → Works_on
- Project → Works_on
- Departament → Project
- Departament → Dept_locations

---

## Conexão com Azure

Foi criada uma instância de Azure SQL Database.

Principais etapas:

- Criação do servidor SQL no Azure
- Configuração de autenticação
- Configuração de firewall
- Criação das tabelas
- Carga dos dados
- Integração com Power BI

---

## Transformações no Power Query

### Endereço

A coluna Address foi dividida em:

- Número
- Rua
- Cidade
- Estado

### Nome Completo

As colunas:

- Fname
- Lname

foram mescladas gerando:

- NomeCompleto

### Colaborador + Departamento

Foi realizada a junção entre:

employee.Dno
e
departament.Dnumber

---

### Colaborador + Gerente

Foi realizada autojunção da tabela employee utilizando:

employee.Super_ssn
e
employee.Ssn

---

### Departamento + Localização

Foi realizada a junção entre:

departament
e
dept_locations

Criando combinações únicas:

- Research - Houston
- Research - Bellaire
- Research - Sugarland
- Administration - Stafford

---

### Agrupamento por Gerente

Foi criada uma visão agregada contendo a quantidade de colaboradores subordinados a cada gerente.

---

## Dashboard

O dashboard apresenta:

- Média salarial
- Faixa salarial
- Média de idade
- Faixa etária
- Funcionários por sexo
- Funcionários por departamento
- Funcionários por gerente
- Dependentes por tipo
- Horas trabalhadas por projeto
- Distribuição geográfica dos funcionários
- Distribuição geográfica dos projetos

---

## Evidências

### Banco Azure

imagens/banco-azure.png

### Modelo de Dados

imagens/modelo-powerbi.png

### Transformações no Power Query

imagens/power-query.png

### Dashboard Final

imagens/dashboard-final.png

---

## Aprendizados

Durante o desenvolvimento deste projeto foram aplicados conceitos de:

- Modelagem Relacional
- SQL
- Azure SQL Database
- Power Query
- ETL
- Modelagem de Dados
- Power BI
- Dashboards Analíticos

---
