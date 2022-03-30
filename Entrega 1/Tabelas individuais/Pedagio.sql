CREATE TABLE Pedagio (
    nome VARCHAR2(255) NOT NULL,
    endereco VARCHAR2(255) NOT NULL,
    quant_cancelas NUMBER NOT NULL CHECK (quant_cancelas > 0),
    CONSTRAINT pedagio_pk PRIMARY KEY (endereco)
);
