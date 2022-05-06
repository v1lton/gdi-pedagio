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
