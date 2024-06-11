-- Cria uma trigger que 'ouve' a tabela produto de forma a atualizar a coluna qtd_estoque de sua tabela.
CREATE OR REPLACE FUNCTION updt_available_prod() RETURNS TRIGGER AS $$
DECLARE
    qtd smallint; --é smallint porque há outra tirgger que impede mais de 300 linhas 
BEGIN
    SELECT COUNT(local) FROM produtos INTO qtd WHERE local = new.local;
    UPDATE produtos SET quantidade_estoque = qtd;
	RETURN NEW.quantidade_estoque;
END;
$$ LANGUAGE PLPGSQL;

CREATE OR REPLACE TRIGGER calc_estoque_prod
AFTER INSERT ON produtos
FOR EACH ROW
EXECUTE FUNCTION updt_available_prod();