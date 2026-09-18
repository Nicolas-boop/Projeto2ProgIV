-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18/09/2026 às 19:56
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
-- Banco de dados: `painelnicolas`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `combinanicolas`
--

CREATE TABLE `combinanicolas` (
  `idcombinanicolas` int(10) UNSIGNED NOT NULL,
  `lednicolas_idlednicolas` int(10) UNSIGNED NOT NULL,
  `painelnicolas_idpainelnicolas` int(10) UNSIGNED NOT NULL,
  `macnicolas_idmacnicolas` varchar(17) NOT NULL,
  `ledr` int(10) UNSIGNED DEFAULT NULL,
  `ledg` int(10) UNSIGNED DEFAULT NULL,
  `ledb` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `combinanicolas`
--

INSERT INTO `combinanicolas` (`idcombinanicolas`, `lednicolas_idlednicolas`, `painelnicolas_idpainelnicolas`, `macnicolas_idmacnicolas`, `ledr`, `ledg`, `ledb`) VALUES
(1, 1, 1, '38:2B:78:03:A8:38', 255, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `lednicolas`
--

CREATE TABLE `lednicolas` (
  `idlednicolas` int(10) UNSIGNED NOT NULL,
  `nome` varchar(35) DEFAULT NULL,
  `pinor` int(10) UNSIGNED DEFAULT NULL,
  `pinog` int(10) UNSIGNED DEFAULT NULL,
  `pinob` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `lednicolas`
--

INSERT INTO `lednicolas` (`idlednicolas`, `nome`, `pinor`, `pinog`, `pinob`) VALUES
(1, 'Led do Nicolas', 5, 6, 7);

-- --------------------------------------------------------

--
-- Estrutura para tabela `macnicolas`
--

CREATE TABLE `macnicolas` (
  `idmacnicolas` varchar(17) NOT NULL,
  `nome` varchar(35) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `macnicolas`
--

INSERT INTO `macnicolas` (`idmacnicolas`, `nome`, `ativo`) VALUES
('38:2B:78:03:A8:38', 'Mac Nicolas', 1);

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
(1, 'Painel -> Aula - 18/09', '2026-09-18 00:00:00', '2026-09-18 23:59:59');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `combinanicolas`
--
ALTER TABLE `combinanicolas`
  ADD PRIMARY KEY (`idcombinanicolas`),
  ADD KEY `combinanicolas_FKIndex1` (`lednicolas_idlednicolas`),
  ADD KEY `combinanicolas_FKIndex2` (`painelnicolas_idpainelnicolas`),
  ADD KEY `combinanicolas_FKIndex3` (`macnicolas_idmacnicolas`);

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
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `combinanicolas`
--
ALTER TABLE `combinanicolas`
  MODIFY `idcombinanicolas` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- Restrições para tabelas `combinanicolas`
--
ALTER TABLE `combinanicolas`
  ADD CONSTRAINT `combinanicolas_ibfk_1` FOREIGN KEY (`lednicolas_idlednicolas`) REFERENCES `lednicolas` (`idlednicolas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `combinanicolas_ibfk_2` FOREIGN KEY (`painelnicolas_idpainelnicolas`) REFERENCES `painelnicolas` (`idpainelnicolas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `combinanicolas_ibfk_3` FOREIGN KEY (`macnicolas_idmacnicolas`) REFERENCES `macnicolas` (`idmacnicolas`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
