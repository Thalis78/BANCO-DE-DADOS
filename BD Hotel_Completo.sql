CREATE TABLE HOSPEDE (
COD_HOSPED INT NOT NULL PRIMARY KEY,
NOME VARCHAR(20) NOT NULL,
DT_NASC DATE NOT NULL);

CREATE TABLE CATEGORIA (
COD_CAT INT NOT NULL PRIMARY KEY,
NOME VARCHAR(40) NOT NULL,
VALOR_DIA FLOAT NOT NULL);

CREATE TABLE ATENDENTE (
COD_ATEND INT NOT NULL PRIMARY KEY,
NOME VARCHAR(20) NOT NULL,
DT_NASC DATE NOT NULL);

CREATE TABLE APTO (
NUM INT NOT NULL PRIMARY KEY,
STATUS CHAR(1) NOT NULL,
COD_CAT INT NOT NULL REFERENCES CATEGORIA(COD_CAT));

CREATE TABLE HOSPEDAGEM (
COD_HOSP INT NOT NULL PRIMARY KEY,
COD_HOSPED INT NOT NULL REFERENCES HOSPEDE(COD_HOSPED),
NUM INT NOT NULL REFERENCES APTO(NUM),
COD_ATEND INT NOT NULL REFERENCES ATENDENTE(COD_ATEND),
DT_ENTRADA DATE NOT NULL,
DT_SAIDA DATE);

CREATE TABLE SERVICO (
COD_SERV INT NOT NULL PRIMARY KEY,
NOME VARCHAR(40) NOT NULL,
DESCRICAO VARCHAR(200) NOT NULL,
VALOR_DIA FLOAT NOT NULL);

CREATE TABLE SOLICITACAO (
COD_SOLIC INT NOT NULL PRIMARY KEY,
COD_SERV INT NOT NULL REFERENCES SERVICO(COD_SERV),
COD_HOSP INT NOT NULL REFERENCES HOSPEDAGEM(COD_HOSP),
COD_ATEND INT NOT NULL REFERENCES ATENDENTE(COD_ATEND),
QUANT INT,
VALOR_TOTAL FLOAT);

ALTER TABLE SOLICITACAO ALTER COLUMN QUANT SET NOT NULL;

CREATE TABLE RESERVA (
COD_RES INT NOT NULL PRIMARY KEY,
COD_HOSPED INT NOT NULL REFERENCES HOSPEDE(COD_HOSPED),
COD_CAT INT NOT NULL REFERENCES CATEGORIA(COD_CAT),
DT_ENT DATE NOT NULL,
DT_PREV_ENT DATE);

--Alterar um dominio de um atributo.
ALTER TABLE RESERVA ALTER COLUMN DT_ENT DROP NOT NULL;
ALTER TABLE RESERVA ALTER COLUMN DT_PREV_ENT SET NOT NULL;

INSERT INTO HOSPEDE VALUES (1, 'JOÃO', '2001-10-12'),
(2, 'MARIA', '1999-04-20'),
(3, 'ARTHUR', '1997-01-15');

INSERT INTO CATEGORIA VALUES 
(1, 'STANDARD', 355.99),
(2, 'MASTER', 549.99),
(3, 'DELUXE', 789.99);

INSERT INTO ATENDENTE VALUES
(001, 'RODRIGO', '1993-12-03'),
(002, 'ANGELA', '1998-10-23'),
(003, 'BEATRIZ', '2001-06-12');

INSERT INTO SERVICO VALUES
(1, 'LAVAGEM DE CARRO', 'LAVAGEM COMPLETA DO SEU AUTOMOVEL', 30.00),
(2, 'LAVAGEM DE ROUPA', 'LAVA E PASSA CADA PEÇA DE ROUPA', 4.00),
(3, 'SPA', 'SPA PARA VOCÊ RELAXAR, CONTA COM SAUNA, MASSAGEM E IOGA', 50.00);

INSERT INTO APTO VALUES 
(101, 'D', 1),
(203, 'D', 3),
(301, 'D', 2);

INSERT INTO HOSPEDAGEM VALUES
(1001, 3, 301, 2, '2022-11-19', '2022-11-21'),
(1002, 1, 203, 1, '2023-01-20', '2023-01-30'),
(1003, 2, 101, 2, '2023-01-12', '2023-01-15');
INSERT INTO HOSPEDAGEM VALUES
(1004, 1, 301, 3, '2023-11-22');

