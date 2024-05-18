CREATE INDEX idx_tipo_entrega ON entrega (tipo_entrega) WHERE tipo_entrega = "Standard"; 
--Espera-se que boa parte das linhas da tabela entrega tenham como tipo da entrega Standard por ser uma opção mais barata e confortável para o cliente
CREATE INDEX idx_uf ON entrega (uf) WHERE uf IN ('SP', 'MG', 'RJ', 'SC'); 
--As UFs em questão devem representar a maioria por serem as mais ricas e populosas, por conseguinte com mais propensão a adiquirir nossos produtos e portanto fazer requisição de entrega


