-- ============================================================================
-- PROJETO TECHSTORE - SCRIPT DE CARGA DE DADOS (DML)
-- Autores: Vitor Matheus e Rafael Constantino | Turma: 14330
-- SGBD: MySQL 8.x | Database: techstore
-- ============================================================================

USE techstore;

-- 1. CARGA DA TABELA CATEGORIA
INSERT INTO CATEGORIA (nome_categoria, descricao) VALUES
('Laptops e Notebooks', 'Computadores portáteis, ultrabooks e notebooks gamers'),
('Periféricos e Acessórios', 'Teclados, mouses, headsets, webcams e acessórios em geral'),
('Componentes de Hardware', 'Processadores, placas de vídeo, memórias RAM, SSDs e fontes'),
('Monitores e Telas', 'Monitores LED, IPS, gamers com alta taxa de atualização'),
('Redes e Conectividade', 'Roteadores, switches, cabos de rede e adaptadores Wi-Fi');

-- 2. CARGA DA TABELA FORNECEDOR
INSERT INTO FORNECEDOR (razao_social, nome_fantasia, cnpj, telefone, email) VALUES
('TechDistribuidores S.A.', 'TechDistrib', '12.345.678/0001-90', '(51) 3333-1000', 'vendas@techdistrib.com.br'),
('HardwareBrasil Importadora Ltda', 'HardwareBR', '98.765.432/0001-10', '(11) 4004-2000', 'contato@hardwarebr.com.br'),
('MegaByte Logística e Comércio', 'MegaByte', '45.678.912/0001-34', '(41) 3222-5500', 'comercial@megabyte.com.br'),
('ConectaTech Suprimentos de TI', 'ConectaTech', '23.890.123/0001-56', '(51) 3012-8800', 'atendimento@conectatech.com'),
('GlobalChip Eletrônicos Import', 'GlobalChip', '67.123.456/0001-78', '(11) 3888-9900', 'suporte@globalchip.com.br');

-- 3. CARGA DA TABELA CLIENTE
INSERT INTO CLIENTE (nome, cpf_cnpj, email, telefone, data_cadastro) VALUES
('Ana Paula Souza', '123.456.789-01', 'ana.souza@gmail.com', '(51) 99887-1122', '2025-01-10'),
('Bruno Eduardo Lima', '234.567.890-12', 'bruno.lima@hotmail.com', '(51) 98765-2233', '2025-01-15'),
('Carla Mendes Silveira', '345.678.901-23', 'carla.mendes@yahoo.com.br', '(51) 99112-3344', '2025-02-01'),
('Diego Fernando Ferreira', '456.789.012-34', 'diego.ferreira@outlook.com', '(51) 98844-5566', '2025-02-10'),
('Elena Rostova Silva', '567.890.123-45', 'elena.rostova@gmail.com', '(51) 99334-6677', '2025-02-20'),
('Fernando Rocha Filho', '678.901.234-56', 'fernando.rocha@uol.com.br', '(51) 98123-7788', '2025-03-01'),
('Adacon Tecnologia Ltda', '11.222.333/0001-44', 'contato@adacon.com.br', '(51) 3211-9900', '2025-03-05'),
('Helena Maria Castro', '789.012.345-67', 'helena.castro@gmail.com', '(51) 99556-8899', '2025-03-12'),
('Igor Ribeiro Campos', '890.123.456-78', 'igor.ribeiro@gmail.com', '(51) 98234-0011', '2025-03-18'),
('VGY Innovate Corp', '22.333.444/0001-55', 'projetos@vgyinnovate.com', '(51) 3022-4455', '2025-03-22');

-- 4. CARGA DA TABELA VENDEDOR
INSERT INTO VENDEDOR (nome, email, telefone, data_contratacao) VALUES
('Carlos Eduardo Silveira', 'carlos.vendas@techstore.com', '(51) 99911-0001', '2024-01-15'),
('Mariana Costa Oliveira', 'mariana.costa@techstore.com', '(51) 99911-0002', '2024-03-01'),
('Roberto Alves Santos', 'roberto.alves@techstore.com', '(51) 99911-0003', '2024-06-10'),
('Patricia Fernandes Luz', 'patricia.luz@techstore.com', '(51) 99911-0004', '2024-09-20'),
('Lucas Martins Ribeiro', 'lucas.martins@techstore.com', '(51) 99911-0005', '2025-01-05');

