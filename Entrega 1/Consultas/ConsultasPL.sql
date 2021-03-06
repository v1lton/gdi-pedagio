/*USO DE RECORD:
Insere uma nova pessoa utilizando o metodo Record na tabela de Pessoa*/
<<record_block>>
DECLARE 
    TYPE pessoa IS RECORD (
        cpf VARCHAR2(11),
        nascimento DATE,
        nome VARCHAR2(255),
        sobrenome VARCHAR2(255));
        nova_pessoa pessoa;
BEGIN 
    nova_pessoa.cpf := '016';
    nova_pessoa.nascimento := to_date('20/02/2002', 'dd/mm/yy');
    nova_pessoa.nome := 'Adonis';
    nova_pessoa.sobrenome := 'Creed';
    INSERT INTO Pessoa VALUES nova_pessoa;
END record_block;

/*USO DE ESTRUTURA DE DADOS DO TIPO TABLE, %TYPE, FOR IN LOOP:
Faz uma lista de coluna única das placas dos veiculos cadastrados nos pedagios, usando o %TYPE 
para referenciar e o FOR IN LOOP para lista-las. */
<<placas_veiculos_block>>
DECLARE 
    TYPE placa_veiculos IS TABLE OF Veiculo.placa%TYPE
    INDEX BY BINARY_INTEGER;
    placas_veiculos_table placa_veiculos;
    i BINARY_INTEGER;
BEGIN   
    i := 1;
    FOR current_row IN (SELECT placa FROM Veiculo) LOOP
        placas_veiculos_table(i) := current_row.placa;
        i := i + 1;
    END LOOP;
    FOR j IN 1..i-1 LOOP
        DBMS_OUTPUT.PUT_LINE(placas_veiculos_table(j));
    END LOOP;
END placas_veiculos_block;

/*USO DE PARÂMETROS (IN, OUT OU IN OUT) E %ROWTYPE:
Procedimento que cadastra um novo desconto. */
CREATE OR REPLACE PROCEDURE cadastroDesconto (aux IN Desconto%ROWTYPE) IS
BEGIN
    INSERT INTO Desconto(porcentagem, codigo, cpf_cliente)
            VALUES (aux.porcentagem, aux.codigo, aux.cpf_cliente);
END;

/*BLOCO ANÔNIMO:
Criando um bloco anônimo com um record de pedagio e printando o nome*/
DECLARE
    TYPE type_cancela IS RECORD (
        nome VARCHAR2(255),
        endereco VARCHAR2(255));
        cancela_01 type_cancela;
BEGIN
    cancela_01.nome := 'Karibian';
    cancela_01.endereco := 'Rua das Mariposas Apropriquadas';
    DBMS_OUTPUT.PUT_LINE(cancela_01.nome);
END;


/*CREATE OR REPLACE TRIGGER (COMANDO), EXCEPTION WHEN E IF ELSIF:
Criando trigger que é ativado quando existe a tentativa de se fazer um pagamento fora do horário definido */
CREATE OR REPLACE TRIGGER pedagio_fechado
BEFORE INSERT ON Pagamento
DECLARE
    pagamento_fora_do_horario EXCEPTION;
BEGIN 
    IF TO_NUMBER(SYSDATE, 'HH24') > 17 OR TO_NUMBER(SYSDATE, 'HH24') < 8
    THEN 
        RAISE pagamento_fora_do_horario;
    END IF;
EXCEPTION 
WHEN pagamento_fora_do_horario THEN
    Raise_application_error(-20202, 'FORA DO HORARIO-' || 'Nosso pedágio fica aberto somente das 8h as 17h. Tente novamente em outro horário.');
END;

/*CASE WHEN, LOOP EXIT WHEN, CURSOR (OPEN, FETCH, CLOSE) E WHILE LOOP: 
Loop que analisa os veículos cadastrados, contabilizando de acordo com o tipo.
Cursor foi usado para pegar o tipo na tabela Veiculo. */
DECLARE 
    count_pessoal BINARY_INTEGER;
    count_coletivo BINARY_INTEGER;
    i BINARY_INTEGER;
    q BINARY_INTEGER;
    aux_veiculo Veiculo.tipo%TYPE;

    CURSOR c_veiculo IS
        SELECT V.tipo
        FROM Veiculo V;
