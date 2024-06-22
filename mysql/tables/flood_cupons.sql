DELIMITER //

CREATE PROCEDURE PopulateCuponsDesconto()
BEGIN
    DECLARE i INT DEFAULT 0;

    WHILE i < 500 DO
        INSERT INTO cupons_desconto (
            codigo,
            descricao,
            percentual_desconto,
            inicio_vigencia,
            fim_vigencia,
            cp_restantes,
            cp_used,
            added_at,
            updated_at,
            deleted_at
        ) VALUES (
            CONCAT('CUPOM', LPAD(FLOOR(RAND() * 1000000), 6, '0')), 
            CONCAT('Descrição do cupom ', i + 1),
            ROUND(RAND() * 100, 2), 
            CURDATE() + INTERVAL FLOOR(RAND() * 30) DAY, -- inicio_vigencia nos próximos 30 dias
            CURDATE() + INTERVAL FLOOR(RAND() * 60 + 30) DAY, -- fim_vigencia entre 30 e 90 dias a partir de hoje
            FLOOR(RAND() * 100 + 1), -- cp_restantes entre 1 e 100
            0, 
            CURDATE(), -- added_at data de hoje
            CURDATE(), -- updated_at data de hoje
            NULL -- deleted_at inicialmente NULL
        );
        SET i = i + 1;
    END WHILE;
END //

DELIMITER ;

CALL PopulateCuponsDesconto();
