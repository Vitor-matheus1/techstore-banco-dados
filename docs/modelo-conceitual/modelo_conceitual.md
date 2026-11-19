# Modelo Conceitual — Projeto TechStore

## 1. Identificação das Entidades

| Entidade | Descrição | Justificativa |
| :--- | :--- | :--- |
| **CLIENTE** | Pessoas físicas ou jurídicas que realizam compras junto à empresa. | Necessária para armazenar os compradores e vinculá-los aos pedidos realizados. |
| **VENDEDOR** | Colaboradores responsáveis por intermediar e efetuar o registro das vendas. | Essencial para associar as vendas aos colaboradores e permitir o acompanhamento de desempenho. |
| **FORNECEDOR** | Empresas parceiras que fornecem os produtos de informática e eletrônicos. | Permite registrar e gerenciar a origem dos produtos adquiridos para revenda. |
| **CATEGORIA** | Classificação e agrupamento dos produtos por segmento. | Garante a organização do catálogo de produtos e facilita buscas e análises. |
| **PRODUTO** | Itens de informática, acessórios e eletrônicos comercializados. | Necessária para controlar os preços, estoque disponível e vínculos com fornecedores. |
| **PEDIDO** | Registro da transação comercial de compra realizada pelo cliente. | Centraliza o histórico das transações de venda, conectando cliente e vendedor. |
| **ITEM_PEDIDO** | Detalhamento dos produtos e quantidades pertencentes a um pedido. | Resolve o relacionamento N:N entre Pedido e Produto, mantendo histórico de preços. |
| **PAGAMENTO** | Registro financeiro relativo ao acerto e quitação do pedido. | Permite o controle financeiro integrado diretamente com cada pedido realizado. |

## 2. Relacionamentos e Cardinalidades

| Relacionamento | Cardinalidade | Descrição |
| :--- | :---: | :--- |
| Fornecedor fornece Produto | `(0, N) : (1, 1)` | Um fornecedor pode fornecer vários produtos (N), mas cada produto é associado a um único fornecedor (1). |
| Categoria classifica Produto | `(0, N) : (1, 1)` | Uma categoria possui vários produtos (N), mas um produto pertence a apenas uma categoria (1). |
| Cliente realiza Pedido | `(0, N) : (1, 1)` | Um cliente pode realizar diversos pedidos (N), mas cada pedido pertence a um único cliente (1). |
| Vendedor atende Pedido | `(0, N) : (1, 1)` | Um vendedor pode atender diversos pedidos (N), mas cada pedido é registrado por apenas um vendedor (1). |
| Pedido possui Item_Pedido | `(1, N) : (1, 1)` | Um pedido pode conter múltiplos itens (N), enquanto cada item pertence a um único pedido (1). |
| Produto compõe Item_Pedido | `(0, N) : (1, 1)` | Um produto pode constar em múltiplos itens de pedidos (N), mas cada item faz referência a apenas um produto (1). |
| Pedido possui Pagamento | `(0, N) : (1, 1)` | Um pedido pode estar associado a zero ou vários pagamentos (N), enquanto cada pagamento refere-se a um único pedido (1). |

## 3. Diagrama Entidade-Relacionamento (DER)

- Versão Conceitual Preliminar: `docs/modelo-conceitual/DER_conceitual.png`
- Versão Física Consolidada: `imagens/DER.png`
