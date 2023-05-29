# AvaliacaoFortes
 
 RODAR OS SEGUINTES SCRIPTS NO BANCO DE DADOS:
 
 CREATE TABLE TANQUE (
    ID INTEGER NOT NULL,
    DESCRICAO VARCHAR(50),
    TIPO_COMBUSTIVEL CHAR(1) DEFAULT 'G' NOT NULL,
    PRECO_LITRO NUMERIC(10,3));

ALTER TABLE TANQUE
ADD CONSTRAINT PK_TANQUE
PRIMARY KEY (ID);

COMMENT ON COLUMN TANQUE.TIPO_COMBUSTIVEL IS
'''G'' - GASOLINA / 
''D'' - DIESEL';

CREATE SEQUENCE GEN_TANQUE_ID;

SET TERM ^ ;

create trigger tanque_bi for tanque
active before insert position 0
as
begin
  if (new.id is null) then
    new.id = gen_id(gen_tanque_id,1);
end^

/******************************************/

SET TERM ; ^

CREATE TABLE BOMBA (
    ID INTEGER NOT NULL,
    TANQUE_ID INTEGER NOT NULL,
    DESCRICAO VARCHAR(50) NOT NULL);

ALTER TABLE BOMBA
ADD CONSTRAINT PK_BOMBA
PRIMARY KEY (ID);

CREATE SEQUENCE GEN_BOMBA_ID;

SET TERM ^ ;

create trigger bomba_bi for bomba
active before insert position 0
as
begin
  if (new.id is null) then
    new.id = gen_id(gen_bomba_id,1);
end^

SET TERM ; ^

ALTER TABLE BOMBA
ADD CONSTRAINT FK_BOMBA_TANQUE
FOREIGN KEY (TANQUE_ID)
REFERENCES TANQUE(ID)
ON UPDATE CASCADE;

/********************************************/

CREATE TABLE ABASTECIMENTO (
    ID INTEGER NOT NULL,
    BOMBA_ID INTEGER NOT NULL,
    DATA DATE NOT NULL,
    QTD_LITROS NUMERIC(10,3) NOT NULL,
    VALOR_TOTAL NUMERIC(10,3) NOT NULL,
    VALOR_IMPOSTO NUMERIC(10,3) NOT NULL);

ALTER TABLE ABASTECIMENTO
ADD CONSTRAINT PK_ABASTECIMENTO
PRIMARY KEY (ID);

CREATE SEQUENCE GEN_ABASTECIMENTO_ID;

SET TERM ^ ;

create trigger abastecimento_bi for abastecimento
active before insert position 0
as
begin
  if (new.id is null) then
    new.id = gen_id(gen_abastecimento_id,1);
end^

SET TERM ; ^

ALTER TABLE ABASTECIMENTO
ADD CONSTRAINT FK_ABASTECIMENTO_BOMBA
FOREIGN KEY (BOMBA_ID)
REFERENCES BOMBA(ID)
ON UPDATE CASCADE;

*****************************
DEVE SER CRIADO UM ARQUIVO DE CONFIGURAÇÕES CHAMADO Configuracoes.ini, na pasta do executável
este arquivo deve contar a chave:
[DataBase]
Caminho = "Caminho do Banco de Dados"
