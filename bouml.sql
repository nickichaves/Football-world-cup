drop table if exists Estat_Jogador ;
drop table if exists Estatistica ;
drop table if exists patrocinio ;
drop table if exists ocorrencia ;
drop table if exists organizador ;
drop table if exists mundial_comitiva ;
drop table if exists Patrocinador ;
drop table if exists Comitiva ;
drop table if exists Pais ;
drop table if exists Estadio ;
drop table if exists Selecao ;
drop table if exists Grupo ;
drop table if exists Jogo ;
drop table if exists Convocado ;
drop table if exists Cartao_Amarelo ;
drop table if exists Cartao_Vermelho ;
drop table if exists Substituicao ;
drop table if exists Golo ;
drop table if exists Mundial ;
drop table if exists Jogador ;
drop table if exists Presidente ;
drop table if exists Tecnico ;
drop table if exists Outro_Elemento ;
drop table if exists Elemento ;
drop table if exists Patrocinador_Oficial ;
 
create table Estat_Jogador
(
   Mundial_Mundial_ID_   integer   not null,
   Jogador_Elemento_Elemento_ID_   integer   not null,
   num_golos   Integer   null,
   num_assistencias   Integer   null,
   jogos_sem_sofrer_golos   Integer   null,
 
   constraint PK_Estat_Jogador primary key (Mundial_Mundial_ID_, Jogador_Elemento_Elemento_ID_)
);
 
create table Estatistica
(
   Jogo_Jogo_ID_   integer   not null,
   Convocado_Convocado_ID_   integer   not null,
 
   constraint PK_Estatistica primary key (Jogo_Jogo_ID_, Convocado_Convocado_ID_)
);
 
create table patrocinio
(
   Patrocinador_Patrocinador_ID_   integer   not null,
   Comitiva_Comitiva_ID_   integer   not null,
 
   constraint PK_patrocinio primary key (Patrocinador_Patrocinador_ID_, Comitiva_Comitiva_ID_)
);
 
create table ocorrencia
(
   Selecao_Grupo_Grupo_ID_   integer   not null,
   Selecao_Selecao_ID_   integer   not null,
   Jogo_Jogo_ID_   integer   not null,
 
   constraint PK_ocorrencia primary key (Selecao_Grupo_Grupo_ID_, Selecao_Selecao_ID_, Jogo_Jogo_ID_)
);
 
create table organizador
(
   Pais_Pais_ID_   integer   not null,
   Mundial_Mundial_ID_   integer   not null,
 
   constraint PK_organizador primary key (Pais_Pais_ID_, Mundial_Mundial_ID_)
);
 
create table mundial_comitiva
(
   Comitiva_Comitiva_ID_   integer   not null,
   Mundial_Mundial_ID_   integer   not null,
 
   constraint PK_mundial_comitiva primary key (Comitiva_Comitiva_ID_, Mundial_Mundial_ID_)
);
 
create table Patrocinador
(
   Patrocinador_ID   integer   not null,
   nome   varchar(20)   null,
 
   constraint PK_Patrocinador primary key (Patrocinador_ID)
);
 
create table Comitiva
(
   Pais_Pais_ID   integer   not null,
   Patrocinador_Oficial_Patrocinador_Patrocinador_ID   integer   not null,
   Comitiva_ID   integer   not null,
   sigla   varchar(10)   null,
   mascote   varchar(20)   null,
 
   constraint PK_Comitiva primary key (Comitiva_ID)
);
 
create table Pais
(
   Pais_ID   integer   not null,
   nome_pais   varchar(20)   null,
   num_habitantes   Integer   null,
   num_federados   Integer   null,
   nome_federacao   varchar(20)   null,
 
   constraint PK_Pais primary key (Pais_ID)
);
 
create table Estadio
(
   Pais_Pais_ID   integer   not null,
   Estadio_ID   integer   not null,
   nome   varchar(50)   null,
   localizacao   varchar(50)   null,
   lotacao   Integer   null,
 
   constraint PK_Estadio primary key (Estadio_ID)
);
 
create table Selecao
(
   Grupo_Grupo_ID   integer   not null,
   Selecao_ID   integer   not null,
   vitorias   Integer   null,
   derrotas   Integer   null,
   empates   Integer   null,
   pontos   Integer   null,
 
   constraint PK_Selecao primary key (Grupo_Grupo_ID, Selecao_ID)
);
 
