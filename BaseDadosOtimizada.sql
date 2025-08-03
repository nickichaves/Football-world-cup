   create database projeto_v3;
   use projeto_v3; 


         /*     TABELAS     */

   /*Tabela Pais*/
   create table Pais
   (
      Nome   varchar(60)   not null,
      Sigla char(3) not null,
      NumHabitantes   Integer   null,
   
      constraint PK_Pais primary key (Sigla),
      constraint UQ_Nome unique (Nome)
   );


   /*Tabela Federacao*/
   create table Federacao
   (
      Nome   varchar(60)   not null,
      Pais   char(3)   not null,
      NumFederados   Integer   null,
   
      constraint PK_Federacao primary key (Pais)
   );


   /*Tabela Edicao*/
   create table Edicao
   (
      Ano   smallint   not null,
      Designacao   varchar(60)   null,
      Orcamento   Integer   null,
      Organizador_1 char(3) not null,
      Organizador_2 char(3) null,                    /*Null porque pode haver apenas um organizador*/
      Total_Selecoes smallint not null,
      constraint PK_Edicao primary key (Ano)
   );

   
   /*Tabela JogadorSelecao*/
   create table JogadorSelecao
   (
      ElementoComitiva_Numero   smallint   not null,
      NomeClube   varchar(60)   null,
      Selecao_Pais   char(3)   not null,
      Selecao_Ano   smallint   not null,
      NumCamisola   tinyint   not null,
      NumInternacionalizacoes   smallint   null,
      Estado   enum ('Convocado', 'Dispensado', 'Lesionado', 'Castigado')   null,
      Posicao   enum ('guarda-redes', 'defesa', 'medio', 'avancado')   null,
      Nome varchar(60) not null,
      Nascimento date not null,
      N_Golos   tinyint    not null,
      N_Assistencias   tinyint    not null,
      N_Jogos_Sem_Sofrer   tinyint    not null,
   
      constraint PK_JogadorSelecao primary key (Selecao_Pais, Selecao_Ano, NumCamisola)    /* Primary key - Ano(Edicao), Nome(Pais) e nº de camisola*/
   );


   /*Tabela Comitiva*/
   create table Comitiva
   (
      Pais   char(3)   not null,
      Ano   smallint   not null,
      Mascote   varchar(60)   null,
      Patrocinador_Oficial_Sigla   char(4)   not null,
   
      constraint PK_Comitiva primary key (Pais, Ano)
   );


   /*Tabela ElementoComitiva*/
   create table ElementoComitiva
   (
      NumeroSerie   smallint   not null,
      Comitiva_Pais   varchar(60)   not null,
      Comitiva_Ano   smallint   not null,
   
      constraint PK_ElementoComitiva primary key (NumeroSerie)
   );


   /*Tabela Presidente*/
   create table Presidente
   (
      ElementoComitiva_Numero   smallint   not null,
      AnoNomeacao   smallint   null,
      Nome varchar(60) not null,
      Nascimento date not null,
   
      constraint PK_Presidente primary key (ElementoComitiva_Numero)
   );


   /*Tabela Tecnico*/
   create table Tecnico
   (
      ElementoComitiva_Numero   smallint   not null,
      Funcao   varchar(30)   not null,
      AnosExperiencia   tinyint   null,
      Nome varchar(60) not null,
      Nascimento date not null,
   
      constraint PK_Tecnico primary key (ElementoComitiva_Numero)
   );


   /*Tabela Outro*/
   create table Outro
   (
      ElementoComitiva_Numero   smallint   not null,
      Funcao   varchar(30)   not null,
      Nome varchar(60) not null,
      Nascimento date not null,
   
      constraint PK_Outro primary key ( ElementoComitiva_Numero)
   );


   /*Tabela Patrocinador*/
   create table Patrocinador
   (
      Sigla   char(4)   not null,
      Nome   varchar(60)   null,
   
      constraint PK_Patrocinador primary key (Sigla)
   );


   /*Tabela Patrocinio*/
   create table Patrocinio
   (
      Comitiva_Pais   char(3)   not null,
      Comitiva_Ano   smallint   not null,
      Patrocinador_Sigla   char(4)   not null,
      Montante   Integer   null,
   
      constraint PK_Patrocinio primary key (Comitiva_Pais, Comitiva_Ano, Patrocinador_Sigla)
   );


   /*Tabela Penalização*/
   create table Penalizacao
   (
      Jogo_Numero   Integer   not null,
      NumeroCartao   tinyint   not null,
      Momento   time   null,
      Tipo_Cartao enum ('amarelo', 'vermelho')   null,
      JogadorEmCampo_Jogo_Numero   Integer   not null,
      JogadorEmCampo_Pais   varchar(60)   not null,
      JogadorEmCampo_Ano   smallint   not null,
      JogadorEmCampo_NumCamisola   tinyint   not null,
   
      constraint PK_Penalizacao primary key (Jogo_Numero, NumeroCartao)
   );


   /*Tabela Seleção*/
   create table Selecao
   (
      Pais   char(3)   not null,
      Ano   smallint   not null,
      Grupo_Letra char(1) not null,
   
      constraint PK_Selecao primary key (Pais, Ano)
   );


   /*Tabela Grupo*/
   create table Grupo
   (
      Edicao_Ano   smallint   not null,
      Letra   char(1)   not null,
   
      constraint PK_Grupo primary key (Edicao_Ano, Letra)
   );


   /*Tabela Estádio*/
   create table Estadio
   (
      Nome   varchar(60)   not null,
      Pais_Nome   char(3)   not null,
      Localidade   varchar(60)   null,
      Lotacao   Integer   null,
   
      constraint PK_Estadio primary key (Nome)
   );


   /*Tabela Substituição*/
   create table Substituicao
   (
      Substituido_Jogo_numero   Integer   not null,
      Substituido_JogadorSelecao_Pais   char(3)   not null,
      Substituido_JogadorSelecao_Ano   smallint   not null,
      Substituido_JogadorSelecao_NumCamisola   tinyint   not null,
      Substituto_Jogo_numero   Integer   not null,
      Substituto_JogadorSelecao_Pais   char(3)   not null,
      Substituto_JogadorSelecao_Ano   smallint   not null,
      Substituto_JogadorSelecao_NumCamisola   tinyint   not null,
   
      constraint PK_Substituicao primary key (
            Substituido_Jogo_Numero, Substituido_JogadorSelecao_Pais, Substituido_JogadorSelecao_Ano, Substituido_JogadorSelecao_NumCamisola,
            Substituto_Jogo_Numero, Substituto_JogadorSelecao_Pais, Substituto_JogadorSelecao_Ano, Substituto_JogadorSelecao_NumCamisola
            )
   );


   /*Tabela Golo*/
   create table Golo
   (
      Jogo_Numero   Integer   not null,
      Golo_Numero   tinyint   not null,
      Marcador_JogadorEmCampo_Jogo_Numero   Integer   not null,
      Marcador_JogadorEmCampo_Pais   char(3)   not null,
      Marcador_JogadorEmCampo_Ano   smallint   not null,
      Marcador_JogadorEmCampo_NumCamisola   tinyint   not null,
      Assistencia_JogadorEmCampo_Jogo_Numero   Integer   null,         /*As assistêncicas podem não acontecer em lanços de bola parada*/
      Assistencia_JogadorEmCampo_Pais   char(3)   null,                /*por este motivo, é apenas "null"*/
      Assistencia_JogadorEmCampo_Ano   smallint   null,
      Assistencia_JogadorEmCampo_NumCamisola   tinyint   null,
      Momento   time   null,
      Autogolo   boolean   null,
   
      constraint PK_Golo primary key (Jogo_Numero, Golo_Numero)
   );


   /*Tabela Jogo*/
   create table Jogo
   (
      Grupo_Edicao_Ano   smallint   null,
      Grupo_Letra   char(1)   null,
      Estadio_Nome   varchar(60)   not null,
      Numero   Integer   not null,
      Fase   enum('Grupos', 'Oitavos', 'Quartos', 'Meias', 'Final')   not null,
      Data   date   not null,
      Vencedor char(3) null,
   
      constraint PK_Jogo primary key (Numero)
   );
   

   /*Tabela JogadorEmCampo*/
   create table JogadorEmCampo
   (
      Jogo_Numero   Integer   not null,
      JogadorSelecao_Pais   char(3)   not null,
      JogadorSelecao_Ano   smallint   not null,
      JogadorSelecao_NumCamisola   tinyint   not null,
   
      constraint PK_JogadorEmCampo primary key (Jogo_Numero, JogadorSelecao_Pais, JogadorSelecao_Ano, JogadorSelecao_NumCamisola)
   );


   /*Tabela JodarJogo*/
   create table JogadorJogo
   (
      JogadorSelecao_Pais   char(3)   not null,
      JogadorSelecao_Ano   smallint   not null,
      JogadorSelecao_NumCamisola   tinyint   not null,
      Jogo_Numero   Integer   not null,
      EstadoJogador enum ('convocado', 'dispensado', 'lesionado', 'castigado') null,
   
      constraint PK_JogadorJogo primary key (JogadorSelecao_Pais, JogadorSelecao_Ano, JogadorSelecao_NumCamisola, Jogo_Numero)
   );


   /*Tabela EquipaJogo*/
   create table EquipaJogo
   (
      Jogo_Numero   Integer   not null,
      Selecao_Pais   char(3)   not null,
      Selecao_Ano   smallint   not null,
   
      constraint PK_EquipaJogo primary key (Jogo_Numero, Selecao_Pais, Selecao_Ano)
   );




         /*     LIGAÇÕES     */


   /*Ligações da tabela Federacao*/
      alter table Federacao
         add constraint FK_Federacao___Pais foreign key (Pais)
            references Pais(Sigla)
            on delete restrict
            on update cascade
      ;  

   
   /*Ligações da tabela Edicao*/
      alter table Edicao
         add constraint FK_Edicao___org1___Federacao
            foreign key (Organizador_1)
            references Federacao(Pais)
            on delete restrict
            on update cascade,
         add constraint FK_Edicao___org2___Federacao
            foreign key (Organizador_2)
            references Federacao(Pais)
            on delete restrict
            on update cascade
      ; 


   /*Ligações da tabela JogadorSelecao*/
      alter table JogadorSelecao
         add constraint FK_JogadorSelecao_ElementoComitiva foreign key ( ElementoComitiva_Numero)
            references ElementoComitiva(NumeroSerie)
            on delete cascade
            on update cascade,
         add constraint FK_JogadorSelecao___Selecao foreign key (Selecao_Pais, Selecao_Ano)
            references Selecao(Pais, Ano)
            on delete cascade
            on update cascade
      ;


   /*Ligações da tabela Comitiva*/
      alter table Comitiva
         add constraint FK_Comitiva___Pais foreign key (Pais)
            references Pais(Sigla)
            on delete restrict
            on update cascade,
         add constraint FK_Comitiva___Edicao foreign key (Ano)
            references Edicao(Ano)
            on delete restrict
            on update cascade,
         add constraint FK_Comitiva__PatrocinadorOficial___Patrocinador foreign key (Patrocinador_Oficial_sigla)
            references Patrocinador(Sigla)
            on delete restrict
            on update cascade
      ;


   /*Ligações da tabela ElementoComitiva*/
      alter table ElementoComitiva
         add constraint FK_ElementoComitiva___Comitiva foreign key (Comitiva_Pais, Comitiva_Ano)
            references Comitiva(Pais, Ano)
            on delete cascade
            on update cascade
      ; 


   /*Ligações da tabela Presidente*/
      alter table Presidente
         add constraint FK_Presidente___ElementoComitiva foreign key ( ElementoComitiva_Numero)
            references ElementoComitiva(NumeroSerie)
            on delete cascade
            on update cascade
      ;


   /*Ligações da tabela Tecnico*/
      alter table Tecnico
         add constraint FK_Tecnico___ElementoComitiva foreign key ( ElementoComitiva_Numero)
            references ElementoComitiva(NumeroSerie)
            on delete cascade
            on update cascade
      ;


   /*Ligações da tabela Outro*/
      alter table Outro
         add constraint FK_Outro___ElementoComitiva foreign key (ElementoComitiva_Numero)
            references ElementoComitiva(NumeroSerie)
            on delete cascade
            on update cascade
   ;


   /*Ligações da tabela Patrocinio*/
      alter table Patrocinio
         add constraint FK_Comitiva_Patrocinio_Patrocinador_ foreign key (Comitiva_Pais, Comitiva_Ano)
            references Comitiva(Pais, Ano)
            on delete cascade
            on update cascade,
         add constraint FK_Patrocinador_Patrocinio_Comitiva_ foreign key (Patrocinador_Sigla)
            references Patrocinador(Sigla)
            on delete cascade
            on update cascade
      ;


   /*Ligações da tabela Penalizacao*/
      alter table Penalizacao
         add constraint FK_Penalizacao___Jogo foreign key (Jogo_Numero)
            references Jogo(Numero)
            on delete cascade
            on update cascade,
         add constraint FK_Penalizacao___JogadorEmCampo 
            foreign key (JogadorEmCampo_Jogo_Numero, JogadorEmCampo_Pais, JogadorEmCampo_Ano, JogadorEmCampo_NumCamisola)
            references JogadorEmCampo(Jogo_Numero, JogadorSelecao_Pais, JogadorSelecao_Ano, JogadorSelecao_NumCamisola)
            on delete restrict
            on update cascade
      ;


   /*Ligações da tabela Selecao*/
      alter table Selecao
         add constraint FK_Selecao___Pais foreign key (Pais)
            references Pais(Sigla)
            on delete restrict
            on update cascade,
         add constraint FK_Selecao___edicao foreign key (Ano)
            references Edicao(Ano)
            on delete restrict
            on update cascade,
         add constraint FK_Selecao___Grupo foreign key (Ano, Grupo_Letra)    
            references Grupo(Edicao_Ano, Letra)
            on delete restrict
            on update cascade
      ;


   /*Ligações da tabela Grupo*/
      alter table Grupo
         add constraint FK_Grupo___Edicao foreign key (Edicao_Ano)
            references Edicao(Ano)
            on delete cascade
            on update cascade
      ;


   /*Ligações da tabela Estadio*/
      alter table Estadio
         add constraint FK_Estadio___Pais foreign key (Pais_Nome)
            references Pais(Sigla)
            on delete restrict
            on update cascade
      ;


   /*Ligações da tabela JogadorJogo*/
      alter table JogadorJogo
         add constraint FK_JogadorJogo___Jogador foreign key (JogadorSelecao_Pais, JogadorSelecao_Ano, JogadorSelecao_NumCamisola)
            references JogadorSelecao(Selecao_Pais, Selecao_Ano, NumCamisola)
            on delete cascade
            on update cascade,
         add constraint FK_JogadorJogo___Jogo foreign key (Jogo_Numero)
            references Jogo(Numero)
            on delete cascade
            on update cascade
      ; 


   /*Ligações da tabela Substituicao*/
      alter table Substituicao
         add constraint FK_Substituicao___substituido_JogadorEmCampo 
            foreign key (Substituido_Jogo_Numero, Substituido_JogadorSelecao_Pais, Substituido_JogadorSelecao_Ano, Substituido_JogadorSelecao_NumCamisola)
            references JogadorEmCampo(Jogo_Numero, JogadorSelecao_Pais, JogadorSelecao_Ano, JogadorSelecao_NumCamisola)
            on delete cascade
            on update cascade,
         add constraint FK_Substituicao___substituto_JogadorJogo
            foreign key (Substituto_Jogo_Numero, Substituto_JogadorSelecao_Pais, Substituto_JogadorSelecao_Ano, Substituto_JogadorSelecao_NumCamisola)
            references JogadorJogo(Jogo_Numero, JogadorSelecao_Pais, JogadorSelecao_Ano, JogadorSelecao_NumCamisola)
            on delete cascade
            on update cascade
      ;


   /*Ligações da tabela Golo*/
      alter table Golo
         add constraint FK_Golo___Jogo foreign key (Jogo_Numero)
            references Jogo(Numero)
            on delete cascade
            on update cascade,
         add constraint FK_Golo___Marcador_JogadorEmCampo 
            foreign key (Marcador_JogadorEmCampo_Jogo_Numero, Marcador_JogadorEmCampo_Pais, Marcador_JogadorEmCampo_Ano, Marcador_JogadorEmCampo_NumCamisola)
            references JogadorEmCampo(Jogo_Numero, JogadorSelecao_Pais, JogadorSelecao_Ano, JogadorSelecao_NumCamisola)
            on delete restrict
            on update cascade,
         add constraint FK_Golo___Assitencia_JogadorEmCampo 
            foreign key (Assistencia_JogadorEmCampo_Jogo_Numero, Assistencia_JogadorEmCampo_Pais, Assistencia_JogadorEmCampo_Ano, Assistencia_JogadorEmCampo_NumCamisola)
            references JogadorEmCampo(Jogo_Numero, JogadorSelecao_Pais, JogadorSelecao_Ano, JogadorSelecao_NumCamisola)
            on delete restrict
            on update cascade
      ;


   /*Ligações da tabela Jogo*/
      alter table Jogo
         add constraint FK_Jogo___Grupo foreign key (Grupo_Edicao_Ano, Grupo_Letra)
            references Grupo(Edicao_Ano, Letra)
            on delete set null
            on update cascade,
         add constraint FK_Jogo___Estadio foreign key (Estadio_Nome)
            references Estadio(Nome)
            on delete restrict
            on update cascade,
         add constraint FK_Jogo___Selecao foreign key (Vencedor)
            references Selecao(Pais)
            on delete set null
            on update cascade
      ;


   /*Ligações da tabela EquipaJogo*/
      alter table EquipaJogo
         add constraint FK_EquipaJogo_Jogo foreign key (Jogo_Numero)
            references Jogo(Numero)
            on delete cascade
            on update cascade,
         add constraint FK_EquipaJogo___Selecao foreign key (Selecao_Pais, Selecao_Ano)
            references Selecao(Pais, Ano)
            on delete cascade
            on update cascade
   ;


   /*Ligações da tabela JogadorEmCampo*/
      alter table JogadorEmCampo
         add constraint FK_JogadorEmCampo___JogadorJogo foreign key (Jogo_Numero, JogadorSelecao_Pais, JogadorSelecao_Ano, JogadorSelecao_NumCamisola)
            references JogadorJogo(Jogo_Numero, JogadorSelecao_Pais, JogadorSelecao_Ano, JogadorSelecao_NumCamisola)
            on delete cascade
            on update cascade              
      ;






   insert into Pais (Nome, Sigla, NumHabitantes) values
      ("Portugal", "POR", 11000000), ("Argentina", "ARG", 45810000),
      ("Républica do Gana", "GHA", 32103042), ("Qatar", "QAT", 2931000)
      
   ;


   insert into Federacao (Nome, Pais, NumFederados) values
      ("Federação Portuguesa de Futebol", "POR", 181495 ), ("Asociacíon del Fútbol Argentino", "ARG", 900000 ),
      ("Federação de Futebol de Gana", "GHA", 325000 ), ("Qatar Football Association", "QAT", 29310 )
   
   ;


   insert into Edicao (Ano, Designacao, Orcamento, Organizador_1, Organizador_2, Total_Selecoes) values
      (2022, "FIFA QATAR WORLD CUP 2022", 220000000000, "QAT", null , 32 )
   ;


   insert into Patrocinador (Sigla, Nome) values
      ("BUD",  "Budweiser"), ("MEO",  "Altice"), ("C&C", "Coca-Cola")
   ;


   insert into Comitiva (Pais, Ano, Mascote, Patrocinador_Oficial_Sigla) values
      ("POR", 2022, "Jubas", "MEO"), ("GHA", 2022, "Kanye West", "C&C")
   ;


   insert into Patrocinio (Comitiva_Pais, Comitiva_Ano, Patrocinador_Sigla, Montante) values
      ("POR", 2022, "MEO", 5000000 ), ("GHA", 2022, "C&C", 10000 )
   ;


   insert into ElementoComitiva (NumeroSerie, Comitiva_Pais, Comitiva_Ano) values 
      (00001, "POR", 2022), (00002, "POR", 2022), (00003, "POR", 2022), (00004, "POR", 2022), 
      (00005, "POR", 2022), (00006, "POR", 2022), (00007, "POR", 2022), (00008, "POR", 2022), 
      (00009, "POR", 2022), (00010, "POR", 2022), (00011, "POR", 2022), (00012, "POR", 2022), 
      (00013, "POR", 2022), (00014, "POR", 2022), (00015, "POR", 2022), (00016, "POR", 2022), 
      (00017, "POR", 2022), (00018, "POR", 2022), (00019, "POR", 2022),

      (00020, "GHA", 2022), (00021, "GHA", 2022), (00022, "GHA", 2022), (00023, "GHA", 2022),
      (00024, "GHA", 2022), (00025, "GHA", 2022), (00026, "GHA", 2022), (00027, "GHA", 2022),
      (00028, "GHA", 2022), (00029, "GHA", 2022), (00030, "GHA", 2022), (00031, "GHA", 2022),
      (00032, "GHA", 2022), (00033, "GHA", 2022), (00034, "GHA", 2022), (00035, "GHA", 2022),
      (00036, "GHA", 2022), (00037, "GHA", 2022), (00038, "GHA", 2022)
   ;


   insert into Presidente (ElementoComitiva_Numero, AnoNomeacao, Nome, Nascimento) values
      (00001, 2011, "Fernando Gomes", 21/02/1952),
      (00038, 2011, "Kwesi Nyantakyi", 27/10/1968)
   ;


   insert into Tecnico (ElementoComitiva_Numero, Funcao, AnosExperiencia, Nome, Nascimento) values 
      (00002, "Treinador", 8, "Fernando Santos", 10/10/1954),
      (00036, "Treinador", 5, "Otto Addo", 09/06/1975)
   ;


   insert into Outro (ElementoComitiva_Numero, Funcao, Nome, Nascimento) values
      (00003, "Fotógrafo", "João Gregório", 22/08/2002),
      (00037, "Fotógrafo", "Luís Gaspar", 27/11/2003)
   ;


   insert into Estadio (Nome, Pais_Nome, Localidade, Lotacao) value
      ("Lusail Stadium", "QAT", "Lusail", 80000),
      ("Stadium 974", "QAT", "Doha", 44089)
   ;


   insert into Grupo (Edicao_Ano, Letra) values
      (2022, "A"), (2022, "B"), (2022, "C"), (2022, "D"),
      (2022, "E"), (2022, "F"), (2022, "G"), (2022, "H");


   insert into Selecao (Pais, Ano, Grupo_Letra) values
      ("POR", 2022, "H"), ("GHA", 2022, "H")
   ;


   insert into JogadorSelecao (ElementoComitiva_Numero, NomeClube, Selecao_Pais, Selecao_Ano, NumCamisola, NumInternacionalizacoes, Estado, Posicao, Nome, Nascimento, N_Golos, N_Assistencias, N_Jogos_Sem_Sofrer) values 
      (00004, "Manchester United", "POR", 2022, 7, 191, "Convocado", "Avançado", "Cristiano Ronaldo", 05/02/1985, 0, 0, 0),
      (00005, "Manchester United", "POR", 2022, 8, 88, "Convocado", "Médio", "Bruno Fernandes", 08/09/1994, 0, 0, 0), 
      (00006, "Benfica", "POR", 2022, 26, 15, "Convocado", "Avançado", "Gonçalo Ramos", 20/06/2001, 0, 0, 0), 
      (00007, "Paris-Saint-Germain", "POR", 2022, 13, 108, "Convocado", "Defesa", "Danilo Pereira", 09/09/1991, 0, 0, 0), 
      (00008, "Manchester City", "POR", 2022, 4, 40, "Convocado", "Defesa", "Rúben Dias", 14/05/1997, 0, 0, 0), 
      (00009, "Manchester City", "POR", 2022, 20, 27, "Convocado", "Defesa", "João Cancelo", 27/05/1994, 0, 0, 0), 
      (00010, "Borussia Dortmund", "POR", 2022, 5, 87, "Convocado", "Defesa", "Raphaël Guerreiro", 22/11/1993, 0, 0, 0), 
      (00011, "Porto", "POR", 2022, 25, 17, "Convocado", "Médio", "Ótavio", 09/02/1995, 0, 0, 0), 
      (00012, "Wolverhampton", "POR", 2022, 18, 54, "Convocado", "Médio", "Rúben Neves", 13/03/1997, 0, 0, 0), 
      (00013, "Manchester City", "POR", 2022, 10, 78, "Convocado", "Médio", "Bernardo Silva", 10/08/1994, 0, 0, 0), 
      (00014, "Atlético Madrid", "POR", 2022, 11, 39, "Convocado", "Avançado", "João Félix", 10/11/1999, 0, 0, 0), 
      (00015, "AC Milan", "POR", 2022, 15, 24, "Convocado", "Avançado", "Rafael Leão", 10/06/1999, 0, 0, 0), 
      (00016, "Real Betis", "POR", 2022, 14, 90, "Convocado", "Médio", "William Carvalho", 07/04/1992, 0, 0, 0), 
      (00017, "Benfica", "POR", 2022, 17, 30, "Convocado", "Médio", "João Mário", 19/01/1993, 0, 0, 0), 
      (00018, "Fulham", "POR", 2022, 6, 27, "Convocado", "Médio", "João Palhinha", 09/07/1995, 0, 0, 0),
      (00019, "Porto", "POR", 2022, 22, 38, "Convocado", "Guarda-redes", "Diogo Costa", 19/08/1999, 0, 0, 0),

      (00020, "Athletic Club", "GHA", 2022, 19, 46, "Convocado", "Avançado", "Iñaki Williams", 15/06/1994, 0, 0, 0),
      (00021, "Al-Sadd", "GHA", 2022, 10, 49, "Convocado", "Avançado", "André Ayew", 17/12/1989, 0, 0, 0), 
      (00022, "RC Lens", "GHA", 2022, 21, 30, "Convocado", "Médio", "Salis Abdul Samed", 26/03/2000, 0, 0, 0), 
      (00023, "Arsenal", "GHA", 2022, 5, 64, "Convocado", "Médio", "Thomas Partney", 13/06/1993, 0, 0, 0), 
      (00024, "Ajax", "GHA", 2022, 20, 32, "Convocado", "Médio", "Mohammed Kudus", 22/08/2000, 0, 0, 0),
      (00025, "Reading", "GHA", 2022, 17, 20, "Convocado", "Defesa", "Abdul Baba Rahman", 02/07/1994, 0, 0, 0),
      (00026, "Southampton", "GHA", 2022, 4, 56, "Convocado", "Defesa", "Mohammed Salisu", 17/04/1999, 0, 0, 0),
      (00027, "RC Strasbourg", "GHA", 2022, 23, 46, "Convocado", "Defesa", "Alexander Djiku", 09/09/1994, 0, 0, 0),
      (00028, "Leicester City", "GHA", 2022, 18, 57, "Convocado", "Defesa", "Daniel Amartey", 21/12/1994, 0, 0, 0),
      (00029, "Clermont Foot 63", "GHA", 2022, 26, 78, "Convocado", "Defesa", "Alidu Seidu", 04/06/2000, 0, 0, 0),
      (00030, "FC St. Gallen 1879", "GHA", 2022, 1, 78, "Convocado", "Guarda-redes", "Lawrence Ati", 29/11/1996, 0, 0, 0),
      (00031, "Brighton & Hove Albion", "GHA", 2022, 2, 23, "Convocado", "Defesa", "Tariq Lamptey", 30/09/2000, 0, 0, 0),
      (00032, "FK Crvena zvezda", "GHA", 2022, 11, 57, "Convocado", "Médio", "Osman Bukari", 13/12/1998, 0, 0, 0),
      (00033, "Sc Freiburg", "GHA", 2022, 8, 45, "Convocado", "Médio", "Daniel-Kofi Kyereh", 08/03/1996, 0, 0, 0),
      (00034, "Britol City", "GHA", 2022, 25, 76, "Convocado", "Avançado", "Antoine Semenyo", 01/01/2000, 0, 0, 0),
      (00035, "Crystal Palace", "GHA", 2022, 9, 76, "Convocado", "Avançado", "Jordan Ayew", 11/09/1991, 0, 0, 0)
   ;


   insert into Jogo (Grupo_Edicao_Ano, Grupo_Letra, Estadio_Nome, Numero, Fase, Data, Vencedor) values
      (2022, "H", "Stadium 974", 16, "Fase de Grupos", 24/11/2022, "POR")
   ;


   insert into JogadorJogo (JogadorSelecao_Pais, JogadorSelecao_Ano, JogadorSelecao_NumCamisola, Jogo_Numero, EstadoJogador) value
      ("POR", 2022, 4, 16, "Convocado"), ("POR", 2022, 5, 16, "Convocado"), ("POR", 2022, 6, 16, "Convocado"), ("POR", 2022, 7, 16, "Convocado"),
      ("POR", 2022, 8, 16, "Convocado"),  ("POR", 2022, 10, 16, "Convocado"), ("POR", 2022, 11, 16, "Convocado"), ("POR", 2022, 13, 16, "Convocado"),
      ("POR", 2022, 14, 16, "Convocado"), ("POR", 2022, 15, 16, "Convocado"), ("POR", 2022, 17, 16, "Convocado"), ("POR", 2022, 18, 16, "Convocado"),
      ("POR", 2022, 20, 16, "Convocado"), ("POR", 2022, 22, 16, "Convocado"), ("POR", 2022, 25, 16, "Convocado"),  ("POR", 2022, 26, 16, "Convocado"),

      ("GHA", 2022, 1, 16, "Convocado"),  ("GHA", 2022, 2, 16, "Convocado"), ("GHA", 2022, 4, 16, "Convocado"), ("GHA", 2022, 5, 16, "Convocado"),
      ("GHA", 2022, 8, 16, "Convocado"),  ("GHA", 2022, 9, 16, "Convocado"),("GHA", 2022, 10, 16, "Convocado"), ("GHA", 2022, 11, 16, "Convocado"),
      ("GHA", 2022, 17, 16, "Convocado"), ("GHA", 2022, 18, 16, "Convocado"), ("GHA", 2022, 19, 16, "Convocado"), ("GHA", 2022, 20, 16, "Convocado"),
      ("GHA", 2022, 21, 16, "Convocado"), ("GHA", 2022, 23, 16, "Convocado"),  ("GHA", 2022, 25, 16, "Convocado"),("GHA", 2022, 26, 16, "Convocado")
   ;


   insert into JogadorEmCampo (Jogo_Numero, JogadorSelecao_Pais, JogadorSelecao_Ano, JogadorSelecao_NumCamisola) value
      (16, "POR", 2022, 22), (16, "POR", 2022, 20), (16, "POR", 2022, 4), (16, "POR", 2022, 13), (16, "POR", 2022, 5), (16, "POR", 2022, 10), (16, "POR", 2022, 18), (16, "POR", 2022, 25), (16, "POR", 2022, 8), (16, "POR", 2022, 7), (16, "POR", 2022, 11),
      (16, "GHA", 2022, 1),  (16, "GHA", 2022, 17), (16, "GHA", 2022, 4), (16, "GHA", 2022, 23), (16, "GHA", 2022, 18), (16, "GHA", 2022, 26), (16, "GHA", 2022, 20), (16, "GHA", 2022, 21), (16, "GHA", 2022, 5), (16, "GHA", 2022, 19), (16, "GHA", 2022, 10)
   ;


   insert into Penalizacao (Jogo_Numero, NumeroCartao, Momento, Tipo_Cartao, JogadorEmCampo_Jogo_Numero, JogadorEmCampo_Pais, JogadorEmCampo_Ano, JogadorEmCampo_NumCamisola) value
      (16, 1, '00:45:18', "amarelo", 16, "GHA", 2022, 20), (16, 2, '00:49:18', "amarelo", 16, "GHA", 2022, 10), (16, 3, '00:57:18', "amarelo", 16, "GHA", 2022, 26),
      (16, 4, '01:31:18', "amarelo", 16, "GHA", 2022, 19), (16, 5, '01:31:18', "amarelo", 16, "POR", 2022, 13), (16, 6, '01:35:18', "amarelo", 16, "POR", 2022, 8)
   ;


   insert into Golo (Jogo_Numero, Golo_Numero, Marcador_JogadorEmCampo_Jogo_Numero, Marcador_JogadorEmCampo_Pais, Marcador_JogadorEmCampo_Ano, Marcador_JogadorEmCampo_NumCamisola, Assistencia_JogadorEmCampo_Jogo_Numero, Assistencia_JogadorEmCampo_Pais, Assistencia_JogadorEmCampo_Ano, Assistencia_JogadorEmCampo_NumCamisola, Momento, AutoGolo) values
      (16, 01, 16, "POR", 2022, 7, 16, "POR", 2022, null, '01:05:03', null ),
      (16, 02, 16, "GHA", 2022, 10, 16, "GHA", 2022, null, '01:13:03', null ),
      (16, 03, 16, "POR", 2022, 11, 16, "POR", 2022, 8, '01:18:03', null )
   /* (16, 04, 16, "POR", 2022, 15, 16, "POR", 2022, 8, '01:20:03', null ),                 /*Não deixa adicionar porque são jogadores substitutos (começaram no banco)
      (16, 05, 16, "GHA", 2022, 11, 16, "GHA", 2022, null, '01:29:03', null ) */
   ;


   insert into Substituicao (Substituido_Jogo_Numero, Substituido_JogadorSelecao_Pais, Substituido_JogadorSelecao_Ano, Substituido_JogadorSelecao_NumCamisola, Substituto_Jogo_Numero, Substituto_JogadorSelecao_Pais, Substituto_JogadorSelecao_Ano, Substituto_JogadorSelecao_NumCamisola) values
      (16, "POR", 2022, 18, 16, "POR", 2022, 15), (16, "POR", 2022, 25, 16, "POR", 2022, 14), (16, "POR", 2022, 10, 16, "POR", 2022, 6), (16, "POR", 2022, 11, 16, "POR", 2022, 17), (16, "POR", 2022, 7, 16, "POR", 2022, 26),
      (16, "GHA", 2022, 23, 16, "GHA", 2022, 8), (16, "GHA", 2022, 26, 16, "GHA", 2022, 2), (16, "GHA", 2022, 20, 16, "GHA", 2022, 11), (16, "GHA", 2022, 21, 16, "GHA", 2022, 25), (16, "GHA", 2022, 10, 16, "GHA", 2022, 9)
   ;


   insert into EquipaJogo (Jogo_Numero, Selecao_Pais, Selecao_Ano) values (16, "POR", 2022), (16, "GHA", 2022);