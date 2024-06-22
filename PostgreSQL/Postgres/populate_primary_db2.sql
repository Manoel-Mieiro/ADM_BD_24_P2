-- INSERT INTO pedidos (destino, cliente, carrinho, frete, total_carrinho, forma_pagamento, cumpom, valor_desconto, total_a_pagar, confirmacao_pagamento, added_at, updated_at, deleted_at) VALUES
-- (1, 1, 1, 15.50, 100.00, 'Cartão de Crédito', 'DESCONTO10', 10.00, 105.50, true, '2023-05-01', '2023-05-01', NULL),
-- (2, 2, 2, 20.00, 200.00, 'PIX', 'DESCONTO15', 15.00, 205.00, true, '2023-06-01', '2023-06-01', NULL),
-- (3, 3, 3, 10.00, 150.00, 'Boleto Bancário', 'DESCONTO20', 20.00, 140.00, false, '2023-07-01', '2023-07-01', NULL);
 
-- INSERT INTO entrega (tipo_entrega, cep, address, complemento, numero, estado, uf, bairro, added_at, updated_at, deleted_at) VALUES
-- ('Standard', '12345678', 'Rua A, 100', 'Apto 101', 100, 'São Paulo', 'SP', 'Centro', '2023-05-01', '2023-05-01', NULL),
-- ('Premium', '23456789', 'Rua B, 200', 'Bloco B', 200, 'Rio de Janeiro', 'RJ', 'Copacabana', '2023-06-01', '2023-06-01', NULL),
-- ('Retirar', '34567890', 'Rua C, 300', 'Casa', 300, 'Minas Gerais', 'MG', 'Savassi', '2023-07-01', '2023-07-01', NULL);
 
-- INSERT INTO produtos (local, fornecedor, quantidade_estoque, codigo_barras, marca, tipo, descricao, altura_embalagem, largura_embalagem, comprimento_embalagem, peso, qtd_folhas, cor, gramatura, altura_folha, comprimento_folha, valor_compra, valor_venda, added_at, updated_at, deleted_at) VALUES
-- (1, 1, 100, '1234567890123', 'Greenbag', 'PapelCartão', 'Papel reciclado', 30.0, 21.0, 10.0, 1.0, 500, 'branco', 80.0, 29.7, 21.0, 50.00, 70.00, '2023-05-01', '2023-05-01', NULL),
-- (2, 2, 200, '2345678901234', 'Bluecup', 'Revestido', 'Papel de alta qualidade', 40.0, 25.0, 15.0, 2.0, 400, 'azul', 90.0, 30.0, 22.0, 60.00, 90.00, '2023-06-01', '2023-06-01', NULL),
-- (3, 3, 150, '3456789012345', 'loop', 'nRevestido', 'Papel para impressões', 35.0, 24.0, 12.0, 1.5, 450, 'cinza', 85.0, 29.0, 21.5, 55.00, 75.00, '2023-07-01', '2023-07-01', NULL);
 
-- INSERT INTO clientes (nome, cpf, email, telefone, cartao, senha, added_at, updated_at, deleted_at) VALUES
-- ('João Silva', '12345678901', 'joao.silva@example.com', '11987654321', '1234123412341234', 'senha123', '2023-05-01', '2023-05-01', NULL),
-- ('Maria Souza', '23456789012', 'maria.souza@example.com', '21987654321', '2345234523452345', 'senha456', '2023-06-01', '2023-06-01', NULL),
-- ('Pedro Oliveira', '34567890123', 'pedro.oliveira@example.com', '31987654321', '3456345634563456', 'senha789', '2023-07-01', '2023-07-01', NULL);
 
-- INSERT INTO cartoes (cliente, banco, numero, tipo, mes_validade, ano_validade, nome_titular, cod_verificacao, added_at, updated_at, deleted_at) VALUES
-- (10, 'Itaú', '1234123412341234', 'Crédito', 12, 2025, 'João Silva', 123, '2023-05-01', '2023-05-01', NULL),
-- (11, 'Nubank', '2345234523452345', 'Débito', 11, 2024, 'Maria Souza', 234, '2023-06-01', '2023-06-01', NULL),
-- (12, 'Bradesco', '3456345634563456', 'Crédito', 10, 2023, 'Pedro Oliveira', 345, '2023-07-01', '2023-07-01', NULL);
 
-- INSERT INTO avaliacao_pedido (usuario, produto, qtd_estrelas, descricao, added_at, updated_at, deleted_at) VALUES
-- (1, 1, '5', 'Excelente produto!', '2023-05-01', '2023-05-01', NULL),
-- (2, 2, '4', 'Muito bom, mas pode melhorar.', '2023-06-01', '2023-06-01', NULL),
-- (3, 3, '3', 'Produto mediano.', '2023-07-01', '2023-07-01', NULL);
 
-- INSERT INTO carrinho (pedido, produto, quantidade, preco_total_produto, added_at, updated_at, deleted_at) VALUES
-- (1, 1, 10, 700.00, '2023-05-01', '2023-05-01', NULL),
-- (2, 2, 20, 1800.00, '2023-06-01', '2023-06-01', NULL),
-- (3, 3, 15, 1125.00, '2023-07-01', '2023-07-01', NULL);
 
-- INSERT INTO fornecedores (nome, cnpj, address, cep, estado, uf, added_at, updated_at, deleted_at) VALUES
-- ('Suzano', '12345678000101', 'Rua A, 100', '12345678', 'São Paulo', 'SP', '2023-05-01', '2023-05-01', NULL),
-- ('Bracell', '23456789000102', 'Rua B, 200', '23456789', 'Rio de Janeiro', 'RJ', '2023-06-01', '2023-06-01', NULL),
-- ('Eldorado', '34567890000103', 'Rua C, 300', '34567890', 'Minas Gerais', 'MG', '2023-07-01', '2023-07-01', NULL);
 
