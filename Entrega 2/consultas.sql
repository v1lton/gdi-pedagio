-- Consulta tabela Cliente com Varray
SELECT cpf, nome, sobrenome, T.*
FROM tb_cliente C, TABLE(C.telefone) T;

-- Consulta tabela Veiculo
SELECT DEREF(C.cpf_cliente).cpf AS Cliente, placa, tipo FROM tb_veiculo C;

-- Consulta tabela Desconto
SELECT codigo, porcentagem FROM tb_desconto;

-- Consulta tabela Pedagio
SELECT nome, endereco, quant_cancelas FROM tb_pedagio;

-- Consulta Nested Table Cancela
SELECT * FROM TABLE(SELECT P.cancelas FROM tb_pedagio P WHERE P.endereco = 'Rua Amelia 65');

-- Consulta tabela Funcionario
SELECT cpf, nome, sobrenome, cargo, salario, DEREF(P.endereco).endereco AS Pedagio FROM tb_funcionario P;

-- Consulta tabela Monitora
SELECT DEREF(F.cpf_funcionario).cpf AS Funcionario, DEREF(F.endereco).endereco AS Pedagio, num_cancela, inicio_monitoramento, fim_monitoramento FROM tb_monitora F;

-- Consulta tabela Pagamento
SELECT DEREF(C.cpf_cliente).cpf AS Cliente, 
DEREF(C.placa_veiculo).placa AS Veiculo, 
DEREF(C.endereco).endereco AS Pedagio, num_cancela, 
DEREF(C.codigo_desconto).codigo AS Desconto, 
data_pagamento, forma_pagamento FROM tb_pagamento C;
