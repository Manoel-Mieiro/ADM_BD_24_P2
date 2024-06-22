CREATE OR REPLACE FUNCTION cmp_cpf()RETURNS TRIGGER AS 
$$
BEGIN
   IF EXISTS(SELECT 1 FROM clientes WHERE cpf = new.cpf) THEN
   RAISE EXCEPTION 'O cliente já está cadastrado. Operação encerrada';
   END IF;
   RETURN NEW;    
END;
$$ LANGUAGE PLPGSQL;

CREATE OR REPLACE TRIGGER check_cpf
BEFORE INSERT ON clientes
FOR EACH ROW
EXECUTE FUNCTION cmp_cpf();