--////// CRIAÇÃO DE TABELAS ////////--

-- TABELA CLIENTE
-- Checklist 13
CREATE TABLE tb_cliente OF tp_cliente (

    cpf PRIMARY KEY,
    nascimento NOT NULL,
    nome NOT NULL,
    sobrenome NOT NULL,
    telefone NOT NULL
);

/

-- TABELA FUNCIONÁRIO
-- Checklist: 14
CREATE TABLE tb_funcionario OF tp_funcionario (

    cpf PRIMARY KEY,
    nascimento NOT NULL,
    nome NOT NULL,
    sobrenome NOT NULL,
    telefone NOT NULL,
    cpf_supervisor WITH ROWID REFERENCES tb_funcionario NOT NULL,
    endereco WITH ROWID REFERENCES tb_pedagio NOT NULL,
    cargo NOT NULL,
    salario NOT NULL CHECK (salario >= 1212.00)

);

/

-- TABELA VEÍCULO
CREATE TABLE tb_veiculo OF tp_veiculo (

    placa PRIMARY KEY,
    cpf_cliente WITH ROWID REFERENCES tb_cliente NOT NULL,
    tipo NOT NULL

);

/

-- TABELA DESCONTO
-- Checklist: 16
CREATE TABLE tb_desconto OF tp_desconto (

    codigo PRIMARY KEY,
    porcentagem NOT NULL,
    cpf_cliente SCOPE IS tb_cliente 

);

/

-- TABELA CANCELA
-- Checklist 20
CREATE OR REPLACE TYPE tp_nt_cancelas AS TABLE OF tp_cancela;

/

--TABELA PEDAGIO
CREATE TABLE tb_pedagio OF tp_desconto (

    endereco PRIMARY KEY ,
    nome NOT NULL,
    quant_cancelas NOT NULL CHECK (quant_cancelas > 0)

) NESTED TABLE cancelas STORE AS cancelas_no_pedagio;

/

-- TABELA MONITORA
CREATE TABLE tb_monitora OF tp_monitora (

    cpf_funcionario WITH ROWID REFERENCES tb_funcionario,
    endereco REF WITH ROWID REFERENCES tb_pedagio,
    num_cancela NOT NULL UNIQUE,
    inicio_monitoramento PRIMARY KEY,
    fim_monitoramento PRIMARY KEY

);

/

-- TABELA PAGAMENTO
CREATE TABLE tb_pagamento OF tp_pagamento (

    cpf_cliente WITH ROWID REFERENCES tp_cliente,
    placa_veiculo WITH ROWID REFERENCES tp_veiculo,
    endereco WITH ROWID REFERENCES tp_pedagio,
    num_cancela NOT NULL UNIQUE,
    codigo_desconto WITH ROWID REFERENCES tp_desconto,
    data_pagamento PRIMARY KEY,
    forma_pagamento NOT NULL

);

/
