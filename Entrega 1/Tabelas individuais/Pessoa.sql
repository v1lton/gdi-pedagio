CREATE TABLE Pessoa (
    cpf VARCHAR2(11) NOT NULL,
    nascimento DATE NOT NULL,
    nome VARCHAR2(255) NOT NULL,
    sobrenome VARCHAR2(255) NOT NULL,
    CONSTRAINT pessoa_pkey PRIMARY KEY (cpf)
);
