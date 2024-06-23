CREATE OR REPLACE FUNCTION flood_products(qtd integer, id_armazem integer, id_fornecedor integer)
RETURNS void AS
$$
DECLARE
    i integer := 0;
    codigo_barras varchar(13);
    marca brands;
    tipo types;
    cor colors;
BEGIN
    WHILE i < qtd LOOP

        codigo_barras := CONCAT(
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
            (random() * 9)::int::text,
            (random() * 9)::int::text,
            (random() * 9)::int::text
        );

        SELECT INTO marca
        (ARRAY['Greenbag', 'Greenpack', 'loop', 'Bluecup', 'BluecupBio', 'liN', 'Report', 'Senninha', 'Couché', 'Pólen', 'AltaAlvura', 'Reciclato', 'Paperfect', 'SUPER6', 'TPWHITE', 'PPTPWHITE', 'AASUPREMO', 'DDSUPREMO'])[floor(random() * 18 + 1)];


        SELECT INTO tipo
        (ARRAY['PapelCartão', 'nRevestido', 'Revestido', 'CutSize', 'Especial'])[floor(random() * 5 + 1)];


        SELECT INTO cor
        (ARRAY['branco', 'cinza', 'bege', 'rosa', 'amarelo', 'azul', 'verde', 'marrom', 'vermelho', 'roxo'])[floor(random() * 10 + 1)];


        INSERT INTO produtos (
            local,
            fornecedor,
            quantidade_estoque,
            codigo_barras,
            marca,
            tipo,
            descricao,
            altura_embalagem,
            largura_embalagem,
            comprimento_embalagem,
            peso,
            qtd_folhas,
            cor,
            gramatura,
            altura_folha,
            comprimento_folha,
            valor_compra
        )
        VALUES (
            id_armazem,
            id_fornecedor,
            (random() * 300)::smallint,
            codigo_barras,
            marca,
            tipo,
            'Produto ' || i,
            (random() * 100)::real, 
            (random() * 100)::real, 
            (random() * 100)::real, 
            (random() * 10)::real, 
            (random() * 100)::smallint, 
            cor,
            (random() * 200)::real, 
            (random() * 100)::real, 
            (random() * 100)::real, 
            (random() * 500)::real
        );
        i := i + 1;
    END LOOP;

    RETURN;  
END;
$$ LANGUAGE plpgsql;
