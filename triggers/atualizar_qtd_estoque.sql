CREATE OR REPLACE FUNCTION updt_available_prod() RETURNS TRIGGER AS $$
DECLARE
    qtd smallint;
BEGIN
    SELECT COUNT(*) INTO qtd
    FROM produtos
    WHERE local = NEW.local;

    UPDATE produtos
    SET quantidade_estoque = qtd
    WHERE local = NEW.local;

    RETURN NEW;  
END;
$$ LANGUAGE PLPGSQL;

CREATE OR REPLACE TRIGGER calc_estoque_prod
AFTER INSERT ON produtos
FOR EACH ROW
EXECUTE FUNCTION updt_available_prod();
