-- Fazer resolução de UF baseado na cidade por trigger

CREATE OR REPLACE FUNCTION link_uf_state() RETURNS TRIGGER 
LANGUAGE plpgsql
AS $$
BEGIN
    -- Sudeste
    IF NEW.estado = 'Rio de Janeiro' THEN
        NEW.uf := 'RJ';
    ELSE IF NEW.estado = 'São Paulo' THEN
        NEW.uf := 'SP';
    ELSE IF NEW.estado = 'Espírito Santo' THEN
        NEW.uf := 'ES';
    ELSE IF NEW.estado = 'Minas Gerais' THEN
        NEW.uf := 'MG';
    -- Sul
    ELSE IF NEW.estado = 'Paraná' THEN
        NEW.uf := 'PR';
    ELSE IF NEW.estado = 'Santa Catarina' THEN
        NEW.uf := 'SC';
    ELSE IF NEW.estado = 'Rio Grande do Sul' THEN
        NEW.uf := 'RS';
    -- Centro Oeste
    ELSE IF NEW.estado = 'Mato Grosso do Sul' THEN
        NEW.uf := 'MS';
    ELSE IF NEW.estado = 'Goiânia' THEN
        NEW.uf := 'GO';
    ELSE IF NEW.estado = 'Mato Grosso' THEN
        NEW.uf := 'MT';
    -- Nordeste
    ELSE IF NEW.estado = 'Bahia' THEN
        NEW.uf := 'BA';
    ELSE IF NEW.estado = 'Sergipe' THEN
        NEW.uf := 'SE';
    ELSE IF NEW.estado = 'Alagoas' THEN
        NEW.uf := 'AL';
    ELSE IF NEW.estado = 'Pernambuco' THEN
        NEW.uf := 'PE';
    ELSE IF NEW.estado = 'Piauí' THEN
        NEW.uf := 'PI';
    ELSE IF NEW.estado = 'Maranhão' THEN
        NEW.uf := 'MA';
    ELSE IF NEW.estado = 'Paraíba' THEN
        NEW.uf := 'PB';
    ELSE IF NEW.estado = 'Rio Grande do Norte' THEN
        NEW.uf := 'RN';
    ELSE IF NEW.estado = 'Ceará' THEN
        NEW.uf := 'CE';
    -- Norte
    ELSE IF NEW.estado = 'Rondônia' THEN
        NEW.uf := 'RO';
    ELSE IF NEW.estado = 'Amazonas' THEN
        NEW.uf := 'AM';
    ELSE IF NEW.estado = 'Tocantins' THEN
        NEW.uf := 'TO';
    ELSE IF NEW.estado = 'Pará' THEN
        NEW.uf := 'PA';
    ELSE IF NEW.estado = 'Paraíba' THEN
        NEW.uf := 'PB';
    ELSE
        RAISE EXCEPTION 'Estado inválido';
    END IF;
    
    RETURN NEW;
END;
$$;


-- Trigger para a tabela entrega
CREATE TRIGGER resolve_uf_entrega
BEFORE INSERT OR UPDATE ON entrega
FOR EACH ROW
EXECUTE FUNCTION link_uf_state();

-- Trigger para a tabela fornecedores
CREATE TRIGGER resolve_uf_fornecedores
BEFORE INSERT OR UPDATE ON fornecedores
FOR EACH ROW
EXECUTE FUNCTION link_uf_state();

-- Trigger para a tabela armazem
CREATE TRIGGER resolve_uf_armazem
BEFORE INSERT OR UPDATE ON armazem
FOR EACH ROW
EXECUTE FUNCTION link_uf_state();
