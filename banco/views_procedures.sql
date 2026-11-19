-- ============================================================================
-- PROJETO TECHSTORE - VIEWS E STORED PROCEDURES (ETAPA 4)
-- Autores: Vitor Matheus e Rafael Constantino | Turma: 14330
-- SGBD: MySQL 8.x | Database: techstore
-- ============================================================================

USE techstore;

-- ============================================================================
-- PARTE 1: CRIAÇÃO DE VIEWS (5 VISÕES)
-- ============================================================================

-- View 01 - Produtos por Categoria (Visão Operacional)
CREATE OR REPLACE VIEW vw_produtos_categoria AS
SELECT
    c.nome_categoria,
    p.id_produto,
    p.nome_produto,
    p.preco_unitario,
    p.quantidade_estoque
FROM PRODUTO p
INNER JOIN CATEGORIA c ON p.id_categoria = c.id_categoria;

-- View 02 - Pedidos Detalhados (Visão Operacional/Gerencial)
CREATE OR REPLACE VIEW vw_pedidos_detalhados AS
SELECT
    p.id_pedido,
    p.data_pedido,
    c.id_cliente,
    c.nome AS cliente,
    v.nome AS vendedor,
    p.valor_total,
    p.status_pedido
FROM PEDIDO p
INNER JOIN CLIENTE c ON p.id_cliente = c.id_cliente
INNER JOIN VENDEDOR v ON p.id_vendedor = v.id_vendedor;

-- View 03 - Faturamento por Vendedor (Visão Gerencial)
CREATE OR REPLACE VIEW vw_faturamento_vendedor AS
SELECT
    v.nome AS vendedor,
    COUNT(p.id_pedido) AS total_pedidos,
    SUM(p.valor_total) AS faturamento_total,
    AVG(p.valor_total) AS ticket_medio_vendedor
FROM VENDEDOR v
INNER JOIN PEDIDO p ON v.id_vendedor = p.id_vendedor
WHERE p.status_pedido = 'Pago'
GROUP BY v.id_vendedor, v.nome;

-- View 04 - Top Produtos Mais Vendidos (Visão Analítica)
CREATE OR REPLACE VIEW vw_top_produtos AS
SELECT
    p.id_produto,
    p.nome_produto,
    SUM(ip.quantidade) AS quantidade_vendida,
    SUM(ip.quantidade * ip.preco_praticado) AS receita_total
FROM ITEM_PEDIDO ip
INNER JOIN PRODUTO p ON ip.id_produto = p.id_produto
INNER JOIN PEDIDO ped ON ip.id_pedido = ped.id_pedido
WHERE ped.status_pedido = 'Pago'
GROUP BY p.id_produto, p.nome_produto
ORDER BY quantidade_vendida DESC;

-- View 05 - Resumo Financeiro de Pagamentos (Visão Gerencial)
CREATE OR REPLACE VIEW vw_resumo_pagamentos AS
SELECT
    forma_pagamento,
    COUNT(id_pagamento) AS qtd_transacoes,
    SUM(valor_pago) AS total_arrecadado
FROM PAGAMENTO
WHERE status_pagamento = 'Aprovado'
GROUP BY forma_pagamento;

-- ============================================================================
-- PARTE 2: CRIAÇÃO DE STORED PROCEDURES (5 PROCEDIMENTOS)
-- ============================================================================

DELIMITER //

-- Procedure 01 - Consultar Histórico de Pedidos de um Cliente
DROP PROCEDURE IF EXISTS sp_pedidos_por_cliente //
CREATE PROCEDURE sp_pedidos_por_cliente(IN p_id_cliente INT)
BEGIN
    SELECT id_pedido, data_pedido, valor_total, status_pedido
    FROM vw_pedidos_detalhados
    WHERE id_cliente = p_id_cliente;
END //

-- Procedure 02 - Consultar Faturamento em um Período Específico
DROP PROCEDURE IF EXISTS sp_faturamento_periodo //
CREATE PROCEDURE sp_faturamento_periodo(IN p_data_inicio DATE, IN p_data_fim DATE)
BEGIN
    SELECT
        SUM(valor_total) AS faturamento_periodo,
        COUNT(id_pedido) AS total_pedidos
    FROM PEDIDO
    WHERE status_pedido = 'Pago'
      AND DATE(data_pedido) BETWEEN p_data_inicio AND p_data_fim;
END //

-- Procedure 03 - Listar os N Produtos Mais Vendidos
DROP PROCEDURE IF EXISTS sp_top_produtos //
CREATE PROCEDURE sp_top_produtos(IN p_limite INT)
BEGIN
    SELECT nome_produto, quantidade_vendida, receita_total
    FROM vw_top_produtos
    LIMIT p_limite;
END //

-- Procedure 04 - Desempenho Detalhado do Vendedor
DROP PROCEDURE IF EXISTS sp_vendas_vendedor //
CREATE PROCEDURE sp_vendas_vendedor(IN p_id_vendedor INT)
BEGIN
    SELECT p.id_pedido, p.data_pedido, c.nome AS cliente, p.valor_total
    FROM PEDIDO p
    INNER JOIN CLIENTE c ON p.id_cliente = c.id_cliente
    WHERE p.id_vendedor = p_id_vendedor AND p.status_pedido = 'Pago'
    ORDER BY p.data_pedido DESC;
END //

-- Procedure 05 - Atualizar Status do Pedido
DROP PROCEDURE IF EXISTS sp_atualizar_status_pedido //
CREATE PROCEDURE sp_atualizar_status_pedido(IN p_id_pedido INT, IN p_novo_status VARCHAR(50))
BEGIN
    UPDATE PEDIDO
    SET status_pedido = p_novo_status
    WHERE id_pedido = p_id_pedido;
END //

DELIMITER ;