-- 5. CARGA DA TABELA PRODUTO
INSERT INTO PRODUTO (nome_produto, descricao, preco_unitario, quantidade_estoque, id_categoria, id_fornecedor) VALUES
('Notebook Dell Inspiron 15', 'Intel Core i5, 16GB RAM, SSD 512GB, Tela 15.6 FHD', 3899.00, 15, 1, 1),
('MacBook Air M2', 'Chip Apple M2, 8GB RAM, SSD 256GB, Tela 13.6 Liquid Retina', 7499.00, 8, 1, 5),
('Notebook Lenovo Legion Slim 5', 'AMD Ryzen 7, RTX 4060, 16GB RAM, SSD 1TB', 6899.00, 6, 1, 2),
('Notebook Acer Aspire 5', 'Intel Core i3, 8GB RAM, SSD 256GB, Linux', 2299.00, 20, 1, 3),
('Teclado Mecânico Logitech G Pro', 'Switches GX Blue Clicky, RGB LIGHTSYNC', 599.00, 30, 2, 2),
('Mouse Sem Fio Logitech MX Master 3S', 'Sensor Darkfield 8000 DPI, Silencioso, Bluetooth', 499.00, 25, 2, 2),
('Headset Gamer HyperX Cloud II', 'Som Surround 7.1, Drivers 53mm, Microfone Removível', 429.00, 40, 2, 3),
('Webcam Full HD Logitech C920s', 'Resolução 1080p, Microfones Estéreos, Proteção de Privacidade', 349.00, 18, 2, 1),
('Processador AMD Ryzen 7 5700X', '8 Cores, 16 Threads, 3.4GHz (4.6GHz Turbo), Socket AM4', 1199.00, 12, 3, 5),
('Placa de Vídeo RTX 4060 8GB', 'NVIDIA GeForce, Ray Tracing, DLSS 3, GDDR6', 2199.00, 10, 3, 2),
('Memória RAM Corsair Vengeance 16GB', 'DDR4 3200MHz, CL16, Dissipador de Calor', 289.00, 50, 3, 3),
('SSD NVMe M.2 Kingston 1TB', 'Leitura até 3500MB/s, Gravação 2100MB/s', 399.00, 45, 3, 1),
('Fonte Corsair CV650 650W', '80 Plus Bronze, PFC Ativo, Ventoinha 120mm', 379.00, 22, 3, 3),
('Monitor Gamer LG Ultragear 27', '27 pol, IPS, 144Hz, 1ms, HDR10, FreeSync', 1299.00, 14, 4, 1),
('Monitor Samsung Odyssey G32 24', '24 pol, 165Hz, 1ms, AMD FreeSync Premium', 999.00, 16, 4, 4),
('Monitor Dell Professional 23.8', 'Full HD, IPS, Ajuste de Altura, HDMI/DisplayPort', 1099.00, 10, 4, 1),
('Roteador TP-Link Archer AX12 WiFi 6', 'Dual Band AX1500, 4 Antenas Externas, WPA3', 299.00, 35, 5, 4),
('Switch TP-Link 8 Portas Gigabit', 'TL-SG1008D, Plug and Play, Desktop', 149.00, 28, 5, 4),
('Adaptador USB Wi-Fi AC1300', 'TP-Link Archer T3U Plus, Dual Band', 119.00, 40, 5, 4),
('Cabo de Rede Cat6 Furukawa 305m', 'Cabo U/UTP 24AWG Azul, 100% Cobre', 849.00, 5, 5, 4);

