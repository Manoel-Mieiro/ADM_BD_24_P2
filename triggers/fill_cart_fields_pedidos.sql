CREATE OR REPLACE FUNCTION update_order() RETURNS TRIGGER AS
$$
BEGIN
    UPDATE pedidos
    SET total_carrinho = (SELECT preco_total_produto FROM carrinho WHERE id = NEW.id)
    WHERE carrinho = NEW.id;
    RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;


CREATE OR REPLACE TRIGGER fill_cart_fields_produtos
AFTER INSERT OR UPDATE ON carrinho
FOR EACH ROW
EXECUTE FUNCTION update_order();