create table Grupo
(
   Grupo_ID   integer   not null,
   designacao   char   null,
 
   constraint PK_Grupo primary key (Grupo_ID)
);
 
create table Jogo
(
   Estadio_Estadio_ID   integer   not null,
   Jogo_ID   integer   not null,
   fase   varchar(20)   null,
   data   varchar(20)   null,
   resultado   varchar(20)   null,
 
   constraint PK_Jogo primary key (Jogo_ID)
);
 
create table Convocado
(
   Jogador_Elemento_Elemento_ID   integer   not null,
   Convocado_ID   integer   not null,
   castigado   bit   null,
   lesionado   bit   null,
   dispensado   bit   null,
   convocado   bit   null,
   num_participacoes   Integer   null,
 
   constraint PK_Convocado primary key (Convocado_ID)
);
 
create table Cartao_Amarelo
(
   Estatistica_Convocado_Convocado_ID_   integer   not null,
   Estatistica_Jogo_Jogo_ID_   integer   not null,
   total_jogo   Integer   null,
   tempo_Jogo   time   null,
 
   constraint PK_Cartao_Amarelo primary key (Estatistica_Convocado_Convocado_ID_, Estatistica_Jogo_Jogo_ID_)
);
 
create table Cartao_Vermelho
(
   Estatistica_Convocado_Convocado_ID_   integer   not null,
   Estatistica_Jogo_Jogo_ID_   integer   not null,
   total_jogo   Integer   null,
   tempo_jogo   time   null,
 
   constraint PK_Cartao_Vermelho primary key (Estatistica_Convocado_Convocado_ID_, Estatistica_Jogo_Jogo_ID_)
);
 
create table Substituicao
(
   Estatistica_Convocado_Convocado_ID_   integer   not null,
   Estatistica_Jogo_Jogo_ID_   integer   not null,
   nome_entrada   varchar(20)   null,
   nome_saida   varchar(20)   null,
   tempo_jogo   time   null,
 
   constraint PK_Substituicao primary key (Estatistica_Convocado_Convocado_ID_, Estatistica_Jogo_Jogo_ID_)
);
 
create table Golo
(
   Estatistica_Convocado_Convocado_ID_   integer   not null,
   Estatistica_Jogo_Jogo_ID_   integer   not null,
   total_golo_jogo   Integer   null,
   marcador   varchar(20)   null,
   equipa   varchar(20)   null,
   jogador_assistencia   varchar(20)   null,
   tempo_jogo   time   null,
 
   constraint PK_Golo primary key (Estatistica_Convocado_Convocado_ID_, Estatistica_Jogo_Jogo_ID_)
);
 
create table Mundial
(
   Mundial_ID   integer   not null,
   designacao   varchar(50)   null,
   edicao   Integer   null,
   num_selecoes   Integer   null,
   orcamento   Integer   null,
 
   constraint PK_Mundial primary key (Mundial_ID)
);
 
create table Jogador
(
   Pais_Pais_ID   integer   not null,
   Selecao_Grupo_Grupo_ID   integer   not null,
   Selecao_Selecao_ID   integer   not null,
   Convocado_Convocado_ID   integer   not null,
   Elemento_Elemento_ID   integer   not null,
   castigado   bit   null,
   lesionado   bit   null,
   dispensado   bit   null,
   convocado   bit   null,
   posicao   varchar(20)   null,
   clube_atual   varchar(20)   null,
   num_internacionalizacoes   Integer   null,
   num_camisola   Integer   null,
 
   constraint PK_Jogador primary key (Elemento_Elemento_ID)
);
 
create table Presidente
(
   Elemento_Elemento_ID   integer   not null,
   ano_nomeacao   Integer   null,
 
   constraint PK_Presidente primary key (Elemento_Elemento_ID)
);
 
create table Tecnico
(
   Elemento_Elemento_ID   integer   not null,
   funcao   varchar(50)   null,
   anos_experiencia   Integer   null,
 
   constraint PK_Tecnico primary key (Elemento_Elemento_ID)
);
 
create table Outro_Elemento
(
   Elemento_Elemento_ID   integer   not null,
   funcao   varchar(50)   null,
 
   constraint PK_Outro_Elemento primary key (Elemento_Elemento_ID)
);
 
