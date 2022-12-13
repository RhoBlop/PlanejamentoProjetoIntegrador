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
DROP TABLE IF EXISTS NotificacaoContrato CASCADE;
DROP TABLE IF EXISTS Mensagem CASCADE;
DROP TABLE IF EXISTS UserMensagem CASCADE;

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
    isVisualizado BOOLEAN DEFAULT FALSE,
    timeCriacaoNotific TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    idRemetente INT,
    idDestinatario INT,
    idContrato INT,
    idStatus INT,

    PRIMARY KEY (idNotific)
);

/* CHAT */
CREATE TABLE Mensagem (
    idMensagem SERIAL,
    textoMensagem TEXT,
    timeCriacaoMensagem TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    idRemetente SERIAL,
    idDestinatario SERIAL,

    PRIMARY KEY(idMensagem)
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

ALTER TABLE NotificacaoContrato ADD CONSTRAINT fk_notificacao_statuscontrato
    FOREIGN KEY (idStatus)
    REFERENCES StatusContrato (idStatus)
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

/* CHAT */
ALTER TABLE Mensagem ADD CONSTRAINT fk_Mensagem_Remetente
    FOREIGN KEY (idRemetente)
    REFERENCES Usuario (idUser)
    ON DELETE CASCADE;

ALTER TABLE Mensagem ADD CONSTRAINT fk_Mensagem_Destinatario
    FOREIGN KEY (idDestinatario)
    REFERENCES Usuario (idUser)
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
('Bahia', 'BA'),
('Rio Grande do Sul', 'RS'),
('Acre','AC'),
('Alagoas','AL'),
('Amapá','AP'),
('Amazonas','AM'),
('Ceará','CE'),
('Goiás','GO'),
('Maranhão','MA'),
('Mato Grosso','MT'),
('Mato Grosso do Sul','MS'),
('Minas Gerais','MG'),
('Pará','PA'),
('Paraíba','PB'),
('Paraná','PR'),
('Pernambuco','PE'),
('Piauí','PI'),
('Rio de Janeiro','RJ'),
('Rio Grande do Norte','RN'),
('Rondônia','RO'),
('Roraima','RR'),
('Santa Catarina','SC'),
('Sergipe','SE'),
('Tocantins', 'TO'),
('Distrito Federal', 'DF');

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
INSERT INTO Usuario (idBairro, nomeuser, nascimentoUser, cpfUser, telefoneUser, biografiaUser, emailUser, senhaUser, isAdminUser) VALUES
(3, 'Mr White', '1958-09-07', '99999999999', '(27) xxxxx-xxxx', 'P.H.D em cristalografia 🧪
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
('Solicitado para contratação', '#BEFBFF'),
('Em andamento', '#304779'),
('Solicitado para finalização', '#F9F871'),
('Finalizado', '#2EA888'),
('Recusado', '#000000'),
('Atrasado', '#FF8D3E');

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
(9, 2, 8, 4, '2022-05-11 05:08:25'),
(9, 2, 6, 4, '2022-10-18 02:39:36'),
(1, 2, 4, 4, '2022-05-14 01:47:23'),
(1, 2, 8, 4, '2022-05-26 09:59:10'),
(9, 2, 5, 4, '2022-01-19 10:35:07'),
(9, 2, 11, 4, '2022-08-29 06:05:01'),
-- THIAGO
(3, 6, 3, 4, '2022-08-22 11:57:39'),
(3, 6, 2, 4, '2022-03-21 04:14:34'),
(1, 6, 6, 4, '2022-05-27 07:40:00'),
(1, 6, 5, 4, '2022-09-12 07:10:29'),
(1, 6, 5, 4, '2022-01-11 09:41:44'),
(1, 6, 4, 4, '2022-09-07 09:45:29'),
(8, 6, 2, 4, '2022-09-19 06:59:24'),
(8, 6, 15, 4, '2022-01-22 04:26:49'),
(8, 6, 13, 4, '2022-04-30 03:18:31'),
-- SARAH
(12, 13, 9, 4, '2022-02-03 01:55:36'),
(12, 13, 14, 4, '2022-06-14 08:44:04'),
(12, 13, 13, 4, '2022-02-19 06:48:46'),
-- MATHEUS
(4, 3, 15, 4, '2022-06-15 11:50:26'),
(5, 3, 5, 4, '2022-03-08 10:30:06'),
(6, 3, 2, 4, '2022-05-28 02:11:33'),
(7, 3, 3, 4, '2022-02-18 03:20:44'),
(8, 3, 9, 4, '2022-09-27 09:47:13'),
-- GIAN
(10, 7, 9, 4, '2022-02-03 01:55:36'),
(10, 7, 5, 4, '2022-06-14 08:44:04'),
(10, 7, 12, 4, '2022-02-19 06:48:46'),
-- ALINE
(14, 15, 5, 4, '2022-09-19 02:18:57');


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
(1, 4, 'Não gostei muito do serviço'),
(2, 1, 'Muito bom'),
(3, 1, ':/'),
(4, 2, 'Serviço show de bola'),
(5, 5, 'Como que tão as coisas aí'),
(6, 4, 'Não gostei muito do serviço'),
(7, 3, 'Muito bom'),
(8, 5, ':/'),
(9, 3, 'Serviço show de bola'),
(10, 5, 'Como que tão as coisas aí'),
(11, 1, 'Não gostei muito do serviço'),
(12, 3, 'Muito bom'),
(13, 3, ':/'),
(14, 2, 'Serviço show de bola'),
(15, 4, 'Como que tão as coisas aí'),
(16, 4, 'Não gostei muito do serviço'),
(17, 2, 'Muito bom'),
(18, 2, ':/'),
(19, 5, 'Serviço show de bola'),
(20, 2, 'Como que tão as coisas aí'),
(21, 4, 'Não gostei muito do serviço'),
(22, 1, 'Muito bom'),
(23, 3, ':/'),
(24, 3, 'Serviço show de bola'),
(25, 5, 'Como que tão as coisas aí'),
(26, 5, 'Não gostei muito do serviço'),
(27, 1, 'Muito bom');

/* Inserts na Tabela Suporte */
INSERT INTO Suporte (idUser, topicoSuporte, mensagemSuporte) VALUES
(3, 'Problemas com a Profissão', 'Não consegui colocar minha profissão adequadamente'),
(2, 'Problemas com Login', 'Esqueci minha senha, o que faço agora?'),
(1, 'Sugestão', 'Estou gostando muito do aplicativo, mas sinto que seria bom um chat próprio para tornar a comunicação com meus clientes mais simples');
