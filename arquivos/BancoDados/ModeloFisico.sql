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
DROP TABLE IF EXISTS Contato CASCADE;
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
    descrEstado varchar(200),
    siglaEstado varchar(2),

    PRIMARY KEY(idEstado)
);

/* Criação da Tabela Cidade */
CREATE TABLE Cidade (
    idCidade SERIAL,
    descrCidade varchar(200),

    idEstado INT,

    PRIMARY KEY(idCidade)
);

/* Criação da Tabela Bairro*/
CREATE TABLE Bairro (
    idBairro SERIAL,
    descrBairro varchar(200),

    idCidade INT,

    PRIMARY KEY(idBairro)
);

/* Criação da Tabela Usuário*/
CREATE TABLE Usuario (
    idUser SERIAL,
    nomeuser varchar(60),
    nascimentoUser date,
    telefoneUser varchar(25),
    cpfUser varchar(20),
    imgUser text,
    emailUser varchar(100),
    senhaUser text,
    biografiaUser text,
    dataCriacaoUser DATE DEFAULT CURRENT_DATE,
    isAtivoUser boolean DEFAULT FALSE,
    isAdminUser boolean DEFAULT FALSE,
    preferenciaDisabledCalendar boolean DEFAULT FALSE,  -- se contratos devem impedir novas contratações nos dias cadastrados

    idBairro INT,

    PRIMARY KEY(idUser)
);

/* Criação da Tabela Profissão*/
CREATE TABLE Profissao (
    idProf SERIAL,
    descrProf varchar(50),
    imgProf text,

    PRIMARY KEY(idProf)
);

/* Criação da Tabela Especializacao */
CREATE TABLE Especializacao (
    idEspec SERIAL,
    descrEspec varchar(50),
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
    comentarioAvaliacao text,
    dataAvaliacao DATE DEFAULT CURRENT_DATE,

    idContrato INT,

    PRIMARY KEY(idAvaliacao)
);

/* Criação da Tabela Contato */
CREATE TABLE Contato (
    idContato SERIAL,
    topicoContato varchar(100),
    mensagemContato varchar(500),

    idUser INT,

    PRIMARY KEY(idContato)
);

/* Criação da Tabela DiaSemana */
CREATE TABLE DiaSemana (
    idDiaSemn SERIAL,
    descrDiaSemn varchar(100),

    PRIMARY KEY(idDiaSemn)
);

/* Criação da Tabela Contrato */
CREATE TABLE Contrato (
    idContrato SERIAL,
    timeCriacaoContrato TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    timeFinalizacaoContrato TIMESTAMP DEFAULT NULL,

    idContratante INT,
    idContratado INT,
    idEspec INT,
    idStatus INT,

    PRIMARY KEY(idContrato)
);

CREATE TABLE StatusContrato (
    idStatus SERIAL,
    descrStatus VARCHAR(20),
    corCalendario VARCHAR(15),  -- cor desse tipo no calendário de eventos do usuário

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
    titleNotific VARCHAR(30),
    descrNotific VARCHAR(50),
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

/* LOCALIZAÇÃO */
ALTER TABLE Usuario ADD CONSTRAINT fk_usuario_bairro
    FOREIGN KEY (idBairro)
    REFERENCES Bairro (idBairro)
    ON DELETE SET NULL;

ALTER TABLE Cidade ADD CONSTRAINT fk_cidade_estado
    FOREIGN KEY (idEstado)
    REFERENCES Estado (idEstado)
    ON DELETE CASCADE;
 
ALTER TABLE Bairro ADD CONSTRAINT fk_bairro_cidade
    FOREIGN KEY (idCidade)
    REFERENCES Cidade (idCidade)
    ON DELETE CASCADE;
 
/* CONTATO */
ALTER TABLE Contato ADD CONSTRAINT fk_contato_usuario
    FOREIGN KEY (idUser)
    REFERENCES Usuario (idUser)
    ON DELETE SET NULL;

/* NOTIFICAÇÕES */
ALTER TABLE NotificacaoContrato ADD CONSTRAINT fk_notificacao_remetente
    FOREIGN KEY (idRemetente)
    REFERENCES Usuario (idUser)
    ON DELETE CASCADE;

ALTER TABLE NotificacaoContrato ADD CONSTRAINT fk_notificacao_destinatario
    FOREIGN KEY (idDestinatario)
    REFERENCES Usuario (idUser)
    ON DELETE CASCADE;

ALTER TABLE NotificacaoContrato ADD CONSTRAINT fk_notificacao_contrato
    FOREIGN KEY (idContrato)
    REFERENCES Contrato (idContrato)
    ON DELETE CASCADE;
 
/* CONTRATO */
ALTER TABLE Contrato ADD CONSTRAINT fk_contrato_contratante
    FOREIGN KEY (idContratante)
    REFERENCES Usuario (idUser)
    ON DELETE SET NULL;
 
ALTER TABLE Contrato ADD CONSTRAINT fk_contrato_contratado
    FOREIGN KEY (idContratado)
    REFERENCES Usuario (idUser)
    ON DELETE SET NULL;

ALTER TABLE Contrato ADD CONSTRAINT fk_contrato_especializacao
    FOREIGN KEY (idEspec)
    REFERENCES Especializacao (idEspec)
    ON DELETE CASCADE;

ALTER TABLE Contrato ADD CONSTRAINT fk_contrato_statuscontrato
    FOREIGN KEY (idStatus)
    REFERENCES StatusContrato (idStatus)
    ON DELETE RESTRICT;

ALTER TABLE DiaContrato ADD CONSTRAINT fk_diacontrato_contrato
    FOREIGN KEY (idContrato)
    REFERENCES Contrato (idContrato)
    ON DELETE CASCADE;

ALTER TABLE Avaliacao ADD CONSTRAINT fk_avaliacao_contrato
    FOREIGN KEY (idContrato)
    REFERENCES Contrato (idContrato)
    ON DELETE CASCADE;

/* ESPECIALIZACAO DO USUÁRIO */
ALTER TABLE Especializacao ADD CONSTRAINT fk_especializacao_profissao
    FOREIGN KEY (idProf)
    REFERENCES Profissao (idProf)
    ON DELETE CASCADE;

ALTER TABLE UserEspec ADD CONSTRAINT fk_UserEspec_usuario
    FOREIGN KEY (idUser)
    REFERENCES Usuario (idUser)
    ON DELETE CASCADE;

ALTER TABLE UserEspec ADD CONSTRAINT fk_UserEspec_especializacao
    FOREIGN KEY (idEspec)
    REFERENCES Especializacao (idEspec)
    ON DELETE CASCADE;

/* FAVORITO */
/* ALTER TABLE Favorito ADD CONSTRAINT fk_favorito_favoritador
    FOREIGN KEY (idFavoritador)
    REFERENCES Usuario (idUser)
    ON DELETE CASCADE;
 
ALTER TABLE Favorito ADD CONSTRAINT fk_favorito_favoritado
    FOREIGN KEY (idFavoritado)
    REFERENCES Usuario (idUser)
    ON DELETE CASCADE; */