-- 6. CARGA DA TABELA PEDIDO
INSERT INTO PEDIDO (id_pedido, data_pedido, valor_total, status_pedido, id_cliente, id_vendedor) VALUES
(1, '2025-02-01 10:30:00', 4498.00, 'Pago', 1, 1),
(2, '2025-02-02 14:15:00', 7499.00, 'Pago', 2, 2),
(3, '2025-02-03 11:00:00', 1028.00, 'Pago', 3, 3),
(4, '2025-02-05 16:45:00', 2299.00, 'Pago', 4, 1),
(5, '2025-02-08 09:20:00', 3398.00, 'Pago', 5, 4),
(6, '2025-02-10 15:10:00', 1299.00, 'Pago', 6, 2),
(7, '2025-02-12 11:30:00', 8798.00, 'Pago', 7, 5),
(8, '2025-02-15 17:00:00', 429.00, 'Pago', 8, 3),
(9, '2025-02-18 13:40:00', 1598.00, 'Pago', 9, 1),
(10, '2025-02-20 10:00:00', 13798.00, 'Pago', 10, 2),
(11, '2025-02-22 14:30:00', 599.00, 'Pago', 1, 4),
(12, '2025-02-25 16:00:00', 3899.00, 'Pago', 3, 5),
(13, '2025-02-28 11:15:00', 999.00, 'Pago', 5, 3),
(14, '2025-03-01 09:45:00', 2598.00, 'Pago', 7, 1),
(15, '2025-03-02 15:20:00', 499.00, 'Pago', 2, 2),
(16, '2025-03-03 10:10:00', 6899.00, 'Pago', 10, 4),
(17, '2025-03-05 11:50:00', 828.00, 'Pago', 4, 3),
(18, '2025-03-06 14:00:00', 1299.00, 'Pago', 8, 5),
(19, '2025-03-08 16:30:00', 2199.00, 'Pago', 6, 1),
(20, '2025-03-10 10:00:00', 3899.00, 'Pago', 9, 2),
(21, '2025-03-12 13:15:00', 349.00, 'Aguardando', 1, 3),
(22, '2025-03-14 15:45:00', 1199.00, 'Pago', 2, 4),
(23, '2025-03-15 11:20:00', 849.00, 'Aguardando', 7, 5),
(24, '2025-03-18 09:30:00', 1099.00, 'Pago', 3, 1),
(25, '2025-03-20 14:10:00', 289.00, 'Aguardando', 5, 2),
(26, '2025-03-22 16:00:00', 7499.00, 'Pago', 10, 3),
(27, '2025-03-24 10:45:00', 448.00, 'Pago', 4, 4),
(28, '2025-03-25 15:00:00', 1299.00, 'Cancelado', 6, 5),
(29, '2025-03-26 11:30:00', 3899.00, 'Aguardando', 8, 1),
(30, '2025-03-27 14:00:00', 2199.00, 'Pago', 9, 2);

-- 7. CARGA DA TABELA ITEM_PEDIDO
INSERT INTO ITEM_PEDIDO (id_pedido, id_produto, quantidade, preco_praticado) VALUES
(1, 1, 1, 3899.00), (1, 5, 1, 599.00),
(2, 2, 1, 7499.00),
(3, 5, 1, 599.00), (3, 7, 1, 429.00),
(4, 4, 1, 2299.00),
(5, 9, 1, 1199.00), (5, 10, 1, 2199.00),
(6, 14, 1, 1299.00),
(7, 1, 2, 3899.00), (7, 16, 1, 1099.00),
(8, 7, 1, 429.00),
(9, 11, 2, 289.00), (9, 12, 1, 399.00), (9, 13, 1, 379.00), (9, 18, 1, 149.00),
(10, 3, 2, 6899.00),
(11, 5, 1, 599.00),
(12, 1, 1, 3899.00),
(13, 15, 1, 999.00),
(14, 14, 2, 1299.00),
(15, 6, 1, 499.00),
(16, 3, 1, 6899.00),
(17, 7, 1, 429.00), (17, 12, 1, 399.00),
(18, 14, 1, 1299.00),
(19, 10, 1, 2199.00),
(20, 1, 1, 3899.00),
(21, 8, 1, 349.00),
(22, 9, 1, 1199.00),
(23, 20, 1, 849.00),
(24, 16, 1, 1099.00),
(25, 11, 1, 289.00),
(26, 2, 1, 7499.00),
(27, 17, 1, 299.00), (27, 19, 1, 119.00), (27, 18, 2, 149.00),
(28, 14, 1, 1299.00),
(29, 1, 1, 3899.00),
(30, 10, 1, 2199.00),
(1, 11, 1, 289.00), (2, 6, 1, 499.00), (4, 17, 1, 299.00), (5, 11, 1, 289.00),
(7, 5, 1, 599.00), (10, 14, 1, 1299.00), (12, 6, 1, 499.00), (14, 5, 1, 599.00),
(16, 7, 1, 429.00), (18, 8, 1, 349.00), (20, 12, 1, 399.00), (22, 11, 1, 289.00),
(24, 18, 1, 149.00), (26, 6, 1, 499.00), (28, 5, 1, 599.00), (30, 11, 1, 289.00),
(3, 19, 1, 119.00), (8, 18, 1, 149.00), (11, 6, 1, 499.00), (15, 8, 1, 349.00),
(19, 11, 1, 289.00), (23, 17, 1, 299.00);

