INSERT INTO wishlist (cliente, produto, data_adicao) VALUES
(1, 101, '2024-06-21'),
(2, 102, '2024-06-22'),
(3, 103, '2024-06-23');

INSERT INTO cupons_desconto (codigo, descricao, percentual_desconto, data_inicio, data_fim, quantidade_disponivel) VALUES
('SAVE10', '10% de desconto em todos os produtos', 10.00, '2024-06-01', '2024-06-30', 100),
('WELCOME15', '15% de desconto na primeira compra', 15.00, '2024-06-01', '2024-12-31', 50),
('FREESHIP', 'Frete grátis para pedidos acima de R$100', 0.00, '2024-06-01', '2024-12-31', 200);

INSERT INTO historico_compras (cliente, produto, data_compra, quantidade, valor_total) VALUES
(1, 101, '2024-06-15', 2, 50.00),
(2, 102, '2024-06-16', 1, 30.00),
(3, 103, '2024-06-17', 3, 75.00);
