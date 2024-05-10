CREATE TABLE "pedidos" (
  "id_pedido" integer PRIMARY KEY,
  "cliente" integer,
  "carrinho" integer,
  "total_a_pagar" integer
);

CREATE TABLE "produtos" (
  "id" serial PRIMARY KEY,
  "local" integer,
  "origem" integer,
  "quantidade" integer,
  "codigo_barras" varchar(60),
  "marca" varchar(50),
  "valor_varejo" integer,
  "valor_atacado" integer
);

CREATE TABLE "clientes" (
  "id" serial PRIMARY KEY,
  "nome" varchar(80),
  "cpf" varchar(11),
  "email" varchar(80),
  "telefone" varchar(11),
  "cartao" varchar(30)
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

CREATE TABLE "transportadora" (
  "id" integer PRIMARY KEY,
  "produto_id" integer,
  "cep" varchar(10),
  "address" varchar(150),
  "numero" integer,
  "uf" varchar(2),
  "cidade" varchar(30),
  "bairro" varchar(50)
);

ALTER TABLE "produtos" ADD FOREIGN KEY ("id") REFERENCES "pedidos" ("id_pedido");

ALTER TABLE "pedidos" ADD FOREIGN KEY ("cliente") REFERENCES "clientes" ("id");

ALTER TABLE "produtos" ADD FOREIGN KEY ("local") REFERENCES "armazem" ("id");

ALTER TABLE "fornecedores" ADD FOREIGN KEY ("id") REFERENCES "produtos" ("origem");

ALTER TABLE "pedidos" ADD FOREIGN KEY ("id_pedido") REFERENCES "carrinho" ("pedido");

ALTER TABLE "produtos" ADD FOREIGN KEY ("id") REFERENCES "carrinho" ("produto");

ALTER TABLE "aquisicao" ADD FOREIGN KEY ("comprador") REFERENCES "funcionario" ("id_comprador");

ALTER TABLE "historico" ADD FOREIGN KEY ("id") REFERENCES "funcionario" ("filial");

ALTER TABLE "fornecedores" ADD FOREIGN KEY ("id") REFERENCES "aquisicao" ("fornecedor");

ALTER TABLE "produtos" ADD FOREIGN KEY ("id") REFERENCES "comissao" ("produto");

ALTER TABLE "aquisicao" ADD FOREIGN KEY ("id_compra") REFERENCES "comissao" ("aquisicao");

ALTER TABLE "fornecedores" ADD FOREIGN KEY ("id") REFERENCES "comissao" ("fornecedor");

ALTER TABLE "produtos" ADD FOREIGN KEY ("marca") REFERENCES "produtos" ("valor_atacado");
