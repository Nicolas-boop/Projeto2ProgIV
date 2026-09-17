-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17/09/2026 às 22:23
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `lednicolas`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `lednicolas`
--

CREATE TABLE `lednicolas` (
  `idlednicolas` int(10) UNSIGNED NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `portar` int(10) UNSIGNED DEFAULT NULL,
  `portag` int(10) UNSIGNED DEFAULT NULL,
  `portab` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `lednicolas`
--

INSERT INTO `lednicolas` (`idlednicolas`, `nome`, `portar`, `portag`, `portab`) VALUES
(1, 'Led da Aura', 5, 6, 7);

-- --------------------------------------------------------

--
-- Estrutura para tabela `macnicolas`
--

CREATE TABLE `macnicolas` (
  `idmacnicolas` varchar(17) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `macnicolas`
--

INSERT INTO `macnicolas` (`idmacnicolas`, `nome`, `ativo`) VALUES
('84:0D:8E:B4:E6:06', 'Placa do Nicolas', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `painelnicolas`
--

CREATE TABLE `painelnicolas` (
  `idpainelnicolas` int(10) UNSIGNED NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `datainicio` datetime DEFAULT NULL,
  `datafim` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `painelnicolas`
--

INSERT INTO `painelnicolas` (`idpainelnicolas`, `nome`, `datainicio`, `datafim`) VALUES
(1, 'Painel nicolas', '2026-09-18 00:00:00', '2026-09-18 23:59:59');

-- --------------------------------------------------------

--
-- Estrutura para tabela `painelnicolas_has_lednicolas`
--

CREATE TABLE `painelnicolas_has_lednicolas` (
  `lednicolas_idlednicolas` int(10) UNSIGNED NOT NULL,
  `painelnicolas_idpainelnicolas` int(10) UNSIGNED NOT NULL,
  `macnicolas_idmacnicolas` varchar(17) NOT NULL,
  `leda` int(10) UNSIGNED DEFAULT NULL,
  `ledg` int(10) UNSIGNED DEFAULT NULL,
  `ledb` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `painelnicolas_has_lednicolas`
--

INSERT INTO `painelnicolas_has_lednicolas` (`lednicolas_idlednicolas`, `painelnicolas_idpainelnicolas`, `macnicolas_idmacnicolas`, `leda`, `ledg`, `ledb`) VALUES
(1, 1, '84:0D:8E:B4:E6:06', 255, 0, 0);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `lednicolas`
--
ALTER TABLE `lednicolas`
  ADD PRIMARY KEY (`idlednicolas`);

--
-- Índices de tabela `macnicolas`
--
ALTER TABLE `macnicolas`
  ADD PRIMARY KEY (`idmacnicolas`);

--
-- Índices de tabela `painelnicolas`
--
ALTER TABLE `painelnicolas`
  ADD PRIMARY KEY (`idpainelnicolas`);

--
-- Índices de tabela `painelnicolas_has_lednicolas`
--
ALTER TABLE `painelnicolas_has_lednicolas`
  ADD KEY `painelnicolas_has_lednicolas_FKIndex1` (`macnicolas_idmacnicolas`),
  ADD KEY `painelnicolas_has_lednicolas_FKIndex2` (`painelnicolas_idpainelnicolas`),
  ADD KEY `painelnicolas_has_lednicolas_FKIndex3` (`lednicolas_idlednicolas`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `lednicolas`
--
ALTER TABLE `lednicolas`
  MODIFY `idlednicolas` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `painelnicolas`
--
ALTER TABLE `painelnicolas`
  MODIFY `idpainelnicolas` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `painelnicolas_has_lednicolas`
--
ALTER TABLE `painelnicolas_has_lednicolas`
  ADD CONSTRAINT `painelnicolas_has_lednicolas_ibfk_1` FOREIGN KEY (`macnicolas_idmacnicolas`) REFERENCES `macnicolas` (`idmacnicolas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `painelnicolas_has_lednicolas_ibfk_2` FOREIGN KEY (`painelnicolas_idpainelnicolas`) REFERENCES `painelnicolas` (`idpainelnicolas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `painelnicolas_has_lednicolas_ibfk_3` FOREIGN KEY (`lednicolas_idlednicolas`) REFERENCES `lednicolas` (`idlednicolas`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
