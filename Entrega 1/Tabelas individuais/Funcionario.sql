CREATE TABLE Funcionario ( --herda de pessoa
    cpf VARCHAR2(11) NOT NULL,
    cpf_supervisor VARCHAR2(11) NOT NULL,
    endereco VARCHAR2(255) NOT NULL,
    cargo VARCHAR2(255) NOT NULL,
    salario NUMBER NOT NULL CHECK (salario >= 1212.00),
    CONSTRAINT funcionario_pk PRIMARY KEY (cpf),
    CONSTRAINT funcionario_fk1 FOREIGN KEY (cpf_supervisor) REFERENCES Funcionario(cpf),
    CONSTRAINT funcionario_fk2 FOREIGN KEY (endereco) REFERENCES Pedagio(endereco)
);
