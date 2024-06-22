USE mydb;

CREATE TABLE wishlist (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    produto_id INT NOT NULL,
    data_adicao DATE NOT NULL,
    added_at DATE,
    updated_at DATE,
    deleted_at DATE
    /*
    ,
    FOREIGN KEY (cliente_id) REFERENCES cliente_ids(id),
    FOREIGN KEY (produto_id) REFERENCES produto_ids(id)
    */
);

CREATE TABLE cupons_desconto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(12) NOT NULL,
    descricao VARCHAR(100),
    percentual_desconto DECIMAL(5,2) NOT NULL,
    inicio_vigencia DATE NOT NULL,
    fim_vigencia DATE NOT NULL,
    cp_restantes INT NOT NULL, #vamos usar uma trigger para ficar monitorando o uso e quando zerar vamos deletar o cupom
    cp_used INT DEFAULT 0,
    added_at DATE,
    updated_at DATE,
    deleted_at DATE
);

CREATE TABLE historico_compras (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    produto_id INT NOT NULL,
    data_compra DATE NOT NULL,
    quantidade INT NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    added_at DATE,
    updated_at DATE,
    deleted_at DATE
    /*,
    FOREIGN KEY (cliente_id) REFERENCES cliente_ids(id),
    FOREIGN KEY (produto_id) REFERENCES produto_ids(id)
    */
);


-- ETL Tables
