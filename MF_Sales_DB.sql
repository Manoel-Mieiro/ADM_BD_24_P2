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
 
CREATE TYPE "unif" AS ENUM (
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
  "cumpom" VARCHAR(12),
  "valor_desconto" real,
  "total_a_pagar" real,
  "confirmacao_pagamento" boolean,
  "added_at" date,
  "updated_at" date,
  "deleted_at" date
);
 
CREATE TABLE "entrega" (
  "id" serial PRIMARY KEY,
  "tipo_entrega" shipping,
  "cep" VARCHAR(8),
  "address" VARCHAR(150),
  "complemento" VARCHAR(50),
  "numero" smallint,
  "estado" states,
  "uf" unif,
  "bairro" VARCHAR(50),
  "added_at" date,
  "updated_at" date,
  "deleted_at" date
);
 
CREATE TABLE "produtos" (
  "id" serial PRIMARY KEY,
  "local" integer,
  "fornecedor" integer,
  "quantidade_estoque" smallint,
  "codigo_barras" VARCHAR(13),
  "marca" brands,
  "tipo" types,
  "descricao" VARCHAR(100),
  "altura_embalagem" real,
  "largura_embalagem" real,
  "comprimento_embalagem" real,
  "peso" real,
  "qtd_folhas" smallint,
  "cor" colors,
  "gramatura" real,
  "altura_folha" real,
  "comprimento_folha" real,
  "valor_compra" real,
  "valor_venda" real,
  "added_at" date,
  "updated_at" date,
  "deleted_at" date
);
 
CREATE TABLE "clientes" (
  "id" serial PRIMARY KEY,
  "nome" VARCHAR(80),
  "cpf" VARCHAR(11),
  "email" VARCHAR(80),
  "telefone" VARCHAR(11),
  "cartao" VARCHAR(30),
  "senha" VARCHAR(30),
  "added_at" date,
  "updated_at" date,
  "deleted_at" date
);
 
CREATE TABLE "cartoes" (
  "id" serial PRIMARY KEY,
  "cliente" int REFERENCES clientes(id),
  "banco" banks,
  "numero" VARCHAR(16),
  "tipo" cards,
  "mes_validade" smallint,
  "ano_validade" smallint,
  "nome_titular" VARCHAR(40),
  "cod_verificacao" smallint,
  "added_at" date,
  "updated_at" date,
  "deleted_at" date
);
 
CREATE TABLE "avaliacao_pedido" (
  "id" serial PRIMARY KEY,
  "usuario" integer,
  "produto" integer,
  "qtd_estrelas" stars,
  "descricao" VARCHAR(100),
  "added_at" date,
  "updated_at" date,
  "deleted_at" date
);
 
CREATE TABLE "carrinho" (
  "id" serial PRIMARY KEY,
  "pedido" integer,
  "produto" integer,
  "quantidade" smallint,
  "preco_total_produto" real,
  "added_at" date,
  "updated_at" date,
  "deleted_at" date
);
 
CREATE TABLE "fornecedores" (
  "id" serial PRIMARY KEY,
  "nome" VARCHAR(100),
  "cnpj" VARCHAR(18),
  "address" VARCHAR(80),
  "cep" VARCHAR(8),
  "estado" states,
  "uf" unif,
  "added_at" date,
  "updated_at" date,
  "deleted_at" date
);
 
CREATE TABLE "pedidos_arquivados" (
  "id" serial PRIMARY KEY,
  "pedido" integer,
  "nf" integer,
  "data_pedido" date,
  "cliente" integer,
  "carrinho" integer,
  "forma_pagamento" payment,
  "total_a_pagar" real,
  "added_at" date,
  "updated_at" date,
  "deleted_at" date
);
 
CREATE TABLE "armazem" (
  "id" serial PRIMARY KEY,
  "cep" VARCHAR(8),
  "address" VARCHAR(150),
  "numero" smallint,
  "estado" states,
  "uf" unif,
  "bairro" VARCHAR(50),
  "added_at" date,
  "updated_at" date,
  "deleted_at" date
);
 
