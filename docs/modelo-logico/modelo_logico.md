# Modelo Lógico Revisado — Projeto TechStore

Estrutura relacional consolidada das **8 tabelas** com suas respectivas Chaves Primárias (**PK**) e Chaves Estrangeiras (**FK**):

- **CLIENTE** (`id_cliente` **[PK]**, `nome`, `cpf_cnpj`, `email`, `telefone`, `data_cadastro`)
- **VENDEDOR** (`id_vendedor` **[PK]**, `nome`, `email`, `telefone`, `data_contratacao`)
- **FORNECEDOR** (`id_fornecedor` **[PK]**, `razao_social`, `nome_fantasia`, `cnpj`, `telefone`, `email`)
- **CATEGORIA** (`id_categoria` **[PK]**, `nome_categoria`, `descricao`)
- **PRODUTO** (`id_produto` **[PK]**, `nome_produto`, `descricao`, `preco_unitario`, `quantidade_estoque`, `id_categoria` **[FK]**, `id_fornecedor` **[FK]**)
- **PEDIDO** (`id_pedido` **[PK]**, `data_pedido`, `valor_total`, `status_pedido`, `id_cliente` **[FK]**, `id_vendedor` **[FK]**)
- **ITEM_PEDIDO** (`id_item_pedido` **[PK]**, `quantidade`, `preco_praticado`, `id_pedido` **[FK]**, `id_produto` **[FK]**)
- **PAGAMENTO** (`id_pagamento` **[PK]**, `data_pagamento`, `valor_pago`, `forma_pagamento`, `status_pagamento`, `id_pedido` **[FK]**)

## Regras de Integridade Referencial

- **`ON DELETE RESTRICT` e `ON UPDATE CASCADE`**: Aplicado nas chaves estrangeiras de `PRODUTO` (`id_categoria`, `id_fornecedor`), `PEDIDO` (`id_cliente`, `id_vendedor`) e `ITEM_PEDIDO` (`id_produto`), impedindo a exclusão de registros pai vinculados.
- **`ON DELETE CASCADE` e `ON UPDATE CASCADE`**: Aplicado em `ITEM_PEDIDO(id_pedido)` e `PAGAMENTO(id_pedido)` para manter consistência automática caso um pedido seja removido.
