--povoamento pessoa
INSERT INTO Pessoa(cpf, nascimento, nome, sobrenome) VALUES ('001', to_date('18/06/1992', 'dd/mm/yy'),'Rogério', 'Gouveia');
INSERT INTO Pessoa(cpf, nascimento, nome, sobrenome) VALUES ('002', to_date('16/02/1999', 'dd/mm/yy'),'Fabricia', 'Galeão');
INSERT INTO Pessoa(cpf, nascimento, nome, sobrenome) VALUES ('003', to_date('01/12/1988', 'dd/mm/yy'),'Carla', 'Santos');
INSERT INTO Pessoa(cpf, nascimento, nome, sobrenome) VALUES ('004', to_date('17/09/1953', 'dd/mm/yy'),'Vitor', 'Cândido');
INSERT INTO Pessoa(cpf, nascimento, nome, sobrenome) VALUES ('005', to_date('30/03/1974', 'dd/mm/yy'),'Socorro', 'Antunes');
INSERT INTO Pessoa(cpf, nascimento, nome, sobrenome) VALUES ('006', to_date('31/12/2000', 'dd/mm/yy'),'Samuel', 'Fernandes');
INSERT INTO Pessoa(cpf, nascimento, nome, sobrenome) VALUES ('007', to_date('12/04/1993', 'dd/mm/yy'),'James', 'Bond');
INSERT INTO Pessoa(cpf, nascimento, nome, sobrenome) VALUES ('008', to_date('07/08/1969', 'dd/mm/yy'),'Maria', 'Dantas');
INSERT INTO Pessoa(cpf, nascimento, nome, sobrenome) VALUES ('009', to_date('01/01/2001', 'dd/mm/yy'),'Renato', 'Marcelino');
INSERT INTO Pessoa(cpf, nascimento, nome, sobrenome) VALUES ('010', to_date('10/06/1992', 'dd/mm/yy'),'Felipe', 'Santos');
INSERT INTO Pessoa(cpf, nascimento, nome, sobrenome) VALUES ('011', to_date('08/01/1988', 'dd/mm/yy'),'João', 'Oliveira');
INSERT INTO Pessoa(cpf, nascimento, nome, sobrenome) VALUES ('012', to_date('12/12/1970', 'dd/mm/yy'),'Regina', 'Correa');
INSERT INTO Pessoa(cpf, nascimento, nome, sobrenome) VALUES ('013', to_date('28/05/1966', 'dd/mm/yy'),'Celso', 'Straub');
INSERT INTO Pessoa(cpf, nascimento, nome, sobrenome) VALUES ('014', to_date('08/08/1998', 'dd/mm/yy'),'Shawn', 'Mendes');
INSERT INTO Pessoa(cpf, nascimento, nome, sobrenome) VALUES ('015', to_date('23/05/1985', 'dd/mm/yy'),'Will', 'Smith');


-- povoamento funcionario
INSERT INTO Funcionario(cpf, cpf_supervisor, cargo, salario) VALUES ('001', '001', 'gerente', '12000');
INSERT INTO Funcionario(cpf, cpf_supervisor, cargo, salario) VALUES ('006', '001', 'coordenador', '7000');
INSERT INTO Funcionario(cpf, cpf_supervisor, cargo, salario) VALUES ('007', '006', 'atendente', '1500');
INSERT INTO Funcionario(cpf, cpf_supervisor, cargo, salario) VALUES ('010', '006', 'atendente', '1500');
INSERT INTO Funcionario(cpf, cpf_supervisor, cargo, salario) VALUES ('011', '006', 'atendente', '1500');
INSERT INTO Funcionario(cpf, cpf_supervisor, cargo, salario) VALUES ('012', '001', 'mecanico', '3000');
INSERT INTO Funcionario(cpf, cpf_supervisor, cargo, salario) VALUES ('013', '001', 'rh', '3000');

