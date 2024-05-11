CREATE TABLE "pedidos" (
  "id_pedido" integer PRIMARY KEY,
  "destino" integer,
  "cliente" integer,
  "carrinho" integer,
  "frete" integer,
  "total_carrinho" integer,
  "forma_pagamento" varchar(29),
  "cumpom" varchar(12),
  "valor_desconto" integer,
  "total_a_pagar" integer,
  "confirmacao_pagamento" boolean,
  "added_at" datetime,
  "updated_at" datetime,
  "deteled_at" datetime
);

CREATE TABLE "entrega" (
  "id" integer PRIMARY KEY,
  "tipo_entrega" integer,
  "cep" varchar(11),
  "address" varchar(150),
  "complemento" varhcar(50),
  "numero" integer,
  "uf" varchar(2),
  "cidade" varchar(30),
  "bairro" varchar(50),
  "added_at" datetime,
  "updated_at" datetime,
  "deteled_at" datetime
);

CREATE TABLE "produtos" (
  "id" serial PRIMARY KEY,
  "local" integer,
  "fornecedor" integer,
  "quantidade_estoque" integer,
  "codigo_barras" varchar(60),
  "marca" varchar(50),
  "tipo" varchar(30),
  "descricao" varchar(100),
  "altura_embalagem" integer,
  "largura_embalagem" integer,
  "comprimento_embalagem" integer,
  "peso" integer,
  "qtd_folhas" integer,
  "cor" varchar(30),
  "gramatura" integer,
  "altura_folha" integer,
  "comprimento_folha" integer,
  "valor_compra" integer,
  "valor_venda" integer,
  "added_at" datetime,
  "updated_at" datetime,
  "deteled_at" datetime
);

CREATE TABLE "clientes" (
  "id" serial PRIMARY KEY,
  "nome" varchar(80),
  "cpf" varchar(11),
  "email" varchar(80),
  "telefone" varchar(11),
  "cartao" varchar(30),
  "senha" varchar(30),
  "added_at" datetime,
  "updated_at" datetime,
  "deteled_at" datetime
);

CREATE TABLE "cartoes" (
  "id" serial PRIMARY KEY,
  "banco" varchar(80),
  "numero" varchar(16),
  "tipo" varchar(80),
  "mes_validade" integer,
  "ano_validade" integer,
  "nome_titular" varchar(40),
  "cod_verificacao" integer,
  "added_at" datetime,
  "updated_at" datetime,
  "deteled_at" datetime
);

CREATE TABLE "avaliacao_pedido" (
  "id" integer PRIMARY KEY,
  "usuario" integer,
  "produto" integer,
  "qtd_estrelas" varchar(10),
  "descricao" varchar(100),
  "added_at" datetime,
  "updated_at" datetime,
  "deteled_at" datetime
);

CREATE TABLE "carrinho" (
  "id" integer PRIMARY KEY,
  "pedido" integer,
  "produto" integer,
  "quantidade" integer,
  "preco_total_produto" integer,
  "added_at" datetime,
  "updated_at" datetime,
  "deteled_at" datetime
);

CREATE TABLE "fornecedores" (
  "id" integer PRIMARY KEY,
  "nome" varchar(100),
  "cnpj" varchar(30),
  "unidade" varchar(80),
  "cep" varchar(11),
  "cidade" varchar(30),
  "estado" varchar(30),
  "uf" varchar(2),
  "added_at" datetime,
  "updated_at" datetime,
  "deteled_at" datetime
);

CREATE TABLE "funcionario" (
  "id_comprador" integer PRIMARY KEY,
  "lotacao" int,
  "filial" int,
  "nome" varchar(80),
  "email" varchar(80),
  "telefone" varchar(11),
  "requisicao_compra" integer,
  "added_at" datetime,
  "updated_at" datetime,
  "deteled_at" datetime
);

CREATE TABLE "aquisicao" (
  "id_compra" integer PRIMARY KEY,
  "fornecedor" ineteger,
  "comprador" integer,
  "preco_total" integer,
  "total_a_pagar" integer,
  "added_at" datetime,
  "updated_at" datetime,
  "deteled_at" datetime
);

CREATE TABLE "comissao" (
  "id" integer PRIMARY KEY,
  "produto" integer,
  "preco_unitario" integer,
  "fornecedor" integer,
  "aquisicao" integer,
  "added_at" datetime,
  "updated_at" datetime,
  "deteled_at" datetime
);

