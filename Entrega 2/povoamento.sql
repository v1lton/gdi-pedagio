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
-- PAGAMENTO

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
