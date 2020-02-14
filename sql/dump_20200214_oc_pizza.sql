-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 14 fév. 2020 à 13:36
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `oc_pizza`
--

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `id_address` int(11) NOT NULL,
  `type` varchar(15) DEFAULT NULL,
  `street_number` int(11) DEFAULT NULL,
  `street_name` varchar(70) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `address_supplement` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id_address`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `address`
--

INSERT INTO `address` (`id_address`, `type`, `street_number`, `street_name`, `postcode`, `city`, `country`, `address_supplement`) VALUES
(1, 'Point de Vente', 1, 'rue du PDV1', '75000', 'Ville1', 'PAYS', 'Complément addresse du PDV1'),
(2, 'Point de Vente', 2, 'rue du PDV2', '69000', 'Ville2', 'PAYS', 'Complément addresse du PDV2'),
(3, 'Point de Vente', 3, 'rue du PDV3', '33000', 'Ville3', 'PAYS', 'Complément addresse du PDV3'),
(4, 'Client', 1, 'rue du client 1', '75000', 'VilleClient1', 'PAYS', 'Complément addresse du client 1'),
(5, 'Client', 2, 'rue du client 2', '69000', 'VilleClient2', 'PAYS', 'Complément addresse du client 2'),
(6, 'Client', 3, 'rue du client 3', '33000', 'VilleClient3', 'PAYS', 'Complément addresse du client 3'),
(7, 'Employe', 4, 'rue du Employe 1', '75001', 'VilleEmploye1', 'PAYS', 'Complément addresse Employe 1'),
(8, 'Employe', 5, 'rue du Employe 2', '69002', 'VilleEmploye2', 'PAYS', 'Complément addresse Employe 2'),
(9, 'Employe', 6, 'rue du Employe 3', '33003', 'VilleEmploye3', 'PAYS', 'Complément addresse Employe 3');

-- --------------------------------------------------------

--
-- Structure de la table `compoundproduct`
--

DROP TABLE IF EXISTS `compoundproduct`;
CREATE TABLE IF NOT EXISTS `compoundproduct` (
  `id_compoundproduct` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pvht` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`id_compoundproduct`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `compoundproduct`
--

INSERT INTO `compoundproduct` (`id_compoundproduct`, `name`, `pvht`) VALUES
(1, 'Pizza1', '9.45'),
(2, 'Pizza2', '11.15');

-- --------------------------------------------------------

--
-- Structure de la table `compoundproduct_has_product`
--

