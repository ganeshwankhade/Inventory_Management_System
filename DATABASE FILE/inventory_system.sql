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

CREATE TABLE IF NOT EXISTS `media` (
`id` int(11) unsigned NOT NULL,
`file_name` varchar (255) NOT NULL,
`file_type` varchar(100) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `products` (
`id` int(11) unsigned NOT NULL,
`name` varchar(255) NOT NULL,
`quantity` varchar(50) DEFAULT NULL,
`buy_price` decimal(25, 2) DEFAULT NULL,
`sale_price` decimal(25, 2) NOT NULL,
`categorie_id` int(11) unsigned NOT NULL,
`media_id` int(11) DEFAULT '0',
`date` datetime NOT NULL
)ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=UTF8;

INSERT INTO `products` (`id`, `name`, `quantity`, `buy_price`, `sale_price`, `categorie_id`, `media_id`, `date`) VALUES
(1, 'Demo Product', '48', '100.00', '500.00', 1, 0, '2022-10-28 16:45:51'),
(2, 'Electronics', '12000', '55.00', '130.00', 4, 0, '2022-10-28 18:44:52'),
(3, 'Wheat', '69', '2.00', '5.00', 2, 0, '2022-10-28 18:48:53');

CREATE TABLE IF NOT EXISTS `sales` (
`id` int(11) unsigned NOT NULL,
`product_id` int(11) unsigned NOT NULL,
`qty` int(11) NOT NULL,
`price` decimal(25, 2) NOT NULL,
`date` date NOT NULL
)ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO `sales` (`id`, `product_id`, `qty`, `price`, `date`) VALUES
(1, 1, 2, '1000.00', '2022-10-29'),
(2, 3, 3, '15.00', '2022-10-29'),
(3, 10, 6, '1932.00', '2022-10-29'),
(4, 6, 2, '830.00', '2022-10-29'),
(5, 12, 5, '50.00', '2022-10-29'),
(6, 13, 21, '399.00', '2022-10-29'),
(7, 7, 5, '35.00', '2022-10-29'),
(8, 9, 2, '110.00', '2022-10-29');

CREATE TABLE IF NOT EXISTS `users` (
	`id` int(11) unsigned NOT NULL,
	  `name` varchar(60) NOT NULL,
	  `username` varchar(50) NOT NULL,
	  `password` varchar(255) NOT NULL,
	  `user_level` int(11) NOT NULL,
	  `image` varchar(255) DEFAULT 'no_image.jpg',
	  `status` int(1) NOT NULL,
	  `last_login` datetime DEFAULT NULL
	) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO `users` (`id`, `name`, `username`, `password`, `user_level`, `image`, `status`, `last_login`) VALUES
(1, 'Ganesh', 'admin', 'ganesh', 1, 'no_image.png', 1, '2022-02-11 19:45:52'),
(2, 'Nayan', 'special', 'nayan', 2, 'no_image.png', 1, '2022-02-11 19:53:26'),
(3, 'abc', 'user', 'abc', 3, 'no_image.png', 1, '2022-02-11 19:54:46'),
(4, 'user', 'natie', 'user', 3, 'no_image.png', 1, NULL),
(5, 'Kevin', 'kevin', 'kevin', 3, 'no_image.png', 1, '2022-02-11 19:54:29');

CREATE TABLE IF NOT EXISTS `user_groups` (
	`id` int(11) NOT NULL,
	  `group_name` varchar(150) NOT NULL,
	  `group_level` int(11) NOT NULL,
	  `group_status` int(1) NOT NULL
	) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO `user_groups` (`id`, `group_name`, `group_level`, `group_status`) VALUES
(1, 'Admin', 1, 1),
(2, 'special', 2, 1),
(3, 'User', 3, 1);


ALTER TABLE `categories`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

ALTER TABLE `media`
 ADD PRIMARY KEY (`id`), ADD KEY `id` (`id`);

ALTER TABLE `products`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`), ADD KEY `categorie_id` (`categorie_id`), ADD KEY `media_id` (`media_id`);


ALTER TABLE `sales`
 ADD PRIMARY KEY (`id`), ADD KEY `product_id` (`product_id`);


ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD KEY `user_level` (`user_level`);


ALTER TABLE `user_groups`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `group_level` (`group_level`);

ALTER TABLE `categories`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;

ALTER TABLE `media`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;

ALTER TABLE `products`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;

ALTER TABLE `sales`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;

ALTER TABLE `users`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;

ALTER TABLE `user_groups`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;

ALTER TABLE `products`
ADD CONSTRAINT `FK_products` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `sales`
ADD CONSTRAINT `SK` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `users`
ADD CONSTRAINT `FK_user` FOREIGN KEY (`user_level`) REFERENCES `user_groups` (`group_level`) ON DELETE CASCADE ON UPDATE CASCADE;
