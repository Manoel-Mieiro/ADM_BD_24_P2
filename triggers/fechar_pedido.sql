-- Criar uma trigger que ao trocar o valor de confirmacao_pagamento em pedidos para true crie uma NF e depois mande a linha correspondente em pedidos para a tabela pedidos_arquivados 

CREATE OR REPLACE FUNCTION end_order() RETURNS VOID AS 
$$
BEGIN
  "desconto" real,
    INSERT INTO nota_fiscal(nome_empresa, entrada_saida, numero_nf, chave_acesso, natureza_operacao, protocolo, cnpj, data_emissao, address, numero, uf, estado, bairro, cep, telefone, base_icms, valor_icms, valor_frete, desconto, total_tributos, total_produtos, total_nf, added_at)
END;
$$ LANGUAGE PLPGSQL;

CREATE OR REPLACE TRIGGER fechar_pedido 
AFTER UPDATE ON pedidos
FOR EACH ROW
EXECUTE FUNCTION end_order();