# Dicionário de Dados Completo — Projeto TechStore

## Tabela: `CLIENTE`
| Nome do campo | Descrição | Tipo de dado | Obrigatório | Observações |
| :--- | :--- | :--- | :---: | :--- |
| `id_cliente` | Identificador único do cliente. | `INT UNSIGNED` | Sim | PK, `AUTO_INCREMENT` |
| `nome` | Nome completo ou razão social do cliente. | `VARCHAR(100)` | Sim | — |
| `cpf_cnpj` | Documento fiscal de identificação. | `VARCHAR(18)` | Sim | `UNIQUE` |
| `email` | Endereço eletrônico do cliente. | `VARCHAR(100)` | Sim | `UNIQUE` |
| `telefone` | Telefone de contato com DDD. | `VARCHAR(20)` | Não | — |
| `data_cadastro` | Data de registro do cliente. | `DATE` | Sim | `DEFAULT (CURRENT_DATE)` |

## Tabela: `VENDEDOR`
| Nome do campo | Descrição | Tipo de dado | Obrigatório | Observações |
| :--- | :--- | :--- | :---: | :--- |
| `id_vendedor` | Identificador único do vendedor. | `INT UNSIGNED` | Sim | PK, `AUTO_INCREMENT` |
| `nome` | Nome completo do colaborador. | `VARCHAR(100)` | Sim | — |
| `email` | E-mail corporativo do vendedor. | `VARCHAR(100)` | Sim | `UNIQUE` |
| `telefone` | Telefone corporativo com DDD. | `VARCHAR(20)` | Não | — |
| `data_contratacao` | Data de contratação do colaborador. | `DATE` | Sim | `DEFAULT (CURRENT_DATE)` |

## Tabela: `FORNECEDOR`
| Nome do campo | Descrição | Tipo de dado | Obrigatório | Observações |
| :--- | :--- | :--- | :---: | :--- |
| `id_fornecedor` | Identificador único do fornecedor. | `INT UNSIGNED` | Sim | PK, `AUTO_INCREMENT` |
| `razao_social` | Razão social da empresa fornecedora. | `VARCHAR(120)` | Sim | — |
| `nome_fantasia` | Nome comercial / fantasia. | `VARCHAR(100)` | Não | — |
| `cnpj` | Documento CNPJ do fornecedor. | `VARCHAR(18)` | Sim | `UNIQUE` |
| `telefone` | Telefone comercial de contato. | `VARCHAR(20)` | Não | — |
| `email` | E-mail comercial do fornecedor. | `VARCHAR(100)` | Não | — |

## Tabela: `CATEGORIA`
| Nome do campo | Descrição | Tipo de dado | Obrigatório | Observações |
| :--- | :--- | :--- | :---: | :--- |
| `id_categoria` | Identificador único da categoria. | `INT UNSIGNED` | Sim | PK, `AUTO_INCREMENT` |
| `nome_categoria` | Nome do segmento de produtos. | `VARCHAR(50)` | Sim | `UNIQUE` |
| `descricao` | Descrição detalhada da categoria. | `TEXT` | Não | — |

## Tabela: `PRODUTO`
| Nome do campo | Descrição | Tipo de dado | Obrigatório | Observações |
| :--- | :--- | :--- | :---: | :--- |
| `id_produto` | Identificador único do produto. | `INT UNSIGNED` | Sim | PK, `AUTO_INCREMENT` |
| `nome_produto` | Título comercial do produto. | `VARCHAR(150)` | Sim | — |
| `descricao` | Especificações técnicas do produto. | `TEXT` | Não | — |
| `preco_unitario` | Preço de venda atual. | `DECIMAL(10,2)` | Sim | `CHECK (preco_unitario > 0)` |
| `quantidade_estoque` | Unidades físicas em estoque. | `INT` | Sim | `DEFAULT 0`, `CHECK (>= 0)` |
| `id_categoria` | Referência à categoria associada. | `INT UNSIGNED` | Sim | FK -> `CATEGORIA(id_categoria)` |
| `id_fornecedor` | Referência ao fornecedor de origem. | `INT UNSIGNED` | Sim | FK -> `FORNECEDOR(id_fornecedor)` |

## Tabela: `PEDIDO`
| Nome do campo | Descrição | Tipo de dado | Obrigatório | Observações |
| :--- | :--- | :--- | :---: | :--- |
| `id_pedido` | Identificador único do pedido. | `INT UNSIGNED` | Sim | PK, `AUTO_INCREMENT` |
| `data_pedido` | Data e hora do registro da venda. | `DATETIME` | Sim | `DEFAULT CURRENT_TIMESTAMP` |
| `valor_total` | Valor total acumulado do pedido. | `DECIMAL(10,2)` | Sim | `DEFAULT 0.00` |
| `status_pedido` | Situação operacional da venda. | `VARCHAR(30)` | Sim | `DEFAULT 'Aguardando'` |
| `id_cliente` | Referência ao cliente comprador. | `INT UNSIGNED` | Sim | FK -> `CLIENTE(id_cliente)` |
| `id_vendedor` | Referência ao vendedor responsável. | `INT UNSIGNED` | Sim | FK -> `VENDEDOR(id_vendedor)` |

## Tabela: `ITEM_PEDIDO`
| Nome do campo | Descrição | Tipo de dado | Obrigatório | Observações |
| :--- | :--- | :--- | :---: | :--- |
| `id_item_pedido` | Identificador único do item. | `INT UNSIGNED` | Sim | PK, `AUTO_INCREMENT` |
| `quantidade` | Quantidade de unidades vendidas. | `INT` | Sim | `CHECK (quantidade > 0)` |
| `preco_praticado` | Preço unitário praticado na venda. | `DECIMAL(10,2)` | Sim | `CHECK (preco_praticado > 0)` |
| `id_pedido` | Referência ao pedido pertencente. | `INT UNSIGNED` | Sim | FK -> `PEDIDO(id_pedido)` |
| `id_produto` | Referência ao produto vendido. | `INT UNSIGNED` | Sim | FK -> `PRODUTO(id_produto)` |

## Tabela: `PAGAMENTO`
| Nome do campo | Descrição | Tipo de dado | Obrigatório | Observações |
| :--- | :--- | :--- | :---: | :--- |
| `id_pagamento` | Identificador único do pagamento. | `INT UNSIGNED` | Sim | PK, `AUTO_INCREMENT` |
| `data_pagamento` | Data e hora do acerto financeiro. | `DATETIME` | Sim | `DEFAULT CURRENT_TIMESTAMP` |
| `valor_pago` | Montante pago pelo cliente. | `DECIMAL(10,2)` | Sim | `CHECK (valor_pago > 0)` |
| `forma_pagamento` | Forma de pagamento utilizada. | `VARCHAR(30)` | Sim | PIX, Cartão Crédito, Boleto, Dinheiro |
| `status_pagamento` | Situação do processamento. | `VARCHAR(30)` | Sim | `DEFAULT 'Pendente'` |
| `id_pedido` | Referência ao pedido quitado. | `INT UNSIGNED` | Sim | FK -> `PEDIDO(id_pedido)` |
