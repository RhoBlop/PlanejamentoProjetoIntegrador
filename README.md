# TRABALHO DE PI:  Contrata Aí
Trabalho desenvolvido durante a disciplina de Projeto Integrador

# Sumário <a id="topo"></a>
1. [Componentes](#1-componentes)
2. [Minimundo](#2minimundo)
3. [PMC](#3pmc)
4. [Personas e Histórias de Usuário](#4personas-e-histórias-de-usuário)
5. [Protótipo](#5rascunhos-básicos-da-interface-mockups)
    1. [Quais perguntas podem ser respondidas com o sistema proposto](#51-quais-perguntas-podem-ser-respondidas-com-o-sistema-proposto)
6. [Tabela de Dados](#6-tabela-de-dados-do-sistema)
7. [Modelo Conceitual](#7modelo-conceitual)
    1. [Descrição dos dados](#71-descrição-dos-dados)
8. [Rastreabilidade dos Artefatos](#8-rastreabilidade-dos-artefatos)
9. [Modelo Lógico](#9-modelo-lógico)
10. [Modelo Físico](#10-modelo-físico)
11. [Inserts](#11-insert-aplicado-nas-tabelas-do-banco-de-dados)
12. Tabelas e Principais Consultas 
    1. [Anteprojeto](#123-anteprojeto-versão-1)


<br>

### 👨‍💻 1. COMPONENTES <a id="1-componentes"></a>
Integrantes do grupo<br><br>
Rafael Rodrigues Matos: rafael1309mt@gmail.com <br>
Thiago Neves Luz: nevesluzthiago@gmail.com<br>
Matheus de Oliveira Magnago: magnagomatheus7@gmail.com<br>

### 🌎 2.MINIMUNDO <a id="2minimundo"></a>

> O Mundo está ficando cada vez mais modernizado... Utilizamos cada vez mais nossos celulares e computadores para facilitar nossas tarefas diárias. Pensando nisso, um grupo de estudantes do IFES Serra resolveu desenvolver um aplicativo focado em serviços autônomos, com o objetivo de facilitar a comunicação entre ambos clientes e prestadores de serviços.<br>
O Sistema do "Contrata Aí" seria feito nos seguintes moldes: O **USUÁRIO** se cadastraria com as seguintes informações: **nome**, **data de nascimento**, **cpf**, **email**, **senha**, **telefone**, REGIÃO (**BAIRRO**, **CIDADE**, **ESTADO**) e uma **foto** de perfil. Ele também irá informar as suas **ESPECIALIZAÇÕES**, caso seja um prestador de serviços, para que assim possamos diferenciar os profissionais dos clientes. O **USUÁRIO** que possua **ESPECIALIZAÇÕES** irá também colocar a sua **DISPONIBILIDADE**, para que ela fique visível em seu perfil e assim a pessoa que o queira contratar fique ciente dos dias da semana em que ele está disponível.<br>
Cadastrado, o **USUÁRIO** contrataria um serviço com os seguintes passos: buscaria um profissional em um mecanismo de busca com diversos filtros (REGIÃO, **PROFISSÃO**, **ESPECIALIZAÇÃO**, **AVALIAÇÃO**), checaria a agenda do mesmo, entraria em contato com ele e, caso ambos resolvam fazer um **CONTRATO**, ele informará ao nosso sistema a **data de contratação** e a **data de fim** do serviço. O **CONTRATO** não ficará visível a todos os clientes, mas essas datas serão usadas para montar a agenda pública do profissional (caso ele tenha um contrato em X horário no dia Y, aquele horário não estará disponível). Passada a data da realização do **CONTRATO**, o **USUÁRIO** poderia então fazer uma **AVALIAÇÃO** do serviço feito, colocando sua **nota**, um **comentário** e uma **imagem** (opcional).<br>
Para feedback quanto ao aplicativo, sejam para sugestões, problemas ou reclamações, os **USUÁRIOS** podem fazer um **CONTATO** com nós, desenvolvedores, enviando uma **mensagem** com um **tópico** pré-definido.
 
### 📋 3.PMC <a id="3pmc"></a>
![PMC - Contrata Aí](https://github.com/RhoBlop/template_projeto_integrador/blob/main/arquivos/Canvas.png?raw=true "PMC")
<br>

⬆️ [Voltar ao início](#topo)

### 👥4.Personas e Histórias de usuário <a id="4personas-e-histórias-de-usuário"></a>

👤 a) Personas desenvolvidos pelo grupo<br>

Persona 1 - José <br>
![Persona 1 - José](https://github.com/RhoBlop/template_projeto_integrador/blob/main/arquivos/Persona_Jose.jpg?raw=true "Persona 1 - José")

🔗 [Link para o PDF das Personas](https://github.com/RhoBlop/template_projeto_integrador/blob/main/arquivos/Personas.pdf?raw=true "Personas") <br><br>

📚 b) Inclusão das Histórias de usuário desenvolvidas pelo grupo

🔗 [Link para o PDF das Histórias de Usuários](https://github.com/RhoBlop/template_projeto_integrador/blob/main/arquivos/HistóriasdeUsuário.pdf?raw=true "Histórias de Usuário") <br>

⬆️ [Voltar ao início](#topo)

<br>

### 📝 5.RASCUNHOS BÁSICOS DA INTERFACE (MOCKUPS) <a id="5rascunhos-básicos-da-interface-mockups"></a> 
O mockup foi feito pelo FIGMA, então disponibilizamos o link abaixo para visualização: <br>

🔗 [Link para acesso](https://www.figma.com/file/1vqdnEQkiOlLbIIEcZ05ip/Aplica%C3%A7%C3%A3o-Mobile?node-id=2%3A38) <br>

![Figma](https://github.com/RhoBlop/template_projeto_integrador/blob/main/arquivos/Mockup.png?raw=true "Print do Figma") 

⬆️ [Voltar ao início](#topo)

#### ❓ 5.1 QUAIS PERGUNTAS PODEM SER RESPONDIDAS COM O SISTEMA PROPOSTO? <a id="51-quais-perguntas-podem-ser-respondidas-com-o-sistema-proposto"></a>
  
> a) Informações voltadas aos usuários 

> b) A Empresa Contratai precisa inicialmente dos seguintes relatórios:
* Relatório de todos os usuários que não possuem nenhuma profissão com as seguintes informações: nome, email, nascimento, cpf e estado.
* Relatório que informe quem são os usuários que possuem alguma profissão com as seguintes informações: nome, email, nascimento, cpf, profissão e estado. 
* Relatório dos dias disponíveis que um usuário com profissão possui com as seguintes informações: nome, email, nascimento, cpf, profissão, estado e dias disponíveis.
* Relatório com a quantidade de usuários cadastrados que possuem profissão. 
* Relatório com as especializações de cada profissão, contendo as seguintes informações: profissão e especialização.

⬆️ [Voltar ao início](#topo)

### 📊 6 TABELA DE DADOS DO SISTEMA <a id="6-tabela-de-dados-do-sistema"></a>

🔗 Link para a Tabela de Dados - Contrata Aí: https://docs.google.com/spreadsheets/d/16KPcQIgBEPmTegCXIHZ1YxdCZvrzmB23dAoRtXDNnhg/edit?usp=sharing <br>

⬆️ [Voltar ao início](#topo)

<br>

### 💭 7.MODELO CONCEITUAL <a id="7modelo-conceitual"></a>
     
![Conceitual](https://github.com/RhoBlop/template_projeto_integrador/blob/main/arquivos/Conceitual_ContrataAi.png?raw=true "Modelo Conceitual")

#### ⬜ Principais Entidades
- Usuário
- Contrato
- Profissão

#### 🔀 Principais Fluxos
- Usuário → Avalia → Usuário
- Usuário → Tem → Profissão
- Usuário → Contrato → Usuário
- Usuário → Possui → Disponibilidade

⬆️ [Voltar ao início](#topo)

<br>
    
#### 📄 7.1 Descrição dos dados <a id="71-descrição-dos-dados"></a>

**USUÁRIO**: Tabela que armazena as informações dos usuários cadastrados <br>
- **nomUsr**: Armazena o nome completo do usuário cadastrado.
- **datNascimentoUsr**: Armazena a data de nascimento do usuário cadastrado.
- **numCPFUsr**: Armazena o número de CPF do usuário cadastrado.
- **dscEmailUsr**: Armazena o endereço de email do usuário cadastrado.
- **numTelefoneUsr**: Armazena o número de telefone do usuário cadastrado.
- **dscFotoUsr**: Armazena a foto de perfil escolhida pelo usuário.
- **dscSenhaUsr**: Armazena a senha (criptografada) escolhida pelo usuário.

**ESPECIALIZAÇÃO**: Tabela referente às informações sobre a especialização de uma profissão <br>
- **dscEspec**: Armazena o nome da especialização cadastrada no sistema.

**PROFISSÃO**: Tabela que armazena as informações sobre as profissões cadastradas no sistema <br>
- **dscProf**: Armazena o nome da profissão cadastrada no sistema. 

**DISPONIBILIDADE**: Tabela referente à disponibilidade daquele usuário <br>
- **horaInicioDisp**: Hora inicial do período de disponibilidade.
- **horaFimDisp**: Hora final do período de disponibilidade.

**DIASEMANA**: Tabela que armazena os dias da semana <br>
- **dscDiaSemn**: Nome do dia da semana cadastrado.

**AVALIAÇÃO**: Tabela que refere as avaliações dos serviços de usuário <br>
- **numNotaAvalia**: Valor da nota dada de 1 a 10 pelo usuário avaliador para quem está sendo avaliado.
- **dscComentarioAvalia**: Comentário feito pelo usuário avaliador para quem está sendo avaliado.
- **dscImagemAvalia**: Atributo que armazena uma imagem enviada pelo usuário avaliador (não é obrigatória).

**CONTATO**: Tabela referente ao contato entre os usuários e os desenvolverores (nós) <br>
- **dscTopicoCont**: Tópico do da mensagem que o usuário irá enviar.
- **dscMensagemCont**: Armazena a mensagem propriamente escrita pelo usuário.

**CONTRATO**: Relacionamento entre os usuários referente aos serviços. Um usuário contrata alguem para que sua demanda seja realizada. <br>
- **datInicioContrt**: Data referente ao dia em que houve a contratação.
- **datFimContrt**: Data em que o serviço foi finalizado.

**BAIRRO, CIDADE, ESTADO**: Tabelas referentes a localização do usuário <br>
- **dscBairro, dscCidade, dscEstado**: Armazenam os nomes dos bairros, cidades e estados cadastrados no sistema respectivamente. 
- **dscSiglaEstado**: Armazena a sigla do estado correspondente.


⬆️ [Voltar ao início](#topo)

<br>

### 📡8 RASTREABILIDADE DOS ARTEFATOS <a id="8-rastreabilidade-dos-artefatos"></a>

🔗 Link para a rastreabilidade dos artefatos: https://docs.google.com/spreadsheets/d/1XBFnOMejbF9WeBEAKDRbdR5ea8CP0M6xNnkPvz2_YnU/edit?usp=sharing <br>

⬆️ [Voltar ao início](#topo)


### 🧬 9 MODELO LÓGICO <a id="9-modelo-lógico"></a>

![Lógico](https://github.com/RhoBlop/template_projeto_integrador/blob/main/arquivos/Lógico_ContrataAi.png?raw=true "Modelo Lógico")

⬆️ [Voltar ao início](#topo) <br>

### 📄 10 MODELO FÍSICO <a id="10-modelo-físico"></a>

⬇️ Segue abaixo o link para o Modelo Físico <br>

- 📃 [Script do Modelo Físico](https://github.com/RhoBlop/template_projeto_integrador/blob/main/arquivos/modeloFisico.sql?raw=true) <br>

⬆️ [Voltar ao início](#topo) <br>

### 📄 11 INSERT APLICADO NAS TABELAS DO BANCO DE DADOS <a id="11-insert-aplicado-nas-tabelas-do-banco-de-dados"></a>

⬇️ Segue abaixo o link para os Inserts do Banco de Dados <br>

- 📃 [Script dos Inserts](https://github.com/RhoBlop/template_projeto_integrador/blob/main/arquivos/exampleInserts.sql?raw=true)

⬇️ Caso prefira, aqui está o link para o Modelo Físico + Inserts <br>

- 📃 [Físico + Inserts](https://github.com/RhoBlop/template_projeto_integrador/blob/main/arquivos/FisicoInserts.sql?raw=true)

<br>

⬆️ [Voltar ao início](#topo)

<!--
### 12	TABELAS E PRINCIPAIS CONSULTAS<br>
    OBS: Incluir para cada tópico as instruções SQL + imagens (print da tela) mostrando os resultados.<br>
#### 12.1	CONSULTAS DAS TABELAS COM TODOS OS DADOS INSERIDOS (Todas) <br>
#### 12.2 PRINCIPAIS CONSULTAS DO SISTEMA 
 Inserir as principais consultas (relativas aos 5 principais relatórios) definidas previamente no iten 3.1 deste template.
 <br>
  a) Você deve apresentar as consultas em formato SQL para cad um dos relatórios.
 <br>
  b) Além da consulta deve ser apresentada uma imagem com o resultado obtido para cada consulta.<br>
-->

<br><br>

### 📑 12.3 ANTEPROJETO VERSÃO 1 <a id="123-anteprojeto-versão-1"></a>
 
🔗 Link para [Modelo de Anteprojeto](https://docs.google.com/document/d/1j5ghB1QAEJij-8y80AIXdLZREqfTdI0EJTIJvSlYktc/edit?usp=sharing)

⬆️ [Voltar ao início](#topo)
 
 
<!--
 ### 13 Gráficos, relatórios, integração com Linguagem de programação e outras solicitações.<br>
     OBS: Observe as instruções relacionadas a cada uma das atividades abaixo.<br>
 #### 13.1	Integração com Linguagem de programação; <br>
 #### 13.2	Desenvolvimento de gráficos/relatórios pertinentes, juntamente com demais <br>
 #### solicitações feitas pelo professor. <br>
 #### 13.3 ANTEPROJETO VERSÃO 2
 <br>
 <br>
 
 
 ### 14 Slides e Apresentação em vídeo. <br>
     OBS: Observe as instruções relacionadas a cada uma das atividades abaixo.<br>
 #### 14.1 Slides; <br>
 #### 14.2 Apresentação em vídeo <br>
 #### 14.3 ANTEPROJETO VERSÃO FINAL
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
