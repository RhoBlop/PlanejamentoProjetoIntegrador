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
    siglaEstado char(2),

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
    nascimentoUsr date,
    telefoneUsr varchar(13),
    cpfUsr char(13),
    imgUsr text,
    emailUsr varchar(100),
    senhaUsr varchar(100),
    biografiaUsr text;

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
    idAvaliacao SERIAL,
    notaAvaliacao integer,
    comentarioAvaliacao varchar(200),
    imagemAvaliacao varchar(100),

    idAvaliador INT,
    idAvaliado INT,

    PRIMARY KEY(idAvaliacao)
);

/* Criação da Tabela Contato */
CREATE TABLE Contato (
    idContato SERIAL,
    topicoContato varchar(100),
    mensagemContato varchar(500),

    idUsr INT,

    PRIMARY KEY(idContato)
);

/* Criação da Tabela DiaSemana */
CREATE TABLE DiaSemana (
    idDiaSemn SERIAL,
    dscDiaSemn varchar(100),

    PRIMARY KEY(idDiaSemn)
);

/* Criação da Tabela Contrat */
CREATE TABLE Contrato (
    idContrato SERIAL,
    inicioContrato date,
    fimContrato date,

    idContratante INT,
    idContratado INT,

    PRIMARY KEY(idContrato)
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

/* ==================================
                INSERTS
   ================================== */

/* Inserts na Tabela Estado */
INSERT INTO Estado (dscEstado, siglaEstado) VALUES
('Espírito Santo', 'ES'),
('São Paulo', 'SP'),
('Bahia', 'SP'),
('Rio Grande do Sul', 'RS');

/* Inserts na Tabela Cidade */
INSERT INTO Cidade (idEstado, dscCidade) VALUES
(1, 'Serra'),
(1, 'Vitória'),
(2, 'São Paulo'),
(3, 'Salvador');

/* Inserts na Tabela Bairro */
INSERT INTO Bairro (idCidade, dscBairro) VALUES
(1, 'Praia de Carapebus'),
(1, 'Santo Antônio'),
(2, 'Jardim da Penha'),
(1, 'Colina de Laranjeiras'),
(3, 'Morumbi');

/* Inserts na Tabela Usuario */
INSERT INTO Usuario (idBairro, nomUsr, nascimentoUsr, cpfUsr, telefoneUsr, imgUsr, emailUsr, senhaUsr) VALUES
(1, 'Rafael Rodrigues', '1990-09-13', '16443762703', '27997550259', 'rafael.png', 'rafael1309@gmail.com', 'gabigolmengao231119'),
(5, 'Matheus Magnago', '2003-04-17', '19047174704', '27998230645', 'matheus.png', 'matheus@gmail.com', 'santospeixao2011'),
(3, 'Jordana Lourenço', '2004-05-19', '15356745710', '27999445510', 'jordana.png', 'jordana@hotmail.com', 'cambridge2023'),
(4, 'Breno Amâncio', '2003-11-03', '19829381707', '27997528603', 'breno.png', 'breno@outlook.com', 'breninlindo2003'),
(3, 'Thiago Neves', '2004-08-08', '11111111111', '27912345678', 'thiago.png', 'snow.thiago@gmail.com', 'batata123');

/* Inserts na Tabela Profissao */
INSERT INTO Profissao (dscProf) VALUES
('professor'),
('motorista'),
('programador'),
('designer');

/* Inserts na Tabela Especializacao */
INSERT INTO Especializacao (idProf, dscEspec) VALUES
(1, 'professor de matemática'),
(1, 'professor de física'),
(2, 'fretador'),
(2, 'transporte de pessoas'),
(3, 'programador frontend'),
(3, 'programador backend'),
(3, 'programador fullstack'),
(4, 'designer gráfico');

/* Inserts na Tabela UsrEspec */
INSERT INTO UsrEspec (idUsr, idEspec) VALUES
(1, 1),
(1, 2),
(1, 8),
(2, 3);

/* Inserts na Tabela Avaliacao */
INSERT INTO Avaliacao (idAvaliado, idAvaliador, notaAvaliacao, comentarioAvaliacao, imagemAvaliacao) VALUES
(1, 2, 4, 'pagina muito bem feita, porém nao gostei muito das cores', 'feedback.png'),
(1, 4, 5, 'depois que meu filho começou a ter aulas de matématica com ele, suas notas aumentaram muito', null),
(1, 5, 1, 'não gostei do resultado final do design do cartão de minha firma, pareceu feito às pressas', 'feedback3.png'),
(2, 3, 2, 'contratei ele para transportar os móveis durante minha mudança, mas, apesar do bom preço, um dos móveis chegou amassado >:(', 'feedback4.png');

/* Inserts na Tabela Contato */
INSERT INTO Contato (idUsr, topicoContato, mensagemContato) VALUES
(3, 'Problemas com a Profissão', 'Não consegui colocar minha profissão adequadamente'),
(2, 'Problemas com Login', 'Esqueci minha senha, o que faço agora?'),
(1, 'Sugestão', 'Estou gostando muito do aplicativo, mas sinto que seria bom um chat próprio para tornar a comunicação com meus clientes mais simples');

/* Inserts na Tabela DiaSemana */
INSERT INTO DiaSemana (dscDiaSemn) VALUES
('domingo'),
('segunda'),
('terça'),
('quarta'),
('quinta'),
('sexta'),
('sábado');

/* Inserts na Tabela Contrato */
INSERT INTO Contrato (idContratado, idContratante, inicioContrato, fimContrato) VALUES
(1, 2, '2022-06-23', '2022-06-30'),
(1, 4, '2022-08-08', '2022-08-10'),
(1, 5, '2022-08-09', '2022-08-15'),
(2, 3, '2022-02-03', '2022-02-04');

/* Inserts na Tabela Disponibilidade */
INSERT INTO Disponibilidade (idDiaSemn, horaInicioDisp, horaFimDisp) VALUES
(2, '06:00', '07:00'),
(2, '07:00', '08:00'),
(2, '08:00', '09:00'),
(2, '09:00', '10:00'),
(2, '10:00', '11:00'),
(2, '11:00', '12:00'),
(2, '12:00', '13:00'),
(2, '13:00', '14:00'),
(2, '14:00', '15:00'),
(2, '15:00', '16:00'),
(2, '16:00', '17:00'),
(2, '17:00', '18:00'),
(3, '06:00', '07:00'),
(3, '07:00', '08:00'),
(3, '08:00', '09:00'),
(3, '09:00', '10:00'),
(3, '10:00', '11:00'),
(3, '11:00', '12:00'),
(3, '12:00', '13:00'),
(3, '13:00', '14:00'),
(3, '14:00', '15:00'),
(3, '15:00', '16:00'),
(3, '16:00', '17:00'),
(3, '17:00', '18:00'),
(4, '06:00', '07:00'),
(4, '07:00', '08:00'),
(4, '08:00', '09:00'),
(4, '09:00', '10:00'),
(4, '10:00', '11:00'),
(4, '11:00', '12:00'),
(4, '12:00', '13:00'),
(4, '13:00', '14:00'),
(4, '14:00', '15:00'),
(4, '15:00', '16:00'),
(4, '16:00', '17:00'),
(4, '17:00', '18:00'),
(5, '06:00', '07:00'),
(5, '07:00', '08:00'),
(5, '08:00', '09:00'),
(5, '09:00', '10:00'),
(5, '10:00', '11:00'),
(5, '11:00', '12:00'),
(5, '12:00', '13:00'),
(5, '13:00', '14:00'),
(5, '14:00', '15:00'),
(5, '15:00', '16:00'),
(5, '16:00', '17:00'),
(5, '17:00', '18:00'),
(6, '06:00', '07:00'),
(6, '07:00', '08:00'),
(6, '08:00', '09:00'),
(6, '09:00', '10:00'),
(6, '10:00', '11:00'),
(6, '11:00', '12:00'),
(6, '12:00', '13:00'),
(6, '13:00', '14:00'),
(6, '14:00', '15:00'),
(6, '15:00', '16:00'),
(6, '16:00', '17:00'),
(6, '17:00', '18:00'),
(7, '06:00', '07:00'),
(7, '07:00', '08:00'),
(7, '08:00', '09:00'),
(7, '09:00', '10:00'),
(7, '10:00', '11:00'),
(7, '11:00', '12:00'),
(7, '12:00', '13:00'),
(7, '13:00', '14:00'),
(7, '14:00', '15:00'),
(7, '15:00', '16:00'),
(7, '16:00', '17:00'),
(7, '17:00', '18:00');

/* Inserts na Tabela UsrDisp */
INSERT INTO UsrDisp (idUsr, idDisp) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 30),
(1, 31),
(1, 32),
(1, 33);
