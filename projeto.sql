-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 28-Out-2022 às 23:58
-- Versão do servidor: 10.4.25-MariaDB
-- versão do PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `projeto`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cartao_amarelo`
--

CREATE TABLE `cartao_amarelo` (
  `Estatistica_Convocado_Jogador_Elemento_Elemento_ID_` int(11) NOT NULL,
  `Estatistica_Jogo_Jogo_ID_` int(11) NOT NULL,
  `total_jogo` int(11) DEFAULT NULL,
  `tempo_Jogo` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cartao_vermelho`
--

CREATE TABLE `cartao_vermelho` (
  `Estatistica_Convocado_Jogador_Elemento_Elemento_ID_` int(11) NOT NULL,
  `Estatistica_Jogo_Jogo_ID_` int(11) NOT NULL,
  `total_jogo` int(11) DEFAULT NULL,
  `tempo_jogo` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `comitiva`
--

CREATE TABLE `comitiva` (
  `Pais_Pais_ID` int(11) NOT NULL,
  `Patrocinador_Oficial_Patrocinador_Patrocinador_ID` int(11) NOT NULL,
  `Comitiva_ID` int(11) NOT NULL,
  `sigla` varchar(10) COLLATE latin1_bin DEFAULT NULL,
  `mascote` varchar(20) COLLATE latin1_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `convocado`
--

CREATE TABLE `convocado` (
  `Jogador_Elemento_Elemento_ID` int(11) NOT NULL,
  `num_participacoes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `elemento`
--

CREATE TABLE `elemento` (
  `Comitiva_Comitiva_ID` int(11) NOT NULL,
  `Elemento_ID` int(11) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `nome` varchar(50) COLLATE latin1_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estadio`
--

CREATE TABLE `estadio` (
  `Pais_Pais_ID` int(11) NOT NULL,
  `Estadio_ID` int(11) NOT NULL,
  `nome` varchar(50) COLLATE latin1_bin DEFAULT NULL,
  `localizacao` varchar(50) COLLATE latin1_bin DEFAULT NULL,
  `lotacao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado`
--

CREATE TABLE `estado` (
  `Estado_ID` int(11) NOT NULL,
  `castigado` bit(1) DEFAULT NULL,
  `lesionado` bit(1) DEFAULT NULL,
  `dispensado` bit(1) DEFAULT NULL,
  `convocado` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estatistica`
--

CREATE TABLE `estatistica` (
  `Jogo_Jogo_ID_` int(11) NOT NULL,
  `Convocado_Jogador_Elemento_Elemento_ID_` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estat_jogador`
--

CREATE TABLE `estat_jogador` (
  `Mundial_Mundial_ID_` int(11) NOT NULL,
  `Jogador_Elemento_Elemento_ID_` int(11) NOT NULL,
  `num_golos` int(11) DEFAULT NULL,
  `num_assistencias` int(11) DEFAULT NULL,
  `jogos_sem_sofrer_golos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `golo`
--

CREATE TABLE `golo` (
  `Estatistica_Convocado_Jogador_Elemento_Elemento_ID_` int(11) NOT NULL,
  `Estatistica_Jogo_Jogo_ID_` int(11) NOT NULL,
  `total_golo_jogo` int(11) DEFAULT NULL,
  `marcador` varchar(20) COLLATE latin1_bin DEFAULT NULL,
  `equipa` varchar(20) COLLATE latin1_bin DEFAULT NULL,
  `jogador_assistencia` varchar(20) COLLATE latin1_bin DEFAULT NULL,
  `tempo_jogo` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `grupo`
--

CREATE TABLE `grupo` (
  `Grupo_ID` int(11) NOT NULL,
  `designacao` char(1) COLLATE latin1_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogador`
--

CREATE TABLE `jogador` (
  `Pais_Pais_ID` int(11) NOT NULL,
  `Selecao_Grupo_Grupo_ID` int(11) NOT NULL,
  `Selecao_Selecao_ID` int(11) NOT NULL,
  `Elemento_Elemento_ID` int(11) NOT NULL,
  `posicao` varchar(20) COLLATE latin1_bin DEFAULT NULL,
  `idade` int(11) DEFAULT NULL,
  `naturalidade` varchar(20) COLLATE latin1_bin DEFAULT NULL,
  `clube_atual` varchar(20) COLLATE latin1_bin DEFAULT NULL,
  `num_internacionalizacoes` int(11) DEFAULT NULL,
  `num_camisola` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogo`
--

CREATE TABLE `jogo` (
  `Estadio_Estadio_ID` int(11) NOT NULL,
  `Jogo_ID` int(11) NOT NULL,
  `fase` varchar(20) COLLATE latin1_bin DEFAULT NULL,
  `data` varchar(20) COLLATE latin1_bin DEFAULT NULL,
  `resultado` varchar(20) COLLATE latin1_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `mundial`
--

CREATE TABLE `mundial` (
  `Mundial_ID` int(11) NOT NULL,
  `designacao` varchar(50) COLLATE latin1_bin DEFAULT NULL,
  `edicao` int(11) DEFAULT NULL,
  `num_selecoes` int(11) DEFAULT NULL,
  `orcamento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `mundial_comitiva`
--

CREATE TABLE `mundial_comitiva` (
  `Comitiva_Comitiva_ID_` int(11) NOT NULL,
  `Mundial_Mundial_ID_` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `newname_1076450471`
--

CREATE TABLE `newname_1076450471` (
  `Selecao_Grupo_Grupo_ID_` int(11) NOT NULL,
  `Selecao_Selecao_ID_` int(11) NOT NULL,
  `Jogo_Jogo_ID_` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `organizador`
--

CREATE TABLE `organizador` (
  `Pais_Pais_ID_` int(11) NOT NULL,
  `Mundial_Mundial_ID_` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `outro_elemento`
--

CREATE TABLE `outro_elemento` (
  `Elemento_Elemento_ID` int(11) NOT NULL,
  `funcao` varchar(50) COLLATE latin1_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pais`
--

CREATE TABLE `pais` (
  `Pais_ID` int(11) NOT NULL,
  `nome_pais` varchar(20) COLLATE latin1_bin DEFAULT NULL,
  `num_habitantes` int(11) DEFAULT NULL,
  `num_federados` int(11) DEFAULT NULL,
  `nome_federacao` varchar(20) COLLATE latin1_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `patrocinador`
--

CREATE TABLE `patrocinador` (
  `Patrocinador_ID` int(11) NOT NULL,
  `nome` varchar(20) COLLATE latin1_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `patrocinador_oficial`
--

CREATE TABLE `patrocinador_oficial` (
  `Patrocinador_Patrocinador_ID` int(11) NOT NULL,
  `Comitiva_Comitiva_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `patrocinio`
--

CREATE TABLE `patrocinio` (
  `Patrocinador_Patrocinador_ID_` int(11) NOT NULL,
  `Comitiva_Comitiva_ID_` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `presidente`
--

CREATE TABLE `presidente` (
  `Elemento_Elemento_ID` int(11) NOT NULL,
  `ano_nomeacao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `selecao`
--

CREATE TABLE `selecao` (
  `Grupo_Grupo_ID` int(11) NOT NULL,
  `Selecao_ID` int(11) NOT NULL,
  `vitorias` int(11) DEFAULT NULL,
  `derrotas` int(11) DEFAULT NULL,
  `empates` int(11) DEFAULT NULL,
  `pontos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `substituicao`
--

CREATE TABLE `substituicao` (
  `Estatistica_Convocado_Jogador_Elemento_Elemento_ID_` int(11) NOT NULL,
  `Estatistica_Jogo_Jogo_ID_` int(11) NOT NULL,
  `nome_entrada` varchar(20) COLLATE latin1_bin DEFAULT NULL,
  `nome_saida` varchar(20) COLLATE latin1_bin DEFAULT NULL,
  `tempo_jogo` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tecnico`
--

CREATE TABLE `tecnico` (
  `Elemento_Elemento_ID` int(11) NOT NULL,
  `funcao` varchar(50) COLLATE latin1_bin DEFAULT NULL,
  `anos_experiencia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cartao_amarelo`
--
ALTER TABLE `cartao_amarelo`
  ADD PRIMARY KEY (`Estatistica_Convocado_Jogador_Elemento_Elemento_ID_`,`Estatistica_Jogo_Jogo_ID_`);

--
-- Índices para tabela `cartao_vermelho`
--
ALTER TABLE `cartao_vermelho`
  ADD PRIMARY KEY (`Estatistica_Convocado_Jogador_Elemento_Elemento_ID_`,`Estatistica_Jogo_Jogo_ID_`);

--
-- Índices para tabela `comitiva`
--
ALTER TABLE `comitiva`
  ADD PRIMARY KEY (`Comitiva_ID`),
  ADD KEY `FK_Comitiva_Pais_Comitivas_Pais` (`Pais_Pais_ID`),
  ADD KEY `FK_Comitiva_Principal_Patrocinador_Oficial` (`Patrocinador_Oficial_Patrocinador_Patrocinador_ID`);

--
-- Índices para tabela `convocado`
--
ALTER TABLE `convocado`
  ADD PRIMARY KEY (`Jogador_Elemento_Elemento_ID`);

--
-- Índices para tabela `elemento`
--
ALTER TABLE `elemento`
  ADD PRIMARY KEY (`Comitiva_Comitiva_ID`,`Elemento_ID`),
  ADD KEY `Elemento_ID` (`Elemento_ID`);

--
-- Índices para tabela `estadio`
--
ALTER TABLE `estadio`
  ADD PRIMARY KEY (`Estadio_ID`),
  ADD KEY `FK_Estadio_Organizacao_Pais` (`Pais_Pais_ID`);

--
-- Índices para tabela `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`Estado_ID`);

--
-- Índices para tabela `estatistica`
--
ALTER TABLE `estatistica`
  ADD PRIMARY KEY (`Jogo_Jogo_ID_`,`Convocado_Jogador_Elemento_Elemento_ID_`),
  ADD KEY `FK_Convocado_Estatistica_Jogo_` (`Convocado_Jogador_Elemento_Elemento_ID_`);

--
-- Índices para tabela `estat_jogador`
--
ALTER TABLE `estat_jogador`
  ADD PRIMARY KEY (`Mundial_Mundial_ID_`,`Jogador_Elemento_Elemento_ID_`),
  ADD KEY `FK_Jogador_Estat_Jogador_Mundial_` (`Jogador_Elemento_Elemento_ID_`);

--
-- Índices para tabela `golo`
--
ALTER TABLE `golo`
  ADD PRIMARY KEY (`Estatistica_Convocado_Jogador_Elemento_Elemento_ID_`,`Estatistica_Jogo_Jogo_ID_`);

--
-- Índices para tabela `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`Grupo_ID`);

--
-- Índices para tabela `jogador`
--
ALTER TABLE `jogador`
  ADD PRIMARY KEY (`Elemento_Elemento_ID`),
  ADD KEY `FK_Jogador_Jogador_Pais_Pais` (`Pais_Pais_ID`),
  ADD KEY `FK_Jogador_Selecao_Jogador_Selecao` (`Selecao_Grupo_Grupo_ID`,`Selecao_Selecao_ID`);

--
-- Índices para tabela `jogo`
--
ALTER TABLE `jogo`
  ADD PRIMARY KEY (`Jogo_ID`),
  ADD KEY `FK_Jogo_Local_Jogo_Estadio` (`Estadio_Estadio_ID`);

--
-- Índices para tabela `mundial`
--
ALTER TABLE `mundial`
  ADD PRIMARY KEY (`Mundial_ID`);

--
-- Índices para tabela `mundial_comitiva`
--
ALTER TABLE `mundial_comitiva`
  ADD PRIMARY KEY (`Comitiva_Comitiva_ID_`,`Mundial_Mundial_ID_`),
  ADD KEY `FK_Mundial_Mundial_Comitiva_Comitiva_` (`Mundial_Mundial_ID_`);

--
-- Índices para tabela `newname_1076450471`
--
ALTER TABLE `newname_1076450471`
  ADD PRIMARY KEY (`Selecao_Grupo_Grupo_ID_`,`Selecao_Selecao_ID_`,`Jogo_Jogo_ID_`),
  ADD KEY `FK_Jogo_newname_1076450471_Selecao_` (`Jogo_Jogo_ID_`);

--
-- Índices para tabela `organizador`
--
ALTER TABLE `organizador`
  ADD PRIMARY KEY (`Pais_Pais_ID_`,`Mundial_Mundial_ID_`),
  ADD KEY `FK_Mundial_Organizador_Pais_` (`Mundial_Mundial_ID_`);

--
-- Índices para tabela `outro_elemento`
--
ALTER TABLE `outro_elemento`
  ADD PRIMARY KEY (`Elemento_Elemento_ID`);

--
-- Índices para tabela `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`Pais_ID`);

--
-- Índices para tabela `patrocinador`
--
ALTER TABLE `patrocinador`
  ADD PRIMARY KEY (`Patrocinador_ID`);

--
-- Índices para tabela `patrocinador_oficial`
--
ALTER TABLE `patrocinador_oficial`
  ADD PRIMARY KEY (`Patrocinador_Patrocinador_ID`);

--
-- Índices para tabela `patrocinio`
--
ALTER TABLE `patrocinio`
  ADD PRIMARY KEY (`Patrocinador_Patrocinador_ID_`,`Comitiva_Comitiva_ID_`),
  ADD KEY `FK_Comitiva_patrocinio_Patrocinador_` (`Comitiva_Comitiva_ID_`);

--
-- Índices para tabela `presidente`
--
ALTER TABLE `presidente`
  ADD PRIMARY KEY (`Elemento_Elemento_ID`);

--
-- Índices para tabela `selecao`
--
ALTER TABLE `selecao`
  ADD PRIMARY KEY (`Grupo_Grupo_ID`,`Selecao_ID`);

--
-- Índices para tabela `substituicao`
--
ALTER TABLE `substituicao`
  ADD PRIMARY KEY (`Estatistica_Convocado_Jogador_Elemento_Elemento_ID_`,`Estatistica_Jogo_Jogo_ID_`);

--
-- Índices para tabela `tecnico`
--
ALTER TABLE `tecnico`
  ADD PRIMARY KEY (`Elemento_Elemento_ID`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cartao_amarelo`
--
ALTER TABLE `cartao_amarelo`
  ADD CONSTRAINT `FK_Cartao_Amarelo_Estatistica` FOREIGN KEY (`Estatistica_Convocado_Jogador_Elemento_Elemento_ID_`,`Estatistica_Jogo_Jogo_ID_`) REFERENCES `estatistica` (`Convocado_Jogador_Elemento_Elemento_ID_`, `Jogo_Jogo_ID_`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `cartao_vermelho`
--
ALTER TABLE `cartao_vermelho`
  ADD CONSTRAINT `FK_Cartao_Vermelho_Estatistica` FOREIGN KEY (`Estatistica_Convocado_Jogador_Elemento_Elemento_ID_`,`Estatistica_Jogo_Jogo_ID_`) REFERENCES `estatistica` (`Convocado_Jogador_Elemento_Elemento_ID_`, `Jogo_Jogo_ID_`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `comitiva`
--
ALTER TABLE `comitiva`
  ADD CONSTRAINT `FK_Comitiva_Pais_Comitivas_Pais` FOREIGN KEY (`Pais_Pais_ID`) REFERENCES `pais` (`Pais_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Comitiva_Principal_Patrocinador_Oficial` FOREIGN KEY (`Patrocinador_Oficial_Patrocinador_Patrocinador_ID`) REFERENCES `patrocinador_oficial` (`Patrocinador_Patrocinador_ID`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `convocado`
--
ALTER TABLE `convocado`
  ADD CONSTRAINT `FK_Convocado_Jogador` FOREIGN KEY (`Jogador_Elemento_Elemento_ID`) REFERENCES `jogador` (`Elemento_Elemento_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `elemento`
--
ALTER TABLE `elemento`
  ADD CONSTRAINT `elemento_ibfk_1` FOREIGN KEY (`Elemento_ID`) REFERENCES `tecnico` (`Elemento_Elemento_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `elemento_ibfk_2` FOREIGN KEY (`Elemento_ID`) REFERENCES `outro_elemento` (`Elemento_Elemento_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `elemento_ibfk_3` FOREIGN KEY (`Elemento_ID`) REFERENCES `presidente` (`Elemento_Elemento_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `elemento_ibfk_4` FOREIGN KEY (`Elemento_ID`) REFERENCES `jogador` (`Elemento_Elemento_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `estadio`
--
ALTER TABLE `estadio`
  ADD CONSTRAINT `FK_Estadio_Organizacao_Pais` FOREIGN KEY (`Pais_Pais_ID`) REFERENCES `pais` (`Pais_ID`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `estado`
--
ALTER TABLE `estado`
  ADD CONSTRAINT `estado_ibfk_1` FOREIGN KEY (`Estado_ID`) REFERENCES `convocado` (`Jogador_Elemento_Elemento_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `estado_ibfk_2` FOREIGN KEY (`Estado_ID`) REFERENCES `jogador` (`Elemento_Elemento_ID`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `estatistica`
--
ALTER TABLE `estatistica`
  ADD CONSTRAINT `FK_Convocado_Estatistica_Jogo_` FOREIGN KEY (`Convocado_Jogador_Elemento_Elemento_ID_`) REFERENCES `convocado` (`Jogador_Elemento_Elemento_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Jogo_Estatistica_Convocado_` FOREIGN KEY (`Jogo_Jogo_ID_`) REFERENCES `jogo` (`Jogo_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `estat_jogador`
--
ALTER TABLE `estat_jogador`
  ADD CONSTRAINT `FK_Jogador_Estat_Jogador_Mundial_` FOREIGN KEY (`Jogador_Elemento_Elemento_ID_`) REFERENCES `jogador` (`Elemento_Elemento_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Mundial_Estat_Jogador_Jogador_` FOREIGN KEY (`Mundial_Mundial_ID_`) REFERENCES `mundial` (`Mundial_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `golo`
--
ALTER TABLE `golo`
  ADD CONSTRAINT `FK_Golo_Estatistica` FOREIGN KEY (`Estatistica_Convocado_Jogador_Elemento_Elemento_ID_`,`Estatistica_Jogo_Jogo_ID_`) REFERENCES `estatistica` (`Convocado_Jogador_Elemento_Elemento_ID_`, `Jogo_Jogo_ID_`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `jogador`
--
ALTER TABLE `jogador`
  ADD CONSTRAINT `FK_Jogador_Jogador_Pais_Pais` FOREIGN KEY (`Pais_Pais_ID`) REFERENCES `pais` (`Pais_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Jogador_Selecao_Jogador_Selecao` FOREIGN KEY (`Selecao_Grupo_Grupo_ID`,`Selecao_Selecao_ID`) REFERENCES `selecao` (`Grupo_Grupo_ID`, `Selecao_ID`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `jogo`
--
ALTER TABLE `jogo`
  ADD CONSTRAINT `FK_Jogo_Local_Jogo_Estadio` FOREIGN KEY (`Estadio_Estadio_ID`) REFERENCES `estadio` (`Estadio_ID`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `mundial_comitiva`
--
ALTER TABLE `mundial_comitiva`
  ADD CONSTRAINT `FK_Comitiva_Mundial_Comitiva_Mundial_` FOREIGN KEY (`Comitiva_Comitiva_ID_`) REFERENCES `comitiva` (`Comitiva_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Mundial_Mundial_Comitiva_Comitiva_` FOREIGN KEY (`Mundial_Mundial_ID_`) REFERENCES `mundial` (`Mundial_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `newname_1076450471`
--
ALTER TABLE `newname_1076450471`
  ADD CONSTRAINT `FK_Jogo_newname_1076450471_Selecao_` FOREIGN KEY (`Jogo_Jogo_ID_`) REFERENCES `jogo` (`Jogo_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Selecao_newname_1076450471_Jogo_` FOREIGN KEY (`Selecao_Grupo_Grupo_ID_`,`Selecao_Selecao_ID_`) REFERENCES `selecao` (`Grupo_Grupo_ID`, `Selecao_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `organizador`
--
ALTER TABLE `organizador`
  ADD CONSTRAINT `FK_Mundial_Organizador_Pais_` FOREIGN KEY (`Mundial_Mundial_ID_`) REFERENCES `mundial` (`Mundial_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Pais_Organizador_Mundial_` FOREIGN KEY (`Pais_Pais_ID_`) REFERENCES `pais` (`Pais_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `patrocinador_oficial`
--
ALTER TABLE `patrocinador_oficial`
  ADD CONSTRAINT `patrocinador_oficial_ibfk_1` FOREIGN KEY (`Patrocinador_Patrocinador_ID`) REFERENCES `patrocinador` (`Patrocinador_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `patrocinio`
--
ALTER TABLE `patrocinio`
  ADD CONSTRAINT `FK_Comitiva_patrocinio_Patrocinador_` FOREIGN KEY (`Comitiva_Comitiva_ID_`) REFERENCES `comitiva` (`Comitiva_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Patrocinador_patrocinio_Comitiva_` FOREIGN KEY (`Patrocinador_Patrocinador_ID_`) REFERENCES `patrocinador` (`Patrocinador_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `selecao`
--
ALTER TABLE `selecao`
  ADD CONSTRAINT `FK_Selecao_Grupo_Grupo` FOREIGN KEY (`Grupo_Grupo_ID`) REFERENCES `grupo` (`Grupo_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `substituicao`
--
ALTER TABLE `substituicao`
  ADD CONSTRAINT `FK_Substituicao_Estatistica` FOREIGN KEY (`Estatistica_Convocado_Jogador_Elemento_Elemento_ID_`,`Estatistica_Jogo_Jogo_ID_`) REFERENCES `estatistica` (`Convocado_Jogador_Elemento_Elemento_ID_`, `Jogo_Jogo_ID_`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
