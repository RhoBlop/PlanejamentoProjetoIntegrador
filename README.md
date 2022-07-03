# TRABALHO DE PI:  Contrata Aí
Trabalho desenvolvido durante a disciplina de Projeto Integrador

# Sumário

### 1. COMPONENTES<br>
Integrantes do grupo<br>
Rafael Rodrigues Matos: rafael1309mt@gmail.com <br>
Thiago Neves Luz: nevesluzthiago@gmail.com<br>
Matheus de Oliveira Magnago: magnagomatheus7@gmail.com<br>

### 2.MINIMUNDO<br>
<!-- Descrever o mini-mundo! (Não deve ser maior do que 30 linhas, se necessário resumir para justar)
Entrevista com o usuário e identificação dos requisitos.(quando for o caso de sistemas com cliente real)
Descrição textual das regras de negócio definidas como um subconjunto do mundo real cujos elementos são propriedades que desejamos incluir, processar, armazenar, gerenciar, atualizar, e que descrevem a proposta/solução a ser desenvolvida.
<br> -->

> O Mundo está ficando cada vez mais modernizado... Utilizamos cada vez mais nossos celulares e computadores para facilitar nossas tarefas diárias. Pensando nisso, um grupo de estudantes do IFES Serra resolveu desenvolver um aplicativo focado em serviços autônomos, para que tanto os prestadores quanto os clientes desses serviços sejam beneficiados. O Sistema do "Contrata Aí" seria feito nos seguintes moldes: O Usuário se cadastraria com as seguintes informações: nome, data de nascimento, cpf, email, senha, telefone, localização (bairro) e uma foto de perfil. Ele também irá informar se possui ou não uma profissão, para que assim podermos diferenciar os Profissionais dos Clientes. Nem toda profissão precisa necessariamente estar ligada a um usuário, porém todo usuário deve informar se possui uma profissão (mesmo que ela seja NENHUMA). Cada profissão possui uma Especialização, que serve para descrever melhor qual o ramo da profissão que aquele usuário possui (Um pintor de ACABAMENTO, um WEB-designer e etc). O Usuário com profissão iria também colocar a sua disponibilidade, para ela fique visível em seu perfil e assim a pessoa que queria o contratar fique ciente dos dias da semana em que ele está disponível. Cadastrado, o usuário contrataria um serviço com os seguintes passos: buscaria um profissional em um mecanismo de busca com diversos filtros (região, profissão, especialização, avaliações), checaria a agenda do mesmo e então mandaria um solicitação para o contratar. Com a solicitação aceita, ambos iniciariam uma conversa até que o serviço seja realmente contratado. Passada a data da realização do contrato, o usuário poderia então avaliar o serviço feito, colocando sua nota, um comentário e uma imagem (opcional). Os usuários também podem contatar os desenvolvedores, enviando uma mensagem com um tópico pré-definido. 
 
### 3.PMC<br>
![PMC - Contrata Aí](https://github.com/RhoBlop/template_projeto_integrador/blob/main/arquivos/Canvas.png?raw=true "PMC")
<br>


### 4.Personas e Histórias de usuário<br>
<!--
<img src="https://neilpatel.com/wp-content/uploads/2019/07/exemplo-carlos.png" Personas src="https://neilpatel.com/wp-content/uploads/2019/07/exemplo-carlos.png" width="500" height="500" /> <br>
-->
a) Personas desenvolvidos pelo grupo<br>

Persona 1 - José <br>
![Persona 1 - José](https://github.com/RhoBlop/template_projeto_integrador/blob/nova/arquivos/Persona_Jose.jpg?raw=true "Persona 1 - José")

![Link para o PDF das Personas](https://github.com/RhoBlop/template_projeto_integrador/blob/main/arquivos/Personas.pdf?raw=true "Personas")

b) inclusão das Histórias de usuário desenvolvidas pelo grupo

![Link para o PDF das Histórias de Usuários](https://github.com/RhoBlop/template_projeto_integrador/blob/nova/arquivos/HistóriasdeUsuário.pdf?raw=true "Histórias de Usuário")

### 5.RASCUNHOS BÁSICOS DA INTERFACE (MOCKUPS)<br>
O mockup foi feito pelo FIGMA, então disponibilizamos o link abaixo para visualização: <br>

Link para acesso: https://www.figma.com/file/1vqdnEQkiOlLbIIEcZ05ip/Aplica%C3%A7%C3%A3o-Mobile?node-id=2%3A38<br>

![Figma](https://github.com/RhoBlop/template_projeto_integrador/blob/main/arquivos/Mockup.png?raw=true "Print do Figma")


#### 5.1 QUAIS PERGUNTAS PODEM SER RESPONDIDAS COM O SISTEMA PROPOSTO?
<!--
    a) O sistema proposto poderá fornecer quais tipos de relatórios e informaçes? 
    b) Crie uma lista com os 5 principais relatórios que poderão ser obtidos por meio do sistema proposto!
-->    
> a) Informações voltadas aos usuários 

> b) A Empresa Contratai precisa inicialmente dos seguintes relatórios:
* Relatório de todos os usuários que não possuem nenhuma profissão com as seguintes informações: nome, email, nascimento, cpf e estado.
* Relatório que informe quem são os usuários que possuem alguma profissão com as seguintes informações: nome, email, nascimento, cpf, profissão e estado. 
* Relatório dos dias disponíveis que um usuário com profissão possui com as seguintes informações: nome, email, nascimento, cpf, profissão, estado e dias disponíveis.
* Relatório com a quantidade de usuários cadastrados que possuem profissão. 
* Relatório com as especializações de cada profissão, contendo as seguintes informações: profissão e especialização.

 

