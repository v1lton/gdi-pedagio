CREATE TABLE Veiculo (
    placa VARCHAR2(7) NOT NULL,
    tipo VARCHAR2(255) NOT NULL,
    cpf_cliente VARCHAR2(11) NOT NULL,
    CONSTRAINT veiculo_pk PRIMARY KEY (placa),
    CONSTRAINT veiculo_fk FOREIGN KEY (cpf_cliente) REFERENCES Cliente(cpf)
);
