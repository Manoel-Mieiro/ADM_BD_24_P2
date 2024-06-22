-- Uso do SELECT ... WHERE: Em vez de fazer um INSERT explícito dentro do loop, utilizamos um INSERT INTO ... SELECT ... WHERE para inserir múltiplas linhas de uma vez.
CREATE OR REPLACE FUNCTION gerar_clientes_v2(qtd integer)
RETURNS void AS
$$
DECLARE
    i integer := 0;
BEGIN
    WHILE i < qtd LOOP
        INSERT INTO clientes (
            nome,
            email,
            telefone,
            cartao,
            senha
        )
        SELECT
            CONCAT('Cliente ', i),
            CONCAT('cliente', i, '@gmail.com'),
            CONCAT('21', LPAD((random() * 1000000000)::BIGINT::TEXT, 9, '0')),
            4,
            CONCAT('cli', i, 'psswd');
        
        i := i + 1;
    END LOOP;
END;
$$ LANGUAGE PLPGSQL;