### 6 TABELA DE DADOS DO SISTEMA:
<!--
    A) Esta tabela deve conter **todos os atributos do sistema** e um mínimo de 10 linhas/registros de dados.
    B) Esta tabela tem a intenção de simular um relatório com todos os dados que serão armazenados 
 <br> (veja o exemplo abaixo antes de criar a tabela para seu trabalho)
    C) Após criada esta tabela não deve ser modificada, pois será comparada com os resultados finais na conclusão do trabalho
-->    


Link para a Tabela de Dados - Contrata Aí: https://docs.google.com/spreadsheets/d/16KPcQIgBEPmTegCXIHZ1YxdCZvrzmB23dAoRtXDNnhg/edit?usp=sharing <br>


 
 ### 7.MODELO CONCEITUAL<br>
<!--
    A) Utilizar a Notação adequada (Preferencialmente utilizar o BR Modelo 3)
    B) O mínimo de entidades do modelo conceitual pare este trabalho será igual a 4.
        * informe quais são as 3 principais entidades do sistema em densenvolvimento
 <br>(se houverem mais de 3 entidades, pense na importância da entidade para o sistema)       
    C) Principais fluxos de informação/entidades do sistema (mínimo 2). <br>Dica: normalmente estes fluxos estão associados as tabelas que conterão maior quantidade de dados 
    D) Qualidade e Clareza
        Garantir que a semântica dos atributos seja clara no esquema (nomes coerentes com os dados).
        Criar o esquema de forma a garantir a redução de informação redundante, possibilidade de valores null, 
        e tuplas falsas (Aplicar os conceitos de normalização abordados).   
-->        
![Conceitual](https://github.com/RhoBlop/template_projeto_integrador/blob/nova/arquivos/Conceitual_ContrataAi.png?raw=true "Modelo Conceitual")

#### Principais Entidades
- Usuário
- Contrato
- Profissão

#### Principais Fluxos

    
#### 7.1 Descrição dos dados 
<!--
    [objeto]: [descrição do objeto]
    
    EXEMPLO:
    CLIENTE: Tabela que armazena as informações relativas ao cliente<br>
    CPF: campo que armazena o número de Cadastro de Pessoa Física para cada cliente da empresa.<br>
-->
**USUÁRIO**: Tabela que armazena as informações dos usuários cadastrados <br>
- Nome: Armazena o nome completo do usuário cadastrado.
- **Nascimento**: Armazena a data de nascimento do usuário cadastrado.

**PROFISSÃO**: Tabela que armazena as informações sobre as profissões cadastradas no sistema <br>
**ESPECIALIZAÇÃO**: Tabela referente às informações sobre a especialização de uma profissão <br>
**DISPONIBILIDADE**: Tabela referente à disponibilidade daquele usuário <br>
**AVALIAÇÃO**: Tabela que refere as avaliações dos serviços de usuário <br>
**CONTATO**: Tabela referente ao contato entre os usuários e os desenvolverores (nós) <br>
**CONTRATO**: Relacionamento entre os usuários referente aos serviços. Um usuário contrata alguem para que sua demanda seja realizada. <br>
**BAIRRO, CIDADE, ESTADO**: Tabelas referentes a localização do usuário <br>


        

<!-- 
### 8	RASTREABILIDADE DOS ARTEFATOS<br>
        a) Historia de usuários vs protótipo (mockup)
        b) Protótipo vs Modelo conceitual
        (não serão aceitos modelos que não estejam em conformidade)
        c) Backlog (caso solicitado)
       


### 9	MODELO LÓGICO<br>
        a) inclusão do esquema lógico do banco de dados
        b) verificação de correspondencia com o modelo conceitual 
        (não serão aceitos modelos que não estejam em conformidade)

### 10	MODELO FÍSICO<br>
        a) inclusão das instruções de criacão das estruturas em SQL/DDL 
        (criação de tabelas, alterações, etc..) 
        
       
### 11	INSERT APLICADO NAS TABELAS DO BANCO DE DADOS<br>
        a) inclusão das instruções de inserção dos dados nas tabelas criadas pelo script de modelo físico
        (Drop para exclusão de tabelas + create definição de para tabelas e estruturas de dados 
 <br> + insert para dados a serem inseridos)
        b) Criar um novo banco de dados para testar a restauracao 
        (em caso de falha na restauração o grupo não pontuará neste quesito)
        c) formato .SQL


### 12	TABELAS E PRINCIPAIS CONSULTAS<br>
    OBS: Incluir para cada tópico as instruções SQL + imagens (print da tela) mostrando os resultados.<br>
#### 12.1	CONSULTAS DAS TABELAS COM TODOS OS DADOS INSERIDOS (Todas) <br>
#### 12.2 PRINCIPAIS CONSULTAS DO SISTEMA 
 Inserir as principais consultas (relativas aos 5 principais relatórios) definidas previamente no iten 3.1 deste template.
 <br>
  a) Você deve apresentar as consultas em formato SQL para cad um dos relatórios.
 <br>
  b) Além da consulta deve ser apresentada uma imagem com o resultado obtido para cada consulta.<br>
 #### 12.3 ANTEPROJETO VERSÃO 1
 
 Link para [Modelo de Anteprojeto](https://docs.google.com/document/d/1oeVS2CUffbSNYWxIWZFY_mX6E5ao_PHU/edit?usp=sharing&ouid=104104747195236161434&rtpof=true&sd=true)
 
 <br>
 <br>
 
 
 
 
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
