CREATE INDEX idx_pedido ON pedidos (id_pedido) WHERE forma_pagamento = 'PIX'; 
--Para buscas por id mais rápidas
-- CREATE INDEX idx_forma_pagamento ON pedidos (forma_pagamento); --Para buscar mais rápido por pedidos a serem pagos no PIX, uma vez que representam dinheiro imediato para a empresa

