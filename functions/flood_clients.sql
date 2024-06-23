CREATE OR REPLACE FUNCTION flood_clientes(qtd integer)
RETURNS void AS
$$
DECLARE
    i integer := 0;
    cpf_gen char(11);
BEGIN
    WHILE i < qtd LOOP
    cpf_gen := CONCAT(
            (random() * 9)::int::text,
            (random() * 9)::int::text,
            (random() * 9)::int::text,
            (random() * 9)::int::text,
            (random() * 9)::int::text,
            (random() * 9)::int::text,
            (random() * 9)::int::text,
            (random() * 9)::int::text,
            (random() * 9)::int::text,
            (random() * 9)::int::text,
            (random() * 9)::int::text
        );
        INSERT INTO clientes (
            nome,
            cpf,
            email,
            telefone,
            cartao,
            senha
        )
        VALUES (
            CONCAT('Cliente ', i),
            cpf_gen,
            CONCAT('cliente', i, '@gmail.com'),
            CONCAT('21', LPAD((random() * 1000000000)::BIGINT::TEXT, 9, '0')),
            4,
            CONCAT('cli', i, 'psswd')
        );
        i := i + 1;
    END LOOP;
END;
$$ LANGUAGE plpgsql;


SELECT flood_clientes(12);

