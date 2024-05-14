CREATE TYPE "caterers" AS ENUM (
  'Suzano',
  'Bracell',
  'Eldorado',
  'Klabin',
  'Cenibra',
  'W3B',
  'IP',
  'TF'
);

CREATE TYPE "brands" AS ENUM (
  'Greenbag',
  'Greenpack',
  'loop',
  'Bluecup',
  'BluecupBio',
  'liN',
  'Report',
  'Senninha',
  'Couché',
  'Pólen',
  'AltaAlvura',
  'Reciclato',
  'Paperfect',
  'SUPER6',
  'TPWHITE',
  'PPTPWHITE',
  'AASUPREMO',
  'DDSUPREMO'
);

CREATE TYPE "types" AS ENUM (
  'PapelCartão',
  'nRevestido',
  'Revestido',
  'CutSize',
  'Especial'
);

CREATE TYPE "colors" AS ENUM (
  'branco',
  'cinza',
  'bege',
  'rosa',
  'amarelo',
  'azul',
  'verde',
  'marrom',
  'vermelho',
  'roxo'
);

CREATE TYPE "UF" AS ENUM (
  'RJ',
  'SP',
  'ES',
  'MG',
  'PR',
  'SC',
  'RS',
  'MS',
  'GO',
  'MT',
  'BA',
  'SE',
  'AL',
  'PE',
  'PI',
  'MA',
  'PB',
  'RN',
  'CE',
  'AC',
  'RO',
  'AM',
  'TO',
  'PA',
  'AP',
  'RR'
);

CREATE TYPE "states" AS ENUM (
  'Rio de Janeiro',
  'São Paulo',
  'Espírito Santo',
  'Minas Gerais',
  'Paraná',
  'Santa Catarina',
  'Rio Grande do Sul',
  'Mato Grosso do Sul',
  'Goiânia',
  'Mato Grosso',
  'Bahia',
  'Sergipe',
  'Alagoas',
  'Pernambuco',
  'Piauí',
  'Marnhão',
  'Paraíba',
  'Rio Grande do Norte',
  'Ceará',
  'Rondônia',
  'Amazonas',
  'Tocantins',
  'Pará',
  'Amapá',
  'RO'
);

CREATE TYPE "payment" AS ENUM (
  'Cartão de Crédito',
  'Cartão de Débito',
  'Boleto Bancário',
  'PIX'
);

CREATE TYPE "shipping" AS ENUM (
  'Retirar',
  'Standard',
  'Premium'
);

CREATE TYPE "cards" AS ENUM (
  'Débito',
  'Crédito'
);

CREATE TYPE "stars" AS ENUM (
  '1',
  '2',
  '3',
  '4',
  '5'
);

CREATE TYPE "banks" AS ENUM (
  'Itaú',
  'Santander',
  'Nubank',
  'C6',
  'Bradesco',
  'Banco do Brasil',
  'Cixa',
  'BTG',
  'Banrisul'
);

CREATE TYPE "op" AS ENUM (
  'Compra',
  'Venda'
);

CREATE TABLE "pedidos" (
  "id_pedido" serial PRIMARY KEY,
  "destino" integer,
  "cliente" integer,
  "carrinho" integer,
  "frete" real,
  "total_carrinho" real,
  "forma_pagamento" payment,
  "cumpom" varchar(12),
  "valor_desconto" real,
  "total_a_pagar" real,
  "confirmacao_pagamento" boolean,
  "added_at" datetime,
  "updated_at" datetime,
  "deteled_at" datetime
);

CREATE TABLE "entrega" (
  "id" serial PRIMARY KEY,
  "tipo_entrega" shipping,
  "cep" varchar(8),
  "address" varchar(150),
  "complemento" varhcar(50),
  "numero" smallint,
  "estado" states,
  "uf" UF,
  "bairro" varchar(50),
  "added_at" datetime,
  "updated_at" datetime,
  "deteled_at" datetime
);

