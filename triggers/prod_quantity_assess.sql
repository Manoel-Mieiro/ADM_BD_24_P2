CREATE OR REPLACE FUNCTION qtd_produtos_disponiveis()RETURNS TRIGGER AS $$
DECLARE
    estoque integer;
BEGIN
    SELECT quantidade_estoque FROM produtos as p INTO estoque WHERE NEW.produto = p.id;
    IF (NEW.quantidade>estoque)THEN
    RAISE EXCEPTION 'Quantidade inserida supera a capacidade do estoque! Operação não pôde ser concluída';
    END IF;
    RETURN NEW;
END
$$ LANGUAGE PLPGSQL;

CREATE OR REPLACE TRIGGER prod_quantity_assess
BEFORE INSERT ON carrinho
FOR EACH ROW
EXECUTE FUNCTION qtd_produtos_disponiveis();