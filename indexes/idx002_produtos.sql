CREATE INDEX idx_produto ON produtos (id) WHERE cor='branco' AND tipo ='PapelCartão'; 
--Para buscas por id mais rápidas
-- CREATE INDEX idx_cor ON produtos (cor = "branco"); --Mais provável que grande parte das linhas sejam papel branco, então é bom ter um index para esse campo
-- CREATE INDEX idx_tipo_papel ON produtos (tipo = "PapelCartão") --Tipo de papel mais comum dos que vendemos, sendo mais provável ter uma maioria esmagadora de lihas com ele incluído

