CREATE TABLE Pessoa (
    cpf VARCHAR2(11) NOT NULL,
    nascimento DATE NOT NULL,
    nome VARCHAR2(255) NOT NULL,
    sobrenome VARCHAR2(255) NOT NULL,
    CONSTRAINT pessoa_pkey PRIMARY KEY (cpf)
);

CREATE TABLE Cliente ( --herda de pessoa
    cpf VARCHAR2(11) NOT NULL,
    CONSTRAINT cliente_pk PRIMARY KEY (cpf),
    CONSTRAINT pessoa_fk FOREIGN KEY (cpf) REFERENCES Pessoa(cpf)
);

CREATE TABLE Funcionario ( --herda de pessoa
    cpf VARCHAR2(11) NOT NULL,
    cpf_supervisor VARCHAR2(11) NOT NULL,
    cargo VARCHAR2(255) NOT NULL,
    salario NUMBER NOT NULL CHECK (salario >= 1212.00),
    CONSTRAINT funcionario_pk PRIMARY KEY (cpf),
    CONSTRAINT funcionario_fk FOREIGN KEY (cpf) REFERENCES Pessoa(cpf),
    CONSTRAINT funcionario_sfk FOREIGN KEY (cpf_supervisor) REFERENCES Funcionario(cpf)
);

CREATE TABLE Veiculo (
    placa VARCHAR2(7) NOT NULL,
    tipo VARCHAR2(255) NOT NULL,
    cpf_cliente VARCHAR2(11) NOT NULL,
    CONSTRAINT veiculo_pk PRIMARY KEY (placa),
    CONSTRAINT veiculo_fk FOREIGN KEY (cpf_cliente) REFERENCES Cliente(cpf)
);

CREATE TABLE Pedagio (
    nome VARCHAR2(255) NOT NULL,
    endereco VARCHAR2(255) NOT NULL,
    quant_cancelas NUMBER NOT NULL CHECK (quant_cancelas > 0),
    CONSTRAINT pedagio_pk PRIMARY KEY (endereco)
);

CREATE TABLE Telefones (
    cpf VARCHAR2(11) NOT NULL,
    num_telefone VARCHAR2(11) NOT NULL,
    CONSTRAINT telefone_pk PRIMARY KEY (cpf,num_telefone),
    CONSTRAINT cpf_fk FOREIGN KEY (cpf) REFERENCES Pessoa(cpf)
);

CREATE TABLE Cancela (
    endereco VARCHAR2(255) NOT NULL,
    num_cancela NUMBER NOT NULL,
    preco_tarifa NUMBER NOT NULL,
    data_manutencao DATE NOT NULL,
    status VARCHAR2(255) NOT NULL,
    tipo_veiculo VARCHAR2(255) NOT NULL,
    CONSTRAINT cancela_pk PRIMARY KEY (endereco, num_cancela),
    CONSTRAINT cancela_fk FOREIGN KEY (endereco) REFERENCES Pedagio(endereco)
);

CREATE TABLE Monitora (
	cpf_funcionario VARCHAR2(11) NOT NULL,
	endereco VARCHAR2(255) NOT NULL,
	num_cancela NUMBER NOT NULL,
	inicio_monitoramento TIMESTAMP,
	fim_monitoramento TIMESTAMP,
	CONSTRAINT monitora_pk PRIMARY KEY (cpf_funcionario, endereco, num_cancela),
	CONSTRAINT monitora_fk1  FOREIGN KEY (cpf_funcionario) REFERENCES  Funcionario(cpf),
	CONSTRAINT monitora_fk2  FOREIGN KEY (endereco, num_cancela) REFERENCES Cancela(endereco, num_cancela)
);

CREATE TABLE Desconto (
    porcentagem NUMBER NOT NULL,
    codigo NUMBER NOT NULL,
    cpf_cliente VARCHAR2(11) NOT NULL,
    CONSTRAINT desconto_pk PRIMARY KEY (codigo),
    CONSTRAINT desconto_fkey FOREIGN KEY (cpf_cliente) REFERENCES Cliente(cpf)
);

CREATE TABLE Pagamento (
    cpf_cliente VARCHAR2(11) NOT NULL,
    placa_veiculo VARCHAR2(7) NOT NULL,
    endereco VARCHAR2(255) NOT NULL,
    num_cancela NUMBER NOT NULL,
    codigo_desconto NUMBER,
    data_pagamento TIMESTAMP NOT NULL,
    forma_pagamento VARCHAR2(255) NOT NULL,
    CONSTRAINT pagamento_pk PRIMARY KEY (cpf_cliente, placa_veiculo, endereco, num_cancela, data_pagamento),
    CONSTRAINT pagamento_fkey1 FOREIGN KEY (endereco, num_cancela) REFERENCES Cancela(endereco, num_cancela),
    CONSTRAINT pagamento_fkey2 FOREIGN KEY (codigo_desconto) REFERENCES Desconto(codigo),
    CONSTRAINT pagamento_fkey3 FOREIGN KEY (cpf_cliente) REFERENCES Cliente(cpf),
    CONSTRAINT pagamento_fkey4 FOREIGN KEY (placa_veiculo) REFERENCES Veiculo(placa)
);