DROP TABLE IF EXISTS `compoundproduct_has_product`;
CREATE TABLE IF NOT EXISTS `compoundproduct_has_product` (
  `compoundproduct_id_compoundproduct` int(11) NOT NULL,
  `product_id_product` int(11) NOT NULL,
  `quantity` decimal(7,3) DEFAULT NULL,
  PRIMARY KEY (`compoundproduct_id_compoundproduct`,`product_id_product`),
  KEY `fk_compoundproduct_has_product_product1` (`product_id_product`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `compoundproduct_has_product`
--

INSERT INTO `compoundproduct_has_product` (`compoundproduct_id_compoundproduct`, `product_id_product`, `quantity`) VALUES
(1, 1, '0.125'),
(1, 4, '5.000'),
(1, 5, '1.000'),
(1, 6, '5.000'),
(1, 7, '5.000'),
(2, 2, '0.125'),
(2, 4, '5.000'),
(2, 5, '1.000'),
(2, 6, '7.000'),
(2, 7, '5.000');

-- --------------------------------------------------------

--
-- Structure de la table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
CREATE TABLE IF NOT EXISTS `delivery` (
  `id_delivery` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`id_delivery`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `delivery`
--

INSERT INTO `delivery` (`id_delivery`, `date`, `status`) VALUES
(1, '2020-01-20 00:00:00', 'Delivered'),
(2, '2019-12-20 00:00:00', 'Aborted'),
(3, '2019-12-20 00:00:00', 'Delivered'),
(4, '2019-12-18 00:00:00', 'Delivered'),
(5, '2019-12-18 00:00:00', 'Delivered'),
(6, '2019-12-18 00:00:00', 'In Progress');

-- --------------------------------------------------------

--
-- Structure de la table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE IF NOT EXISTS `invoice` (
  `id_invoice` int(11) NOT NULL,
  `transaction_method` varchar(255) DEFAULT NULL,
  `transaction_status` varchar(45) DEFAULT NULL,
  `transaction_reference` varchar(255) NOT NULL,
  `transaction_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` decimal(6,2) NOT NULL,
  PRIMARY KEY (`id_invoice`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `invoice`
--

INSERT INTO `invoice` (`id_invoice`, `transaction_method`, `transaction_status`, `transaction_reference`, `transaction_date`, `amount`) VALUES
(1, 'CB', 'Validated', '00200000614C', '2020-01-20 00:00:00', '14.95'),
(2, 'CB', 'Aborted', 'NULL', '2020-01-21 00:00:00', '0.00'),
(3, 'Ticket Restaurant', 'Validated', 'CAISSE_PDV1-TRANSAC1B256225599TR', '2019-12-20 00:00:00', '21.00'),
(4, 'Espèce', 'Validated', 'CAISSE_PDV1-TRANSAC1B256225599ESP', '2019-12-20 00:00:00', '37.50'),
(5, 'CB', 'Validated', '00200000615C', '2019-12-18 00:00:00', '11.00'),
(6, 'CB', 'Validated', '00200000616C', '2019-12-15 00:00:00', '14.95');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `list_orders`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `list_orders`;
CREATE TABLE IF NOT EXISTS `list_orders` (
`ID Commande` int(11)
,`ID Facture` int(11)
,`Nom` varchar(255)
,`Prénom` varchar(255)
,`Date de livraison` datetime
,`Etat Livraison` varchar(45)
,`Nb ligne cmd` bigint(21)
,`Total facturé` decimal(6,2)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `list_point_of_sales`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `list_point_of_sales`;
CREATE TABLE IF NOT EXISTS `list_point_of_sales` (
`Nom du PDV` varchar(45)
,`Manager du PDV` varchar(45)
,`N°` int(11)
,`Rue` varchar(70)
,`Code Postale` varchar(10)
,`Ville` varchar(20)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `list_users`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `list_users`;
CREATE TABLE IF NOT EXISTS `list_users` (
`ID Client` int(11)
,`Civ.` varchar(5)
,`Nom` varchar(255)
,`Prénom` varchar(255)
,`e-Mail` varchar(255)
,`Type adresse` varchar(15)
,`N°` int(11)
,`Rue` varchar(70)
,`Code Postale` varchar(10)
,`Ville` varchar(20)
);

-- --------------------------------------------------------

--
-- Structure de la table `openinghours`
--

DROP TABLE IF EXISTS `openinghours`;
CREATE TABLE IF NOT EXISTS `openinghours` (
  `id_openinghours` int(11) NOT NULL,
  `day` varchar(70) DEFAULT NULL,
  `lunchtime_opening` time DEFAULT NULL,
  `lunchtime_closing` time DEFAULT NULL,
  `evening_opening` time DEFAULT NULL,
  `envening_closong` time DEFAULT NULL,
  PRIMARY KEY (`id_openinghours`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `openinghours`
--

INSERT INTO `openinghours` (`id_openinghours`, `day`, `lunchtime_opening`, `lunchtime_closing`, `evening_opening`, `envening_closong`) VALUES
(1, 'Lundi', '11:30:00', '13:30:00', '19:00:00', '21:30:00'),
(2, 'Mardi', '11:30:00', '13:30:00', '19:00:00', '21:30:00'),
(3, 'Mercredi', '11:30:00', '13:30:00', '19:00:00', '21:30:00'),
(4, 'Jeudi', '11:30:00', '13:30:00', '19:00:00', '21:30:00'),
(5, 'Vendredi', '11:30:00', '13:30:00', '19:00:00', '21:30:00'),
(6, 'Samedi', '12:00:00', '14:30:00', '18:30:00', '22:30:00'),
(7, 'Dimanche', '12:00:00', '14:30:00', '18:30:00', '22:30:00'),
(8, 'Lundi', '12:00:00', '13:30:00', '19:30:00', '21:00:00'),
(9, 'Mardi', '12:00:00', '13:30:00', '19:30:00', '21:00:00'),
(10, 'Mercredi', '12:00:00', '13:30:00', '19:30:00', '21:00:00'),
(11, 'Jeudi', '12:00:00', '13:30:00', '19:30:00', '21:00:00'),
(12, 'Vendredi', '12:00:00', '13:30:00', '19:30:00', '21:00:00'),
(13, 'Samedi', NULL, NULL, NULL, NULL),
(14, 'Dimanche', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `id_order` int(11) NOT NULL,
  `invoice_id_invoice` int(11) NOT NULL,
  `delivery_id_delivery` int(11) NOT NULL,
  `user_id_user` int(11) NOT NULL,
  `user_pointofsale_id_pointofsale` int(11) NOT NULL,
  PRIMARY KEY (`id_order`,`invoice_id_invoice`,`delivery_id_delivery`,`user_id_user`,`user_pointofsale_id_pointofsale`),
  KEY `fk_order_invoice1` (`invoice_id_invoice`),
  KEY `fk_order_delivery1` (`delivery_id_delivery`),
  KEY `fk_order_user1` (`user_id_user`,`user_pointofsale_id_pointofsale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `order`
--

INSERT INTO `order` (`id_order`, `invoice_id_invoice`, `delivery_id_delivery`, `user_id_user`, `user_pointofsale_id_pointofsale`) VALUES
(1, 1, 1, 1, 1),
(2, 2, 2, 2, 2),
(3, 3, 3, 3, 3),
(4, 4, 4, 1, 1),
(5, 5, 5, 2, 2),
(6, 6, 6, 3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `orderline`
--

DROP TABLE IF EXISTS `orderline`;
CREATE TABLE IF NOT EXISTS `orderline` (
  `id_orderline` int(11) NOT NULL,
  `product_quantity` int(11) DEFAULT NULL,
  `order_line_status` varchar(45) NOT NULL,
  `product_id_product` int(11) DEFAULT NULL,
  `compoundproduct_id_compoundproduct` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_orderline`),
  KEY `fk_orderline_product1` (`product_id_product`),
  KEY `fk_orderline_compoundproduct1` (`compoundproduct_id_compoundproduct`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `orderline`
--

INSERT INTO `orderline` (`id_orderline`, `product_quantity`, `order_line_status`, `product_id_product`, `compoundproduct_id_compoundproduct`) VALUES
(1, 1, 'En cours de Préparation', NULL, 1),
(2, 1, 'En cours de Préparation', 8, NULL),
(3, 1, 'Annulation', NULL, 2),
(4, 1, 'Annulation', 8, NULL),
(5, 1, 'En cours de Préparation', NULL, 1),
(6, 1, 'En cours de Préparation', 8, NULL),
(7, 1, 'En cours de Préparation', NULL, 1),
(8, 1, 'En cours de Préparation', 8, NULL),
(9, 1, 'En cours de Préparation', NULL, 1),
(10, 1, 'En cours de Préparation', 8, NULL),
(11, 1, 'En cours de Préparation', NULL, 2);

-- --------------------------------------------------------

--
-- Structure de la table `order_has_orderline`
--

DROP TABLE IF EXISTS `order_has_orderline`;
CREATE TABLE IF NOT EXISTS `order_has_orderline` (
  `order_id_order` int(11) NOT NULL,
  `orderline_id_orderline` int(11) NOT NULL,
  PRIMARY KEY (`order_id_order`,`orderline_id_orderline`),
  KEY `fk_order_has_orderline_orderline1` (`orderline_id_orderline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `order_has_orderline`
--

INSERT INTO `order_has_orderline` (`order_id_order`, `orderline_id_orderline`) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(5, 10),
(6, 11);

-- --------------------------------------------------------

--
-- Structure de la table `pointofsale`
--

DROP TABLE IF EXISTS `pointofsale`;
CREATE TABLE IF NOT EXISTS `pointofsale` (
  `id_pointofsale` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `opening_date` date DEFAULT NULL,
  `closing_date` date DEFAULT NULL,
  `store_manager` varchar(45) DEFAULT NULL,
  `phonenumber` varchar(45) DEFAULT NULL,
  `address_id_address` int(11) NOT NULL,
  PRIMARY KEY (`id_pointofsale`,`address_id_address`),
  KEY `fk_pointofsale_address1` (`address_id_address`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `pointofsale`
--

INSERT INTO `pointofsale` (`id_pointofsale`, `name`, `opening_date`, `closing_date`, `store_manager`, `phonenumber`, `address_id_address`) VALUES
(1, 'Nom du PDV1', '2018-09-24', NULL, 'Manager John Doe du PDV1', '+33 3 00 00 00 01', 1),
(2, 'Nom du PDV2', '2016-09-14', NULL, 'Manager Jane Doe du PDV2', '+33 3 00 00 00 02', 2),
(3, 'Nom du PDV2', '2014-09-01', NULL, 'Manager Justin Doe du PDV3', '+33 3 00 00 00 03', 3);

-- --------------------------------------------------------

--
-- Structure de la table `pointofsale_has_openinghours`
--

DROP TABLE IF EXISTS `pointofsale_has_openinghours`;
CREATE TABLE IF NOT EXISTS `pointofsale_has_openinghours` (
  `openinghours_id_openinghours` int(11) NOT NULL,
  `pointofsale_id_pointofsale` int(11) NOT NULL,
  PRIMARY KEY (`openinghours_id_openinghours`,`pointofsale_id_pointofsale`),
  KEY `fk_openinghours_has_pointofsale_pointofsale1` (`pointofsale_id_pointofsale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `pointofsale_has_openinghours`
--

INSERT INTO `pointofsale_has_openinghours` (`openinghours_id_openinghours`, `pointofsale_id_pointofsale`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(5, 1),
(5, 2),
(6, 1),
(7, 1),
(8, 3),
(9, 3),
(10, 3),
(11, 3),
(12, 3),
(13, 2),
(13, 3),
(14, 2),
(14, 3);

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id_product` int(11) NOT NULL,
  `internal_reference` varchar(45) DEFAULT NULL,
  `sku` varchar(45) DEFAULT NULL,
  `ean13` varchar(45) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pvht` decimal(6,2) NOT NULL,
  `paht` decimal(6,2) NOT NULL,
  `tva100` decimal(6,2) DEFAULT NULL,
  `mesureunit` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_product`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id_product`, `internal_reference`, `sku`, `ean13`, `name`, `pvht`, `paht`, `tva100`, `mesureunit`) VALUES
(1, 'base_tomate', 'TOMAT-6510790', '1234567890123', 'Base pizza tomate concentré', '0.50', '0.12', '5.50', NULL),
(2, 'base_creme', 'CREME-6510790', '1234567890123', 'Base pizza crème', '0.50', '0.12', '5.50', NULL),
(3, 'basilic', 'BASILIC-6510790', '1234567890123', 'Basilic frais', '0.50', '0.12', '5.50', NULL),
(4, 'mozzarella', 'MOZZA-6510790', '1234567890123', 'Mozzarella B.', '0.50', '0.12', '5.50', NULL),
(5, 'oeuf', 'OEUF-6510790', '1234567890123', 'Oeuf Calibre M', '0.50', '0.12', '5.50', NULL),
(6, 'champignon', 'CHAMP-6510790', '1234567890123', 'Champignons de Paris', '0.50', '0.12', '5.50', NULL),
(7, 'olives', 'OLIVE-6510790', '1234567890123', 'Olives noire dénoyautées', '0.50', '0.12', '5.50', NULL),
(8, 'jus_orange', 'JDF_Orange-6510790', '1234567890123', 'Jus orange (briquette de 25cl)', '2.50', '0.80', '5.50', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE IF NOT EXISTS `stock` (
  `id_stock` int(11) NOT NULL,
  `pointofsale_id_pointofsale` int(11) NOT NULL,
  `product_id_product` int(11) NOT NULL,
  `stock` decimal(7,3) DEFAULT NULL,
  `mesureunit` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_stock`),
  KEY `fk_stock_pointofsale1` (`pointofsale_id_pointofsale`),
  KEY `fk_stock_product1` (`product_id_product`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `stock`
--

INSERT INTO `stock` (`id_stock`, `pointofsale_id_pointofsale`, `product_id_product`, `stock`, `mesureunit`) VALUES
(1, 1, 1, '1000.000', 'L'),
(2, 1, 2, '50.500', 'L'),
(3, 1, 3, '100.000', 'g'),
(4, 1, 4, '150.000', 'g'),
(5, 1, 5, '40.000', 'unit'),
(6, 1, 6, '400.000', 'g'),
(7, 1, 7, '100.000', 'g'),
(8, 1, 8, '50.000', 'unit'),
(9, 2, 1, '189.000', 'L'),
(10, 2, 2, '112.000', 'L'),
(11, 2, 3, '50.000', 'g'),
(12, 2, 4, '62.000', 'g'),
(13, 2, 5, '25.000', 'unit'),
(14, 2, 6, '250.000', 'g'),
(15, 2, 7, '300.000', 'g'),
(16, 2, 8, '42.000', 'unit'),
(17, 3, 1, '67.000', 'L'),
(18, 3, 2, '42.000', 'L'),
(19, 3, 3, '250.000', 'g'),
(20, 3, 4, '40.000', 'g'),
(21, 3, 5, '15.000', 'unit'),
(22, 3, 6, '325.000', 'g'),
(23, 3, 7, '150.000', 'g'),
(24, 3, 8, '12.000', 'unit');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL,
  `civility` varchar(5) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `login` varchar(255) NOT NULL,
  `encrypted_password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  `pointofsale_id_pointofsale` int(11) NOT NULL,
  PRIMARY KEY (`id_user`,`pointofsale_id_pointofsale`),
  KEY `fk_user_pointofsale1` (`pointofsale_id_pointofsale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `civility`, `name`, `lastname`, `login`, `encrypted_password`, `email`, `phone_number`, `pointofsale_id_pointofsale`) VALUES
(1, 'Mr', 'NomUser1', 'PrénomUser1', 'LoginUser1', 'P@SsW0rD_3|VcryPT3|)_User1', 'user1@null.fr', '+33 6 00 00 00 01', 1),
(2, 'Mrs', 'NomUser2', 'PrénomUser2', 'LoginUser2', 'P@SsW0rD_3|VcryPT3|)_User2', 'user2@null.fr', '+33 6 00 00 00 02', 2),
(3, 'Mr', 'NomUser3', 'PrénomUser3', 'LoginUser3', 'P@SsW0rD_3|VcryPT3|)_User3', 'user3@null.fr', '+33 6 00 00 00 03', 3),
(4, 'Mr', 'NomUser-Employe4', 'PrénomUser-Employe4', 'LoginUser-Employe4', 'P@SsW0rD_3|VcryPT3|)_User-Employe4', 'user4@null.fr', '+33 6 00 00 00 04', 1),
(5, 'Mrs', 'NomUser-Employe5', 'PrénomUser-Employe5', 'LoginUser-Employe5', 'P@SsW0rD_3|VcryPT3|)_User-Employe5', 'user5@null.fr', '+33 6 00 00 00 05', 2),
(6, 'Mr', 'NomUser-Employe6', 'PrénomUser-Employe6', 'LoginUser-Employe6', 'P@SsW0rD_3|VcryPT3|)_User-Employe6', 'user6@null.fr', '+33 6 00 00 00 06', 3);

-- --------------------------------------------------------

--
-- Structure de la table `userrole`
--

DROP TABLE IF EXISTS `userrole`;
CREATE TABLE IF NOT EXISTS `userrole` (
  `id_userrole` int(11) NOT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_userrole`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `userrole`
--

INSERT INTO `userrole` (`id_userrole`, `role_name`) VALUES
(1, 'Client'),
(2, 'Employé'),
(3, 'Gérant');

-- --------------------------------------------------------

--
-- Structure de la table `user_address`
--

DROP TABLE IF EXISTS `user_address`;
CREATE TABLE IF NOT EXISTS `user_address` (
  `user_id_user` int(11) NOT NULL,
  `address_id_address` int(11) NOT NULL,
  PRIMARY KEY (`user_id_user`,`address_id_address`),
  KEY `fk_user_has_address_address1` (`address_id_address`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user_address`
--

INSERT INTO `user_address` (`user_id_user`, `address_id_address`) VALUES
(1, 4),
(2, 5),
(3, 6),
(4, 7),
(5, 8),
(6, 9);

-- --------------------------------------------------------

--
-- Structure de la table `user_userrole`
--

DROP TABLE IF EXISTS `user_userrole`;
CREATE TABLE IF NOT EXISTS `user_userrole` (
  `user_id_user` int(11) NOT NULL,
  `typedecontrat` varchar(45) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `userrole_id_userrole` int(11) NOT NULL,
  PRIMARY KEY (`user_id_user`,`userrole_id_userrole`),
  KEY `fk_user_has_userrole_userrole1` (`userrole_id_userrole`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user_userrole`
--

INSERT INTO `user_userrole` (`user_id_user`, `typedecontrat`, `start_date`, `end_date`, `userrole_id_userrole`) VALUES
(1, NULL, NULL, NULL, 1),
(2, NULL, NULL, NULL, 1),
(3, NULL, NULL, NULL, 1),
(4, 'CDI', '2016-01-01', NULL, 2),
(5, 'CDI', '2018-03-24', NULL, 2),
(6, 'CDD', '2019-09-30', '2020-09-30', 2);

-- --------------------------------------------------------

--
-- Structure de la vue `list_orders`
--
DROP TABLE IF EXISTS `list_orders`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `list_orders`  AS  select `o`.`id_order` AS `ID Commande`,`invoice`.`id_invoice` AS `ID Facture`,`u`.`name` AS `Nom`,`u`.`lastname` AS `Prénom`,`delivery`.`date` AS `Date de livraison`,`delivery`.`status` AS `Etat Livraison`,count(`orderline`.`id_orderline`) AS `Nb ligne cmd`,`invoice`.`amount` AS `Total facturé` from (((((`order` `o` join `invoice` on((`invoice`.`id_invoice` = `o`.`invoice_id_invoice`))) join `user` `u` on((`u`.`id_user` = `o`.`user_id_user`))) join `delivery` on((`delivery`.`id_delivery` = `o`.`delivery_id_delivery`))) left join `order_has_orderline` `order_orderline` on((`order_orderline`.`order_id_order` = `o`.`id_order`))) left join `orderline` on((`orderline`.`id_orderline` = `order_orderline`.`orderline_id_orderline`))) group by `o`.`id_order` ;

-- --------------------------------------------------------

--
-- Structure de la vue `list_point_of_sales`
--
DROP TABLE IF EXISTS `list_point_of_sales`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `list_point_of_sales`  AS  select `pointofsale`.`name` AS `Nom du PDV`,`pointofsale`.`store_manager` AS `Manager du PDV`,`address`.`street_number` AS `N°`,`address`.`street_name` AS `Rue`,`address`.`postcode` AS `Code Postale`,`address`.`city` AS `Ville` from (`pointofsale` join `address`) where (`pointofsale`.`address_id_address` = `address`.`id_address`) ;

-- --------------------------------------------------------

--
-- Structure de la vue `list_users`
--
DROP TABLE IF EXISTS `list_users`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `list_users`  AS  select `u`.`id_user` AS `ID Client`,`u`.`civility` AS `Civ.`,`u`.`name` AS `Nom`,`u`.`lastname` AS `Prénom`,`u`.`email` AS `e-Mail`,`address`.`type` AS `Type adresse`,`address`.`street_number` AS `N°`,`address`.`street_name` AS `Rue`,`address`.`postcode` AS `Code Postale`,`address`.`city` AS `Ville` from ((`user` `u` left join `user_address` on((`user_address`.`user_id_user` = `u`.`id_user`))) left join `address` on((`user_address`.`address_id_address` = `address`.`id_address`))) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
