CREATE OR REPLACE FUNCTION total_prod_cart() RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO carrinho(total_produtos)VALUES(quantidade*(SELECT valor_venda FROM produtos as p WHERE NEW.produto = p.id))
    RETURN NEW;
END;
$$ LANGUAGE PLPGSQ;

CREATE OR REPLACE TRIGGER calc_prod
BEFORE INSERT ON carrinho
FOR EACH rows
EXECUTE total_prod_cart();