-- 8. CARGA DA TABELA PAGAMENTO
INSERT INTO PAGAMENTO (id_pedido, valor_pago, forma_pagamento, status_pagamento, data_pagamento) VALUES
(1, 4498.00, 'PIX', 'Aprovado', '2025-02-01 10:35:00'),
(2, 7499.00, 'Cartão Crédito', 'Aprovado', '2025-02-02 14:20:00'),
(3, 1028.00, 'PIX', 'Aprovado', '2025-02-03 11:05:00'),
(4, 2299.00, 'Boleto', 'Aprovado', '2025-02-06 09:10:00'),
(5, 3398.00, 'Cartão Crédito', 'Aprovado', '2025-02-08 09:25:00'),
(6, 1299.00, 'PIX', 'Aprovado', '2025-02-10 15:12:00'),
(7, 8798.00, 'PIX', 'Aprovado', '2025-02-12 11:35:00'),
(8, 429.00, 'Dinheiro', 'Aprovado', '2025-02-15 17:05:00'),
(9, 1598.00, 'Cartão Crédito', 'Aprovado', '2025-02-18 13:45:00'),
(10, 13798.00, 'PIX', 'Aprovado', '2025-02-20 10:05:00'),
(11, 599.00, 'PIX', 'Aprovado', '2025-02-22 14:32:00'),
(12, 3899.00, 'Cartão Crédito', 'Aprovado', '2025-02-25 16:05:00'),
(13, 999.00, 'Boleto', 'Aprovado', '2025-03-01 10:00:00'),
(14, 2598.00, 'PIX', 'Aprovado', '2025-03-01 09:50:00'),
(15, 499.00, 'PIX', 'Aprovado', '2025-03-02 15:22:00'),
(16, 6899.00, 'Cartão Crédito', 'Aprovado', '2025-03-03 10:15:00'),
(17, 828.00, 'PIX', 'Aprovado', '2025-03-05 11:52:00'),
(18, 1299.00, 'Cartão Crédito', 'Aprovado', '2025-03-06 14:05:00'),
(19, 2199.00, 'PIX', 'Aprovado', '2025-03-08 16:32:00'),
(20, 3899.00, 'Cartão Crédito', 'Aprovado', '2025-03-10 10:05:00'),
(21, 349.00, 'Boleto', 'Pendente', '2025-03-12 13:15:00'),
(22, 1199.00, 'PIX', 'Aprovado', '2025-03-14 15:48:00'),
(23, 849.00, 'PIX', 'Pendente', '2025-03-15 11:20:00'),
(24, 1099.00, 'Cartão Crédito', 'Aprovado', '2025-03-18 09:35:00'),
(25, 289.00, 'Boleto', 'Pendente', '2025-03-20 14:10:00'),
(26, 7499.00, 'PIX', 'Aprovado', '2025-03-22 16:02:00'),
(27, 448.00, 'PIX', 'Aprovado', '2025-03-24 10:48:00'),
(28, 1299.00, 'Cartão Crédito', 'Estornado', '2025-03-25 15:30:00'),
(29, 3899.00, 'Boleto', 'Pendente', '2025-03-26 11:30:00'),
(30, 2199.00, 'PIX', 'Aprovado', '2025-03-27 14:05:00');
