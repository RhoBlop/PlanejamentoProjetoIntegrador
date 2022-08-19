-- Usuários sem profissão cadastrada
SELECT DISTINCT nomUsr as "Usuário", dscEmailUsr as "Email", datNascimentoUsr as "Nascimento", numCPFUsr as "CPF", dscBairro as "Bairro", dscCidade as "Cidade",
dscEstado as "Estado", dscProf as "Profissão", dscEspec as "Especialização"
FROM usuario as usr 
INNER JOIN usrEspec as usres ON (usres.idUsr = usr.idUsr)
INNER JOIN especializacao as espec ON (usres.idEspec = espec.idEspec)
INNER JOIN profissao as prof ON (espec.idProf = prof.idProf)
INNER JOIN bairro as bair ON (usr.idbairro = bair.idbairro) 
INNER JOIN cidade as cid ON (bair.idcidade = cid.idcidade)
INNER JOIN estado as es ON (cid.idEstado = es.idEstado);

-- Usuários com profissão cadastrada
SELECT DISTINCT nomUsr as "Usuário", dscEmailUsr as "Email", datNascimentoUsr as "Nascimento", numCPFUsr as "CPF", dscBairro as "Bairro", dscCidade as "Cidade",
dscEstado as "Estado", dscProf as "Profissão", dscEspec as "Especialização"
FROM usuario as usr 
INNER JOIN usrEspec as usres ON (usres.idUsr = usr.idUsr)
INNER JOIN especializacao as espec ON (usres.idEspec = espec.idEspec)
INNER JOIN profissao as prof ON (espec.idProf = prof.idProf)
INNER JOIN bairro as bair ON (usr.idbairro = bair.idbairro) 
INNER JOIN cidade as cid ON (bair.idcidade = cid.idcidade)
INNER JOIN estado as es ON (cid.idEstado = es.idEstado)

-- Especializações e suas respectivas profissões
SELECT dscEspec as "Especialização", dscProf as "Profissão"
FROM especializacao as espec
INNER JOIN profissao as prof ON (espec.idProf = prof.idProf)

-- Dias da semana disponíveis de um usuário
SELECT DISTINCT dscDiaSemn as "DiaSemana", nomUsr as "Usuário", dscEmailUsr as "Email"
FROM usuario as usr
INNER JOIN usrDisp as usrdi ON (usr.idUsr = usrdi.idUsr)
INNER JOIN disponibilidade as disp ON (usrdi.idDisp = disp.idDisp)
INNER JOIN diaSemana as diaSemn ON (disp.idDiaSemn = diaSemn.idDiaSemn)
/* WHERE usr.idUsr = (X) */

-- Principais categorias (profissões)
SELECT 