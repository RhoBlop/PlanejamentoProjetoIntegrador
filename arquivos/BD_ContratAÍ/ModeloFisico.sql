/* NewLGC_ContrtAÍ: */

/* Criação da Tabela Usuario */
CREATE TABLE Usuario (
    idUsr INT PRIMARY KEY,
    nomUsr VARCHAR(50),
    datNascimentoUsr DATE,
    numCPFUsr VARCHAR(12),
    dscEmailUsr VARCHAR(150),
    numTelefoneUsr VARCHAR(11),
    dscFotoUsr VARCHAR(100),
    dscSenhaUsr VARCHAR(100),
    datCriacaoAcc DATE,
    ultVisto DATE,
    IdBairro INT
);

/* Criação da Tabela Contato */
CREATE TABLE Contato (
    idCont INT PRIMARY KEY,
    idUsr INT,
    dscTopicoCont VARCHAR(100),
    dscMensagemCont VARCHAR(300)
);

/* Criação da Tabela Bairro */
CREATE TABLE Bairro (
    idBairro INT PRIMARY KEY,
    idCidade INT,
    dscBairro VARCHAR(100)
);
/* Criação da Tabela Cidade */
CREATE TABLE Cidade (
    idCidade INT PRIMARY KEY,
    idEstado INT,
    dscCidade VARCHAR(100)
);

/* Criação da Tabela Estado*/
CREATE TABLE Estado (
    idEstado INT PRIMARY KEY,
    dscEstado VARCHAR(100),
    dscSiglaEstado VARCHAR(2)
);

/* Criação da Tabela Disponibilidade */
CREATE TABLE Disponibilidade (
    idDisp INT PRIMARY KEY,
    idDiaSemn INT,
    horaInicioDisp DATE,
    horaFimDisp DATE
);

/* Criação da Tabela DiaSemana*/
CREATE TABLE DiaSemana (
    idDiaSemn INT PRIMARY KEY,
    dscDiaSemn VARCHAR(50)
);

/* Criação da Tabela Especializacao */
CREATE TABLE Especializacao (
    idEspec INT PRIMARY KEY,
    idProf INT,
    dscEspec VARCHAR(50)
);

/* Criação da Tabela Profissao */
CREATE TABLE Profissao (
    idProf INT PRIMARY KEY,
    dscProf VARCHAR(50)
);

/* Criação da Tabela Avaliacao */
CREATE TABLE Avaliacao (
    idAvalia INT PRIMARY KEY,
    idContrt INT,
    dscImagemAvalia VARCHAR(50),
    numNotaAvalia INT
);

/* Criação da Tabela Favorito */
CREATE TABLE Favorito (
    idFavoritador INT,
    idFavoritado INT,
    idFavorito INT PRIMARY KEY,
    datFav DATE
);

/* Criação da Tabela Contrato */
CREATE TABLE Contrato (
    idContratante INT,
    idContratado INT,
    idContrt INT PRIMARY KEY,
    datInicioContrt DATE,
    datFimContrt DATE,
    idEspec INT
);

/* Criação da Tabela UsrDisp */
CREATE TABLE UsrDisp (
    idUsr INT,
    idDisp INT
);

/* Criação da Tabela UsrEspec */
CREATE TABLE UsrEspec (
    idUsr INT,
    idEspec INT
);

/* Criação da Tabela Comentário */
CREATE TABLE Comentario (
    idComentario INT PRIMARY KEY,
    idAvalia INT,
    dscComentario VARCHAR(200)
);
 
 
 /* Atribuição das Chaves Primárias e Estrangeiras nas tabelas */
 
ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario_2
    FOREIGN KEY (IdBairro)
    REFERENCES Bairro (idBairro)
    ON DELETE CASCADE;
 
ALTER TABLE Contato ADD CONSTRAINT FK_Contato_2
    FOREIGN KEY (idUsr)
    REFERENCES Usuario (idUsr)
    ON DELETE CASCADE;
 
ALTER TABLE Bairro ADD CONSTRAINT FK_Bairro_2
    FOREIGN KEY (idCidade)
    REFERENCES Cidade (idCidade)
    ON DELETE CASCADE;
 
ALTER TABLE Cidade ADD CONSTRAINT FK_Cidade_2
    FOREIGN KEY (idEstado)
    REFERENCES Estado (idEstado)
    ON DELETE CASCADE;
 
ALTER TABLE Disponibilidade ADD CONSTRAINT FK_Disponibilidade_2
    FOREIGN KEY (idDiaSemn)
    REFERENCES DiaSemana (idDiaSemn)
    ON DELETE CASCADE;
 
ALTER TABLE Especializacao ADD CONSTRAINT FK_Especializacao_2
    FOREIGN KEY (idProf)
    REFERENCES Profissao (idProf)
    ON DELETE CASCADE;
 
ALTER TABLE Avaliacao ADD CONSTRAINT FK_Avaliacao_1
    FOREIGN KEY (idContrt)
    REFERENCES Contrato (idContrt)
    ON DELETE CASCADE;
 
ALTER TABLE Favorito ADD CONSTRAINT FK_Favorito_2
    FOREIGN KEY (idFavoritador)
    REFERENCES Usuario (idUsr)
    ON DELETE CASCADE;
 
ALTER TABLE Favorito ADD CONSTRAINT FK_Favorito_3
    FOREIGN KEY (idFavoritado)
    REFERENCES Usuario (idUsr)
    ON DELETE CASCADE;
 
ALTER TABLE Contrato ADD CONSTRAINT FK_Contrato_2
    FOREIGN KEY (idContratante)
    REFERENCES Usuario (idUsr)
    ON DELETE CASCADE;
 
ALTER TABLE Contrato ADD CONSTRAINT FK_Contrato_3
    FOREIGN KEY (idContratado)
    REFERENCES Usuario (idUsr)
    ON DELETE CASCADE;
 
ALTER TABLE Contrato ADD CONSTRAINT FK_Contrato_4
    FOREIGN KEY (idEspec)
    REFERENCES Especializacao (idEspec);
 
ALTER TABLE UsrDisp ADD CONSTRAINT FK_UsrDisp_1
    FOREIGN KEY (idUsr)
    REFERENCES Usuario (idUsr)
    ON DELETE SET NULL;
 
ALTER TABLE UsrDisp ADD CONSTRAINT FK_UsrDisp_2
    FOREIGN KEY (idDisp)
    REFERENCES Disponibilidade (idDisp)
    ON DELETE SET NULL;
 
ALTER TABLE UsrEspec ADD CONSTRAINT FK_UsrEspec_1
    FOREIGN KEY (idUsr)
    REFERENCES Usuario (idUsr)
    ON DELETE SET NULL;
 
ALTER TABLE UsrEspec ADD CONSTRAINT FK_UsrEspec_2
    FOREIGN KEY (idEspec)
    REFERENCES Especializacao (idEspec)
    ON DELETE SET NULL;
 
ALTER TABLE Comentario ADD CONSTRAINT FK_Comentario_1
    FOREIGN KEY (idAvalia)
    REFERENCES Avaliacao (idAvalia);
