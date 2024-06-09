CREATE INDEX idx_pedido_arquivado ON pedidos_arquivados(id); --Agiliza a busca pelo pedido
CREATE INDEX idx_nf_archive ON pedidos_arquivados(nf); --Agiliza a busca por NFs