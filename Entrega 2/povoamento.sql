-- SETANDO O HORÁRIO CORRETINHO -----
ALTER SESSION SET NLS_TIMESTAMP_FORMAT='DD-MON-YY HH24:MI';
/
-- CRIANDO SEQUÊNCIA PRA ID DE DESCONTO -----
CREATE SEQUENCE id INCREMENT by 1 START WITH 1;
/

-- CLIENTE
-- FUNCIONARIO
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
-- CANCELA
-- PEDAGIO
-- MONITORA
-- PAGAMENTO