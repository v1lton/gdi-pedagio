/*Insere uma nova pessoa utilizando o metodo Record na tabela de Pessoa*/
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

/*Faz uma lista de coluna única das placas dos veiculos cadastrados nos pedagios, usando o %TYPE 
para referencia e o FOR IN LOOP para lista-las. */
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

/*Procedimento que cadastra um novo desconto. */
CREATE OR REPLACE PROCEDURE cadastroDesconto (aux IN Desconto%ROWTYPE) IS
BEGIN
    INSERT INTO Desconto(porcentagem, codigo, cpf_cliente)
            VALUES (aux.porcentagem, aux.codigo, aux.cpf_cliente);
END;

/*
Criando um bloco anônimo com um record de pedagio e printando o nome
*/
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
