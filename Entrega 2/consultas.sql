-- Consulta tabela Cliente com Varray
SELECT cpf, nome, sobrenome, T.*
FROM tb_cliente C, TABLE(C.telefone) T;

/

-- Consulta tabela Veiculo
SELECT DEREF(C.cpf_cliente).cpf AS Cliente, placa, tipo FROM tb_veiculo C;

/

-- Consulta tabela Desconto
SELECT codigo, porcentagem FROM tb_desconto;

/

-- Consulta tabela Pedagio
SELECT nome, endereco, quant_cancelas FROM tb_pedagio;

/

-- Consulta Nested Table Cancela
SELECT * FROM TABLE(SELECT P.cancelas FROM tb_pedagio P WHERE P.endereco = 'Rua Amelia 65');

/

-- Consulta tabela Funcionario
SELECT cpf, nome, sobrenome, cargo, salario, DEREF(P.endereco).endereco AS Pedagio FROM tb_funcionario P;

/

-- Consulta tabela Monitora
SELECT DEREF(F.cpf_funcionario).cpf AS Funcionario, DEREF(F.endereco).endereco AS Pedagio, num_cancela, inicio_monitoramento, fim_monitoramento FROM tb_monitora F;

/

-- Consulta tabela Pagamento
SELECT DEREF(C.cpf_cliente).cpf AS Cliente, 
DEREF(C.placa_veiculo).placa AS Veiculo, 
DEREF(C.endereco).endereco AS Pedagio, num_cancela, 
DEREF(C.codigo_desconto).codigo AS Desconto, 
data_pagamento, forma_pagamento FROM tb_pagamento C;

/* -- Member function
SELECT S.salarioAnual() FROM tb_funcionario S WHERE S.cpf = '001';

----- ORDER MEMBER FUNCTION -----
DECLARE 
    aux NUMBER;
    cupom1 tp_desconto;
    cupom2 tp_desconto;
BEGIN
    SELECT VALUE(C) INTO cupom1 FROM tb_desconto C WHERE codigo = 1;
    SELECT VALUE(C) INTO cupom2 FROM tb_desconto C WHERE codigo = 2;
    aux := cupom1.comparaDesconto(cupom2);
    IF aux = 1 THEN
        DBMS_OUTPUT.PUT_LINE('Desconto do cupom ' || TO_CHAR(cupom1.codigo) 
                    || ' é maior que o desconto do cupom ' || TO_CHAR(cupom2.codigo));
        DBMS_OUTPUT.PUT_LINE('Cupom de codigo ' || TO_CHAR(cupom1.codigo) || ' possui desconto de ' 
                    || TO_CHAR(cupom1.porcentagem) || ' reais, enquanto '
                    || TO_CHAR(cupom2.codigo) || ' tem desconto de ' || TO_CHAR(cupom2.porcentagem) || ' reais.');
    ELSIF aux = -1 THEN 
        DBMS_OUTPUT.PUT_LINE('Desconto do cupom ' || TO_CHAR(cupom2.codigo) 
                    || ' é maior que o desconto do cupom ' || TO_CHAR(cupom1.codigo));
        DBMS_OUTPUT.PUT_LINE('Cupom de codigo ' || TO_CHAR(cupom2.codigo) || ' possui desconto de ' 
                    || TO_CHAR(cupom2.porcentagem) || ' reais, enquanto o cupom de id '
                    || TO_CHAR(cupom1.codigo) || ' tem desconto de ' || TO_CHAR(cupom1.porcentagem) || ' reais.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Ambos possuem o mesmo desconto.');
        DBMS_OUTPUT.PUT_LINE('O desconto é de: ' || TO_CHAR(cupom1.porcentagem) || ' reais');
    END IF;
END; */

