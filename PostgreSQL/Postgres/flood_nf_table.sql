DO
$$
DECLARE
    i INT := 1;
    empresa_nome TEXT;
    entrada_saida BOOLEAN;
    numero_nf TEXT;
    chave_acesso TEXT;
    natureza_operacao TEXT := 'Venda';
    protocolo TEXT;
    cnpj TEXT;
    data_emissao DATE;
    address TEXT;
    numero SMALLINT;
    estado TEXT := 'SP';
    uf TEXT := 'SP';
    bairro TEXT;
    cep TEXT;
    telefone TEXT;
    base_icms REAL;
    valor_icms REAL;
    valor_frete REAL;
    desconto REAL;
    total_tributos REAL;
    total_produtos REAL;
    total_nf REAL;
    added_at DATE := NOW();
    updated_at DATE := NOW();
    deleted_at DATE := NULL;
BEGIN
    WHILE i <= 10000000 LOOP
        -- Alterna entre as empresas
        CASE (i % 3)
            WHEN 0 THEN
                empresa_nome := 'Empresa A';
                entrada_saida := TRUE;
                numero_nf := 'NF1234567890123456789012345678901234567890' || LPAD(i::TEXT, 4, '0');
                chave_acesso := '123456789012345678901234567890123456789012345678' || LPAD(i::TEXT, 4, '0');
                cnpj := '12345678000195';
                address := 'Rua A, ' || i;
                bairro := 'Bairro A';
                cep := '12345678';
                telefone := '1234567890';
            WHEN 1 THEN
                empresa_nome := 'Empresa B';
                entrada_saida := FALSE;
                numero_nf := 'NF2345678901234567890123456789012345678901' || LPAD(i::TEXT, 4, '0');
                chave_acesso := '234567890123456789012345678901234567890123456789' || LPAD(i::TEXT, 4, '0');
                cnpj := '23456789000195';
                address := 'Rua B, ' || i;
                bairro := 'Bairro B';
                cep := '23456789';
                telefone := '2345678901';
            WHEN 2 THEN
                empresa_nome := 'Empresa C';
                entrada_saida := TRUE;
                numero_nf := 'NF3456789012345678901234567890123456789012' || LPAD(i::TEXT, 4, '0');
                chave_acesso := '345678901234567890123456789012345678901234567890' || LPAD(i::TEXT, 4, '0');
                cnpj := '34567890000195';
                address := 'Rua C, ' || i;
                bairro := 'Bairro C';
                cep := '34567890';
                telefone := '3456789012';
        END CASE;

        data_emissao := '2023-01-01'::DATE + (i % 365);
        numero := (i % 100)::SMALLINT;
        base_icms := ROUND(RANDOM() * 1000, 2);
        valor_icms := ROUND(RANDOM() * 100, 2);
        valor_frete := ROUND(RANDOM() * 50, 2);
        desconto := ROUND(RANDOM() * 30, 2);
        total_tributos := ROUND(RANDOM() * 200, 2);
        total_produtos := ROUND(RANDOM() * 2000, 2);
        total_nf := base_icms + valor_icms + valor_frete - desconto + total_tributos + total_produtos;

        INSERT INTO nota_fiscal (
            nome_empresa, entrada_saida, numero_nf, chave_acesso, natureza_operacao, protocolo, cnpj, data_emissao, address, numero, estado, uf, bairro, cep, telefone, base_icms, valor_icms, valor_frete, desconto, total_tributos, total_produtos, total_nf, added_at, updated_at, deleted_at
        ) VALUES (
            empresa_nome, entrada_saida, numero_nf, chave_acesso, natureza_operacao, NULL, cnpj, data_emissao, address, numero, estado, uf, bairro, cep, telefone, base_icms, valor_icms, valor_frete, desconto, total_tributos, total_produtos, total_nf, added_at, updated_at, deleted_at
        );

        i := i + 1;
    END LOOP;
