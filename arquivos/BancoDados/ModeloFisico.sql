/* CONTRATAI */

/* Deleção de possíveis tabelas que já existam */
DROP TABLE IF EXISTS Estado CASCADE;
DROP TABLE IF EXISTS Cidade CASCADE;
DROP TABLE IF EXISTS Bairro CASCADE;
DROP TABLE IF EXISTS Usuario CASCADE;
DROP TABLE IF EXISTS Profissao CASCADE;
DROP TABLE IF EXISTS Especializacao CASCADE;
DROP TABLE IF EXISTS Profissao CASCADE;
DROP TABLE IF EXISTS UsrEspec CASCADE;
DROP TABLE IF EXISTS Avaliacao CASCADE;
DROP TABLE IF EXISTS Contato CASCADE;
DROP TABLE IF EXISTS DiaSemana CASCADE;
DROP TABLE IF EXISTS Contrato CASCADE;
DROP TABLE IF EXISTS Disponibilidade CASCADE;
DROP TABLE IF EXISTS UsrDisp CASCADE;

/* Criação da Tabela Estado*/
CREATE TABLE Estado (
    idEstado SERIAL,
    dscEstado varchar(200),
    dscSiglaEstado char(2),

    PRIMARY KEY(idEstado)
);

/* Criação da Tabela Cidade */
CREATE TABLE Cidade (
    idCidade SERIAL,
    dscCidade varchar(200),

    idEstado INT,

    PRIMARY KEY(idCidade)
);

/* Criação da Tabela Bairro*/
CREATE TABLE Bairro (
    idBairro SERIAL,
    dscBairro varchar(200),

    idCidade INT,

    PRIMARY KEY(idBairro)
);

/* Criação da Tabela Usuário*/
CREATE TABLE Usuario (
    idUsr SERIAL,
    nomUsr varchar(50),
    dscEmailUsr varchar(100),
    dscSenhaUsr varchar(100),
    numCPFUsr char(13),
    dscFotoUsr varchar(50),
    datNascimentoUsr date,
    numTelefoneUsr varchar(13),

    idBairro INT,

    PRIMARY KEY(idUsr)
);

/* Criação da Tabela Profissão*/
CREATE TABLE Profissao (
    idProf SERIAL,
    dscProf varchar(50),

    PRIMARY KEY(idProf)
);

/* Criação da Tabela Especializacao */
CREATE TABLE Especializacao (
    idEspec SERIAL,
    dscEspec varchar(50),

    idProf INT,

    PRIMARY KEY(idEspec)
);

/* Criação da Tabela UsrEspec */
CREATE TABLE UsrEspec (
    idUsrEspec SERIAL,
    
    idUsr INT,
    idEspec INT,

    PRIMARY KEY(idUsrEspec)
);

/* Criação da Tabela Avaliacao */
CREATE TABLE Avaliacao (
    idAvalia SERIAL,
    numNotaAvalia integer,
    dscComentarioAvalia varchar(200),
    dscImagemAvalia varchar(100),

    idAvaliador INT,
    idAvaliado INT,

    PRIMARY KEY(idAvalia)
);

/* Criação da Tabela Contato */
CREATE TABLE Contato (
    idCont SERIAL,
    dscTopicoCont varchar(100),
    dscMensagemCont varchar(500),

    idUsr INT,

    PRIMARY KEY(idCont)
);

/* Criação da Tabela DiaSemana */
CREATE TABLE DiaSemana (
    idDiaSemn SERIAL,
    dscDiaSemn varchar(100),

    PRIMARY KEY(idDiaSemn)
);

/* Criação da Tabela Contrat */
CREATE TABLE Contrato (
    idContrt SERIAL,
    datInicioContrt date,
    datFimContrt date,

    idContratante INT,
    idContratado INT,

    PRIMARY KEY(idContrt)
);

/* Criação da Tabela Disponibilidade */
CREATE TABLE Disponibilidade (
    idDisp SERIAL, 
    horaInicioDisp time, 
    horaFimDisp time,

    idDiaSemn INT,

    PRIMARY KEY(idDisp)
);

/* Criação da Tabela UsrDisp */
CREATE TABLE UsrDisp (
    idUsrDisp SERIAL,

    idUsr INT,
    idDisp INT,

    PRIMARY KEY (idUsrDisp)
);

/* Atribuição das Chaves Primárias e Estrangeiras nas tabelas */
ALTER TABLE Usuario ADD CONSTRAINT fk_usuario_bairro
    FOREIGN KEY (idBairro)
    REFERENCES Bairro (idBairro)
    ON DELETE CASCADE;
 
ALTER TABLE Cidade ADD CONSTRAINT fk_cidade_estado
    FOREIGN KEY (idEstado)
    REFERENCES Estado (idEstado)
    ON DELETE CASCADE;
 
ALTER TABLE Bairro ADD CONSTRAINT fk_bairro_cidade
    FOREIGN KEY (idCidade)
    REFERENCES Cidade (idCidade)
    ON DELETE CASCADE;
 
ALTER TABLE Especializacao ADD CONSTRAINT fk_especializacao_profissao
    FOREIGN KEY (idProf)
    REFERENCES Profissao (idProf)
    ON DELETE CASCADE;
 
ALTER TABLE Contato ADD CONSTRAINT fk_contato_usuario
    FOREIGN KEY (idUsr)
    REFERENCES Usuario (idUsr)
    ON DELETE CASCADE;
 
ALTER TABLE Disponibilidade ADD CONSTRAINT fk_disponibilidade_diaSemana
    FOREIGN KEY (idDiaSemn)
    REFERENCES DiaSemana (idDiaSemn)
    ON DELETE CASCADE;
 
ALTER TABLE Avaliacao ADD CONSTRAINT fk_avaliacao_avaliador
    FOREIGN KEY (idAvaliador)
    REFERENCES Usuario (idUsr)
    ON DELETE CASCADE;
 
ALTER TABLE Avaliacao ADD CONSTRAINT fk_avaliacao_avaliado
    FOREIGN KEY (idAvaliado)
    REFERENCES Usuario (idUsr)
    ON DELETE CASCADE;
 
ALTER TABLE Contrato ADD CONSTRAINT fk_contrato_contratante
    FOREIGN KEY (idContratante)
    REFERENCES Usuario (idUsr)
    ON DELETE CASCADE;
 
ALTER TABLE Contrato ADD CONSTRAINT fk_contrato_contratado
    FOREIGN KEY (idContratado)
    REFERENCES Usuario (idUsr)
    ON DELETE CASCADE;
 
ALTER TABLE UsrDisp ADD CONSTRAINT fk_usrDisp_disponibilidade
    FOREIGN KEY (idDisp)
    REFERENCES Disponibilidade (idDisp)
    ON DELETE CASCADE;
 
ALTER TABLE UsrDisp ADD CONSTRAINT fk_usrDisp_usuario
    FOREIGN KEY (idUsr)
    REFERENCES Usuario (idUsr)
    ON DELETE CASCADE;

ALTER TABLE UsrEspec ADD CONSTRAINT fk_usrEspec_usuario
    FOREIGN KEY (idUsr)
    REFERENCES Usuario (idUsr)
    ON DELETE CASCADE;
 
ALTER TABLE UsrEspec ADD CONSTRAINT fk_usrEspec_especializacao
    FOREIGN KEY (idEspec)
    REFERENCES Especializacao (idEspec)
    ON DELETE CASCADE;