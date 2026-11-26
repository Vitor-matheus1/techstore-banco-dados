# 🛒 TechStore — Sistema de Gestão Comercial (Banco de Dados)

Projeto de Banco de Dados Relacional desenvolvido em **MySQL 8.x** para o gerenciamento comercial da loja **TechStore**, contemplando modelagem, criação da estrutura física, carga de dados, consultas analíticas e relatórios gerenciais.

---

## 👥 Autores e Turma
* **Vitor Matheus Menezes de Araújo** ([@Vitor-matheus1](https://github.com/Vitor-matheus1))
* **Rafael Constantino** ([@Constantino-java](https://github.com/Constantino-java))
* **Turma:** 14330 | **Ano:** 2026

---

## 📁 Estrutura do Repositório
* **`banco/`** — Scripts SQL completos (criação das tabelas DDL, carga de dados DML, consultas com filtros, junções, agregações e relatórios).
* **`docs/`** — Documentação técnica das etapas, regras de negócio, guias e checklists de validação.
* **`imagens/`** — Diagramas Entidade-Relacionamento (DER) e evidências de execução no MySQL Workbench.
* **`README.md`** — Apresentação e documentação geral do projeto.

---

## 🗄️ Estrutura do Banco de Dados (`techstore`)
O banco de dados relacional é composto por **8 tabelas** integradas por chaves primárias e estrangeiras:
1. **`CATEGORIA`** — Classificação dos produtos comercializados.
2. **`FORNECEDOR`** — Cadastro de empresas fornecedoras de hardware e periféricos.
3. **`CLIENTE`** — Registro de clientes Pessoa Física e Pessoa Jurídica.
4. **`VENDEDOR`** — Equipe comercial responsável pelos atendimentos.
5. **`PRODUTO`** — Catálogo de itens, preços unitários e controle de estoque.
6. **`PEDIDO`** — Cabeçalho das vendas realizadas, status e valores totais.
7. **`ITEM_PEDIDO`** — Detalhamento dos produtos, quantidades e preços praticados em cada pedido.
8. **`PAGAMENTO`** — Controle financeiro, formas de pagamento e status de aprovação.

---

## 🚀 Etapas Desenvolvidas
* **Entrega 1 — Modelagem Conceitual:** Análise de requisitos, definição de regras de negócio e Diagrama Entidade-Relacionamento (DER).
* **Entrega 2 — Implementação Física (DDL):** Criação do banco `techstore`, tabelas, restrições e integridade referencial (`PRIMARY KEY` e `FOREIGN KEY`).
* **Entrega 3 — Consultas e Relatórios (DML / DQL):**
  * População completa das tabelas (categorias, fornecedores, clientes, vendedores, produtos, pedidos, itens de pedido e pagamentos).
  * Consultas com filtros (`LIKE`, `BETWEEN`, `IN`, `IS NULL`), relacionamentos (`INNER JOIN`, `LEFT JOIN`) e agregações (`COUNT`, `SUM`, `AVG`, `MAX`, `MIN`, `GROUP BY`, `HAVING`).
  * **8 Relatórios Operacionais e Gerenciais** (clientes cadastrados, produtos, pedidos, pagamentos por forma, estoque por categoria, vendas por vendedor, top 5 produtos mais vendidos e ranking de clientes).

---

## 🛠️ Tecnologias Utilizadas
* **SGBD:** MySQL 8.x
* **Ferramenta:** MySQL Workbench
* **Versionamento:** Git & GitHub
