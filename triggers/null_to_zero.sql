CREATE OR REPLACE FUNCTION transform() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.frete IS NULL THEN 
        NEW.frete := 0;
    END IF;
    IF NEW.valor_desconto IS NULL THEN 
        NEW.valor_desconto := 0;
    END IF;
    NEW.total_a_pagar := 0;
    NEW.total_carrinho := 0;
    NEW.confirmacao_pagamento := FALSE;

    RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;

 
CREATE OR REPLACE TRIGGER null_to_zero
BEFORE INSERT ON pedidos
FOR EACH ROW
EXECUTE FUNCTION transform();