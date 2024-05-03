-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.5.62 - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para banco
CREATE DATABASE IF NOT EXISTS `banco` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `banco`;

-- Copiando estrutura para tabela banco.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `endereco` varchar(80) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela banco.clientes: ~20 rows (aproximadamente)
DELETE FROM `clientes`;
INSERT INTO `clientes` (`codigo`, `nome`, `endereco`, `email`, `telefone`) VALUES
	(1, 'Antonio', 'Rua Domingos', 'Antonio@gmail.com', '(11) 53323-7152'),
	(2, 'Daniela NatÃƒÂ¡lia Priscila Rezende', 'Rua Serra JapuÃƒÂ­ra', 'daniela.natalia.rezende@sabereler.com.br', '(43) 2621-9759'),
	(3, 'Lucas Pedro', 'Rua joneles', 'lucaspedro@gmail.com', '(11) 63342-2569'),
	(4, 'Guilherme Caleb Novaes', 'Rua Acesita', 'guilherme_novaes@diebold.com', '(27) 2581-2705'),
	(5, 'Giovanna Rosa AssunÃ§Ã£o', 'Rua Eduardo Hugo Lins Guerra', 'giovanna-assuncao98@emerson.com', '(83) 2988-1945'),
	(6, 'Diego Bruno Francisco Brito', 'Rua Passos Cabral', 'diego_bruno_brito@cielo.com.br', '(79) 3553-3321'),
	(7, 'Ana Rafaela Kamilly Bernardes', 'Quadra Quadra 6', 'ana_rafaela_bernardes@vipsaude.com.br', '(61) 3608-7666'),
	(8, 'Geraldo Caleb da Mata', 'Alameda AntÃ´nio Ferreira de Jusus', 'geraldocalebdamata@gmeil.com', '(96) 2517-6126'),
	(9, 'Isabel Stefany Vera Nunes', 'Rua Serra da Canastra', 'isabel_nunes@oliveiracontabil.com.br', '(31) 2749-7513'),
	(10, 'Carolina Clara da Rocha', 'Rua GuatambÃº', 'carolina_clara_darocha@uel.br', '(11) 2950-8233'),
	(11, 'Paulo Dom', 'Rua avenida', 'paulodom@hotmail.com', '(11) 99815-4199'),
	(12, 'Claudia Aparecida da Silva', 'rua placidio covaleiro', 'claudias.aparecida@gmail.com', '(11) 87425-4899'),
	(13, 'Patrick Dom da Silva', 'Rua palmeiras', 'patrick@hotmail.com', '(24) 48535-0945'),
	(14, 'Ian Nicolas Assis', 'Rua LÃ³tus', 'ian.nicolas.assis@mavex.com.br', '(69) 2697-6932'),
	(15, 'Enzo Alexandre Almeida', 'Rua Murupi', 'enzoalexandrealmeida@texfuse.com.br', '(68) 3685-8150'),
	(16, 'Bruna PatrÃ­cia Sabrina Barbosa', 'Travessa da Saudade', 'bruna.patricia.barbosa@unicohost.com.br', '(81) 2585-6619'),
	(17, 'Andre Paulo da Conceicao', 'Rua Roberto Morais', 'andre_daconceicao@superig.com.br', '(79) 2843-8296'),
	(18, 'Anthony Joaquim Heitor da Mota', 'Rua Dez', 'anthony_joaquim_damota@land.com.br', '(32) 2516-0750'),
	(19, 'Noah Caleb Sales', 'Rua Visconde de Porto Alegre', 'noahcalebsales@compecia.com.br', '(92) 2902-9854'),
	(20, 'Antonio Caio Souza', 'Rua Cinco', 'antonio_caio_souza@pop.com.br', '(35) 3741-4425');

-- Copiando estrutura para tabela banco.pedidoi
CREATE TABLE IF NOT EXISTS `pedidoi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_m` int(50) DEFAULT NULL,
  `cod_produto` varchar(50) DEFAULT NULL,
  `quantidade` varchar(50) DEFAULT NULL,
  `valor_unitario` varchar(50) DEFAULT NULL,
  `valor_total` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_m` (`id_m`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela banco.pedidoi: ~0 rows (aproximadamente)
DELETE FROM `pedidoi`;

-- Copiando estrutura para tabela banco.pedidom
CREATE TABLE IF NOT EXISTS `pedidom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` varchar(10) DEFAULT NULL,
  `hora` varchar(5) DEFAULT NULL,
  `cliente` varchar(100) DEFAULT NULL,
  `sub_total` varchar(250) DEFAULT NULL,
  `desconto` varchar(4) DEFAULT NULL,
  `total` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela banco.pedidom: ~0 rows (aproximadamente)
DELETE FROM `pedidom`;

-- Copiando estrutura para tabela banco.produtos
CREATE TABLE IF NOT EXISTS `produtos` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `produto` varchar(180) DEFAULT NULL,
  `descricao` varchar(180) DEFAULT NULL,
  `unidade` varchar(50) DEFAULT NULL,
  `margem` varchar(150) DEFAULT NULL,
  `codigo_de_barras` varchar(120) DEFAULT NULL,
  `valor_de_venda` double(15,2) DEFAULT NULL,
  `valor_de_compra` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela banco.produtos: ~6 rows (aproximadamente)
DELETE FROM `produtos`;
INSERT INTO `produtos` (`codigo`, `produto`, `descricao`, `unidade`, `margem`, `codigo_de_barras`, `valor_de_venda`, `valor_de_compra`) VALUES
	(1, 'CalÃ§a Jeans Azul', 'CalÃ§a jeans azul escuro, tamanho 38', 'PeÃ§a', '40', '9876543210987', 15.00, ' 50,00'),
	(2, 'TÃªnis Esportivo Preto', ' TÃªnis esportivo preto, modelo unissex, tamanho 40', ' Par', '60', ' 8765432109876', 20.00, ' 80,00'),
	(3, 'Camisa Polo Branca', 'Camisa polo branca, manga curta, tamanho M', 'PeÃ§a', '50', '7654321098765', 12.00, '30,00'),
	(4, ' Ã“culos de Sol Aviador', 'Ã“culos de sol estilo aviador, armaÃ§Ã£o dourada, lentes escuras', ' PeÃ§a', '70', '6543210987654', 12.00, ' 25,00'),
	(5, 'Vestido Floral', 'Vestido estampado floral, com alÃ§as finas, tecido leve', ' PeÃ§a', '55', '5432109876543', 2.00, '40,00'),
	(6, 'Camiseta Branca', ' Camiseta de algodÃ£o branca, tamanho M', 'PeÃ§a', '50', '1234567890123', 5.00, '20,00');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;