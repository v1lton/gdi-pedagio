-- povoamento pessoa
INSERT INTO Pessoa(cpf, nascimento, nome, sobrenome) VALUES ('1', to_date('18/06/1992', 'dd/mm/yy'),'Rogério', 'Gouveia');
INSERT INTO Pessoa(cpf, nascimento, nome, sobrenome) VALUES ('2', to_date('16/02/1999', 'dd/mm/yy'),'Fabricia', 'Galeão');
INSERT INTO Pessoa(cpf, nascimento, nome, sobrenome) VALUES ('3', to_date('01/12/1988', 'dd/mm/yy'),'Carla', 'Santos');
INSERT INTO Pessoa(cpf, nascimento, nome, sobrenome) VALUES ('4', to_date('17/09/1953', 'dd/mm/yy'),'Vitor', 'Cândido');
INSERT INTO Pessoa(cpf, nascimento, nome, sobrenome) VALUES ('5', to_date('30/03/1974', 'dd/mm/yy'),'Socorro', 'Antunes');
INSERT INTO Pessoa(cpf, nascimento, nome, sobrenome) VALUES ('6', to_date('31/12/2000', 'dd/mm/yy'),'Samuel', 'Fernandes');
INSERT INTO Pessoa(cpf, nascimento, nome, sobrenome) VALUES ('7', to_date('12/04/1993', 'dd/mm/yy'),'Kallyne', 'Andrade');
INSERT INTO Pessoa(cpf, nascimento, nome, sobrenome) VALUES ('8', to_date('07/08/1969', 'dd/mm/yy'),'Maria', 'Dantas');
INSERT INTO Pessoa(cpf, nascimento, nome, sobrenome) VALUES ('9', to_date('01/01/2001', 'dd/mm/yy'),'Eduarda', 'Silva');
INSERT INTO Pessoa(cpf, nascimento, nome, sobrenome) VALUES ('10', to_date('10/06/1992', 'dd/mm/yy'),'Felipe', 'Santos');
INSERT INTO Pessoa(cpf, nascimento, nome, sobrenome) VALUES ('11', to_date('08/01/1988', 'dd/mm/yy'),'João', 'Oliveira');
INSERT INTO Pessoa(cpf, nascimento, nome, sobrenome) VALUES ('12', to_date('12/12/1970', 'dd/mm/yy'),'Regina', 'Correa');
INSERT INTO Pessoa(cpf, nascimento, nome, sobrenome) VALUES ('13', to_date('28/05/1966', 'dd/mm/yy'),'Celso', 'Straub');

-- povoamento funcionario
INSERT INTO Funcionario(cpf, cpf_supervisor, cargo, salario) VALUES ('1', '1', 'gerente', '12000');
INSERT INTO Funcionario(cpf, cpf_supervisor, cargo, salario) VALUES ('3', '1', 'coordenador', '7000');
INSERT INTO Funcionario(cpf, cpf_supervisor, cargo, salario) VALUES ('2', '3', 'analista', '4500');
INSERT INTO Funcionario(cpf, cpf_supervisor, cargo, salario) VALUES ('11', '3', 'analista', '4500');
INSERT INTO Funcionario(cpf, cpf_supervisor, cargo, salario) VALUES ('13', '1', 'mecanico', '5500');

--povoamento cliente
INSERT INTO Cliente(cpf) VALUES ('1');
INSERT INTO Cliente(cpf) VALUES ('2');
INSERT INTO Cliente(cpf) VALUES ('4');
INSERT INTO Cliente(cpf) VALUES ('5');
INSERT INTO Cliente(cpf) VALUES ('6');
INSERT INTO Cliente(cpf) VALUES ('7');
INSERT INTO Cliente(cpf) VALUES ('8');
INSERT INTO Cliente(cpf) VALUES ('9');
INSERT INTO Cliente(cpf) VALUES ('10');
INSERT INTO Cliente(cpf) VALUES ('12');
INSERT INTO Cliente(cpf) VALUES ('13');

select * from (Pessoa);
select * from (Funcionario);
select * from (Cliente);
