# ************************************************************
# Sequel Pro SQL dump
# Versão 4529
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.6.23)
# Base de Dados: loja_phpoo
# Tempo de Geração: 2017-08-09 03:36:15 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump da tabela carrinho
# ------------------------------------------------------------

DROP TABLE IF EXISTS `carrinho`;

CREATE TABLE `carrinho` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `produto` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `sessao` varchar(200) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `expire` timestamp NULL DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump da tabela carrinho_backup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `carrinho_backup`;

CREATE TABLE `carrinho_backup` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `produto` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `sessao` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump da tabela categorias
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categorias`;

CREATE TABLE `categorias` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `categoria_nome` varchar(50) DEFAULT NULL,
  `categoria_slug` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;

INSERT INTO `categorias` (`id`, `categoria_nome`, `categoria_slug`)
VALUES
	(1,'Celular','categoria-celular'),
	(2,'Câmeras','cameras'),
	(5,'Notebooks','notebooks'),
	(6,'Placas de Video','placas-de-video'),
	(14,'Teste updated','teste-2'),
	(22,'sdsds','dsd'),
	(23,'dsds','');

/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela estoque
# ------------------------------------------------------------

DROP TABLE IF EXISTS `estoque`;

CREATE TABLE `estoque` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `estoque_produto` int(11) DEFAULT NULL,
  `estoque_quantidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;

INSERT INTO `estoque` (`id`, `estoque_produto`, `estoque_quantidade`)
VALUES
	(1,1,136),
	(2,2,130),
	(3,3,300),
	(4,4,104),
	(5,5,122),
	(6,6,100),
	(7,7,134);

/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela fotos_produtos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fotos_produtos`;

CREATE TABLE `fotos_produtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `produto` int(11) DEFAULT NULL,
  `foto_thumb` varchar(150) DEFAULT NULL,
  `foto_grande` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `fotos_produtos` WRITE;
/*!40000 ALTER TABLE `fotos_produtos` DISABLE KEYS */;

INSERT INTO `fotos_produtos` (`id`, `produto`, `foto_thumb`, `foto_grande`)
VALUES
	(1,2,'assets/images/produtos/camera-samsung.jpg','assets/images/produtos/camera-samsung.jpg'),
	(2,2,'assets/images/produtos/iphone6s.jpeg','assets/images/produtos/camera-samsung.jpg'),
	(3,3,'assets/images/produtos/iphone6s.jpeg','assets/images/produtos/iphone6s.jpeg');

/*!40000 ALTER TABLE `fotos_produtos` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela marcas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `marcas`;

CREATE TABLE `marcas` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `marca_nome` varchar(50) DEFAULT NULL,
  `marca_slug` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;

INSERT INTO `marcas` (`id`, `marca_nome`, `marca_slug`)
VALUES
	(1,'Apple','apple'),
	(2,'Samsung','samsung'),
	(3,'LG','lg'),
	(4,'Radeon','radeon'),
	(5,'Geforce','geforce');

/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela online
# ------------------------------------------------------------

DROP TABLE IF EXISTS `online`;

CREATE TABLE `online` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session` varchar(150) NOT NULL,
  `ip` varchar(100) NOT NULL,
  `expire` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `online` WRITE;
/*!40000 ALTER TABLE `online` DISABLE KEYS */;

INSERT INTO `online` (`id`, `session`, `ip`, `expire`)
VALUES
	(80,'MTUwMjIxMzQwMTU5OTI2Mzc5ODY3MDYyODAxYTk4ZjczZTYzNmQ4Y2MyZmExOTk4NzNlYzg1ODM=','::1','2017-08-08 21:40:06');

