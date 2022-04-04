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