CREATE TABLE "produtos" (
  "id" serial PRIMARY KEY,
  "local" integer,
  "fornecedor" integer,
  "quantidade_estoque" smallint,
  "codigo_barras" varchar(13),
  "marca" brands,
  "tipo" types,
  "descricao" varchar(100),
  "altura_embalagem" real,
  "largura_embalagem" reak,
  "comprimento_embalagem" real,
  "peso" real,
  "qtd_folhas" smallint,
  "cor" colors,
  "gramatura" real,
  "altura_folha" real,
  "comprimento_folha" real,
  "valor_compra" real,
  "valor_venda" real,
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
  "cliente" int,
  "banco" banks,
  "numero" varchar(16),
  "tipo" cards,
  "mes_validade" smallint,
  "ano_validade" smallint,
  "nome_titular" varchar(40),
  "cod_verificacao" smallint,
  "added_at" datetime,
  "updated_at" datetime,
  "deteled_at" datetime
);

CREATE TABLE "avaliacao_pedido" (
  "id" serial PRIMARY KEY,
  "usuario" integer,
  "produto" integer,
  "qtd_estrelas" stars,
  "descricao" varchar(100),
  "added_at" datetime,
  "updated_at" datetime,
  "deteled_at" datetime
);

CREATE TABLE "carrinho" (
  "id" serial PRIMARY KEY,
  "pedido" integer,
  "produto" integer,
  "quantidade" smallint,
  "preco_total_produto" real,
  "added_at" datetime,
  "updated_at" datetime,
  "deteled_at" datetime
);

CREATE TABLE "fornecedores" (
  "id" serial PRIMARY KEY,
  "nome" varchar(100),
  "cnpj" varchar(18),
  "address" varchar(80),
  "cep" varchar(8),
  "estado" states,
  "uf" UF,
  "added_at" datetime,
  "updated_at" datetime,
  "deteled_at" datetime
);

CREATE TABLE "pedidos_arquivados" (
  "id" serial PRIMARY KEY,
  "pedido" integer,
  "nf" integer,
  "data_pedido" datetime,
  "cliente" integer,
  "carrinho" integer,
  "forma_pagamento" payment,
  "total_a_pagar" real,
  "added_at" datetime,
  "updated_at" datetime,
  "deteled_at" datetime
);

CREATE TABLE "armazem" (
  "id" serial PRIMARY KEY,
  "cep" varchar(8),
  "address" varchar(150),
  "numero" smallint,
  "estado" states,
  "uf" UF,
  "bairro" varchar(50),
  "added_at" datetime,
  "updated_at" datetime,
  "deteled_at" datetime
);

CREATE TABLE "nota_fiscal" (
  "id" serial PRIMARY KEY,
  "nome_empresa" varchar(70),
  "entrada_saida" boolean,
  "numero_nf" varchar(43),
  "chave_acesso" varchar(54),
  "natureza_operacao" op,
  "protocolo" varchar(40),
  "cnpj" varchar(18),
  "data_emissao" datetime,
  "address" varchar(150),
  "numero" smallint,
  "estado" states,
  "uf" UF,
  "bairro" varchar(50),
  "cep" varchar(8),
  "telefone" integer,
  "base_icms" real,
  "valor_icms" real,
  "valor_frete" real,
  "desconto" real,
  "total_tributos" real,
  "total_produtos" real,
  "total_nf" real,
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

ALTER TABLE "pedidos" ADD FOREIGN KEY ("id_pedido") REFERENCES "pedidos_arquivados" ("pedido");

ALTER TABLE "nota_fiscal" ADD FOREIGN KEY ("id") REFERENCES "pedidos_arquivados" ("nf");

ALTER TABLE "pedidos" ADD FOREIGN KEY ("id_pedido") REFERENCES "nota_fiscal" ("id");

ALTER TABLE "produtos" ADD FOREIGN KEY ("gramatura") REFERENCES "produtos" ("largura_embalagem");

ALTER TABLE "cartoes" ADD FOREIGN KEY ("ano_validade") REFERENCES "cartoes" ("mes_validade");