create table Elemento
(
   Comitiva_Comitiva_ID   integer   not null,
   Elemento_ID   integer   not null,
   numero   Integer   null,
   nome   varchar(50)   null,
   idade   Integer   null,
   naturalidade   varchar(20)   null,
 
   constraint PK_Elemento primary key (Comitiva_Comitiva_ID, Elemento_ID)
);
 
create table Patrocinador_Oficial
(
   Patrocinador_Patrocinador_ID   integer   not null,
   Comitiva_Comitiva_ID   integer   not null,
 
   constraint PK_Patrocinador_Oficial primary key (Patrocinador_Patrocinador_ID)
);
 
alter table Estat_Jogador
   add constraint FK_Mundial_Estat_Jogador_Jogador_ foreign key (Mundial_Mundial_ID_)
   references Mundial(Mundial_ID)
   on delete cascade
   on update cascade
; 
alter table Estat_Jogador
   add constraint FK_Jogador_Estat_Jogador_Mundial_ foreign key (Jogador_Elemento_Elemento_ID_)
   references Jogador(Elemento_Elemento_ID)
   on delete cascade
   on update cascade
;
 
alter table Estatistica
   add constraint FK_Jogo_Estatistica_Convocado_ foreign key (Jogo_Jogo_ID_)
   references Jogo(Jogo_ID)
   on delete cascade
   on update cascade
; 
alter table Estatistica
   add constraint FK_Convocado_Estatistica_Jogo_ foreign key (Convocado_Convocado_ID_)
   references Convocado(Convocado_ID)
   on delete cascade
   on update cascade
;
 
alter table patrocinio
   add constraint FK_Patrocinador_patrocinio_Comitiva_ foreign key (Patrocinador_Patrocinador_ID_)
   references Patrocinador(Patrocinador_ID)
   on delete cascade
   on update cascade
; 
alter table patrocinio
   add constraint FK_Comitiva_patrocinio_Patrocinador_ foreign key (Comitiva_Comitiva_ID_)
   references Comitiva(Comitiva_ID)
   on delete cascade
   on update cascade
;
 
alter table ocorrencia
   add constraint FK_Selecao_ocorrencia_Jogo_ foreign key (Selecao_Grupo_Grupo_ID_, Selecao_Selecao_ID_)
   references Selecao(Grupo_Grupo_ID, Selecao_ID)
   on delete cascade
   on update cascade
; 
alter table ocorrencia
   add constraint FK_Jogo_ocorrencia_Selecao_ foreign key (Jogo_Jogo_ID_)
   references Jogo(Jogo_ID)
   on delete cascade
   on update cascade
;
 
alter table organizador
   add constraint FK_Pais_organizador_Mundial_ foreign key (Pais_Pais_ID_)
   references Pais(Pais_ID)
   on delete cascade
   on update cascade
; 
alter table organizador
   add constraint FK_Mundial_organizador_Pais_ foreign key (Mundial_Mundial_ID_)
   references Mundial(Mundial_ID)
   on delete cascade
   on update cascade
;
 
alter table mundial_comitiva
   add constraint FK_Comitiva_mundial_comitiva_Mundial_ foreign key (Comitiva_Comitiva_ID_)
   references Comitiva(Comitiva_ID)
   on delete cascade
   on update cascade
; 
alter table mundial_comitiva
   add constraint FK_Mundial_mundial_comitiva_Comitiva_ foreign key (Mundial_Mundial_ID_)
   references Mundial(Mundial_ID)
   on delete cascade
   on update cascade
;
 
 
alter table Comitiva
   add constraint FK_Comitiva_pais_comitiva_Pais foreign key (Pais_Pais_ID)
   references Pais(Pais_ID)
   on delete restrict
   on update cascade
; 
alter table Comitiva
   add constraint FK_Comitiva_principal_Patrocinador_Oficial foreign key (Patrocinador_Oficial_Patrocinador_Patrocinador_ID)
   references Patrocinador_Oficial(Patrocinador_Patrocinador_ID)
   on delete restrict
   on update cascade
;
 
 
alter table Estadio
   add constraint FK_Estadio_organizacao_Pais foreign key (Pais_Pais_ID)
   references Pais(Pais_ID)
   on delete restrict
   on update cascade
