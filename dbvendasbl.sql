-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 28-Nov-2021 às 22:49
-- Versão do servidor: 8.0.21
-- versão do PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `dbvendasbl`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_login`
--

DROP TABLE IF EXISTS `tbl_login`;
CREATE TABLE IF NOT EXISTS `tbl_login` (
  `pk_id_cliente` int NOT NULL AUTO_INCREMENT,
  `user_nome` varchar(30) NOT NULL,
  `user_login` varchar(15) NOT NULL,
  `user_senha` int NOT NULL,
  PRIMARY KEY (`pk_id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tbl_login`
--

INSERT INTO `tbl_login` (`pk_id_cliente`, `user_nome`, `user_login`, `user_senha`) VALUES
(1, 'ADM', 'ADM', 1723),
(2, 'Lucas', 'LUMAGLI', 161020);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_produto`
--

DROP TABLE IF EXISTS `tbl_produto`;
CREATE TABLE IF NOT EXISTS `tbl_produto` (
  `pk_id_produto` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `pro_nome` varchar(50) NOT NULL,
  `pro_valor` double NOT NULL,
  `pro_estoque` int NOT NULL,
  PRIMARY KEY (`pk_id_produto`),
  UNIQUE KEY `pk_id_produto` (`pk_id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tbl_produto`
--

INSERT INTO `tbl_produto` (`pk_id_produto`, `pro_nome`, `pro_valor`, `pro_estoque`) VALUES
(1, 'Maracujá', 2, 30),
(2, 'Morango', 5, 90),
(3, 'Batata', 6, 200),
(4, 'Batata doce', 4, 150),
(5, 'Cenoura', 2, 49);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_usuario`
--

DROP TABLE IF EXISTS `tbl_usuario`;
CREATE TABLE IF NOT EXISTS `tbl_usuario` (
  `pk_id_usuario` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_nome` varchar(50) NOT NULL,
  `user_endereco` varchar(50) NOT NULL,
  `user_bairro` varchar(30) NOT NULL,
  `user_cidade` varchar(20) NOT NULL,
  `user_uf` varchar(2) NOT NULL,
  `user_cep` int NOT NULL,
  `user_numero` int NOT NULL,
  `user_telefone` int DEFAULT NULL,
  `user_celular` int NOT NULL,
  PRIMARY KEY (`pk_id_usuario`),
  UNIQUE KEY `fk_usuario` (`pk_id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tbl_usuario`
--

INSERT INTO `tbl_usuario` (`pk_id_usuario`, `user_nome`, `user_endereco`, `user_bairro`, `user_cidade`, `user_uf`, `user_cep`, `user_numero`, `user_telefone`, `user_celular`) VALUES
(1, 'Lucas', 'Rua aparecida ramos fuchida', 'PQ CONTINENTAL', 'Guarulhos', 'SP', 7077290, 256, 1142442766, 954541811),
(2, 'Laura', 'são joaquim', 'vila medeiros', 'bragança paulista', 'SP', 5842320, 44, 25486633, 958642871),
(3, 'Kaique', 'Dante pereira ', 'São domingos', 'Coramandel', 'MG', 38550000, 909, 25446882, 982663477),
(4, 'Joaquim', 'rua 8', 'santana', 'São Pualo', 'SP', 7086320, 244, 45448266, 984775266),
(5, 'Guilherme', 'Rua 7', 'Tucuruvi', 'São Paulo', 'SP', 8099352, 4456, NULL, 962448755);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_vendas`
--

DROP TABLE IF EXISTS `tbl_vendas`;
CREATE TABLE IF NOT EXISTS `tbl_vendas` (
  `pk_id_vendas` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `fk_usuario` bigint UNSIGNED NOT NULL,
  `ven_data_venda` date NOT NULL,
  `ven_valor_liquido` double NOT NULL,
  `ven_valor_bruto` double NOT NULL,
  `ven_desconto` double NOT NULL,
  PRIMARY KEY (`pk_id_vendas`),
  UNIQUE KEY `fkcliente` (`fk_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tbl_vendas`
--

INSERT INTO `tbl_vendas` (`pk_id_vendas`, `fk_usuario`, `ven_data_venda`, `ven_valor_liquido`, `ven_valor_bruto`, `ven_desconto`) VALUES
(1, 1, '2021-11-20', 59, 69, 10),
(2, 2, '2021-11-12', 85, 85, 0),
(3, 3, '2021-11-13', 45, 45, 0),
(4, 4, '2021-11-10', 74, 82, 7);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_vendas_produto`
--

DROP TABLE IF EXISTS `tbl_vendas_produto`;
CREATE TABLE IF NOT EXISTS `tbl_vendas_produto` (
  `pk_id_venda_produto` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `fk_produto` bigint UNSIGNED NOT NULL,
  `fk_vendas` bigint UNSIGNED NOT NULL,
  `ven_pro_valor` double NOT NULL,
  `ven_pro_quantidade` int NOT NULL,
  PRIMARY KEY (`pk_id_venda_produto`),
  KEY `fkvendas` (`fk_vendas`),
  KEY `fkprodutos` (`fk_produto`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tbl_vendas`
--
ALTER TABLE `tbl_vendas`
  ADD CONSTRAINT `tbl_vendas_ibfk_1` FOREIGN KEY (`fk_usuario`) REFERENCES `tbl_usuario` (`pk_id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `tbl_vendas_produto`
--
ALTER TABLE `tbl_vendas_produto`
  ADD CONSTRAINT `tbl_vendas_produto_ibfk_1` FOREIGN KEY (`fk_produto`) REFERENCES `tbl_produto` (`pk_id_produto`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tbl_vendas_produto_ibfk_2` FOREIGN KEY (`fk_vendas`) REFERENCES `tbl_vendas` (`pk_id_vendas`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
