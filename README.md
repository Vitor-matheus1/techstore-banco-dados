# TechStore — Banco de Dados SQL

Repositório oficial da documentação e dos scripts SQL do **Projeto Didático TechStore**, desenvolvido na **Unidade Curricular 12** (*Executar os Processos de Codificação, Manutenção e Documentação de Aplicativos Computacionais para Desktop*).

## Informações da Equipe

- **Integrantes:** Vitor Matheus Menezes de Araújo e Rafael Constantino
- **Turma:** 14330

## Identificação do Projeto

- **Nome do Projeto:** TechStore (`techstore-banco-dados`)
- **Objetivo do Sistema:** Sistema de gerenciamento de banco de dados relacional para uma loja de suprimentos de informática e eletrônicos, centralizando o controle de clientes, vendedores, fornecedores, categorias, catálogo de produtos, estoque, pedidos, itens vendidos e pagamentos, além de Views e Stored Procedures para apoio à tomada de decisão.

## Tecnologias Utilizadas

- **MySQL 8.x** (Sistema Gerenciador de Banco de Dados Relacional / MySQL Workbench)
- **SQL** (DDL, DML, DQL, Views e Stored Procedures)
- **Git** (Controle de versão local)
- **GitHub** (Hospedagem e versionamento remoto)
- **Visual Studio Code** (Ambiente de edição e publicação Git)

## Estrutura do Repositório

```text
techstore-banco-dados/
├── README.md
├── docs/
│   ├── modelo-conceitual/
│   │   ├── modelo_conceitual.md
│   │   └── DER_conceitual.png
│   ├── modelo-logico/
│   │   └── modelo_logico.md
│   └── dicionario-de-dados/
│       └── dicionario_de_dados.md
├── banco/
│   ├── create_database.sql
│   ├── create_tables.sql
│   ├── inserts.sql
│   ├── consultas.sql
│   └── views_procedures.sql
└── imagens/
    └── DER.png
```

## Estrutura do Banco de Dados

O banco de dados `techstore` é estruturado em **8 tabelas relacionais**:

1. **`CLIENTE`**: Armazena os dados cadastrais de pessoas físicas ou jurídicas que realizam compras (`id_cliente`, `nome`, `cpf_cnpj`, `email`, `telefone`, `data_cadastro`).
2. **`VENDEDOR`**: Registra os colaboradores responsáveis por intermediar e registrar as vendas (`id_vendedor`, `nome`, `email`, `telefone`, `data_contratacao`).
3. **`FORNECEDOR`**: Mantém o cadastro das empresas parceiras distribuidoras de produtos (`id_fornecedor`, `razao_social`, `nome_fantasia`, `cnpj`, `telefone`, `email`).
4. **`CATEGORIA`**: Classifica e agrupa os produtos por segmento de informática (`id_categoria`, `nome_categoria`, `descricao`).
5. **`PRODUTO`**: Controla o catálogo de itens comercializados, preços unitários, estoque e vínculos com categoria e fornecedor (`id_produto`, `nome_produto`, `descricao`, `preco_unitario`, `quantidade_estoque`, `id_categoria`, `id_fornecedor`).
6. **`PEDIDO`**: Centraliza o histórico das transações de compra realizadas, conectando cliente e vendedor (`id_pedido`, `data_pedido`, `valor_total`, `status_pedido`, `id_cliente`, `id_vendedor`).
7. **`ITEM_PEDIDO`**: Tabela associativa que resolve o relacionamento N:N entre `PEDIDO` e `PRODUTO`, detalhando quantidades e preço praticado na venda (`id_item_pedido`, `quantidade`, `preco_praticado`, `id_pedido`, `id_produto`).
8. **`PAGAMENTO`**: Registra os acertos financeiros vinculados aos pedidos, forma de pagamento e status de processamento (`id_pagamento`, `data_pagamento`, `valor_pago`, `forma_pagamento`, `status_pagamento`, `id_pedido`).

## Ordem de Execução dos Scripts SQL

1. `banco/create_database.sql` — Cria e seleciona o banco de dados `techstore`.
2. `banco/create_tables.sql` — Cria as 8 tabelas com chaves primárias, estrangeiras e restrições de integridade.
3. `banco/inserts.sql` — Insere a massa de dados inicial (5 categorias, 5 fornecedores, 10 clientes, 5 vendedores, 20 produtos, 30 pedidos, 62 itens de pedido e 30 pagamentos).
4. `banco/consultas.sql` — Executa filtros (`LIKE`, `BETWEEN`, `IN`, `IS NULL`), junções (`INNER JOIN`, `LEFT JOIN`), agregações (`GROUP BY`, `HAVING`) e os 8 relatórios operacionais e gerenciais.
5. `banco/views_procedures.sql` — Cria as 5 Views e as 5 Stored Procedures da Etapa 4.

eaeeee