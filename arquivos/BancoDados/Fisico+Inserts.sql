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
 
/* Suporte */
ALTER TABLE Suporte ADD CONSTRAINT fk_suporte_usuario
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

/* ==================================
                INSERTS
   ================================== */

/* Inserts na Tabela Estado */
INSERT INTO Estado (descrEstado, siglaEstado) VALUES
('Espírito Santo', 'ES'),
('São Paulo', 'SP'),
('Bahia', 'SP'),
('Rio Grande do Sul', 'RS');

/* Inserts na Tabela Cidade */
INSERT INTO Cidade (idEstado, descrCidade) VALUES
(1, 'Serra'),
(1, 'Vitória'),
(2, 'São Paulo'),
(3, 'Salvador'),
(1, 'Vila Velha'),
(1, 'Cariacica');


/* Inserts na Tabela Bairro */
INSERT INTO Bairro (idCidade, descrBairro) VALUES
(1, 'Praia de Carapebus'),
(2, 'Santo Antônio'),
(2, 'Jardim da Penha'),
(1, 'Colina de Laranjeiras'),
(3, 'Morumbi'),
(1, 'Jardim Camburi'),
(1, 'Morada de Laranjeiras'),
(5, 'Ulisses Guimarães'),
(5, 'Barramares'),
(1, 'Balneário de Carapebus'),
(1, 'Novo'),
(6, 'Novo Brasil');


