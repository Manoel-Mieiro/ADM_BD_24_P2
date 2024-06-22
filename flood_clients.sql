DO
$$
DECLARE
    i integer := 0;
BEGIN
    -- Inserting 300000 rows
    WHILE i < 1000000 LOOP
        INSERT INTO clientes (
            nome,
            email,
            telefone,
            cartao,
            senha
        )
        VALUES (
            CONCAT('Cliente ', i),
            CONCAT('cliente', i, '@gmail.com'),
            CONCAT('21', LPAD((random() * 1000000000)::BIGINT::TEXT, 9, '0')),
            4,
            CONCAT('cli', i, 'psswd')
        );
        i := i + 1;
    END LOOP;
END;
$$ LANGUAGE PLPGSQL;
