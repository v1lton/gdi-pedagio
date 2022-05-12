-- SETANDO O HORÁRIO CORRETINHO -----
ALTER SESSION SET NLS_TIMESTAMP_FORMAT='DD-MON-YY HH24:MI';
/
-- CRIANDO SEQUÊNCIA PRA ID DE DESCONTO -----
CREATE SEQUENCE codigo INCREMENT by 1 START WITH 1;
/

-- POVOAMENTO CLIENTE

INSERT INTO tb_cliente VALUES (

    tp_cliente(
        '001',
        to_date('18/06/1992', 'dd/mm/yy'),
        'Rogério', 
        'Gouveia',
        tp_varray_telefone(tp_telefone('81900000001'), tp_telefone('81900000011')),
        'Recife-PE'
    )

);

/

INSERT INTO tb_cliente VALUES (

    tp_cliente(
        '002',
        to_date('16/02/1999', 'dd/mm/yy'),
        'Fabricia',
        'Galeão',
        tp_varray_telefone(tp_telefone('81900000002')),
        'Recife-PE'
    )

);

/

INSERT INTO tb_cliente VALUES (

    tp_cliente(
        '005',
        to_date('30/03/1974', 'dd/mm/yy'),
        'Socorro', 
        'Antunes',
        tp_varray_telefone(tp_telefone('81900000005')),
        'Recife-PE'
    )

);

-- VEICULO

INSERT INTO tb_veiculo VALUES (
    tp_veiculo(
        (SELECT REF(R) FROM tb_cliente R WHERE R.cpf = '001'),
        'AAA1234',
        'pessoal'
    )
);

/

INSERT INTO tb_veiculo VALUES (
    tp_veiculo(
        (SELECT REF(R) FROM tb_cliente R WHERE R.cpf = '005'),
        'BBB2021',
        'pessoal'
    )
);

/

-- DESCONTO

INSERT INTO tb_desconto VALUES (
    tp_desconto(
        '10',
        codigo.NEXTVAL,
        (SELECT REF(R) FROM tb_cliente R WHERE R.cpf = '001')
    )
);

/

INSERT INTO tb_desconto VALUES (
    tp_desconto(
        '10',
        codigo.NEXTVAL,
        (SELECT REF(R) FROM tb_cliente R WHERE R.cpf = '005')
    )
);

/

-- Povoamento de tb_pedagio e tp_nt_cancela
INSERT INTO tb_pedagio VALUES (
    tp_pedagio(
        'Valerium',
        'Rua Amelia 65',
        '3',
        tp_nt_cancelas(
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

-- POVOAMENTO FUNCIONÁRIO

INSERT INTO tb_funcionario VALUES (

    tp_funcionario(
        '001',
        to_date('18/06/1992', 'dd/mm/yy'),
        'Rogerio', 
        'Gouveia',
        tp_varray_telefone(tp_telefone('81900001'), tp_telefone('81900011')),
        'Recife-PE',
        NULL,
        (SELECT REF(E) FROM tb_pedagio E WHERE E.endereco = 'Rua Amelia 65'),
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
        tp_varray_telefone(tp_telefone('81900000006')),
        'Recife-PE',
        (SELECT REF(E) FROM tb_funcionario E WHERE E.cpf = '001'), 
        (SELECT REF(E) FROM tb_pedagio E WHERE E.endereco = 'Rua Amelia 65'),
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
        tp_varray_telefone(tp_telefone('81900000007')),
        'Recife-PE',
        (SELECT REF(E) FROM tb_funcionario E WHERE E.cpf = '001'), 
        (SELECT REF(E) FROM tb_pedagio E WHERE E.endereco = 'Rua Amelia 65'),
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
        tp_varray_telefone(tp_telefone('81900000010')),
        'Recife-PE',
        (SELECT REF(E) FROM tb_funcionario E WHERE E.cpf = '001'), 
        (SELECT REF(E) FROM tb_pedagio E WHERE E.endereco = 'Rua Amelia 65'),
        'atendente', 
        '1500'
    )

);

/
/*
INSERT INTO tb_funcionario VALUES (

    tp_funcionario(
        '011', 
        to_date('08/01/1988', 'dd/mm/yy'),
        'João', 
        'Oliveira',
        tp_varray_telefone(tp_telefone('81900000111')),
        'Recife-PE',
        (SELECT REF(E) FROM tb_funcionario E WHERE E.cpf = '001'), 
        (SELECT REF(E) FROM tb_pedagio E WHERE E.endereco = 'Rua Amelia 65'),
        'atendente', 
        '1500'
    )

);*/

/

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
        TIMESTAMP '2022-08-10 08:00:01',
        TIMESTAMP '2022-08-10 17:00:01'
    )
);

/

INSERT INTO tb_monitora VALUES (
    tp_monitora(
        (SELECT REF(F) FROM tb_funcionario F WHERE F.cpf = '007'),
        (SELECT REF(E) FROM tb_pedagio E WHERE E.endereco = 'Rua Amelia 65'),
        '3',
        TIMESTAMP '2022-09-10 08:00:02',
        TIMESTAMP '2022-09-10 17:00:02'
    )
);

/

-- PAGAMENTO

INSERT INTO tb_pagamento VALUES (
    tp_pagamento(
        (SELECT REF(C) FROM tb_cliente C WHERE C.cpf = '001'),
        (SELECT REF(V) FROM tb_veiculo V WHERE V.placa = 'AAA1234'),
        (SELECT REF(P) FROM tb_pedagio P WHERE P.endereco = 'Rua Amelia 65'),
        (SELECT num_cancela FROM TABLE(SELECT P.cancelas FROM tb_pedagio P WHERE P.endereco = 'Rua Amelia 65') WHERE num_cancela = 1), 
        (SELECT REF(D) FROM tb_desconto D WHERE D.codigo = '2'),
        TIMESTAMP '2022-08-10 12:23:37', 
        'dinheiro'
    )
);

/

INSERT INTO tb_pagamento VALUES (
    tp_pagamento(
        (SELECT REF(C) FROM tb_cliente C WHERE C.cpf = '005'),
        (SELECT REF(V) FROM tb_veiculo V WHERE V.placa = 'BBB2021'),
        (SELECT REF(P) FROM tb_pedagio P WHERE P.endereco = 'Rua Amelia 65'),
        (SELECT num_cancela FROM TABLE(SELECT P.cancelas FROM tb_pedagio P WHERE P.endereco = 'Rua Amelia 65') WHERE num_cancela = 3),
        (SELECT REF(D) FROM tb_desconto D WHERE D.codigo = '1'),
        TIMESTAMP '2022-10-08 11:55:32', 
        'PIX'
    )
);



