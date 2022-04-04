/*Alter Table: 
Adicionar um check para que um deconto seja, no máximo, de 100% */
ALTER TABLE Desconto
ADD CHECK (codigo<=100);    

/*Create index:
Colocar um índice nos atributos cliente e desconto do 
respectivo pagamento, para agilizar a busca */
CREATE INDEX indice_desconto ON Pagamento(cpf_cliente, codigo_desconto);

/*Insert into: 
Pedágio abriu uma nova cancela, portanto vamos adicioná-la à tabela */
INSERT INTO Cancela(endereco, num_cancela, preco_tarifa, data_manutencao, status, tipo_veiculo) VALUES ('Rua Amelia 65', '4', '5', to_date('02/06/2022', 'dd/mm/yy'), 'ativada', 'pessoal'); 

/*Update:
Atendentes recebem aumento, então vamos atualizar o valor do salário */
UPDATE Funcionario
SET salario = 1700
WHERE cargo = 'atendente';

/*Delete:
Um dos telefones do gerente não é mais válido, então vamos tirá-lo da tabela */
DELETE FROM Telefones
WHERE (cpf = 001 AND telefone = 81900000011);

/*Select from where:
Selecionar o cpf dos clientes que usaram pix como forma de pagamento */
SELECT cpf_cliente
FROM Pagamento
WHERE forma_pagamento = 'PIX';

/*Between:
Selecionar o cpf dos clientes que fizeram pagamento no mês de abril */
--ou cancelas que precisam ed manutenção em algum mês
SELECT cpf_cliente
FROM Pagamento
WHERE data_pagamento Between ('01-AGO-2022 00:00') AND ('30-AGO-2022 23:59');

/*In:
Selecionar cpf dos funcionários que têm salário 1500 ou 3000 */
SELECT cpf_funcionario
FROM Funcionario
WHERE salario IN ('1500', '3000');

/*Like:
Selecionar todas as pessoas (nome e cpf) cadastradas que tem nome começando pela letra  R*/
SELECT nome, cpf 
FROM Pessoa 
WHERE nome Like 'R%'; 

/*Is null ou is not null:
Selecionar o cpf dos clientes que usaram desconto no pagamento */
SELECT cpf_cliente
FROM Pagamento
WHERE codigo_desconto IS NOT NULL;

/*Inner Join:
Selecionar clientes que também são funcionários */
SELECT C.cpf
FROM Cliente C 
INNER Join Funcionario F ON C.cpf = F.cpf; 

/*Max:
Selecionar o maior salário de funcionário */
SELECT Max(salario) FROM Funcionario;

/*Min:
Selecionar a menor porcentagem de desconto */
SELECT Min(porcentagem) FROM Desconto;

/*Max:
Selecionar a média dos valores das tarifas */
SELECT Avg(preco_tarifa) FROM Cancela;

/*Count:
Contabilizar os pagamentos onde não foi usado desconto */
SELECT COUNT(*) 
FROM Pagamento
WHERE codigo_desconto IS NULL;

/*Order by:
Listar toda a tabela de clientes, ordenada ascendentemente 
pelo nome (ordem alfabética de a-z)*/
SELECT * FROM Cliente ORDER BY nome;