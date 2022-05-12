--////// CRIAÇÃO DE TIPOS ////////--

-- TIPO TELEFONE
CREATE OR REPLACE TYPE tp_telefone AS OBJECT (
    telefone VARCHAR (14) 
);

/

-- ARRAY DE TELEFONES 
-- Checklist: 19
CREATE OR REPLACE TYPE tp_varray_telefone AS VARRAY (5) OF tp_telefone;

/


-- TIPO PESSOA
-- NOT FINAL: permite criar subtipos
-- NOT INSTANTIABLES: não pode ter instâncias de objetos criadas em tabelas
-- Checklist: 1, 3, 10
CREATE OR REPLACE TYPE tp_pessoa AS OBJECT (

    cpf VARCHAR2 (11),
    nascimento DATE,
    nome VARCHAR2 (20),
    sobrenome VARCHAR2 (50),
    telefone tp_varray_telefone,
    MEMBER PROCEDURE print_info,
    FINAL MAP MEMBER FUNCTION qntd_telefones RETURN NUMBER

) NOT FINAL NOT INSTANTIABLE;

/

-- TIPO CLIENTE
-- Herda de Pessoa
CREATE OR REPLACE TYPE tp_cliente UNDER tp_pessoa (

);

/

-- CORPO DOS MÉTODOS PARA tp_cliente
-- qntd_telefones: retorna a quantidade de telefones cadastrados por cliente
-- Checklist 6, 9
CREATE OR REPLACE TYPE BODY tp_cliente AS 
FINAL MAP MEMBER FUNCTION qntd_telefones RETURN NUMBER IS
selfCnt NUMBER;
    BEGIN
        SELECT COUNT(*) INTO selfCnt
        FROM TABLE(SELF.telefone);
        RETURN selfCnt;
    END;
END;

/

-- TIPO CANCELA
CREATE OR REPLACE TYPE tp_cancela AS OBJECT (

    num_cancela NUMBER,
    preco_tarica NUMBER,
    data_manutencao DATE,
    status_cancela VARCHAR2 (10),
    tipo_veiculo VARCHAR2 (10)

);

-- TIPO NESTED CANCELA
CREATE OR REPLACE TYPE tp_nt_cancelas AS TABLE OF tp_cancela;

/

-- TIPO PEDAGIO
CREATE OR REPLACE TYPE tp_pedagio AS OBJECT (

    nome VARCHAR2 (20),
    endereco VARCHAR2 (100),
    quant_cancelas NUMBER,
    cancelas tp_nt_cancelas

);

/

-- TIPO FUNCIONÁRIO
-- Herda de Pessoa
-- Checklist: 8, 11, 15
CREATE OR REPLACE TYPE tp_funcionario UNDER tp_pessoa (

    cpf_supervisor REF tp_funcionario,
    endereco REF tp_pedagio,
    cargo VARCHAR2 (15),
    salario NUMBER,
    OVERRIDING MEMBER PROCEDURE print_info,
    MEMBER FUNCTION salarioAnual RETURN NUMBER,
    ORDER MEMBER FUNCTION comparaSalario (SELF IN OUT NOCOPY tp_funcionario, f tp_funcionario) RETURN NUMBER
    CONSTRUCTOR FUNCTION tp_funcionario (x1 tp_funcionario) RETURN SELF AS RESULT

);

/

-- CORPO DOS MÉTODOS PARA tp_funcionario
-- salarioAnual: member function que calcula o salário anual do funcionário
-- comparaSalario: order member function que compara salários (se SELF>X, resultado é positivo, se SELF=X, resultado é 0 e se SELF<X, resultado é negativo)
-- print_info: overriding member procedure que imprime as informações do funcionário
-- constructor: padrão
-- Checklist: 2, 4
CREATE OR REPLACE TYPE BODY tp_funcionario AS

MEMBER FUNCTION salarioAnual RETURN NUMBER IS
    BEGIN
        RETURN salario*12;
    END;
-- Checklist: 5
CREATE OR REPLACE TYPE BODY tp_funcionario AS
ORDER MEMBER FUNCTION comparaSalario (SELF IN OUT NOCOPY tp_funcionario, f tp_funcionario) RETURN NUMBER IS
    BEGIN
        IF SELF.salario < f.salario THEN 
            RETURN -1;
        ELSIF SELF.salario > f.salario THEN 
            RETURN 1;
        ELSE 
            RETURN 0;
        END IF;
    END;
END;
OVERRIDING MEMBER PROCEDURE print_info IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE(nome);
        DBMS_OUTPUT.PUT_LINE(cpf);
        DBMS_OUTPUT.PUT_LINE(cpf_supervisor);
        DBMS_OUTPUT.PUT_LINE(cargo);
        DBMS_OUTPUT.PUT_LINE(salario);
    END;
-- Checklist: 7
CONSTRUCTOR FUNCTION tp_entregador (x1 tp_entregador) RETURN SELF AS RESULT IS
    BEGIN
        cpf := x1.cpf; 
        nome := x1.nome; 
        sobrenome := x1.sobrenome; 
        nascimento := x1.nascimento;
        telefone := x1.telefone; 
        cpf_supervisor := x1.cpf_supervisor; 
        endereco := x1.endereco;
        cargo := x1.cargo; 
        salario := x1.salario; 
        RETURN; 
    END;

END;

/

-- TIPO VEÍCULO
CREATE OR REPLACE TYPE tp_veiculo AS OBJECT (

    cpf_cliente REF tp_cliente,
    placa VARCHAR2(7),
    tipo VARCHAR2(255)

);

/

-- TIPO DESCONTO
CREATE OR REPLACE TYPE tp_desconto AS OBJECT (

    porcentagem NUMBER,
    codigo NUMBER,
    cpf_cliente REF tp_cliente

);

/

-- TIPO MONITORA
CREATE OR REPLACE TYPE tp_monitora AS OBJECT (

    cpf_funcionario REF tp_funcionario,
    endereco REF tp_pedagio,
    num_cancela NUMBER,
    inicio_monitoramento TIMESTAMP,
    fim_monitoramento TIMESTAMP

);

/

-- TIPO PAGAMENTO
CREATE OR REPLACE TYPE tp_pagamento AS OBJECT (

    cpf_cliente REF tp_cliente,
    placa_veiculo REF tp_veiculo,
    endereco REF tp_pedagio,
    num_cancela NUMBER,
    codigo_desconto REF tp_desconto,
    data_pagamento TIMESTAMP,
    forma_pagamento VARCHAR2 (10)

);

/

-- ALTER TYPE + ADD: adiciona atributo naturalidade em pessoa
-- CASCADE: propaga a mudança para tipos dependentes de tp_pessoa
-- Checklist: 12
ALTER TYPE tp_pessoa ADD ATTRIBUTE (naturalidade VARCHAR2(20)) CASCADE;

/
