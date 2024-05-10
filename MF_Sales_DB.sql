CREATE TABLE "pedidos" (
  "id_pedido" integer PRIMARY KEY,
  "destino" integer,
  "cliente" integer,
  "carrinho" integer,
  "frete" integer,
  "total_carrinho" integer,
  "forma_pagamento" varchar(29),
  "cumpom" varchar(12),
  "total_a_pagar" integer
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
  "bairro" varchar(50)
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
  "valor_venda" integer
);

CREATE TABLE "clientes" (
  "id" serial PRIMARY KEY,
  "nome" varchar(80),
  "cpf" varchar(11),
  "email" varchar(80),
  "telefone" varchar(11),
  "cartao" varchar(30)
);

CREATE TABLE "cartoes" (
  "id" serial PRIMARY KEY,
  "banco" varchar(80),
  "numero" varchar(16),
  "tipo" varchar(80),
  "mes_validade" integer,
  "ano_validade" integer,
  "nome_titular" varchar(40),
  "cod_verificacao" integer
);

CREATE TABLE "avaliacao_pedido" (
  "id" integer PRIMARY KEY,
  "usuario" integer,
  "produto" integer,
  "qtd_estrelas" varchar(10),
  "descricao" varchar(100)
);

CREATE TABLE "carrinho" (
  "id" integer PRIMARY KEY,
  "pedido" integer,
  "produto" integer,
  "preco_unitario" integer
);

CREATE TABLE "fornecedores" (
  "id" integer PRIMARY KEY,
  "nome" varchar(100),
  "cnpj" varchar(30),
  "unidade" varchar(80),
  "uf" varchar(2),
  "prod_id" integer
);

CREATE TABLE "funcionario" (
  "id_comprador" integer PRIMARY KEY,
  "lotacao" int,
  "filial" int,
  "nome" varchar(80),
  "email" varchar(80),
  "telefone" varchar(11),
  "requisicao_compra" integer
);

CREATE TABLE "aquisicao" (
  "id_compra" integer PRIMARY KEY,
  "fornecedor" ineteger,
  "comprador" integer,
  "preco_total" integer,
  "total_a_pagar" integer
);

CREATE TABLE "comissao" (
  "id" integer PRIMARY KEY,
  "produto" integer,
  "preco_unitario" integer,
  "fornecedor" integer,
  "aquisicao" integer
);

CREATE TABLE "historico" (
  "id" integer PRIMARY KEY,
  "cep" varchar(10),
  "address" varchar(150),
  "numero" integer,
  "uf" varchar(2),
  "cidade" varchar(30),
  "bairro" varchar(50)
);

CREATE TABLE "armazem" (
  "id" integer PRIMARY KEY,
  "produto_id" integer,
  "cep" varchar(10),
  "address" varchar(150),
  "numero" integer,
  "uf" varchar(2),
  "cidade" varchar(30),
  "bairro" varchar(50)
);

CREATE TABLE "nota_fiscal" (
  "id" integer PRIMARY KEY
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

ALTER TABLE "pedidos" ADD FOREIGN KEY ("id_pedido") REFERENCES "nota_fiscal" ("id");