END
$$;
DO
$$
DECLARE
    i INT := 1;
    empresa_nome TEXT;
    entrada_saida BOOLEAN;
    numero_nf TEXT;
    chave_acesso TEXT;
    natureza_operacao op;
    protocolo TEXT;
    cnpj TEXT;
    data_emissao DATE;
    address TEXT;
    numero SMALLINT;
    estado states := 'São Paulo';
    uf unif := 'SP';
    bairro TEXT;
    cep TEXT;
    telefone TEXT;
    base_icms REAL;
    valor_icms REAL;
    valor_frete REAL;
    desconto REAL;
    total_tributos REAL;
    total_produtos REAL;
    total_nf REAL;
    added_at DATE := NOW();
    updated_at DATE := NOW();
    deleted_at DATE := NULL;
BEGIN
    WHILE i <= 10000 LOOP
        -- Alterna entre as empresas
        CASE (i % 3)
            WHEN 0 THEN
                empresa_nome := 'Empresa A';
                entrada_saida := TRUE;
                numero_nf := 'NF' || LPAD(i::TEXT, 41, '0'); -- Ajustado para 43 caracteres
                chave_acesso := LPAD(i::TEXT, 43, '0'); -- Ajustado para 43 caracteres
                cnpj := '12345678000195';
                address := 'Rua A, ' || i;
                bairro := 'Bairro A';
                cep := '12345678';
                telefone := '1234567890';
                natureza_operacao := 'Venda'::op;
            WHEN 1 THEN
                empresa_nome := 'Empresa B';
                entrada_saida := FALSE;
                numero_nf := 'NF' || LPAD(i::TEXT, 41, '0'); -- Ajustado para 43 caracteres
                chave_acesso := LPAD(i::TEXT, 43, '0'); -- Ajustado para 43 caracteres
                cnpj := '23456789000195';
                address := 'Rua B, ' || i;
                bairro := 'Bairro B';
                cep := '23456789';
                telefone := '2345678901';
                natureza_operacao := 'Compra'::op;
            WHEN 2 THEN
                empresa_nome := 'Empresa C';
                entrada_saida := TRUE;
                numero_nf := 'NF' || LPAD(i::TEXT, 41, '0'); -- Ajustado para 43 caracteres
                chave_acesso := LPAD(i::TEXT, 43, '0'); -- Ajustado para 43 caracteres
                cnpj := '34567890000195';
                address := 'Rua C, ' || i;
                bairro := 'Bairro C';
                cep := '34567890';
                telefone := '3456789012';
                natureza_operacao := 'Venda'::op;
        END CASE;

        data_emissao := '2023-01-01'::DATE + (i % 365);
        numero := (i % 100)::SMALLINT;
        base_icms := ROUND((RANDOM() * 1000)::numeric, 2)::REAL;
        valor_icms := ROUND((RANDOM() * 100)::numeric, 2)::REAL;
        valor_frete := ROUND((RANDOM() * 50)::numeric, 2)::REAL;
        desconto := ROUND((RANDOM() * 30)::numeric, 2)::REAL;
        total_tributos := ROUND((RANDOM() * 200)::numeric, 2)::REAL;
        total_produtos := ROUND((RANDOM() * 2000)::numeric, 2)::REAL;
        total_nf := base_icms + valor_icms + valor_frete - desconto + total_tributos + total_produtos;

        INSERT INTO nota_fiscal (
            nome_empresa, entrada_saida, numero_nf, chave_acesso, natureza_operacao, protocolo, cnpj, data_emissao, address, numero, estado, uf, bairro, cep, telefone, base_icms, valor_icms, valor_frete, desconto, total_tributos, total_produtos, total_nf, added_at, updated_at, deleted_at
        ) VALUES (
            empresa_nome, entrada_saida, numero_nf, chave_acesso, natureza_operacao, NULL, cnpj, data_emissao, address, numero, estado, uf, bairro, cep, telefone, base_icms, valor_icms, valor_frete, desconto, total_tributos, total_produtos, total_nf, added_at, updated_at, deleted_at
        );

        i := i + 1;
    END LOOP;
END
$$;
