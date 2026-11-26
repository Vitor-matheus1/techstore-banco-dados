# 🛒 TechStore — Sistema de Gestão Comercial (Banco de Dados)

Banco de dados relacional desenvolvido em **MySQL 8.x** para o controle comercial, financeiro e de estoque da loja **TechStore**, abrangendo modelagem conceitual e lógica, implementação física, carga de dados, consultas analíticas, relatórios gerenciais, *Views* e *Stored Procedures*.

---

## 📋 Identificação do Projeto

| Campo | Informação |
| :--- | :--- |
| **Projeto** | Sistema de Gestão Comercial — TechStore |
| **Autores** | Vitor Matheus Menezes de Araújo ([@Vitor-matheus1](https://github.com/Vitor-matheus1)) e Rafael Constantino ([@Constantino-java](https://github.com/Constantino-java)) |
| **Turma** | 14330 |
| **Banco de Dados** | `techstore` (`utf8mb4` / `utf8mb4_unicode_ci`) |
| **Tecnologias** | MySQL 8.x, MySQL Workbench, Git e GitHub |

---

## 📁 Organização do Repositório e Ordem de Execução

Para evitar erros de dependência entre chaves primárias e estrangeiras, execute os scripts da pasta `banco/` na sequência numerada abaixo:

| Execução | Pasta / Arquivo | Etapa | Descrição Detalhada |
| :---: | :--- | :--- | :--- |
| **1º** | `banco/create_database.sql` | Criação do Banco | Cria o banco de dados `techstore` com suporte completo a caracteres especiais (`utf8mb4`). |
| **2º** | `banco/create_tables.sql` | Implementação Física (DDL) | Cria as 8 tabelas relacionais com chaves primárias (`PK`), chaves estrangeiras (`FK`), restrições `UNIQUE`, `CHECK` e regras `ON DELETE RESTRICT / CASCADE`. |
| **3º** | `banco/inserts.sql` | Carga de Dados (DML) | Insere a massa inicial de dados: 5 categorias, 5 fornecedores, 10 clientes, 5 vendedores, 20 produtos, 30 pedidos, 60 itens de pedido e 30 pagamentos. |
| **4º** | `banco/consultas.sql` | Consultas e Relatórios (DQL) | Executa 10 consultas com filtros (`LIKE`, `BETWEEN`, `IN`, `IS NULL`), junções (`INNER JOIN`, `LEFT JOIN`), agregações (`GROUP BY`, `HAVING`) e 8 relatórios gerenciais. |
| **5º** | `banco/views_procedures.sql` | Automação e Visões | Cria 5 *Views* para consultas consolidadas e 5 *Stored Procedures* para operações parametrizadas. |
| — | `docs/modelo_conceitual.md` | Documentação | Define as 8 entidades do negócio, justificativas e tabela de cardinalidades dos relacionamentos. |
| — | `docs/modelo_logico.md` | Documentação | Apresenta o esquema relacional consolidado e as políticas de integridade referencial. |
| — | `docs/dicionario_de_dados.md` | Documentação | Detalha todos os atributos das 8 tabelas, tipos de dados, obrigatoriedade e restrições. |
| — | `imagens/DER_conceitual.png` | Diagrama | Diagrama Entidade-Relacionamento conceitual preliminar do sistema. |
| — | `imagens/DER.png` | Diagrama | Diagrama Entidade-Relacionamento físico consolidado no MySQL Workbench. |

---

## 🗄️ Estrutura das Tabelas (`techstore`)

| Tabela | Chave Primária (PK) | Chaves Estrangeiras (FK) | Finalidade e Regras de Integridade |
| :--- | :--- | :--- | :--- |
| **`CATEGORIA`** | `id_categoria` | — | Classifica os produtos por segmento. Possui restrição `UNIQUE` em `nome_categoria`. |
| **`FORNECEDOR`** | `id_fornecedor` | — | Registra empresas fornecedoras de hardware e periféricos. Possui `UNIQUE` em `cnpj`. |
| **`CLIENTE`** | `id_cliente` | — | Armazena clientes Pessoa Física e Jurídica (`cpf_cnpj` e `email` únicos). |
| **`VENDEDOR`** | `id_vendedor` | — | Cadastra os colaboradores da equipe comercial (`email` único). |
| **`PRODUTO`** | `id_produto` | `id_categoria`, `id_fornecedor` | Controla catálogo, preço (`CHECK > 0`) e estoque (`CHECK >= 0`). Bloqueia exclusão de categoria/fornecedor vinculado (`RESTRICT`). |
| **`PEDIDO`** | `id_pedido` | `id_cliente`, `id_vendedor` | Centraliza as vendas realizadas, data, status operacional e valor total. |
| **`ITEM_PEDIDO`** | `id_item_pedido` | `id_pedido`, `id_produto` | Resolve o relacionamento N:N entre pedido e produto, registrando quantidade e preço praticado. Exclui itens em cascata se o pedido for removido (`CASCADE`). |
| **`PAGAMENTO`** | `id_pagamento` | `id_pedido` | Controla os acertos financeiros, forma de pagamento (PIX, Cartão Crédito, Boleto, Dinheiro) e status de aprovação. |

---

## 📊 Consultas Analíticas e Relatórios (`consultas.sql`)

| Seção do Script | Recursos SQL Utilizados | O que Entrega |
| :--- | :--- | :--- |
| **Parte 1 — Filtros** | `WHERE`, `LIKE`, `BETWEEN`, `IN`, `IS NULL`, `ORDER BY` | Busca produtos por termo, filtra faixas de preço, lista pedidos pendentes/cancelados e identifica cadastros incompletos. |
| **Parte 2 — Relacionamentos** | `INNER JOIN` (duplo e triplo) e `LEFT JOIN` | Cruza produtos com categorias e fornecedores, detalha pedidos com cliente e vendedor e localiza clientes sem pedidos. |
| **Parte 3 — Agregações** | `COUNT`, `SUM`, `AVG`, `MAX`, `MIN`, `GROUP BY`, `HAVING` | Calcula estatísticas gerais do catálogo, faturamento por vendedor e categorias com receita acima de R$ 10.000,00. |
| **Parte 4 — 8 Relatórios** | `JOIN`, `GROUP BY`, `ORDER BY`, `LIMIT` | Gera relatórios de clientes, produtos, pedidos, pagamentos por modalidade, estoque por categoria, vendas por vendedor, Top 5 produtos e clientes Curva A. |

---

## ⚙️ Views e Stored Procedures (`views_procedures.sql`)

| Tipo | Nome do Objeto | Parâmetros | Função no Banco de Dados |
| :--- | :--- | :--- | :--- |
| **View** | `vw_produtos_categoria` | — | Exibe produtos com suas respectivas categorias, preços e quantidades em estoque. |
| **View** | `vw_pedidos_detalhados` | — | Consolida os dados dos pedidos com os nomes do cliente e do vendedor responsável. |
| **View** | `vw_faturamento_vendedor` | — | Calcula total de pedidos pagos, faturamento total e ticket médio por vendedor. |
| **View** | `vw_top_produtos` | — | Ranqueia os produtos mais vendidos em quantidade e receita gerada. |
| **View** | `vw_resumo_pagamentos` | — | Agrupa transações aprovadas e total arrecadado por forma de pagamento. |
| **Procedure** | `sp_pedidos_por_cliente` | `IN p_id_cliente INT` | Lista o histórico completo de pedidos de um cliente específico. |
| **Procedure** | `sp_faturamento_periodo` | `IN p_data_inicio DATE, IN p_data_fim DATE` | Retorna o faturamento total e a quantidade de pedidos pagos dentro de um período. |
| **Procedure** | `sp_top_produtos` | `IN p_limite INT` | Lista os *N* produtos mais vendidos conforme o limite informado. |
| **Procedure** | `sp_vendas_vendedor` | `IN p_id_vendedor INT` | Exibe todas as vendas pagas realizadas por um vendedor específico. |
| **Procedure** | `sp_atualizar_status_pedido` | `IN p_id_pedido INT, IN p_novo_status VARCHAR(50)` | Atualiza o status operacional de um pedido diretamente pelo seu identificador. |
