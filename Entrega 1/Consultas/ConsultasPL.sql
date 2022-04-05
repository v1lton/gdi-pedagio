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

/*USO DE PARÂMETROS (IN, OUT OU IN OUT):
Procedimento que cadastra um novo desconto. */
CREATE OR REPLACE PROCEDURE cadastroDesconto (aux IN Desconto%ROWTYPE) IS
BEGIN
    INSERT INTO Desconto(porcentagem, codigo, cpf_cliente)
            VALUES (aux.porcentagem, aux.codigo, aux.cpf_cliente);
END;

/*EXCEPTION WHEN E CREATE OR REPLACE TRIGGER (COMANDO):
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
