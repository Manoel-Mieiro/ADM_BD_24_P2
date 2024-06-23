CREATE OR REPLACE FUNCTION cmp_cpf()
RETURNS TRIGGER AS 
$$
BEGIN
   IF NEW.cpf IS DISTINCT FROM OLD.cpf THEN
      IF EXISTS(SELECT 1 FROM clientes WHERE cpf = NEW.cpf AND id <> NEW.id) THEN
         RAISE EXCEPTION 'O cliente já está cadastrado. Operação encerrada';
      END IF;
   END IF;
   RETURN NEW;    
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER check_cpf
BEFORE INSERT ON clientes
FOR EACH ROW
EXECUTE FUNCTION cmp_cpf();


CREATE OR REPLACE TRIGGER check_cpf_update
BEFORE UPDATE ON clientes
FOR EACH ROW
EXECUTE FUNCTION cmp_cpf();
