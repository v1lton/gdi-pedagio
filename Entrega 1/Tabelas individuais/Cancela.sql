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
