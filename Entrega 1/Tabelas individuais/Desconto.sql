CREATE TABLE Desconto (
    porcentagem NUMBER NOT NULL,
    codigo NUMBER NOT NULL,
    cpf_cliente VARCHAR2(11) NOT NULL,
    CONSTRAINT desconto_pk PRIMARY KEY (codigo),
    CONSTRAINT desconto_fkey FOREIGN KEY (cpf_cliente) REFERENCES Cliente(cpf)
);
