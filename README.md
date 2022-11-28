# TRABALHO DE PI:  Contrata Aí
Trabalho desenvolvido durante a disciplina de Projeto Integrador

# Sumário <a id="topo"></a>
1. [Componentes](#1-componentes)
2. [Minimundo](#2minimundo)
3. [PMC](#3pmc)
4. [Calendário Reverso](#4calendario-reverso)
5. [Personas e Histórias de Usuário](#5personas-e-histórias-de-usuário)
6. [Protótipo](#6rascunhos-básicos-da-interface-mockups)
    1. [Quais perguntas podem ser respondidas com o sistema proposto](#61-quais-perguntas-podem-ser-respondidas-com-o-sistema-proposto)
7. [Tabela de Dados](#7-tabela-de-dados-do-sistema)
8. [Modelo Conceitual](#8modelo-conceitual)
    1. [Descrição dos dados](#81-descrição-dos-dados)
9. [Rastreabilidade dos Artefatos](#9-rastreabilidade-dos-artefatos)
10. [Modelo Lógico](#10-modelo-lógico)
11. [Modelo Físico](#11-modelo-físico)
12. [Inserts](#12-insert-aplicado-nas-tabelas-do-banco-de-dados)
13. [Diagrama de Classes](#13-classes-do-sistema)
14. Tabelas e Principais Consultas 
    1. [Anteprojeto](#143-anteprojeto-versão-1)


### 👨‍💻 1. COMPONENTES <a id="1-componentes"></a>
**Integrantes do grupo**<br><br>
Rafael Rodrigues Matos: rafael1309mt@gmail.com <br>
Thiago Neves Luz: nevesluzthiago@gmail.com<br>
Matheus de Oliveira Magnago: magnagomatheus7@gmail.com<br>

### 🌎 2. MINIMUNDO <a id="2minimundo"></a>

> O Mundo está ficando cada vez mais modernizado... Utilizamos cada vez mais nossos celulares e computadores para facilitar nossas tarefas diárias. Pensando nisso, um grupo de estudantes do IFES Serra resolveu desenvolver um aplicativo focado em serviços autônomos, com o objetivo de facilitar a comunicação entre ambos clientes e prestadores de serviços.<br>
O Sistema do "Contrata Aí" seria feito nos seguintes moldes: O **USUÁRIO** se cadastraria com as seguintes informações: **nome**, **data de nascimento**, **cpf**, **email**, **senha**, **telefone**, REGIÃO (**BAIRRO**, **CIDADE**, **ESTADO**) e uma **foto** de perfil. Ele também irá informar as suas **ESPECIALIZAÇÕES**, caso seja um prestador de serviços, para que assim possamos diferenciar os profissionais dos clientes. Cada **ESPECIALIZAÇÃO** tem uma **PROFISSÃO** atribuída. Um usuário também pode ser um **ADMINISTRADOR**, caso **isAdminUser** seja verdadeira. 
Cadastrado, o **USUÁRIO** contrataria um serviço com os seguintes passos: buscaria um profissional em um mecanismo de busca com diversos filtros (REGIÃO, **PROFISSÃO**, **ESPECIALIZAÇÃO**, **AVALIAÇÃO**), entraria em seu perfil e veria suas **AVALIAÇÕES** e por fim solicitaria um contrato com o profissional. Caso ambos (Contratante e contratado) resolvam fazer um **CONTRATO**, ele informará ao nosso sistema a **data de contratação** e a **data de fim** do serviço, além de atribuir qual **ESPECIALIZAÇÃO** e uma **descrContrat**. O **CONTRATO** não ficará visível a todos os clientes, mas essas datas serão usadas para montar a agenda do profissional (que aparecerá na aba de Contratos no perfil do usuário). 
Os **CONTRATOS** também são **notificados** para o usuário (com a ajuda da tabela **NotificacaoContrato**). As notificações carregam consigo um **title** e uma **descricao**, além da **timeCriacao** (hora em que foi criada a notificação) e um controle de visualização (**isVisualizado**).
Passada a data da realização do **CONTRATO**, o **USUÁRIO** poderia então fazer uma **AVALIAÇÃO** do serviço feito, colocando sua **nota**, um **comentário** e uma **imagem** (opcional).<br>
**USUARIOS** também podem se enviar **MENSAGENS** em tempo real entre si, facilitando a interação entre ambos. 
Para feedback quanto ao aplicativo, sejam para sugestões, problemas ou reclamações, os **USUÁRIOS** podem fazer um contato com nós, desenvolvedores, através do **SUPORETE**, enviando uma **mensagemSuporte** com um **tópicoSuporte** pré-definido.
 
### 📋 3. PMC <a id="3pmc"></a>
![PMC - Contrata Aí](https://github.com/RhoBlop/PlanejamentoProjetoIntegrador/blob/main/arquivos/CanvasPMC.png?raw=true "PMC")
<br>

⬆️ [Voltar ao início](#topo)

### 🗓️ 4. Calendário reverso <a id="4calendario-reverso"></a>

Para nos organizarmos, criamos um calendário reverso para acompanharmos o andamentos de nossas tarefas e se elas estavam sendo feitas nos prazos estipulados. <br>

🔗 [Link para o calendário reverso](https://docs.google.com/spreadsheets/d/1k9YNGqm7fSp0WxOwgUg43jRwyoubNQXO9H_cI1iwJvs/edit?usp=sharing) <br>

⬆️ [Voltar ao início](#topo)

### 👥 5. Personas e Histórias de usuário <a id="5personas-e-histórias-de-usuário"></a>

👤 a) Personas desenvolvidos pelo grupo <br>

Persona 1 - José <br>
![Persona 1 - José](https://github.com/RhoBlop/PlanejamentoProjetoIntegrador/blob/main/arquivos/Personas/PersonaJorge.jpg?raw=true "Persona 1 - José")

🔗 [Link para o PDF das Personas](https://github.com/RhoBlop/PlanejamentoProjetoIntegrador/blob/main/arquivos/Personas/Personas.pdf?raw=true "Personas") <br><br>

📚 b) Inclusão das Histórias de usuário desenvolvidas pelo grupo

🔗 [Link para o PDF das Histórias de Usuários](https://github.com/RhoBlop/PlanejamentoProjetoIntegrador/blob/main/arquivos/Personas/HistoriasdeUsuario.pdf?raw=true "Histórias de Usuário") <br>

⬆️ [Voltar ao início](#topo)

<br>

### 📝 6. RASCUNHOS BÁSICOS DA INTERFACE (MOCKUPS) <a id="6rascunhos-básicos-da-interface-mockups"></a> 
O mockup foi feito pelo FIGMA, então disponibilizamos o link abaixo para visualização: <br>

🔗 [Link para acesso](https://www.figma.com/file/1vqdnEQkiOlLbIIEcZ05ip/Aplica%C3%A7%C3%A3o-Mobile?node-id=2%3A38) <br>

![Figma](https://github.com/RhoBlop/PlanejamentoProjetoIntegrador/blob/main/arquivos/Prototipos/Mobile.png?raw=true "Print do Figma") 

⬆️ [Voltar ao início](#topo)

#### ❓ 6.1. QUAIS PERGUNTAS PODEM SER RESPONDIDAS COM O SISTEMA PROPOSTO? <a id="51-quais-perguntas-podem-ser-respondidas-com-o-sistema-proposto"></a>
  
> a) Informações voltadas aos usuários 

> b) A Empresa Contratai precisa inicialmente dos seguintes relatórios:
* Relatório de todos os usuários que não possuem nenhuma profissão com as seguintes informações: nome, email, nascimento, cpf e estado.
* Relatório que informe quem são os usuários que possuem alguma profissão com as seguintes informações: nome, email, nascimento, cpf, profissão e estado. 
* Relatório dos dias disponíveis que um usuário com profissão possui com as seguintes informações: nome, email, nascimento, cpf, profissão, estado e dias disponíveis.
* Relatório com a quantidade de usuários cadastrados que possuem profissão. 
* Relatório com as especializações de cada profissão, contendo as seguintes informações: profissão e especialização.

⬆️ [Voltar ao início](#topo)

### 📊 7. TABELA DE DADOS DO SISTEMA <a id="7-tabela-de-dados-do-sistema"></a>

🔗 Link para a Tabela de Dados - Contrata Aí: https://docs.google.com/spreadsheets/d/16KPcQIgBEPmTegCXIHZ1YxdCZvrzmB23dAoRtXDNnhg/edit?usp=sharing <br>

⬆️ [Voltar ao início](#topo)

<br>

### 💭 8. MODELO CONCEITUAL <a id="8modelo-conceitual"></a>
     
![Conceitual](https://github.com/RhoBlop/PlanejamentoProjetoIntegrador/blob/main/arquivos/BancoDados/ModeloConceitual.png?raw=true "Modelo Conceitual")

#### ⬜ Principais Entidades
- Usuario
- Contrato
- Especializacao

#### 🔀 Principais Fluxos
- Usuario → Mensagem → Usuario
- Usuario → Tem → Especializacao → Tem → Profissao
- Avaliacao ← Tem ← Contrato ← Realizado ← Usuario 
- Contrato → Tem → NotificacaoContrato → Notifica → Usuario 

⬆️ [Voltar ao início](#topo)

<br>
    
#### 📄 8.1. Descrição dos dados <a id="81-descrição-dos-dados"></a>

**USUÁRIO**: Tabela que armazena as informações dos usuários cadastrados <br>
- **nomUser**: Armazena o nome completo do usuário cadastrado.
- **nascimentoUser**: Armazena a data de nascimento do usuário cadastrado.
- **cpfUser**: Armazena o número de CPF do usuário cadastrado.
- **emailUser**: Armazena o endereço de email do usuário cadastrado.
- **telefoneUser**: Armazena o número de telefone do usuário cadastrado.
- **imgUser**: Armazena a foto de perfil escolhida pelo usuário.
- **senhaUser**: Armazena a senha (criptografada) escolhida pelo usuário.
- **dataCriacaoUser**: Armazena a data em que aquele usuário foi criado.
- **isAdminUser**: Controla se aquele usuário é ou não um administrador. 
- **biografiaUser**: Armazena a biografia do usuário cadastrado. 

**ESPECIALIZAÇÃO**: Tabela referente às informações sobre a especialização de uma profissão <br>
- **descrEspec**: Armazena o nome da especialização cadastrada no sistema.
- **isPublicEspec**: Define se aquela especialização será pública ou não. 

**PROFISSÃO**: Tabela que armazena as informações sobre as profissões cadastradas no sistema <br>
- **descrProf**: Armazena o nome da profissão cadastrada no sistema. 
- **imgProf**: Armazena a imagem da profissão cadastrada no sistema. 

**DIASEMANA**: Tabela que armazena os dias da semana. <br>
- **dscDiaSemn**: Nome do dia da semana cadastrado.

**SUPORTE**: Tabela referente ao contato entre os usuários e os desenvolverores (nós) <br>
- **topicoSuporte**: Tópico do da mensagem que o usuário irá enviar.
- **mensagemSuporte**: Armazena a mensagem propriamente escrita pelo usuário.

**CONTRATO**: Tabela referente ao contrato estabelecido por dois usuários. Um usuário contrata alguem para que sua demanda seja realizada. <br>
- **timeCriacaoContrato**: Armazena a data de criação do contrato. 
- **descrContrato**: Armazena a descrição daquele contrato.
- **timeFinalizacaoContrato**: Armazena a data de quando aquele contrato foi finalizado. 
- **isAvaliado**: Checa se o contrato foi ou não avaliado. 

**DiaContrato**: Tabela referente aos dias que aquele contrato vai ser realizado. <br>
- **diaContrato**: Armazena o dia estabelecido no contrato. 

**STATUSCONTRATO**: Tabela referente ao status de um contrato. <br>
- **descrStatus**: Armazena o tipo de descrição daquele contrato.
- **corCalendario**: Armazena qual a cor vai ser colocada na agenda do usuário. 

**AVALIAÇÃO**: Tabela que refere as avaliações dos contratos. <br>
- **notaAvaliacao**: Valor da nota dada de 1 a 5 pelo usuário avaliador para o contrato.
- **comentarioAvaliacao**: Comentário feito pelo usuário avaliador para o contrato.
- **dataAvaliacao**: Armazena a data referente ao dia que aquela avaliação foi feita.

**MENSAGEM**: Autorelacionamento entre usuários onde cada um troca mensagens um com o outro (chat) <br>
- **textoMensagem**: Armaezena o texto da mensagem. 
- **timeCriacaoMensagem**: Armazena quando aquela mensagem foi criada. 

**BAIRRO, CIDADE, ESTADO**: Tabelas referentes a localização do usuário <br>
- **descrBairro, descrCidade, descrEstado**: Armazenam os nomes dos bairros, cidades e estados cadastrados no sistema respectivamente. 
- **siglaEstado**: Armazena a sigla do estado correspondente.


⬆️ [Voltar ao início](#topo)

<br>

### 📡9. RASTREABILIDADE DOS ARTEFATOS <a id="9-rastreabilidade-dos-artefatos"></a>

🔗 Link para a rastreabilidade dos artefatos: https://docs.google.com/spreadsheets/d/1XBFnOMejbF9WeBEAKDRbdR5ea8CP0M6xNnkPvz2_YnU/edit?usp=sharing <br>

⬆️ [Voltar ao início](#topo)


### 🧬 10. MODELO LÓGICO <a id="10-modelo-lógico"></a>

![Lógico](https://github.com/RhoBlop/PlanejamentoProjetoIntegrador/blob/main/arquivos/BancoDados/ModeloLogico.png?raw=true "Modelo Lógico")

⬆️ [Voltar ao início](#topo) <br>

### 📄 11. MODELO FÍSICO <a id="11-modelo-físico"></a>

⬇️ Segue abaixo o link para o Modelo Físico <br>

- 📃 [Script do Modelo Físico](https://github.com/RhoBlop/PlanejamentoProjetoIntegrador/blob/main/arquivos/BancoDados/ModeloFisico.sql?raw=true) <br>

⬆️ [Voltar ao início](#topo) <br>

### 📄 12. INSERT APLICADO NAS TABELAS DO BANCO DE DADOS <a id="12-insert-aplicado-nas-tabelas-do-banco-de-dados"></a>

⬇️ Segue abaixo o link para os Inserts do Banco de Dados <br>

- 📃 [Script dos Inserts](https://github.com/RhoBlop/PlanejamentoProjetoIntegrador/blob/main/arquivos/BancoDados/InsertsExemplo.sql?raw=true)

⬇️ Caso prefira, aqui está o link para o Modelo Físico + Inserts <br>

- 📃 [Físico + Inserts](https://github.com/RhoBlop/PlanejamentoProjetoIntegrador/blob/main/arquivos/BancoDados/Fisico+Inserts.sql?raw=true)


### 🗃️ 13. CLASSES DO SISTEMA <a id="13-classes-do-sistema"></a>

⬇️ Segue abaixo o diagrama de classes do nosso sistema <br>

![Diagrama de classes](https://github.com/RhoBlop/PlanejamentoProjetoIntegrador/blob/main/arquivos/DiagramaClasses.png?raw=true "Diagrama de classes") <br>

⬆️ [Voltar ao início](#topo) <br>

<!--
### 13	TABELAS E PRINCIPAIS CONSULTAS<br>
    OBS: Incluir para cada tópico as instruções SQL + imagens (print da tela) mostrando os resultados.<br>
#### 13.1	CONSULTAS DAS TABELAS COM TODOS OS DADOS INSERIDOS (Todas) <br>
#### 13.2 PRINCIPAIS CONSULTAS DO SISTEMA 
 Inserir as principais consultas (relativas aos 5 principais relatórios) definidas previamente no iten 3.1 deste template.
 <br>
  a) Você deve apresentar as consultas em formato SQL para cad um dos relatórios.
 <br>
  b) Além da consulta deve ser apresentada uma imagem com o resultado obtido para cada consulta.<br>
-->

### 📑 14.3. ANTEPROJETO VERSÃO 1 <a id="143-anteprojeto-versão-1"></a>
 
🔗 Link para [Modelo de Anteprojeto](https://docs.google.com/document/d/1j5ghB1QAEJij-8y80AIXdLZREqfTdI0EJTIJvSlYktc/edit?usp=sharing)

⬆️ [Voltar ao início](#topo)
 
 
<!--
 ### 14 Gráficos, relatórios, integração com Linguagem de programação e outras solicitações.<br>
     OBS: Observe as instruções relacionadas a cada uma das atividades abaixo.<br>
 #### 14.1	Integração com Linguagem de programação; <br>
 #### 14.2	Desenvolvimento de gráficos/relatórios pertinentes, juntamente com demais <br>
 #### solicitações feitas pelo professor. <br>
 #### 14.3 ANTEPROJETO VERSÃO 2
 <br>
 <br>
 
 
 ### 15 Slides e Apresentação em vídeo. <br>
     OBS: Observe as instruções relacionadas a cada uma das atividades abaixo.<br>
 #### 15.1 Slides; <br>
 #### 15.2 Apresentação em vídeo <br>
 #### 15.3 ANTEPROJETO VERSÃO FINAL
 <br>
 <br>   


    
##### About Formatting
    https://help.github.com/articles/about-writing-and-formatting-on-github/
    
##### Basic Formatting in Git
    
    https://help.github.com/articles/basic-writing-and-formatting-syntax/#referencing-issues-and-pull-requests
   
    
##### Working with advanced formatting
    https://help.github.com/articles/working-with-advanced-formatting/

#### Mastering Markdown
    https://guides.github.com/features/mastering-markdown/

### OBSERVAÇÕES IMPORTANTES

#### Todos os arquivos que fazem parte do projeto (Imagens, pdfs, arquivos fonte, etc..), devem estar presentes no GIT. Os arquivos do projeto vigente não devem ser armazenados em quaisquer outras plataformas.
1. Caso existam arquivos com conteúdos sigilosos, comunicar o professor que definirá em conjunto com o grupo a melhor forma de armazenamento do arquivo.

#### Todos os grupos deverão fazer Fork deste repositório e dar permissões administrativas ao usuário deste GIT, para acompanhamento do trabalho.

#### Os usuários criados no GIT devem possuir o nome de identificação do aluno (não serão aceitos nomes como Eu123, meuprojeto, pro456, etc). Em caso de dúvida comunicar o professor.


Link para BrModelo:<br>
http://sis4.com/brModelo/brModelo/download.html
<br>


Link para curso de GIT<br>
![https://www.youtube.com/curso_git](https://www.youtube.com/playlist?list=PLo7sFyCeiGUdIyEmHdfbuD2eR4XPDqnN2?raw=true "Title")
-->
