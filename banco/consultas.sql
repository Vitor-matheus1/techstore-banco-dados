-- ============================================================================
-- PROJETO TECHSTORE - CONSULTAS SQL E RELATÓRIOS GERENCIAIS (DQL)
-- Autores: Vitor Matheus e Rafael Constantino | Turma: 14330
-- SGBD: MySQL 8.x | Database: techstore
-- ============================================================================

USE techstore;

-- ============================================================================
-- PARTE 1: CONSULTAS BÁSICAS E FILTROS
-- ============================================================================

-- Consulta 01 - Filtro por Padrão de Texto (LIKE)
SELECT id_produto, nome_produto, preco_unitario, quantidade_estoque
FROM PRODUTO
WHERE nome_produto LIKE '%Logitech%' OR nome_produto LIKE '%Gamer%'
ORDER BY preco_unitario DESC;

-- Consulta 02 - Filtro por Intervalo de Valores (BETWEEN)
SELECT id_produto, nome_produto, preco_unitario
FROM PRODUTO
WHERE preco_unitario BETWEEN 300.00 AND 1500.00
ORDER BY preco_unitario ASC;

-- Consulta 03 - Filtro por Conjunto de Valores (IN)
SELECT id_pedido, data_pedido, valor_total, status_pedido, id_cliente
FROM PEDIDO
WHERE status_pedido IN ('Aguardando', 'Cancelado')
ORDER BY data_pedido DESC;

-- Consulta 04 - Identificação de Valores Opcionais / Ausentes (IS NULL)
SELECT id_fornecedor, razao_social, nome_fantasia, cnpj, telefone, email
FROM FORNECEDOR
WHERE email IS NULL OR telefone IS NULL;

-- ============================================================================
-- PARTE 2: CONSULTAS COM RELACIONAMENTOS (JOINS)
-- ============================================================================

-- Consulta 01 - Produtos com Categorias e Fornecedores (INNER JOIN Triplo)
SELECT
    p.id_produto,
    p.nome_produto,
    c.nome_categoria,
    f.razao_social AS fornecedor,
    p.preco_unitario
FROM PRODUTO p
INNER JOIN CATEGORIA c ON p.id_categoria = c.id_categoria
INNER JOIN FORNECEDOR f ON p.id_fornecedor = f.id_fornecedor
ORDER BY c.nome_categoria, p.nome_produto;

-- Consulta 02 - Pedidos Detalhados com Cliente e Vendedor (INNER JOIN)
SELECT
    p.id_pedido,
    p.data_pedido,
    cli.nome AS cliente,
    v.nome AS vendedor,
    p.valor_total,
    p.status_pedido
FROM PEDIDO p
INNER JOIN CLIENTE cli ON p.id_cliente = cli.id_cliente
INNER JOIN VENDEDOR v ON p.id_vendedor = v.id_vendedor
ORDER BY p.id_pedido ASC;

-- Consulta 03 - Identificação de Clientes sem Pedidos (LEFT JOIN)
SELECT
    c.id_cliente,
    c.nome,
    c.email,
    p.id_pedido,
    p.data_pedido
FROM CLIENTE c
LEFT JOIN PEDIDO p ON c.id_cliente = p.id_cliente
WHERE p.id_pedido IS NULL;

-- ============================================================================
-- PARTE 3: CONSULTAS COM AGREGAÇÃO E AGRUPAMENTO
-- ============================================================================

-- Consulta 01 - Estatísticas Gerais do Catálogo de Produtos (Agregação Global)
SELECT
    COUNT(id_produto) AS total_produtos,
    AVG(preco_unitario) AS preco_medio,
    MAX(preco_unitario) AS maior_preco,
    MIN(preco_unitario) AS menor_preco,
    SUM(quantidade_estoque) AS estoque_total
FROM PRODUTO;

-- Consulta 02 - Total de Vendas e Faturamento por Vendedor (GROUP BY)
SELECT
    v.id_vendedor,
    v.nome AS vendedor,
    COUNT(p.id_pedido) AS quantidade_pedidos,
    SUM(p.valor_total) AS total_faturado,
    AVG(p.valor_total) AS ticket_medio_vendedor
FROM VENDEDOR v
INNER JOIN PEDIDO p ON v.id_vendedor = p.id_vendedor
WHERE p.status_pedido = 'Pago'
GROUP BY v.id_vendedor, v.nome
ORDER BY total_faturado DESC;

-- Consulta 03 - Categorias com Faturamento Superior a R$ 10.000,00 (HAVING)
SELECT
    c.nome_categoria,
    COUNT(DISTINCT p.id_pedido) AS quantidade_pedidos,
    SUM(ip.quantidade * ip.preco_praticado) AS faturamento_categoria
