-- SETANDO O HORÁRIO CORRETINHO -----
ALTER SESSION SET NLS_TIMESTAMP_FORMAT='DD-MON-YY HH24:MI';
/
-- CRIANDO SEQUÊNCIA PRA ID DE DESCONTO -----
CREATE SEQUENCE id INCREMENT by 1 START WITH 1;
/

-- CLIENTE
-- FUNCIONARIO
-- VEICULO
-- DESCONTO
-- CANCELA
-- PEDAGIO
-- MONITORA
INSERT INTO tb_monitora VALUES (
    tp_monitora(
        (SELECT REF(F) FROM tb_funcionario F WHERE F.cpf = '007'),
        (SELECT REF(E) FROM tb_pedagio E WHERE E.endereco = 'Rua Amelia 65'),
        '1',
        TIMESTAMP '2022-08-10 08:00:00',
        TIMESTAMP '2022-08-10 17:00:00'
    )
);
/
INSERT INTO tb_monitora VALUES (
    tp_monitora(
        (SELECT REF(F) FROM tb_funcionario F WHERE F.cpf = '010'),
        (SELECT REF(E) FROM tb_pedagio E WHERE E.endereco = 'Rua Amelia 65'),
        '2',
        TIMESTAMP '2022-08-10 08:00:00',
        TIMESTAMP '2022-08-10 17:00:00'
    )
);
/
INSERT INTO tb_monitora VALUES (
    tp_monitora(
        (SELECT REF(F) FROM tb_funcionario F WHERE F.cpf = '007'),
        (SELECT REF(E) FROM tb_pedagio E WHERE E.endereco = 'Rua Amelia 65'),
        '3',
        TIMESTAMP '2022-09-10 08:00:00',
        TIMESTAMP '2022-09-10 17:00:00'
    )
);
/
-- PAGAMENTO
INSERT INTO tb_pagamento VALUES (
    tp_pagamento(
        (SELECT REF(C) FROM tb_cliente C WHERE C.cpf = '001'),
        (SELECT REF(V) FROM tb_veiculo V WHERE V.placa = 'AAA1234'),
        (SELECT REF(P) FROM tb_pedagio P WHERE P.endereco = 'Rua Amelia 65'),
        '1', 
        (SELECT REF(D) FROM tb_desconto D WHERE D.codigo = '2'),
        TIMESTAMP '2022-08-10 12:23:37', 
        'dinheiro'
    )
);
/
INSERT INTO tb_pagamento VALUES (
    tp_pagamento(
        (SELECT REF(C) FROM tb_cliente C WHERE C.cpf = '05'),
        (SELECT REF(V) FROM tb_veiculo V WHERE V.placa = 'BBB2021'),
        (SELECT REF(P) FROM tb_pedagio P WHERE P.endereco = 'Rua Amelia 65'),
        '3', 
        (SELECT REF(D) FROM tb_desconto D WHERE D.codigo = '1'),
        TIMESTAMP '2022-10-08 11:55:32', 
        'PIX'
    )
);
/
-- Povoamento de tb_pedagio e tp_nt_cancela
INSERT INTO tb_pedagio VALUES (
    tp_pedagio(
        'Valerium',
        'Rua das Ninfas, número 70',
        '3',
        tp_nt_cancela(
            tp_cancela(
                1,
                5.50,
                to_date('05/12/2020', 'dd/mm/yy'),
                'ativa',
                'pessoal'
            ),
            tp_cancela(
                2,
                7.50,
                to_date('05/12/2020', 'dd/mm/yy'),
                'desativada',
                'coletivo'
            ),
            tp_cancela(
                3,
                5.50,
                to_date('05/12/2020', 'dd/mm/yy'),
                'ativa',
                'pessoal'
            )
        )
    )
);

/

-- POVOAMENTO CLIENTE

INSERT INTO tb_cliente VALUES (

    tp_cliente(
        '001',
        to_date('18/06/1992', 'dd/mm/yy'),
        'Rogério', 
        'Gouveia',
        tp_arr_telefone(tp_telefone('81900000001'), tp_telefone('81900000011')),
        'Recife-PE'
    )

);

/

INSERT INTO tb_cliente VALUES (

    tp_cliente(
        '002',
        to_date('16/02/1999', 'dd/mm/yy'),
        'Fabricia',
        'Galeão'
        tp_arr_telefone(tp_telefone('81900000002')),
        'Recife-PE'
    )

);

/

INSERT INTO tb_cliente VALUES (

    tp_cliente(
        '005',
        to_date('30/03/1974', 'dd/mm/yy'),
        'Socorro', 
        'Antunes'
        tp_arr_telefone(tp_telefone('81900000005')),
        'Recife-PE'
    )

);

/

-- POVOAMENTO FUNCIONÁRIO

INSERT INTO tb_funcionario VALUES (

    tp_funcionario(
        '001',
        to_date('18/06/1992', 'dd/mm/yy'),
        'Rogério', 
        'Gouveia',
        tp_arr_telefone(tp_telefone('81900000001'), tp_telefone('81900000011'))
        'Recife-PE',
        '001', 
        SELECT REF(E) FROM tb_pedagio WHERE E.endereco = 'Rua Amelia 65',
        'gerente', 
        '12000'
    )

);

/

INSERT INTO tb_funcionario VALUES (

    tp_funcionario(
        '006', 
        to_date('31/12/2000', 'dd/mm/yy'),
        'Samuel', 
        'Fernandes',
        tp_arr_telefone(tp_telefone('81900000006')),
        'Recife-PE',
        '001', 
        SELECT REF(E) FROM tb_pedagio WHERE E.endereco = 'Rua Amelia 65',
        'coordenador', 
        '7000'
    )

);

/

INSERT INTO tb_funcionario VALUES (

    tp_funcionario(
        '007', 
        to_date('12/04/1993', 'dd/mm/yy'),
        'James', 
        'Bond',
        tp_arr_telefone(tp_telefone('81900000007')),
        'Recife-PE',
        '006', 
        SELECT REF(E) FROM tb_pedagio WHERE E.endereco = 'Rua Amelia 65',
        'atendente', 
        '1500'
    )

);

/

INSERT INTO tb_funcionario VALUES (

    tp_funcionario(
        '010', 
        to_date('10/06/1992', 'dd/mm/yy'),
        'Felipe', 
        'Santos',
        tp_arr_telefone(tp_telefone('81900000010')),
        'Recife-PE',
        '006', 
        SELECT REF(E) FROM tb_pedagio WHERE E.endereco = 'Rua Amelia 65',
        'atendente', 
        '1500'
    )

);

/

INSERT INTO tb_funcionario VALUES (

    tp_funcionario(
        '011', 
        to_date('08/01/1988', 'dd/mm/yy'),
        'João', 
        'Oliveira',
        tp_arr_telefone(tp_telefone('81900000111')),
        'Recife-PE',
        '006', 
        SELECT REF(E) FROM tb_pedagio WHERE E.endereco = 'Rua Amelia 65',
        'atendente', 
        '1500'
    )

);

/
