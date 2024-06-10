DO
$$
DECLARE
    i smallint := 10;
    forns smallint;
    arm smallint;
    qtd smallint;
    barcode varchar(13);
    brand brands;
BEGIN
    WHILE i < 299 LOOP
        -- Alterna os ids do armazem
        IF i < 23 THEN
            arm := 3;
        ELSIF i >= 23 AND i < 29 THEN
            arm := 2;
        ELSE
            arm := 1;
        END IF;

        -- Alterna os ids de fornecedor
        IF i % 2 = 0 THEN
            forns := 1;
        ELSE
            forns := 2;
        END IF;

        -- Alterna a qtd em estoque
        qtd := floor(random() * 100)::smallint;

        -- Gera barcode
        barcode := lpad(floor(random() * 10000000000000)::text, 13, '0');

        -- Alterna entre marcas
        IF i < 10 THEN
            brand := 'Greenbag';
        ELSIF (i >= 10 AND i < 25) OR (i > 32 AND i < 40) THEN
            brand := 'Greenpack';
        ELSIF (i >= 25 AND i < 32) OR (i > 290) THEN
            brand := 'Report';
        ELSE
            brand := 'Senninha';
        END IF;

        INSERT INTO produtos (
            id,
            local,
            fornecedor,
            quantidade_estoque,
            codigo_barras,
            marca
        ) VALUES (
            i,
            arm,
            forns,
            qtd,
            barcode,
            brand
        );
        
        i := i + 1;
    END LOOP;
END;
$$ LANGUAGE plpgsql;
