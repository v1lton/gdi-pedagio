CREATE TABLE Pagamento (
    cpf_cliente VARCHAR2(11) NOT NULL,
    placa_veiculo VARCHAR2(7) NOT NULL,
    endereco VARCHAR2(255) NOT NULL,
    num_cancela NUMBER NOT NULL,
    codigo_desconto NUMBER,
    data_pagamento TIMESTAMP NOT NULL,
    forma_pagamento VARCHAR2(255) NOT NULL,
    CONSTRAINT pagamento_pk PRIMARY KEY (cpf_cliente, placa_veiculo, endereco, num_cancela),
    CONSTRAINT pagamento_fkey1 FOREIGN KEY (endereco, num_cancela) REFERENCES Cancela(endereco, num_cancela),
    CONSTRAINT pagamento_fkey2 FOREIGN KEY (codigo_desconto) REFERENCES Desconto(codigo),
    CONSTRAINT pagamento_fkey3 FOREIGN KEY (cpf_cliente) REFERENCES Cliente(cpf),
    CONSTRAINT pagamento_fkey4 FOREIGN KEY (placa_veiculo) REFERENCES Veiculo(placa)
);