--povoamento cliente
INSERT INTO Cliente(cpf) VALUES ('001');
INSERT INTO Cliente(cpf) VALUES ('002');
INSERT INTO Cliente(cpf) VALUES ('003');
INSERT INTO Cliente(cpf) VALUES ('004');
INSERT INTO Cliente(cpf) VALUES ('005');
INSERT INTO Cliente(cpf) VALUES ('007');
INSERT INTO Cliente(cpf) VALUES ('008');
INSERT INTO Cliente(cpf) VALUES ('009');
INSERT INTO Cliente(cpf) VALUES ('010');
INSERT INTO Cliente(cpf) VALUES ('012');
INSERT INTO Cliente(cpf) VALUES ('013');

--povoamento veiculo
INSERT INTO Veiculo(placa, tipo, cpf_cliente) VALUES ('AAA1234', 'pessoal', '001');
INSERT INTO Veiculo(placa, tipo, cpf_cliente) VALUES ('BBB2021', 'coletivo', '005');
INSERT INTO Veiculo(placa, tipo, cpf_cliente) VALUES ('CCC4321', 'pessoal', '012');
INSERT INTO Veiculo(placa, tipo, cpf_cliente) VALUES ('DDD0810', 'coletivo', '007');
INSERT INTO Veiculo(placa, tipo, cpf_cliente) VALUES ('TCC2022', 'pessoal', '002');
INSERT INTO Veiculo(placa, tipo, cpf_cliente) VALUES ('TAT4505', 'pessoal', '009');

--povoamento pedágio
INSERT INTO Pedagio(nome, endereco, quant_cancelas) VALUES ('Valerium', 'Rua Amelia 65', '3');

--povoamento telefones
INSERT INTO Telefones(cpf, num_telefone) VALUES ('001', '81900000001');
INSERT INTO Telefones(cpf, num_telefone) VALUES ('001', '81900000011');
INSERT INTO Telefones(cpf, num_telefone) VALUES ('002', '81900000002');
INSERT INTO Telefones(cpf, num_telefone) VALUES ('003', '81900000003');
INSERT INTO Telefones(cpf, num_telefone) VALUES ('004', '81900000004');
INSERT INTO Telefones(cpf, num_telefone) VALUES ('005', '81900000005');
INSERT INTO Telefones(cpf, num_telefone) VALUES ('006', '81900000006');
INSERT INTO Telefones(cpf, num_telefone) VALUES ('007', '81900000007');
INSERT INTO Telefones(cpf, num_telefone) VALUES ('008', '81900000008');
INSERT INTO Telefones(cpf, num_telefone) VALUES ('009', '79900000009');
INSERT INTO Telefones(cpf, num_telefone) VALUES ('009', '79900000099');
INSERT INTO Telefones(cpf, num_telefone) VALUES ('010', '81900000010');
INSERT INTO Telefones(cpf, num_telefone) VALUES ('011', '81900000111');
INSERT INTO Telefones(cpf, num_telefone) VALUES ('012', '81900000012');
INSERT INTO Telefones(cpf, num_telefone) VALUES ('013', '81900000013');
INSERT INTO Telefones(cpf, num_telefone) VALUES ('014', '81900000014');
INSERT INTO Telefones(cpf, num_telefone) VALUES ('015', '81900000015');

--povoamento cancelas
INSERT INTO Cancela(endereco, num_cancela, cpf_funcionario, preco_tarifa, data_manutencao, status, tipo_veiculo) VALUES ('Rua Amelia 65', '1', '007', '5', to_date('30/04/2022', 'dd/mm/yy'), 'ativada', 'pessoal'); 
INSERT INTO Cancela(endereco, num_cancela, cpf_funcionario, preco_tarifa, data_manutencao, status, tipo_veiculo) VALUES ('Rua Amelia 65', '2', '010', '5', to_date('31/03/2022', 'dd/mm/yy'), 'desativada', 'pessoal'); 
INSERT INTO Cancela(endereco, num_cancela, cpf_funcionario, preco_tarifa, data_manutencao, status, tipo_veiculo) VALUES ('Rua Amelia 65', '3', '011', '10', to_date('31/05/2022', 'dd/mm/yy'), 'ativada', 'coletivo'); 

