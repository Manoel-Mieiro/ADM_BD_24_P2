CREATE INDEX idx_nf ON nota_fiscal(id); --Agiliza a busca pela NF
CREATE INDEX idx_protocolo ON nota_fiscal(protocolo); --Agiliza a busca pelos protocolos
CREATE INDEX idx_chave_acesso ON nota_fiscal(chave_acesso); --Agiliza a busca pelas chaves de acesso
CREATE INDEX idx_uf ON nota_fiscal (uf) WHERE uf IN ('SP', 'MG', 'RJ', 'SC'); --As UFs em questão devem representar a maioria por serem as mais ricas e populosas, por conseguinte com mais propensão a adiquirir nossos produtos e portanto fazer requisição de entrega
