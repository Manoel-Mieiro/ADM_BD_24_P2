CREATE OR REPLACE FUNCTION total_prod_cart() RETURNS TRIGGER AS $$
BEGIN
    NEW.preco_total_produto := NEW.quantidade * (SELECT valor_venda FROM produtos WHERE id = NEW.produto);
    RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;

CREATE OR REPLACE TRIGGER calc_prod
BEFORE INSERT ON carrinho
FOR EACH ROW
EXECUTE FUNCTION total_prod_cart();