BEGIN
    OPEN c_veiculo;
    count_pessoal := 0;
    count_coletivo := 0;
    i := 0;
    SELECT COUNT(*) INTO q FROM Veiculo;
    WHILE i < q LOOP
        FETCH c_veiculo INTO aux_veiculo;
        EXIT WHEN c_veiculo%NOTFOUND;
        CASE aux_veiculo
            WHEN 'pessoal' THEN
                count_pessoal := count_pessoal + 1;
            ELSE
                count_coletivo := count_coletivo + 1;
        END CASE;
        i := i + 1;
    END LOOP;
    CLOSE c_veiculo;
    DBMS_OUTPUT.PUT_LINE('Pessoal: ' || count_pessoal || ', Coletivo: ' || count_coletivo);
END;

/*CREATE PROCEDURE, ROWTYPE, CREATE OR REPLACE PACKAGE/BODY:
Packages com procedures para inserção de elementos do tipo PEDAGIO e CANCELAS na tabela. */
CREATE OR REPLACE PACKAGE cadastros AS
PROCEDURE new_pedagio(aux Pedagio%ROWTYPE);
PROCEDURE new_cancela(
    c_endereco Cancela.endereco%TYPE,
    c_num_cancela Cancela.num_cancela%TYPE,
    c_preco_tarifa Cancela.preco_tarifa%TYPE,
    c_data_manutencao Cancela.data_manutencao%TYPE,
    c_status Cancela.status%TYPE,
    c_tipo_veiculo Cancela.tipo_veiculo%TYPE
);
END cadastros;
CREATE OR REPLACE PACKAGE BODY cadastros AS
PROCEDURE new_pedagio(aux Pedagio%ROWTYPE) IS
BEGIN
    INSERT INTO Pedagio(nome, endereco, quant_cancelas)
        VALUES(aux.nome, aux.endereco, aux.quant_cancelas);
END new_pedagio;
PROCEDURE new_cancela(
    c_endereco Cancela.endereco%TYPE,
    c_num_cancela Cancela.num_cancela%TYPE,
    c_preco_tarifa Cancela.preco_tarifa%TYPE,
    c_data_manutencao Cancela.data_manutencao%TYPE,
    c_status Cancela.status%TYPE,
    c_tipo_veiculo Cancela.tipo_veiculo%TYPE
) IS
    BEGIN
        INSERT INTO Cancela(endereco, num_cancela, preco_tarifa, data_manutencao, status, tipo_veiculo)
            VALUES (c_endereco, c_num_cancela, c_preco_tarifa, c_data_manutencao, c_status, c_tipo_veiculo);
        END new_cancela;
END cadastros;

/*CREATE OR REPLACE TRIGGER (LINHA​)
Trigger ativado quando se tenta inserir um Desconto com porcentagem negativa. */
CREATE OR REPLACE TRIGGER porcentagem_negativa
BEFORE INSERT ON Desconto
FOR EACH ROW
DECLARE
    porcentagem_negativa EXCEPTION;
BEGIN 
    IF :NEW.porcentagem < 0 THEN
        DBMS_OUTPUT.PUT_LINE('DESCONTO COM PORCENTAGEM NEGATIVA');
        RAISE porcentagem_negativa;
    END IF;
EXCEPTION
    WHEN porcentagem_negativa THEN
    Raise_application_error(-20202, 'Valor negativo da porcentagem de desconto-' || 'Não é possível inserir um valor negativo à porcentagem do do Desconto.');
END;

/*CREATE FUNCTION, IF/ELSIF E SELECT ... INTO
Função que recebe o cpf do cliente, a data do pagamento e a forma de pagamento, e printa mensagens de acordo com a forma de pagamento*/
CREATE OR REPLACE FUNCTION forma_de_pagamento_msg (cpf Pagamento.cpf_cliente%TYPE, data Pagamento.data_pagamento%TYPE)
RETURN VARCHAR2
IS
    forma_pagamento Pagamento.forma_pagamento%TYPE;
    func_out VARCHAR2(255);
BEGIN
    SELECT p.forma_pagamento INTO forma_pagamento
    FROM Pagamento p
    WHERE p.cpf_cliente = cpf AND p.data_pagamento = data;

    IF forma_pagamento = 'PIX' THEN
        func_out := 'Você pagou no PIX!';
    ELSIF forma_pagamento = 'debito' THEN
        func_out := 'Você pagou no débito!';
    ELSIF forma_pagamento = 'credito' THEN
        func_out := 'Você pagou no crédito!';
    ELSIF forma_pagamento = 'dinheiro' THEN
        func_out := 'Você pagou em dinheiro!';
    ELSE
        func_out := 'Forma de pagamento não autorizada!';
    END IF;
    RETURN func_out;
END forma_de_pagamento_msg;
--Teste: SELECT forma_de_pagamento_msg('001', TIMESTAMP '2022-08-10 12:23:37') FROM DUAL;
