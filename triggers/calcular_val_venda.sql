-- Calcula e preenche o valor da coluna valor de venda da tabela produto baseado em um dado percentual estabelecido
CREATE OR REPLACE FUNCTION assess() RETURNS TRIGGER AS $$
DECLARE
    percentual real := 0.31;
BEGIN
    NEW.valor_venda := NEW.valor_compra*(1+percentual);
    RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;

CREATE OR REPLACE TRIGGER calc_val_venda
BEFORE INSERT ON produtos
FOR EACH ROW
EXECUTE FUNCTION assess();