CREATE OR REPLACE FUNCTION gerar_produtos(qtd integer)
RETURNS void AS
$$
DECLARE
    i smallint := 1; 
    forns smallint;
    arm smallint;
    barcode varchar(13);
    brand varchar(50);
BEGIN
    WHILE i <= qtd LOOP  
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
            floor(random() * 100)::smallint, -- Gera quantidade aleatória em estoque
            barcode,
            brand
        );
        
        i := i + 1;
    END LOOP;
END;
$$ LANGUAGE plpgsql;
