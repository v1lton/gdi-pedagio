CREATE TABLE Cliente ( --herda de pessoa
    cpf VARCHAR2(11) NOT NULL,
    CONSTRAINT cliente_pk PRIMARY KEY (cpf),
    CONSTRAINT pessoa_fk FOREIGN KEY (cpf) REFERENCES Pessoa(cpf)
);
