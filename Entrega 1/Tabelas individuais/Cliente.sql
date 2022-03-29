CREATE TABLE Cliente ( --herda de pessoa
    cpf VARCHAR2(11) NOT NULL,
    CONSTRAINT cliente_pk PRIMARY KEY (cpf),
    CONSTRAINT pessoa_fk FOREIGN KEY (cpf) REFERENCES Pessoa(cpf)
)






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
    salario NUMBER NOT NULL CHECK (renda >= 1212.00),
    CONSTRAINT funcionario_pkey PRIMARY KEY (cpf),
    CONSTRAINT funcionario_fkey FOREIGN KEY (cpf) REFERENCES Funcionario(cpf)
);

CREATE TABLE Veiculo (
    placa VARCHAR2(7) NOT NULL,
    tipo VARCHAR2(255) NOT NULL,
    cpf_cliente VARCHAR2(11) NOT NULL,
    CONSTRAINT veiculo_pk PRIMARY KEY (placa),
    CONSTRAINT veiculo_pk FOREIGN KEY (cpf_cliente) REFERENCES Cliente(cpf)
)