/*!40000 ALTER TABLE `online` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela password_reminder
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_reminder`;

CREATE TABLE `password_reminder` (
  `user` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `expire` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hash` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump da tabela pedidos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pedidos`;

CREATE TABLE `pedidos` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pedido_user` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `pedido_frete` decimal(10,2) DEFAULT NULL,
  `pedido_status` int(11) DEFAULT '11',
  `sessao` varchar(100) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `status_pagamento` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump da tabela pedidos_produtos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pedidos_produtos`;

CREATE TABLE `pedidos_produtos` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `produto` int(11) DEFAULT '11',
  `quantidade` int(11) DEFAULT '11',
  `sessao` varchar(100) DEFAULT NULL,
  `user` int(11) DEFAULT '11',
  `valor` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump da tabela produtos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `produtos`;

CREATE TABLE `produtos` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `produto_nome` varchar(50) DEFAULT NULL,
  `produto_valor` decimal(10,2) DEFAULT NULL,
  `produto_slug` varchar(100) DEFAULT NULL,
  `produto_descricao` text,
  `produto_foto` varchar(150) DEFAULT NULL,
  `produto_promocao` int(11) DEFAULT NULL,
  `produto_valor_promocao` decimal(10,2) DEFAULT NULL,
  `produto_categoria` int(11) DEFAULT NULL,
  `produto_marca` int(11) DEFAULT NULL,
  `produto_presente` int(11) DEFAULT NULL,
  `produto_destaque` int(11) DEFAULT NULL,
  `produto_garantia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;

INSERT INTO `produtos` (`id`, `produto_nome`, `produto_valor`, `produto_slug`, `produto_descricao`, `produto_foto`, `produto_promocao`, `produto_valor_promocao`, `produto_categoria`, `produto_marca`, `produto_presente`, `produto_destaque`, `produto_garantia`)
VALUES
	(3,'Celular Iphone 6S',500.00,'produto-celular-iphone-6s-updated','Se hoje é o dia das crianças... Ontem eu disse: o dia da criança é o dia da mãe, dos pais, das professoras, mas também é o dia dos animais, sempre que você olha uma criança, há sempre uma figura oculta, que é um cachorro atrás. O que é algo muito importante!\r\n\r\nA população ela precisa da Zona Franca de Manaus, porque na Zona franca de Manaus, não é uma zona de exportação, é uma zona para o Brasil. Portanto ela tem um objetivo, ela evita o desmatamento, que é altamente lucravito. Derrubar arvores da natureza é muito lucrativo!\r\n\r\nA única área que eu acho, que vai exigir muita atenção nossa, e aí eu já aventei a hipótese de até criar um ministério. É na área de... Na área... Eu diria assim, como uma espécie de analogia com o que acontece na área agrícola.','assets/images/produtos/capa-php-js.jpg',1,345.00,1,1,2,1,'Temos uma garantia de 200 dias'),
	(4,'Celular LG Leon',2500.00,'celular-lg-leon','Se hoje é o dia das crianças... Ontem eu disse: o dia da criança é o dia da mãe, dos pais, das professoras, mas também é o dia dos animais, sempre que você olha uma criança, há sempre uma figura oculta, que é um cachorro atrás. O que é algo muito importante!\n\nA população ela precisa da Zona Franca de Manaus, porque na Zona franca de Manaus, não é uma zona de exportação, é uma zona para o Brasil. Portanto ela tem um objetivo, ela evita o desmatamento, que é altamente lucravito. Derrubar arvores da natureza é muito lucrativo!\n\nA única área que eu acho, que vai exigir muita atenção nossa, e aí eu já aventei a hipótese de até criar um ministério. É na área de... Na área... Eu diria assim, como uma espécie de analogia com o que acontece na área agrícola.','assets/images/produtos/lgleon.jpg',1,3456.00,1,3,2,2,'Temos uma garantia de 200 dias'),
	(5,'Macbook pro super',10000.00,'macbook-pro','O MacBook Pro é uma linha de computadores portáteis Macintosh da Apple Inc. apresentada em Janeiro de 2006, agora na terceira geração. \r\nSubstituindo o PowerBook G4, o Macbook pro foi o segundo modelo a ser anunciado com a familia de processadores intel, depois do Imac. \r\n\r\nÉ o modelo top de linha da Família Macbook e atualmente está sendo vendido os modelos com 13 e 15 polegadas. Um modelo de 17 polegadas era vendido no passado.\r\n\r\nA primeira geração do Macbook Pro aparenta ser externamente similar ao PowerBook G4, mas com os Processadores da Intel ao invés do chip PowerPC G4. O modelo de 15 polegadas foi introduzido primeiro, em Janeiro de 2006; o de 17 polegadas em abril do mesmo ano. Ambos receberam muitas atualizações em seguida com o processador Core 2 duo naquele ano.\r\n\r\nA segunda geração, conhecida como &#39;unibody&#39; (único corpo), tem um design cônico e uma carcaça feita de um bloco único de alumínio. Foi apresentada em Outubro de 2008 os modelos de 15-polegadas e de 13-polegadas. Em Janeiro foi levado o novo design para o modelo de 17-polegadas também, e a bateria interna foi alterada para o resto da linha Macbook Pro em Junho, quando a Apple também mudou o modelo de 13-polegadas para a linha Pro. Durante várias melhorias trouxe os processadores Intel Core i5 e i7 e introduzida a tecnologia também da Intel, chamada Thunderbolt.\r\n\r\nA Apple apresentou a terceira geração do Macbook pro em Junho de 2012 com o modelo de 15-polegadas. Juntamente, a variante de 17-polegadas foi descontinuada, e pequenas atualizações dos modelos unibody de 13 e 15-polegadas foram anunciadas e vendidas paralelamente. Comparado, é menor que o suas versões anteriores, o estilo similar com a terceira geração manteve um design unibody. A diferença mais substancial nos modelos de terceira geração foi a tela retina encontrada nestes novos notebooks, com uma resolução substancialmente maior e a eliminação do leitor de disco óptico e a substituição dos Discos Rígidos por Unidades de estado sólido. Um modelo de 13-polegadas da linha Pro foi lançada em Outubro de 2012.','assets/images/produtos/macbook_pro.jpg',1,34.00,5,1,1,2,'Temos uma garantia de 200 dias'),
	(6,'Radeon',300.00,'placa-video-radeon','Divirta-se com os últimos lançamentos de jogos com esta GPU totalmente compatível com o Microsoft DirectX® 11 que oferece gráficos em alta definição \nrealísticos incríveis e jogos em 3D estereoscópico reais para ter uma experiência em jogos de alta definição verdadeiramente imersiva. \nExpanda seu ambiente visual com a tecnologia ATI Eyefinity para várias telas, que permite que você veja mais e domine o campo de batalha. \n\nAgora, com a aceleração AMD App, você pode ganhar potência até mesmo com aplicativos de mídia que consomem alta largura de banda a velocidades incríveis. \nSeja para jogos ou produtividade, essa placa serve para ambos.','assets/images/produtos/radeon.jpg',1,789.00,6,4,1,1,'Temos uma garantia de 200 dias'),
	(7,'Geforce gts250',550.00,'placa-video-gforce','Se hoje é o dia das crianças... Ontem eu disse: o dia da criança é o dia da mãe, dos pais, das professoras, mas também é o dia dos animais, sempre que você olha uma criança, há sempre uma figura oculta, que é um cachorro atrás. O que é algo muito importante!\n\nA população ela precisa da Zona Franca de Manaus, porque na Zona franca de Manaus, não é uma zona de exportação, é uma zona para o Brasil. Portanto ela tem um objetivo, ela evita o desmatamento, que é altamente lucravito. Derrubar arvores da natureza é muito lucrativo!\n\nA única área que eu acho, que vai exigir muita atenção nossa, e aí eu já aventei a hipótese de até criar um ministério. É na área de... Na área... Eu diria assim, como uma espécie de analogia com o que acontece na área agrícola.','assets/images/produtos/geforce_gts_250.jpg',1,150.00,6,5,1,2,'Temos uma garantia de 200 dias'),
	(8,'Teste',32.00,'teste','Teste de descriçao',NULL,NULL,NULL,1,1,NULL,NULL,'32'),
	(9,'Teste2',32.00,'test-2','ewewe',NULL,NULL,NULL,1,1,NULL,NULL,'32');

/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `sobrenome` varchar(50) DEFAULT NULL,
  `is_admin` int(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  `cep` varchar(20) DEFAULT NULL,
  `endereco` varchar(70) DEFAULT NULL,
  `cidade` varchar(20) DEFAULT NULL,
  `bairro` varchar(20) DEFAULT NULL,
  `ddd` varchar(20) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `estado` char(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `sobrenome`, `is_admin`, `email`, `password`, `cep`, `endereco`, `cidade`, `bairro`, `ddd`, `telefone`, `estado`)
VALUES
	(1,'Alexandre','Cardoso',1,'xandecar@hotmail.com','$2y$11$Xc4Uc.QpWUfZOmOjyRaCNOPlMosPaeuST2iG.wtbiGPcRg.hsQ90e','14811260','endereco teste','araraquara','santa clara','16','992467199','sp'),
	(3,'Marcia','Santos',2,'marcia@email.com.br','$2y$11$1qmRvkKl2/7q9VtzaKcGMeQxIiyL6j.uRTo3N0kRRoSpIwvAm8HhG','14811260','rua teste','Araraquara','bairro etste','16','16992467199','sp'),
	(4,'Joao','Pedro',2,'cursos@asolucoesweb.com.br','$2y$11$zHhvQddwPCZlzPqR/p43yuavJN/PsLfUKhSIFHi2pONLizbobbhV6','14811260','Rua presidente João Belquior Marques Goulart, 64','Araraquara','wdwwewe','16','16992467199','SP');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
