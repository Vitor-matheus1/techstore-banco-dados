-- ============================================================================
-- PROJETO TECHSTORE - SCRIPT DE IMPLEMENTAÇÃO FÍSICA (DDL REVISADO)
-- Autores: Vitor Matheus e Rafael Constantino | Turma: 14330
-- SGBD: MySQL 8.x | Ferramenta: MySQL Workbench
-- ============================================================================

USE techstore;

-- 1. TABELA CATEGORIA
CREATE TABLE CATEGORIA (
    id_categoria INT UNSIGNED AUTO_INCREMENT,
    nome_categoria VARCHAR(50) NOT NULL,
    descricao TEXT,
    CONSTRAINT pk_categoria PRIMARY KEY (id_categoria),
    CONSTRAINT uq_nome_categoria UNIQUE (nome_categoria)
);

-- 2. TABELA FORNECEDOR
CREATE TABLE FORNECEDOR (
    id_fornecedor INT UNSIGNED AUTO_INCREMENT,
    razao_social VARCHAR(120) NOT NULL,
    nome_fantasia VARCHAR(100),
    cnpj VARCHAR(18) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    CONSTRAINT pk_fornecedor PRIMARY KEY (id_fornecedor),
    CONSTRAINT uq_fornecedor_cnpj UNIQUE (cnpj)
);

-- 3. TABELA CLIENTE
CREATE TABLE CLIENTE (
    id_cliente INT UNSIGNED AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf_cnpj VARCHAR(18) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    data_cadastro DATE NOT NULL DEFAULT (CURRENT_DATE),
    CONSTRAINT pk_cliente PRIMARY KEY (id_cliente),
    CONSTRAINT uq_cliente_cpf_cnpj UNIQUE (cpf_cnpj),
    CONSTRAINT uq_cliente_email UNIQUE (email)
);

-- 4. TABELA VENDEDOR
CREATE TABLE VENDEDOR (
    id_vendedor INT UNSIGNED AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    data_contratacao DATE NOT NULL DEFAULT (CURRENT_DATE),
    CONSTRAINT pk_vendedor PRIMARY KEY (id_vendedor),
    CONSTRAINT uq_vendedor_email UNIQUE (email)
);

-- 5. TABELA PRODUTO
CREATE TABLE PRODUTO (
    id_produto INT UNSIGNED AUTO_INCREMENT,
    nome_produto VARCHAR(150) NOT NULL,
    descricao TEXT,
    preco_unitario DECIMAL(10,2) NOT NULL,
    quantidade_estoque INT NOT NULL DEFAULT 0,
    id_categoria INT UNSIGNED NOT NULL,
    id_fornecedor INT UNSIGNED NOT NULL,
    CONSTRAINT pk_produto PRIMARY KEY (id_produto),
    CONSTRAINT chk_preco_positivo CHECK (preco_unitario > 0),
    CONSTRAINT chk_estoque_nao_negativo CHECK (quantidade_estoque >= 0),
    CONSTRAINT fk_produto_categoria FOREIGN KEY (id_categoria)
        REFERENCES CATEGORIA(id_categoria)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_produto_fornecedor FOREIGN KEY (id_fornecedor)
        REFERENCES FORNECEDOR(id_fornecedor)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- 6. TABELA PEDIDO
CREATE TABLE PEDIDO (
    id_pedido INT UNSIGNED AUTO_INCREMENT,
    data_pedido DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    valor_total DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    status_pedido VARCHAR(30) NOT NULL DEFAULT 'Aguardando',
    id_cliente INT UNSIGNED NOT NULL,
    id_vendedor INT UNSIGNED NOT NULL,
    CONSTRAINT pk_pedido PRIMARY KEY (id_pedido),
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (id_cliente)
        REFERENCES CLIENTE(id_cliente)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_pedido_vendedor FOREIGN KEY (id_vendedor)
        REFERENCES VENDEDOR(id_vendedor)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- 7. TABELA ITEM_PEDIDO
CREATE TABLE ITEM_PEDIDO (
    id_item_pedido INT UNSIGNED AUTO_INCREMENT,
    quantidade INT NOT NULL,
    preco_praticado DECIMAL(10,2) NOT NULL,
    id_pedido INT UNSIGNED NOT NULL,
    id_produto INT UNSIGNED NOT NULL,
    CONSTRAINT pk_item_pedido PRIMARY KEY (id_item_pedido),
    CONSTRAINT uq_item_pedido_produto UNIQUE (id_pedido, id_produto),
    CONSTRAINT chk_quantidade_positiva CHECK (quantidade > 0),
    CONSTRAINT chk_preco_praticado_positivo CHECK (preco_praticado > 0),
    CONSTRAINT fk_item_pedido_pedido FOREIGN KEY (id_pedido)
        REFERENCES PEDIDO(id_pedido)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_item_pedido_produto FOREIGN KEY (id_produto)
        REFERENCES PRODUTO(id_produto)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- 8. TABELA PAGAMENTO
CREATE TABLE PAGAMENTO (
    id_pagamento INT UNSIGNED AUTO_INCREMENT,
    data_pagamento DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    valor_pago DECIMAL(10,2) NOT NULL,
    forma_pagamento VARCHAR(30) NOT NULL,
    status_pagamento VARCHAR(30) NOT NULL DEFAULT 'Pendente',
    id_pedido INT UNSIGNED NOT NULL,
    CONSTRAINT pk_pagamento PRIMARY KEY (id_pagamento),
    CONSTRAINT chk_valor_pago_positivo CHECK (valor_pago > 0),
    CONSTRAINT fk_pagamento_pedido FOREIGN KEY (id_pedido)
        REFERENCES PEDIDO(id_pedido)
        ON DELETE CASCADE ON UPDATE CASCADE
);
