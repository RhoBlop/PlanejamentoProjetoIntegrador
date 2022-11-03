/* CONTRATAI */

/* Deleção de possíveis tabelas que já existam */
DROP TABLE IF EXISTS Estado CASCADE;
DROP TABLE IF EXISTS Cidade CASCADE;
DROP TABLE IF EXISTS Bairro CASCADE;
DROP TABLE IF EXISTS Usuario CASCADE;
DROP TABLE IF EXISTS Profissao CASCADE;
DROP TABLE IF EXISTS Especializacao CASCADE;
DROP TABLE IF EXISTS UserEspec CASCADE;
DROP TABLE IF EXISTS Avaliacao CASCADE;
DROP TABLE IF EXISTS Suporte CASCADE;
DROP TABLE IF EXISTS DiaSemana CASCADE;
DROP TABLE IF EXISTS Contrato CASCADE;
DROP TABLE IF EXISTS Disponibilidade CASCADE;
DROP TABLE IF EXISTS UserDisp CASCADE;
DROP TABLE IF EXISTS Favorito CASCADE;
DROP TABLE IF EXISTS DiaContrato CASCADE;
DROP TABLE IF EXISTS StatusContrato CASCADE;
DROP TABLE IF EXISTS NotificacaoContrato;

/* Criação da Tabela Estado*/
CREATE TABLE Estado (
    idEstado SERIAL,
    descrEstado VARCHAR(100),
    siglaEstado VARCHAR(5),

    PRIMARY KEY(idEstado)
);

/* Criação da Tabela Cidade */
CREATE TABLE Cidade (
    idCidade SERIAL,
    descrCidade VARCHAR(100),

    idEstado INT,

    PRIMARY KEY(idCidade)
);

/* Criação da Tabela Bairro*/
CREATE TABLE Bairro (
    idBairro SERIAL,
    descrBairro VARCHAR(100),

    idCidade INT,

    PRIMARY KEY(idBairro)
);

/* Criação da Tabela Usuário*/
CREATE TABLE Usuario (
    idUser SERIAL,
    nomeuser VARCHAR(60),
    nascimentoUser DATE,
    telefoneUser VARCHAR(25),
    cpfUser VARCHAR(20),
    imgUser TEXT,
    emailUser VARCHAR(100),
    senhaUser TEXT,
    biografiaUser TEXT,
    dataCriacaoUser DATE DEFAULT CURRENT_DATE,
    isAtivoUser BOOLEAN DEFAULT FALSE,
    isAdminUser BOOLEAN DEFAULT FALSE,
    preferenciaDisabledCalendar BOOLEAN DEFAULT FALSE,  -- se contratos devem impedir novas contratações nas datas já marcadas

    idBairro INT,

    PRIMARY KEY(idUser)
);

/* Criação da Tabela Profissão*/
CREATE TABLE Profissao (
    idProf SERIAL,
    descrProf VARCHAR(50),
    imgProf TEXT,

    PRIMARY KEY(idProf)
);

/* Criação da Tabela Especializacao */
CREATE TABLE Especializacao (
    idEspec SERIAL,
    descrEspec VARCHAR(50),
    -- para controle de especializações criadas por usuários, um admin pode setar isso para true
    isPublicEspec BOOLEAN DEFAULT FALSE,

    idProf INT,

    PRIMARY KEY(idEspec)
);

/* Criação da Tabela UserEspec */
CREATE TABLE UserEspec (
    idUserEspec SERIAL,
    
    idUser INT,
    idEspec INT,

    PRIMARY KEY(idUserEspec)
);

/* Criação da Tabela Avaliacao */
CREATE TABLE Avaliacao (
    idAvaliacao SERIAL,
    notaAvaliacao INT,
    comentarioAvaliacao TEXT,
    dataAvaliacao DATE DEFAULT CURRENT_DATE,

    idContrato INT,

    PRIMARY KEY(idAvaliacao)
);

/* Criação da Tabela Suporte */
CREATE TABLE Suporte (
    idSuporte SERIAL,
    topicoSuporte VARCHAR(100),
    mensagemSuporte VARCHAR(500),

    idUser INT,

    PRIMARY KEY(idSuporte)
);

/* Criação da Tabela DiaSemana */
CREATE TABLE DiaSemana (
    idDiaSemn SERIAL,
    descrDiaSemn VARCHAR(100),

    PRIMARY KEY(idDiaSemn)
);

/* Criação da Tabela Contrato */
CREATE TABLE Contrato (
    idContrato SERIAL,
    descrContrato VARCHAR(200),
    timeCriacaoContrato TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    timeFinalizacaoContrato TIMESTAMP DEFAULT NULL,
    isAvaliado BOOLEAN DEFAULT FALSE,

    idContratante INT,
    idContratado INT,
    idEspec INT,
    idStatus INT,

    PRIMARY KEY(idContrato)
);

CREATE TABLE StatusContrato (
    idStatus SERIAL,
    descrStatus VARCHAR(40),
    corCalendario VARCHAR(20),  -- cor desse tipo no calendário de eventos do usuário

    PRIMARY KEY (idStatus)
);

CREATE TABLE DiaContrato (
    idDiaContrato SERIAL,
    diaContrato DATE,

    idContrato INT,

    PRIMARY KEY (idDiaContrato)
);

CREATE TABLE NotificacaoContrato (
    idNotific SERIAL,
    titleNotific VARCHAR(50),
    descrNotific VARCHAR(100),
    isVisualizado BOOLEAN DEFAULT FALSE,
    timeCriacaoNotific TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    idRemetente INT,
    idDestinatario INT,
    idContrato INT,

    PRIMARY KEY (idNotific)
);

/* Criação da Tabela Favoritos */
/* CREATE TABLE Favorito (
    idFavorito SERIAL,
    dataFav DATE DEFAULT CURRENT_DATE,

    idFavoritador INT,
    idFavoritado INT,

    PRIMARY KEY (idFavorito)
); */

/* Atribuição das Chaves Primárias e Estrangeiras nas tabelas */