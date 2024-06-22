CREATE TYPE caterers AS ENUM (
  'Suzano',
  'Bracell',
  'Eldorado',
  'Klabin',
  'Cenibra',
  'W3B',
  'IP',
  'TF'
);

CREATE TYPE brands AS ENUM (
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

CREATE TYPE types AS ENUM (
  'PapelCartão',
  'nRevestido',
  'Revestido',
  'CutSize',
  'Especial'
);

CREATE TYPE colors AS ENUM (
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

CREATE TYPE unif AS ENUM (
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

CREATE TYPE states AS ENUM (
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

CREATE TYPE payment AS ENUM (
  'Cartão de Crédito',
  'Cartão de Débito',
  'Boleto Bancário',
  'PIX'
);

CREATE TYPE shipping AS ENUM (
  'Retirar',
  'Standard',
  'Premium'
);

CREATE TYPE cards AS ENUM (
  'Débito',
  'Crédito'
);

CREATE TYPE stars AS ENUM (
  '1',
  '2',
  '3',
  '4',
  '5'
);

CREATE TYPE banks AS ENUM (
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

CREATE TYPE op AS ENUM (
  'Compra',
  'Venda'
);

CREATE TABLE public.fornecedores (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    cnpj VARCHAR(18),
    address VARCHAR(80),
    cep VARCHAR(8),
    estado states,
    uf unif,
    added_at DATE,
    updated_at DATE,
    deleted_at DATE
);

CREATE TABLE public.armazem (
    id SERIAL PRIMARY KEY,
    cep VARCHAR(8),
    address VARCHAR(150),
    numero SMALLINT,
    estado states,
    uf unif,
    bairro VARCHAR(50),
    added_at DATE,
    updated_at DATE,
    deleted_at DATE
);

CREATE TABLE public.produtos (
    id SERIAL PRIMARY KEY,
    local INTEGER REFERENCES public.armazem(id),
    fornecedor INTEGER REFERENCES public.fornecedores(id),
    quantidade_estoque SMALLINT,
    codigo_barras VARCHAR(13),
    marca brands,
    tipo types,
    descricao VARCHAR(100),
    altura_embalagem REAL,
    largura_embalagem REAL,
    comprimento_embalagem REAL,
    peso REAL,
    qtd_folhas SMALLINT,
    cor colors,
    gramatura REAL,
    altura_folha REAL,
    comprimento_folha REAL,
    valor_compra REAL,
    valor_venda REAL,
    added_at DATE,
    updated_at DATE,
    deleted_at DATE
);

CREATE TABLE public.clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(80),
    cpf VARCHAR(11),
    email VARCHAR(80),
    telefone VARCHAR(15),
    cartao VARCHAR(30),
    senha VARCHAR(30),
    added_at DATE,
    updated_at DATE,
    deleted_at DATE
);

CREATE TABLE public.entrega (
    id SERIAL PRIMARY KEY,
    tipo_entrega shipping,
    cep VARCHAR(8),
    address VARCHAR(150),
    complemento VARCHAR(50),
    numero SMALLINT,
    estado states,
    uf unif,
    bairro VARCHAR(50),
    added_at DATE,
    updated_at DATE,
    deleted_at DATE
);

CREATE TABLE public.nota_fiscal (
    id SERIAL PRIMARY KEY,
    nome_empresa VARCHAR(70),
    entrada_saida BOOLEAN,
    numero_nf VARCHAR(43),
    chave_acesso VARCHAR(54),
    natureza_operacao op,
    protocolo VARCHAR(40),
    cnpj VARCHAR(18),
    address VARCHAR(150),
    numero SMALLINT,
    estado states,
    uf unif,
    bairro VARCHAR(50),
    cep VARCHAR(8),
    telefone VARCHAR(15),
    base_icms REAL,
    valor_icms REAL,
    valor_frete REAL,
    desconto REAL,
    total_tributos REAL,
    total_produtos REAL,
    total_nf REAL,
    added_at DATE,
    updated_at DATE,
    deleted_at DATE
);

CREATE TABLE public.carrinho (
    id SERIAL PRIMARY KEY,
    produto INTEGER REFERENCES public.produtos(id),
    quantidade SMALLINT,
    preco_total_produto REAL,
    added_at DATE,
    updated_at DATE,
    deleted_at DATE
);

CREATE TABLE public.pedidos (
    id SERIAL PRIMARY KEY,
    id_pedido SERIAL,
    destino INTEGER REFERENCES public.entrega(id),
    cliente INTEGER REFERENCES public.clientes(id),
    frete REAL,
    total_carrinho REAL,
    forma_pagamento payment,
    cupom VARCHAR(12),
    valor_desconto REAL,
    total_a_pagar REAL,
    confirmacao_pagamento BOOLEAN,
    added_at DATE,
    updated_at DATE,
    deleted_at DATE,
    carrinho INTEGER REFERENCES public.carrinho(id)
);

CREATE TABLE public.pedidos_arquivados (
    id SERIAL PRIMARY KEY,
    pedido INTEGER REFERENCES public.pedidos(id),
    nf INTEGER REFERENCES public.nota_fiscal(id),
    data_pedido DATE,
    cliente INTEGER REFERENCES public.clientes(id),
    carrinho INTEGER REFERENCES public.carrinho(id),
    forma_pagamento payment,
    total_a_pagar REAL,
    added_at DATE,
    updated_at DATE,
    deleted_at DATE
);

CREATE TABLE public.cartoes (
    id SERIAL PRIMARY KEY,
    cliente INTEGER REFERENCES public.clientes(id),
    banco banks,
    numero VARCHAR(16),
    tipo cards,
    mes_validade SMALLINT,
    ano_validade SMALLINT,
    nome_titular VARCHAR(40),
    added_at DATE,
    updated_at DATE,
    deleted_at DATE
);

CREATE TABLE public.avaliacao_pedido (
    id SERIAL PRIMARY KEY,
    usuario INTEGER REFERENCES public.clientes(id),
    pedido INTEGER REFERENCES public.pedidos(id),
    produto INTEGER REFERENCES public.produtos(id),
    descricao VARCHAR(100),
    added_at DATE,
    updated_at DATE,
    deleted_at DATE,
    cod_verificacao SMALLINT
);

-- CREATE TABLE public.wishlist_cliente (
--     id SERIAL PRIMARY KEY,
--     cliente INT NOT NULL,
--     produto INT NOT NULL,
--     data_adicao DATE NOT NULL,
--     adicionado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     deletado_em TIMESTAMP,
--     origem VARCHAR(50), 
--     status ENUM('ativo', 'inativo') DEFAULT 'ativo',
--     FOREIGN KEY (cliente) REFERENCES clientes(id),
--     FOREIGN KEY (produto) REFERENCES produtos(id)
-- );

CREATE TABLE public.cupons_sales (
    id SERIAL PRIMARY KEY,
    codigo VARCHAR(20) NOT NULL,
    descricao VARCHAR(100),
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    quantidade_disponivel INT NOT NULL DEFAULT 0,
    percentual_desconto DECIMAL(5,2) DEFAULT 0,
    quantidade_usada INT NOT NULL DEFAULT 0,
    vigente BOOLEAN DEFAULT FALSE,
	  added_at DATE DEFAULT now(),
    updated_at DATE,
    deleted_at DATE
);

-- CREATE TABLE public.compras_cliente (
--     id SERIAL PRIMARY KEY,
--     cliente INT NOT NULL,
--     produto INT NOT NULL,
--     data_compra DATE NOT NULL DEFAULT now(),
--     quantidade INT NOT NULL,
--     valor_total DECIMAL(10,2) NOT NULL,
--     -- adicionado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     -- modificado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     -- excluido_em TIMESTAMP,
--     added_at DATE,
--     updated_at DATE,
--     deleted_at DATE,
--     FOREIGN KEY (cliente) REFERENCES clientes(id),
--     FOREIGN KEY (produto) REFERENCES produtos(id)
-- );

-- Tabela destino ETL
-- CREATE TABLE public.business (
--   id SERIAL PRIMARY KEY,
--   assessment_code VARCHAR(20) --YYYY+mm+assessment+random_number_sequence(4),
--   total_ativos  FLOAT         --Fazer trigger que preencha esse campo ao inserir na tabela produtos
--   -- trazer faixa do imposto baseado no total_ativos
--   -- trazer 
-- )