-- INSERT INTO pedidos_arquivados (pedido, nf, data_pedido, cliente, carrinho, forma_pagamento, total_a_pagar, added_at, updated_at, deleted_at) VALUES
-- (1, 12345, '2023-05-01', 1, 1, 'Cartão de Crédito', 105.50, '2023-05-01', '2023-05-01', NULL),
-- (2, 12346, '2023-06-01', 2, 2, 'PIX', 205.00, '2023-06-01', '2023-06-01', NULL),
-- (3, 12347, '2023-07-01', 3, 3, 'Boleto Bancário', 140.00, '2023-07-01', '2023-07-01', NULL);
 
-- INSERT INTO armazem (cep, address, numero, estado, uf, bairro, added_at, updated_at, deleted_at) VALUES
-- ('12345678', 'Rua A, 100', 100, 'São Paulo', 'SP', 'Centro', '2023-05-01', '2023-05-01', NULL),
-- ('23456789', 'Rua B, 200', 200, 'Rio de Janeiro', 'RJ', 'Copacabana', '2023-06-01', '2023-06-01', NULL),
-- ('34567890', 'Rua C, 300', 300, 'Minas Gerais', 'MG', 'Savassi', '2023-07-01', '2023-07-01', NULL);
 
-- INSERT INTO nota_fiscal (nome_empresa, entrada_saida, numero_nf, chave_acesso, natureza_operacao, protocolo, cnpj, data_emissao, address, numero, estado, uf, bairro, cep, telefone, base_icms, valor_icms, valor_frete, desconto, total_tributos, total_produtos, total_nf, added_at, updated_at, deleted_at) VALUES
-- ('Empresa A', true, 'NF1234567890123456789012345678901234567890', '1234567890123456789012345678901234567890123456789', 'Compra', 'PROTOCOLO12345678901234567890', '12345678000101', '2023-05-01', 'Rua A, 100', 100, 'São Paulo', 'SP', 'Centro', '12345678', '+5511987654321', 1000.00, 180.00, 50.00, 20.00, 200.00, 1200.00, 1350.00, '2023-05-01', '2023-05-01', NULL),
-- ('Empresa B', false, 'NF2345678901234567890123456789012345678901', '2345678901234567890123456789012345678901234567890', 'Venda', 'PROTOCOLO23456789012345678901', '23456789000102', '2023-06-01', 'Rua B, 200', 200, 'Rio de Janeiro', 'RJ', 'Copacabana', '23456789', '+5521987654321', 2000.00, 360.00, 100.00, 40.00, 400.00, 2400.00, 2700.00, '2023-06-01', '2023-06-01', NULL),
-- ('Empresa C', true, 'NF3456789012345678901234567890123456789012', '34567890123456789012345678901234567890123456789012', 'Compra', 'PROTOCOLO34567890123456789012', '34567890000103', '2023-07-01', 'Rua C, 300', 300, 'Minas Gerais', 'MG', 'Savassi', '34567890', '+5531987654321', 3000.00, 540.00, 150.00, 60.00, 600.00, 3600.00, 4050.00, '2023-07-01', '2023-07-01', NULL);
 
INSERT INTO clientes(nome, cpf, email, telefone, senha) VALUES ('Pluto', '33660235032', 'plutinho@gmail.com', '6122116275', 'coxinha123')
INSERT INTO cartoes(banco, numero, tipo, mes_validade, ano_validade, nome_titular, cod_verificacao) VALUES ('Itaú', '5357360661337549', 'Débito', 6, 2029, 'Dolinho', '231')
UPDATE clientes SET cartao = 1
INSERT INTO fornecedores(nome, cnpj, address, cep, estado, uf) VALUES ('CHAMEX', '70064245000168', 'Rua Dom Moura 39', '55896970', 'Pernambuco', 'PE')
INSERT INTO entrega (tipo_entrega, cep, address, complemento, numero, estado, bairro) VALUES ('Retirar', '55896970','Rua Dom Moura', 'casa 2', 387, 'Pernambuco', 'Upatininga')
INSERT INTO armazem (cep, address, numero, estado, bairro) VALUES ('55896970', 'Rua Dom Moura 39', 233, 'Pernambuco', 'Upatininga');

INSERT INTO produtos (
    local, 
    fornecedor, 
    codigo_barras, 
    marca, 
    tipo, 
    descricao, 
    altura_embalagem, 
    largura_embalagem, 
    comprimento_embalagem, 
    peso, 
    qtd_folhas, 
    cor, 
    gramatura, 
    altura_folha, 
    comprimento_folha, 
    valor_compra
) 
VALUES (
    1, 
    1, 
    '3E2342392323', 
    'Senninha', 
    'nRevestido', 
    'desc', 
    12.5, 
    5.5, 
    18, 
    4.87, 
    100,
    'branco',
    87.3,
    32.55,
    16.3,
    8.67 
);

INSERT INTO produtos (
    local, 
    fornecedor, 
    codigo_barras, 
    marca, 
    tipo, 
    descricao, 
    altura_embalagem, 
    largura_embalagem, 
    comprimento_embalagem, 
    peso, 
    qtd_folhas, 
    cor, 
    gramatura, 
    altura_folha, 
    comprimento_folha, 
    valor_compra
) 
VALUES (
    1, 
    1, 
    '3E2342392323', 
    'Senninha', 
    'nRevestido', 
    'desc', 
    12.5, 
    5.5, 
    18, 
    4.87, 
    100,
    'branco',
    87.3,
    32.55,
    16.3,
    8.67 
);

