-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 13-Dez-2023 às 02:12
-- Versão do servidor: 8.0.30
-- versão do PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_pecuaria`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `nome` varchar(50) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `nascimento` date DEFAULT NULL,
  `id_cliente` smallint NOT NULL,
  `senha` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`nome`, `telefone`, `email`, `nascimento`, `id_cliente`, `senha`) VALUES
('Joao', '(11) 91223-2321', 'matheus.cerratotavares@gmail.com', '2004-12-30', 3, '123'),
('Matheus', '(11) 93365-6701', 'matheus.cerratotavares@gmail.com', '2006-06-30', 2, '123'),
('gabriel', '(11) 94444-4444', 'matheus.cerratotavares@gmail.com', '2007-10-30', 4, '123');

-- --------------------------------------------------------

--
-- Estrutura da tabela `familiar`
--

CREATE TABLE `familiar` (
  `nome_familiar` varchar(50) NOT NULL,
  `telefone_familiar` varchar(20) NOT NULL,
  `email_familiar` varchar(50) NOT NULL,
  `nascimento_familiar` date DEFAULT NULL,
  `id_familiar` smallint NOT NULL,
  `id_cliente_familiar` smallint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `familiar`
--

INSERT INTO `familiar` (`nome_familiar`, `telefone_familiar`, `email_familiar`, `nascimento_familiar`, `id_familiar`, `id_cliente_familiar`) VALUES
('matheus cerrato', '(11) 87643-2314', 'cerratotavares@hotmail.com', '2006-12-24', 1, NULL),
('Maria', '(11) 87643-2311', 'maria@gmail.com', '2000-07-30', 4, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `gado`
--

CREATE TABLE `gado` (
  `quantidade_gado` smallint NOT NULL,
  `data_gado` date DEFAULT NULL,
  `comprovante_rebanho` varchar(200) NOT NULL,
  `vacina_gado` varchar(200) NOT NULL,
  `raca` varchar(50) NOT NULL,
  `nascimento_gado` date DEFAULT NULL,
  `peso` varchar(6) NOT NULL,
  `etiqueta_gado` smallint NOT NULL,
  `id_cliente_gado` smallint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `gado`
--

INSERT INTO `gado` (`quantidade_gado`, `data_gado`, `comprovante_rebanho`, `vacina_gado`, `raca`, `nascimento_gado`, `peso`, `etiqueta_gado`, `id_cliente_gado`) VALUES
(1, '2022-11-30', 'comprovante 1', 'covid', 'gado', '2007-06-07', '150,20', 1, NULL),
(3, '2022-11-30', 'comprovante 2', 'TÃ©tano', 'gadÃ£o', '2000-06-07', '200,00', 2, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `propriedade`
--

CREATE TABLE `propriedade` (
  `data_propriedade` date DEFAULT NULL,
  `nome_propriedade` varchar(50) NOT NULL,
  `tamanho` varchar(6) NOT NULL,
  `equipamentos` varchar(200) NOT NULL,
  `tipo_producao` varchar(30) NOT NULL,
  `quantidade_silo` varchar(10) NOT NULL,
  `id_propriedade` smallint NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `propriedade`
--

INSERT INTO `propriedade` (`data_propriedade`, `nome_propriedade`, `tamanho`, `equipamentos`, `tipo_producao`, `quantidade_silo`, `id_propriedade`) VALUES
('2022-12-01', 'SÃ£o bento', '30,167', 'PÃ¡', 'extensiva', '57,567', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `silagem`
--

CREATE TABLE `silagem` (
  `data_silagem` date DEFAULT NULL,
  `tipo_producao_silo` varchar(20) NOT NULL,
  `quantidade` varchar(10) NOT NULL,
  `quantidade_gasta` varchar(10) NOT NULL,
  `quantidade_produzida` varchar(10) NOT NULL,
  `id_silagem` smallint NOT NULL,
  `id_cliente_silagem` smallint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `silagem`
--

INSERT INTO `silagem` (`data_silagem`, `tipo_producao_silo`, `quantidade`, `quantidade_gasta`, `quantidade_produzida`, `id_silagem`, `id_cliente_silagem`) VALUES
('2022-12-02', 'milho', '67,676', '11,111', '09,846', 1, NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices para tabela `familiar`
--
ALTER TABLE `familiar`
  ADD PRIMARY KEY (`id_familiar`),
  ADD KEY `id_cliente_familiar` (`id_cliente_familiar`) USING BTREE;

--
-- Índices para tabela `gado`
--
ALTER TABLE `gado`
  ADD PRIMARY KEY (`etiqueta_gado`),
  ADD KEY `id_cliente_gado` (`id_cliente_gado`);

--
-- Índices para tabela `propriedade`
--
ALTER TABLE `propriedade`
  ADD PRIMARY KEY (`id_propriedade`);

--
-- Índices para tabela `silagem`
--
ALTER TABLE `silagem`
  ADD PRIMARY KEY (`id_silagem`),
  ADD KEY `id_cliente_silagem` (`id_cliente_silagem`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` smallint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `familiar`
--
ALTER TABLE `familiar`
  MODIFY `id_familiar` smallint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `gado`
--
ALTER TABLE `gado`
  MODIFY `etiqueta_gado` smallint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `propriedade`
--
ALTER TABLE `propriedade`
  MODIFY `id_propriedade` smallint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `silagem`
--
ALTER TABLE `silagem`
  MODIFY `id_silagem` smallint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