;
 
alter table Selecao
   add constraint FK_Selecao_grupo_Grupo foreign key (Grupo_Grupo_ID)
   references Grupo(Grupo_ID)
   on delete cascade
   on update cascade
;
 
 
alter table Jogo
   add constraint FK_Jogo_localizacao_Estadio foreign key (Estadio_Estadio_ID)
   references Estadio(Estadio_ID)
   on delete restrict
   on update cascade
;
 
alter table Convocado
   add constraint FK_Convocado_Estado_Jogador foreign key (Jogador_Elemento_Elemento_ID)
   references Jogador(Elemento_Elemento_ID)
   on delete restrict
   on update cascade
;
 
alter table Cartao_Amarelo
   add constraint FK_Cartao_Amarelo_Estatistica foreign key (Estatistica_Convocado_Convocado_ID_, Estatistica_Jogo_Jogo_ID_)
   references Estatistica(Convocado_Convocado_ID_, Jogo_Jogo_ID_)
   on delete cascade
   on update cascade
;
 
alter table Cartao_Vermelho
   add constraint FK_Cartao_Vermelho_Estatistica foreign key (Estatistica_Convocado_Convocado_ID_, Estatistica_Jogo_Jogo_ID_)
   references Estatistica(Convocado_Convocado_ID_, Jogo_Jogo_ID_)
   on delete cascade
   on update cascade
;
 
alter table Substituicao
   add constraint FK_Substituicao_Estatistica foreign key (Estatistica_Convocado_Convocado_ID_, Estatistica_Jogo_Jogo_ID_)
   references Estatistica(Convocado_Convocado_ID_, Jogo_Jogo_ID_)
   on delete cascade
   on update cascade
;
 
alter table Golo
   add constraint FK_Golo_Estatistica foreign key (Estatistica_Convocado_Convocado_ID_, Estatistica_Jogo_Jogo_ID_)
   references Estatistica(Convocado_Convocado_ID_, Jogo_Jogo_ID_)
   on delete cascade
   on update cascade
;
 
 
alter table Jogador
   add constraint FK_Jogador_jogador_pais_Pais foreign key (Pais_Pais_ID)
   references Pais(Pais_ID)
   on delete restrict
   on update cascade
; 
alter table Jogador
   add constraint FK_Jogador_selecionado_Selecao foreign key (Selecao_Grupo_Grupo_ID, Selecao_Selecao_ID)
   references Selecao(Grupo_Grupo_ID, Selecao_ID)
   on delete restrict
   on update cascade
; 
alter table Jogador
   add constraint FK_Jogador_Estado_Convocado foreign key (Convocado_Convocado_ID)
   references Convocado(Convocado_ID)
   on delete restrict
   on update cascade
; 
alter table Jogador
   add constraint FK_Jogador_Elemento foreign key (Elemento_Elemento_ID)
   references Elemento(Elemento_ID)
   on delete cascade
   on update cascade
;
 
alter table Presidente
   add constraint FK_Presidente_Elemento foreign key (Elemento_Elemento_ID)
   references Elemento(Elemento_ID)
   on delete cascade
   on update cascade
;
 
alter table Tecnico
   add constraint FK_Tecnico_Elemento foreign key (Elemento_Elemento_ID)
   references Elemento(Elemento_ID)
   on delete cascade
   on update cascade
;
 
alter table Outro_Elemento
   add constraint FK_Outro_Elemento_Elemento foreign key (Elemento_Elemento_ID)
   references Elemento(Elemento_ID)
   on delete cascade
   on update cascade
;
 
alter table Elemento
   add constraint FK_Elemento_composicao_Comitiva foreign key (Comitiva_Comitiva_ID)
   references Comitiva(Comitiva_ID)
   on delete cascade
   on update cascade
;
 
alter table Patrocinador_Oficial
   add constraint FK_Patrocinador_Oficial_Patrocinador foreign key (Patrocinador_Patrocinador_ID)
   references Patrocinador(Patrocinador_ID)
   on delete cascade
   on update cascade
; 
alter table Patrocinador_Oficial
   add constraint FK_Patrocinador_Oficial_principal_Comitiva foreign key (Comitiva_Comitiva_ID)
   references Comitiva(Comitiva_ID)
   on delete restrict
   on update cascade
;
 