FROM CATEGORIA c
INNER JOIN PRODUTO prod ON c.id_categoria = prod.id_categoria
INNER JOIN ITEM_PEDIDO ip ON prod.id_produto = ip.id_produto
INNER JOIN PEDIDO p ON ip.id_pedido = p.id_pedido
WHERE p.status_pedido = 'Pago'
GROUP BY c.id_categoria, c.nome_categoria
HAVING faturamento_categoria > 10000.00
ORDER BY faturamento_categoria DESC;

-- ============================================================================
-- PARTE 4: RELATÓRIOS SQL OPERACIONAIS E GERENCIAIS (8 RELATÓRIOS)
-- ============================================================================

-- Relatório 01 - Clientes Cadastrados
SELECT
    id_cliente,
    nome,
    cpf_cnpj,
    email,
    telefone,
    data_cadastro
FROM CLIENTE
ORDER BY data_cadastro ASC;

-- Relatório 02 - Produtos Cadastrados
SELECT
    p.id_produto,
    p.nome_produto,
    c.nome_categoria,
    p.preco_unitario,
    p.quantidade_estoque
FROM PRODUTO p
INNER JOIN CATEGORIA c ON p.id_categoria = c.id_categoria
ORDER BY p.nome_produto ASC;

-- Relatório 03 - Pedidos Realizados
SELECT
    p.id_pedido,
    p.data_pedido,
    c.nome AS cliente,
    v.nome AS vendedor,
    p.valor_total,
    p.status_pedido
FROM PEDIDO p
INNER JOIN CLIENTE c ON p.id_cliente = c.id_cliente
INNER JOIN VENDEDOR v ON p.id_vendedor = v.id_vendedor
ORDER BY p.data_pedido DESC;

-- Relatório 04 - Pagamentos Efetuados
SELECT
    forma_pagamento,
    COUNT(id_pagamento) AS quantidade_transacoes,
    SUM(valor_pago) AS total_arrecadado,
    AVG(valor_pago) AS valor_medio_transacao
FROM PAGAMENTO
WHERE status_pagamento = 'Aprovado'
GROUP BY forma_pagamento
ORDER BY total_arrecadado DESC;

-- Relatório 05 - Produtos por Categoria
SELECT
    c.nome_categoria,
    COUNT(p.id_produto) AS qtd_produtos_distintos,
    SUM(p.quantidade_estoque) AS total_itens_estoque,
    SUM(p.quantidade_estoque * p.preco_unitario) AS valor_total_estoque
FROM CATEGORIA c
LEFT JOIN PRODUTO p ON c.id_categoria = p.id_categoria
GROUP BY c.id_categoria, c.nome_categoria
ORDER BY valor_total_estoque DESC;

-- Relatório 06 - Vendas por Vendedor
SELECT
    v.nome AS vendedor,
    COUNT(p.id_pedido) AS total_pedidos_fechados,
    SUM(p.valor_total) AS faturamento_total,
    AVG(p.valor_total) AS ticket_medio
FROM VENDEDOR v
INNER JOIN PEDIDO p ON v.id_vendedor = p.id_vendedor
WHERE p.status_pedido = 'Pago'
GROUP BY v.id_vendedor, v.nome
ORDER BY faturamento_total DESC;

-- Relatório 07 - Produtos Mais Vendidos (Top 5 Produtos)
SELECT
    p.id_produto,
    p.nome_produto,
    c.nome_categoria,
    SUM(ip.quantidade) AS quantidade_total_vendida,
    SUM(ip.quantidade * ip.preco_praticado) AS receita_gerada
FROM ITEM_PEDIDO ip
INNER JOIN PRODUTO p ON ip.id_produto = p.id_produto
INNER JOIN CATEGORIA c ON p.id_categoria = c.id_categoria
INNER JOIN PEDIDO ped ON ip.id_pedido = ped.id_pedido
WHERE ped.status_pedido = 'Pago'
GROUP BY p.id_produto, p.nome_produto, c.nome_categoria
ORDER BY quantidade_total_vendida DESC
LIMIT 5;

-- Relatório 08 - Clientes com Maior Volume de Compras (Curva A)
SELECT
    c.id_cliente,
    c.nome AS cliente,
    c.cpf_cnpj,
    COUNT(p.id_pedido) AS total_pedidos,
    SUM(p.valor_total) AS total_gasto
FROM CLIENTE c
INNER JOIN PEDIDO p ON c.id_cliente = p.id_cliente
WHERE p.status_pedido = 'Pago'
GROUP BY c.id_cliente, c.nome, c.cpf_cnpj
ORDER BY total_gasto DESC
LIMIT 5;
