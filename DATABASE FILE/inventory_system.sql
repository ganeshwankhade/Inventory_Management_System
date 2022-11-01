SET SQL_MODE = "NO_AUTO_VALUE_ONZERO";
SET time_zone = "+00:00";

CREATE TABLE IF NOT EXISTS `categories` (
`id` int(11) unsigned NOT NULL,
`name` varchar(60) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=UTF8;

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Demo Category'),
(3, 'Finished Goods'),
(5, 'Machinery'),
(4, 'Packing Materials'),
(2, 'Raw Materials'),
(8, 'Stationery Items'),
(6, 'Work in Progress');