--povoamento monitora
INSERT INTO Monitora(cpf_funcionario, endereco, num_cancela, inicio_monitoramento, fim_monitoramento) VALUES ('007', 'Rua Amelia 65', '1', TIMESTAMP '2022-08-10 08:00:00', TIMESTAMP '2022-08-10 17:00:00');
INSERT INTO Monitora(cpf_funcionario, endereco, num_cancela, inicio_monitoramento, fim_monitoramento) VALUES ('010', 'Rua Amelia 65', '2', TIMESTAMP '2022-08-10 08:00:00', TIMESTAMP '2022-08-10 17:00:00');
INSERT INTO Monitora(cpf_funcionario, endereco, num_cancela, inicio_monitoramento, fim_monitoramento) VALUES ('011', 'Rua Amelia 65', '3', TIMESTAMP '2022-08-10 08:00:00', TIMESTAMP '2022-08-10 17:00:00');
INSERT INTO Monitora(cpf_funcionario, endereco, num_cancela, inicio_monitoramento, fim_monitoramento) VALUES ('010', 'Rua Amelia 65', '1', TIMESTAMP '2022-09-10 08:00:00', TIMESTAMP '2022-09-10 17:00:00');
INSERT INTO Monitora(cpf_funcionario, endereco, num_cancela, inicio_monitoramento, fim_monitoramento) VALUES ('011', 'Rua Amelia 65', '2', TIMESTAMP '2022-09-10 08:00:00', TIMESTAMP '2022-09-10 17:00:00');
INSERT INTO Monitora(cpf_funcionario, endereco, num_cancela, inicio_monitoramento, fim_monitoramento) VALUES ('007', 'Rua Amelia 65', '3', TIMESTAMP '2022-09-10 08:00:00', TIMESTAMP '2022-09-10 17:00:00');

--povoamento desconto
CREATE SEQUENCE codigo INCREMENT by 1 START WITH 1;

INSERT INTO Desconto(porcentagem, codigo, cpf_cliente) VALUES ('10', codigo.NEXTVAL, '008');
INSERT INTO Desconto(porcentagem, codigo, cpf_cliente) VALUES ('99', codigo.NEXTVAL, '001');
INSERT INTO Desconto(porcentagem, codigo, cpf_cliente) VALUES ('30', codigo.NEXTVAL, '007');
INSERT INTO Desconto(porcentagem, codigo, cpf_cliente) VALUES ('20', codigo.NEXTVAL, '009');

--povoamento pagamento  
INSERT INTO Pagamento(cpf_cliente, placa_veiculo, endereco, num_cancela, codigo_desconto, data_pagamento, forma_pagamento) VALUES ('001', 'AAA1234', 'Rua Amelia 65', '1', '2', TIMESTAMP '2022-08-10 12:23:37', 'dinheiro');
INSERT INTO Pagamento(cpf_cliente, placa_veiculo, endereco, num_cancela, codigo_desconto, data_pagamento, forma_pagamento) VALUES ('001', 'AAA1234', 'Rua Amelia 65', '1', '',  TIMESTAMP '2022-08-10 13:23:37', 'debito');
INSERT INTO Pagamento(cpf_cliente, placa_veiculo, endereco, num_cancela, codigo_desconto, data_pagamento, forma_pagamento) VALUES ('007', 'DDD0810', 'Rua Amelia 65', '3', '3', TIMESTAMP '2022-12-12 13:12:23', 'PIX');
INSERT INTO Pagamento(cpf_cliente, placa_veiculo, endereco, num_cancela, codigo_desconto, data_pagamento, forma_pagamento) VALUES ('002', 'TCC2022', 'Rua Amelia 65', '1', '', TIMESTAMP '2022-01-05 11:22:44', 'credito');
INSERT INTO Pagamento(cpf_cliente, placa_veiculo, endereco, num_cancela, codigo_desconto, data_pagamento, forma_pagamento) VALUES ('009', 'TAT4505', 'Rua Amelia 65', '2', '4', TIMESTAMP '2022-12-11 22:00:22', 'debito');
INSERT INTO Pagamento(cpf_cliente, placa_veiculo, endereco, num_cancela, codigo_desconto, data_pagamento, forma_pagamento) VALUES ('005', 'BBB2021', 'Rua Amelia 65', '3', '1', TIMESTAMP '2022-10-08 11:55:32', 'PIX');
