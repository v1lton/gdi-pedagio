CREATE TABLE Telefones (
    cpf VARCHAR2(11) NOT NULL,
    num_telefone VARCHAR2(11) NOT NULL,
    CONSTRAINT telefone_pk PRIMARY KEY (cpf,num_telefone),
    CONSTRAINT cpf_fk FOREIGN KEY (cpf) REFERENCES Pessoa(cpf)
);
