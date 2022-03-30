CREATE TABLE Monitora (
	cpf_funcionario VARCHAR2(11) NOT NULL,
	endereco VARCHAR2(255) NOT NULL,
	num_cancela NUMBER NOT NULL,
	inicio_monitoramento TIMESTAMP,
	fim_monitoramento TIMESTAMP,
	CONSTRAINT monitora_pk PRIMARY KEY (cpf_funcionario, endereco, num_cancela),
	CONSTRAINT monitora_fk1  FOREIGN KEY (cpf_funcionario) REFERENCES  Funcionario(cpf),
	CONSTRAINT monitora_fk2  FOREIGN KEY (endereco, num_cancela) REFERENCES Cancela(endereco, num_cancela)
);