CREATE TABLE "nota_fiscal" (
  "id" serial PRIMARY KEY,
  "nome_empresa" VARCHAR(70),
  "entrada_saida" boolean,
  "numero_nf" VARCHAR(43),
  "chave_acesso" VARCHAR(54),
  "natureza_operacao" op,
  "protocolo" VARCHAR(40),
  "cnpj" VARCHAR(18),
  "data_emissao" date,
  "address" VARCHAR(150),
  "numero" smallint,
  "estado" states,
  "uf" unif,
  "bairro" VARCHAR(50),
  "cep" VARCHAR(8),
  "telefone" VARCHAR(15),
  "base_icms" real,
  "valor_icms" real,
  "valor_frete" real,
  "desconto" real,
  "total_tributos" real,
  "total_produtos" real,
  "total_nf" real,
  "added_at" date,
  "updated_at" date,
  "deleted_at" date
);

--FK em pedidos
-- Adicionando chave estrangeira para a tabela 'entrega'
ALTER TABLE "pedidos" 
ADD CONSTRAINT fk_destino
FOREIGN KEY ("destino") REFERENCES "entrega"("id");

-- Adicionando chave estrangeira para a tabela 'clientes'
ALTER TABLE "pedidos" 
ADD CONSTRAINT fk_cliente
FOREIGN KEY ("cliente") REFERENCES "clientes"("id");




--FK on avalicao_pedido
-- Adicionando chave estrangeira para a tabela 'clientes'
ALTER TABLE "avaliacao_pedido" 
ADD CONSTRAINT fk_usuario
FOREIGN KEY ("usuario") REFERENCES "clientes"("id");

-- Adicionando chave estrangeira para a tabela 'produtos'
ALTER TABLE "avaliacao_pedido" 
ADD CONSTRAINT fk_produto
FOREIGN KEY ("produto") REFERENCES "produtos"("id");


-- FK on carrinho
-- Adicionando chave estrangeira para a tabela 'pedidos'
ALTER TABLE "carrinho" 
ADD CONSTRAINT fk_pedido
FOREIGN KEY ("pedido") REFERENCES "pedidos"("id_pedido");

-- Adicionando chave estrangeira para a tabela 'produtos'
ALTER TABLE "carrinho" 
ADD CONSTRAINT fk_produto
FOREIGN KEY ("produto") REFERENCES "produtos"("id");


-- Adicionando chave estrangeira para a tabela 'armazem'
ALTER TABLE "produtos" 
ADD CONSTRAINT fk_local
FOREIGN KEY ("local") REFERENCES "armazem"("id");

-- Adicionando chave estrangeira para a tabela 'fornecedores'
ALTER TABLE "produtos" 
ADD CONSTRAINT fk_fornecedor
FOREIGN KEY ("fornecedor") REFERENCES "fornecedores"("id");


--Adaptando antiga coluna de cartao como FK na tabela clientes
-- Removendo a coluna "cliente" antiga
ALTER TABLE "cartoes"
DROP COLUMN "cliente";

-- Removendo a coluna "cartao" antiga
ALTER TABLE "clientes"
DROP COLUMN "cartao";

-- Adicionando uma nova coluna de chave estrangeira para a tabela "clientes"
ALTER TABLE "clientes" 
ADD COLUMN "cartao" int;

-- Adicionando a restrição de chave estrangeira para a nova coluna "cartao"
ALTER TABLE "clientes" 
ADD CONSTRAINT fk_cartao
FOREIGN KEY ("cartao") REFERENCES "cartoes"("id");





-- Removendo a restrição de chave estrangeira para o campo 'cliente' na tabela cartoes
ALTER TABLE "cartoes" 
DROP CONSTRAINT IF EXISTS cartoes_cliente_fkey;


-- FK on pedidos arquivados
-- Adicionando chave estrangeira para a tabela 'pedidos'
ALTER TABLE "pedidos_arquivados" 
ADD CONSTRAINT fk_pedido_archive
FOREIGN KEY ("pedido") REFERENCES "pedidos"("id_pedido");

-- Adicionando chave estrangeira para a tabela 'nota_fiscal'
ALTER TABLE "pedidos_arquivados" 
ADD CONSTRAINT fk_pedido_nf_archive
FOREIGN KEY ("nf") REFERENCES "nota_fiscal"("id");

-- Adicionando chave estrangeira para a tabela 'clientes'
ALTER TABLE "pedidos_arquivados" 
ADD CONSTRAINT fk_pedido_cliente_archive
FOREIGN KEY ("cliente") REFERENCES "clientes"("id");