/* Inserts na Tabela Usuario */
INSERT INTO Usuario (idBairro, nomeuser, nascimentoUser, cpfUser, telefoneUser, imgUser, biografiaUser, emailUser, senhaUser, isAdminUser) VALUES
(3, 'Mr White', '1958-09-07', '99999999999', '(27) xxxxx-xxxx', 'data:image/webp;base64,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', 'P.H.D em cristalografia 🧪
Professor de Ensino Médio 🤡', 'admin@gmail.com', 'abc', TRUE);

INSERT INTO Usuario (idBairro, nomeuser, nascimentoUser, cpfUser, telefoneUser, imgUser, emailUser, senhaUser, dataCriacaoUser) VALUES
(1, 'Rafael Rodrigues Matos', '1990-09-13', '179.106.395-03', '(27) 96637-4177', null, 'rafael@gmail.com', 'abc', '2022-01-28'),
(5, 'Matheus Magnago', '2003-04-17', '904.100.091-72', '(27) 91475-1620', null, 'matheus@gmail.com', 'abc', '2022-02-08'),
(3, 'Jordana Lourenço', '2004-05-19', '609.151.069-06', '(27) 97743-2199', null, 'jordana@gmail.com', 'abc', '2022-04-16'),
(4, 'Breno Amâncio', '2003-11-03', '605.165.160-86', '(27) 96685-7708', null, 'breno@gmail.com', 'abc', '2022-04-28'),
(3, 'Thiago Neves Luz', '2004-08-08', '254.575.588-51', '(27) 95342-5874', null, 'thiago@gmail.com', 'abc', '2022-05-30'),
(2, 'Gianluca Scalzi Sampogli', '2004-01-12', '865.692.933-03', '(27) 92057-6788', null, 'gian@gmail.com', 'abc', '2022-05-31'),
(6, 'Miguel Abreu de Matos', '2004-08-06', '684.463.124-33', '(27) 96717-9349', null, 'miguel@gmail.com', 'abc', '2022-09-28'),
(7, 'Carlos Azevedo Borges', '1981-12-13', '114.064.999-00', '(27) 97269-8961', null, 'carlos@gmail.com', 'abc', '2022-10-19'),
(8, 'Thales Geraldo da Mota', '1991-08-09', '335.659.090-13', '(27) 98452-9172', null, 'thales@gmail.com', 'abc', '2022-12-03'),
(9, 'Yago Hugo Murilo Corte Real', '1975-03-12', '602.160.962-00', '(27) 98361-2776', null, 'yago@gmail.com', 'abc', '2022-12-12'),
(10, 'Julio Cauê Ramos', '1993-04-02', '320.402.308-74', '(27) 91556-9585', null, 'julio@gmail.com', 'abc', '2022-02-06'),
(11, 'Sarah Giovana Campos', '1999-02-22', '305.371.427-20', '(27) 97733-8972', null, 'sarah@gmail.com', 'abc', '2022-02-15'),
(12, 'Isabella Isabel Rosângela Farias', '2003-10-05', '166.127.822-18', '(27) 96661-8222', null, 'isabella@gmail.com', 'abc', '2022-03-12'),
(1, 'Aline Rodrigues Matos', '1981-08-07', '133.733.029-94' ,'(27) 96931-9856', null, 'alinermatos@yahoo.com.br', 'abc', '2022-10-20');

/* Inserts na Tabela Profissao */
INSERT INTO Profissao (descrProf) VALUES
('professor'),
('motorista'),
('programador'),
('designer'),
('jardineiro'),
('massagista'),
('enfermeiro');


/* Inserts na Tabela Especializacao */
INSERT INTO Especializacao (idProf, descrEspec) VALUES
(1, 'professor de matemática'),
(1, 'professor de física'),
(1, 'professor de química'),
(2, 'fretador'),
(2, 'transporte de pessoas'),
(3, 'programador frontend'),
(3, 'programador backend'),
(3, 'programador fullstack'),
(4, 'designer gráfico'),
(5, 'jardineiro'),
(1, 'professor de português'),
(6, 'massagista'),
(7, 'enfermeiro especialista em CTI'),
(7, 'enfermeiro especialista em centro-cirúrgico'),
(7, 'enfermeiro especialista em pronto-socorro');


/* Inserts na Tabela UserEspec */
INSERT INTO UserEspec (idUser, idEspec) VALUES
(2, 1),
(2, 2),
(2, 9),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(6, 3),
(6, 1),
(6, 8),
(7, 10),
(11, 11),
(13, 12),
(15, 14);


INSERT INTO StatusContrato (descrStatus, corCalendario) VALUES
('solicitacao contratacao', '#ff0000'),
('em andamento', '#ff00ff'),
('solicitacao finalizacao', '#000000'),
('finalizado', '#ffffff'),
('recusado', '#00ff00'),
('atrasado', '#0000ff');

/* 
Rafael: 2
    professor de matematica: 1
    professor de física: 2
    designer gráfico: 9

Matheus: 3
    fretador: 4

Thiago: 6
    professor de quimica: 3

Gian: 7
    jardineiro: 10

Yago: 11
    professor de português: 11

Sarah: 13
    massagista: 12

Aline: 15
    enfermeiro especialista em centro-cirúrgico: 14
*/
/* Inserts na Tabela Contrato */
INSERT INTO Contrato (idEspec, idContratado, idContratante, idStatus, timeCriacaoContrato) VALUES
-- RAFAEL
(9, 2, 6, 3, '2022-10-18 02:39:36'),
(9, 2, 8, 3, '2022-05-11 05:08:25'),
(1, 2, 4, 3, '2022-05-14 01:47:23'),
(1, 2, 8, 3, '2022-05-26 09:59:10'),
(9, 2, 5, 3, '2022-01-19 10:35:07'),
(9, 2, 11, 3, '2022-08-29 06:05:01'),
-- THIAGO
(3, 6, 3, 3, '2022-08-22 11:57:39'),
(3, 6, 2, 3, '2022-03-21 04:14:34'),
(1, 6, 6, 3, '2022-05-27 07:40:00'),
(1, 6, 5, 3, '2022-09-12 07:10:29'),
(1, 6, 5, 3, '2022-01-11 09:41:44'),
(1, 6, 4, 3, '2022-09-07 09:45:29'),
(8, 6, 2, 3, '2022-09-19 06:59:24'),
(8, 6, 15, 3, '2022-01-22 04:26:49'),
(8, 6, 13, 3, '2022-04-30 03:18:31'),
-- SARAH
(12, 13, 9, 3, '2022-02-03 01:55:36'),
(12, 13, 14, 3, '2022-06-14 08:44:04'),
(12, 13, 13, 3, '2022-02-19 06:48:46'),
-- MATHEUS
(4, 3, 15, 3, '2022-06-15 11:50:26'),
(5, 3, 5, 3, '2022-03-08 10:30:06'),
(6, 3, 2, 3, '2022-05-28 02:11:33'),
(7, 3, 3, 3, '2022-02-18 03:20:44'),
(8, 3, 9, 3, '2022-09-27 09:47:13'),
-- GIAN
(10, 7, 9, 3, '2022-02-03 01:55:36'),
(10, 7, 5, 3, '2022-06-14 08:44:04'),
(10, 7, 12, 3, '2022-02-19 06:48:46'),
-- ALINE
(14, 15, 5, 3, '2022-09-19 02:18:57');


-- por enquanto sem dados dos contratos
INSERT INTO DiaContrato (idContrato, diaContrato) VALUES
(1, '2022-06-23'),
(1, '2022-06-24'),
(1, '2022-06-25'),
(1, '2022-06-27'),
(2, '2022-10-15'),
(2, '2022-10-22'),
(2, '2022-10-29'),
(3, '2022-12-10'),
(3, '2022-12-11'),
(4, '2022-06-29'),
(4, '2022-06-30');


/* Inserts na Tabela Avaliacao */
INSERT INTO Avaliacao (idContrato, notaAvaliacao, comentarioAvaliacao) VALUES
(1, 4, 'Avaliacao1'),
(2, 1, 'Avaliacao2'),
(3, 1, 'Avaliacao3'),
(4, 2, 'Avaliacao4'),
(5, 5, 'Avaliacao5'),
(6, 4, 'Avaliacao6'),
(7, 3, 'Avaliacao7'),
(8, 5, 'Avaliacao8'),
(9, 3, 'Avaliacao9'),
(10, 5, 'Avaliacao10'),
(11, 1, 'Avaliacao11'),
(12, 3, 'Avaliacao12'),
(13, 3, 'Avaliacao13'),
(14, 2, 'Avaliacao14'),
(15, 4, 'Avaliacao15'),
(16, 4, 'Avaliacao16'),
(17, 2, 'Avaliacao17'),
(18, 2, 'Avaliacao18'),
(19, 5, 'Avaliacao19'),
(20, 2, 'Avaliacao20'),
(21, 4, 'Avaliacao21'),
(22, 1, 'Avaliacao22'),
(23, 3, 'Avaliacao23'),
(24, 3, 'Avaliacao24'),
(25, 5, 'Avaliacao25'),
(26, 5, 'Avaliacao26'),
(27, 1, 'Avaliacao27');

/* Inserts na Tabela Suporte */
INSERT INTO Suporte (idUser, topicoSuporte, mensagemSuporte) VALUES
(3, 'Problemas com a Profissão', 'Não consegui colocar minha profissão adequadamente'),
(2, 'Problemas com Login', 'Esqueci minha senha, o que faço agora?'),
(1, 'Sugestão', 'Estou gostando muito do aplicativo, mas sinto que seria bom um chat próprio para tornar a comunicação com meus clientes mais simples');