CREATE TABLE "historico" (
  "id" integer PRIMARY KEY,
  "pedido" integer,
  "data_pedido" datetime,
  "cliente" integer,
  "carrinho" integer,
  "forma_pagamento" varchar(29),
  "total_a_pagar" integer,
  "added_at" datetime,
  "updated_at" datetime,
  "deteled_at" datetime
);

CREATE TABLE "armazem" (
  "id" integer PRIMARY KEY,
  "produto_id" integer,
  "cep" varchar(10),
  "address" varchar(150),
  "numero" integer,
  "uf" varchar(2),
  "capacidade_total" integer,
  "cidade" varchar(30),
  "bairro" varchar(50),
  "added_at" datetime,
  "updated_at" datetime,
  "deteled_at" datetime
);

CREATE TABLE "nota_fiscal" (
  "id" integer PRIMARY KEY,
  "nome_empresa" varchar(70),
  "entrada_saida" boolean,
  "numero_nf" varchar(70),
  "chave_acesso" integer,
  "natureza_operacao" integer,
  "protocolo" varchar(60),
  "cnpj" integer,
  "data_emissao" datetime,
  "address" varchar(150),
  "numero" integer,
  "uf" varchar(2),
  "cidade" varchar(30),
  "bairro" varchar(50),
  "cep" integer,
  "telefone" integer,
  "base_icms" integer,
  "valor_icms" integer,
  "valor_frete" integer,
  "desconto" integer,
  "total_tributos" integer,
  "total_produtos" integer,
  "total_nf" integer,
  "added_at" datetime,
  "updated_at" datetime,
  "deteled_at" datetime
);

ALTER TABLE "pedidos" ADD FOREIGN KEY ("cliente") REFERENCES "clientes" ("id");

ALTER TABLE "pedidos" ADD FOREIGN KEY ("destino") REFERENCES "entrega" ("id");

ALTER TABLE "produtos" ADD FOREIGN KEY ("local") REFERENCES "armazem" ("id");

ALTER TABLE "fornecedores" ADD FOREIGN KEY ("id") REFERENCES "produtos" ("fornecedor");

CREATE TABLE "clientes_cartoes" (
  "clientes_cartao" varchar(30),
  "cartoes_id" serial,
  PRIMARY KEY ("clientes_cartao", "cartoes_id")
);

ALTER TABLE "clientes_cartoes" ADD FOREIGN KEY ("clientes_cartao") REFERENCES "clientes" ("cartao");

ALTER TABLE "clientes_cartoes" ADD FOREIGN KEY ("cartoes_id") REFERENCES "cartoes" ("id");


ALTER TABLE "avaliacao_pedido" ADD FOREIGN KEY ("usuario") REFERENCES "clientes" ("id");

ALTER TABLE "avaliacao_pedido" ADD FOREIGN KEY ("produto") REFERENCES "produtos" ("id");

ALTER TABLE "pedidos" ADD FOREIGN KEY ("id_pedido") REFERENCES "carrinho" ("pedido");

ALTER TABLE "produtos" ADD FOREIGN KEY ("id") REFERENCES "carrinho" ("produto");

ALTER TABLE "aquisicao" ADD FOREIGN KEY ("comprador") REFERENCES "funcionario" ("id_comprador");

ALTER TABLE "historico" ADD FOREIGN KEY ("id") REFERENCES "funcionario" ("filial");

ALTER TABLE "fornecedores" ADD FOREIGN KEY ("id") REFERENCES "aquisicao" ("fornecedor");

ALTER TABLE "produtos" ADD FOREIGN KEY ("id") REFERENCES "comissao" ("produto");

ALTER TABLE "aquisicao" ADD FOREIGN KEY ("id_compra") REFERENCES "comissao" ("aquisicao");

ALTER TABLE "fornecedores" ADD FOREIGN KEY ("id") REFERENCES "comissao" ("fornecedor");

ALTER TABLE "pedidos" ADD FOREIGN KEY ("id_pedido") REFERENCES "historico" ("pedido");

ALTER TABLE "pedidos" ADD FOREIGN KEY ("id_pedido") REFERENCES "nota_fiscal" ("id");