--Um insert apenas nos atributos que eu quero.
INSERT INTO RESERVA(COD_RES, COD_HOSPED, COD_CAT, DT_PREV_ENT) VALUES 
(2001, 2, 3, '2023-11-23');

--Um Insert já fazendo o calculo do valor total do serviço.
INSERT INTO SOLICITACAO VALUES
(3001, 2, 1001, 1, 2, (SELECT 2 * VALOR_DIA FROM SERVICO WHERE COD_SERV=2));

--OBTER O NOME DOS HOSPEDES QUE TENHA CODIGO DE HOSPEDE 1,2,5,27,51.
SELECT NOME FROM HOSPEDE WHERE COD_HOSPED IN (1,2,5,27,52);

--OBTER O NOME DOS HOSPEDES QUE TENHAM NASCIDO NOS ANOS 90.
SELECT NOME FROM HOSPEDE WHERE DT_NASC >= '1990-01-01' AND DT_NASC <= '1999-12-31';

--OBTER O CÓDIGO E O NOME DOS ATENDENTES QUE TENHAM A LETRA A NO NOME.
SELECT COD_ATEND, NOME FROM ATENDENTE WHERE NOME LIKE '%A%';

/*OBTER O NOME DOS ATENDENTES QUE FIZERAM O CADASTRO DE HOSPEDAGEM
DOS HOSPEDES DE NOME JOÃO E MARIA. */
SELECT NOME FROM ATENDENTE WHERE COD_ATEND IN
(SELECT COD_ATEND FROM HOSPEDAGEM WHERE COD_HOSPED IN
(SELECT COD_HOSPED FROM HOSPEDE WHERE NOME='JOÃO' OR NOME='MARIA'));

--ALTER A TABELA HOSPEDE ADICIONANDO UMA NOVA COLUNA CHAMADA NACIONALIDADE:
ALTER TABLE HOSPEDE ADD COLUMN NACIONALIDADE VARCHAR(40) NOT NULL DEFAULT 'NÃO REGISTRADO';

--REJUSTAR O VALOR DA DIARIA DAS CATEGORIAS DO HOTEL EM 10%.
UPDATE CATEGORIA SET VALOR_DIA = VALOR_DIA * 1.1;

SELECT NUM FROM HOSPEDAGEM WHERE NUM IN
(SELECT NUM FROM APTO WHERE COD_CAT IN
(SELECT COD_CAT FROM CATEGORIA WHERE VALOR_DIA IN
(SELECT MAX(VALOR_DIA) FROM CATEGORIA))) AND COD_HOSPED IN
(SELECT COD_HOSPED FROM HOSPEDE WHERE NOME='JOÃO')

SELECT NOME FROM HOSPEDE WHERE COD_HOSPED NOT IN 
(SELECT COD_HOSPED FROM HOSPEDAGEM WHERE NUM=101)

SELECT NOME FROM HOSPEDE WHERE COD_HOSPED NOT IN
(SELECT COD_HOSPED FROM HOSPEDAGEM WHERE NUM IN
(SELECT NUM FROM APTO WHERE COD_CAT IN
(SELECT COD_CAT FROM CATEGORIA WHERE NOME='DELUXE')))

SELECT * FROM CATEGORIA;

SELECT NOME FROM HOSPEDE WHERE DT_NASC IN
(SELECT MIN(DT_NASC) FROM HOSPEDE WHERE COD_HOSPED IN
(SELECT COD_HOSPED FROM HOSPEDAGEM WHERE COD_ATEND IN
(SELECT COD_ATEND FROM ATENDENTE WHERE DT_NASC IN
(SELECT MAX(DT_NASC) FROM ATENDENTE))));

SELECT NOME FROM CATEGORIA WHERE VALOR_DIA IN
(SELECT MAX(VALOR_DIA) FROM CATEGORIA WHERE COD_CAT IN
(SELECT COD_CAT FROM APTO WHERE NUM IN
(SELECT NUM FROM HOSPEDAGEM WHERE COD_HOSPED IN
(SELECT COD_HOSPED FROM HOSPEDE WHERE DT_NASC IN
(SELECT MIN(DT_NASC) FROM HOSPEDE))));
 
INSERT INTO CATEGORIA VALUES
(4, 'DELUXE_2', 790.99);
 
INSERT INTO APTO VALUES
(302, 'D', 4);
 
SELECT * FROM APTO WHERE COD_CAT IN
(SELECT COD_CAT FROM CATEGORIA WHERE NOME LIKE '%DELUXE_2%');

UPDATE CATEGORIA SET VALOR_DIA = VALOR_DIA - (VALOR_DIA * 0.1);