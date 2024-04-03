-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Mar 20, 2024 at 03:48 PM
-- Server version: 11.2.2-MariaDB
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `belle_presserie`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_service` smallint(6) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `id_user_employee` varchar(50) DEFAULT NULL,
  `id_status` tinyint(4) NOT NULL,
  `id_material` smallint(6) NOT NULL,
  `id_condition` tinyint(4) NOT NULL,
  PRIMARY KEY (`article_id`),
  KEY `id_condition` (`id_condition`),
  KEY `id_item` (`id_item`),
  KEY `id_material` (`id_material`),
  KEY `id_order` (`id_order`),
  KEY `id_service` (`id_service`),
  KEY `id_status` (`id_status`),
  KEY `id_user_employee` (`id_user_employee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `article_status`
--

DROP TABLE IF EXISTS `article_status`;
CREATE TABLE IF NOT EXISTS `article_status` (
  `status_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(30) NOT NULL,
  PRIMARY KEY (`status_id`),
  UNIQUE KEY `status_name` (`status_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `category_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(30) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
CREATE TABLE IF NOT EXISTS `cities` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(80) NOT NULL,
  `id_country` int(11) NOT NULL,
  PRIMARY KEY (`city_id`),
  KEY `id_country` (`id_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(80) NOT NULL,
  PRIMARY KEY (`country_id`),
  UNIQUE KEY `country_name` (`country_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
CREATE TABLE IF NOT EXISTS `gender` (
  `gender_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `gender_name` varchar(30) NOT NULL,
  PRIMARY KEY (`gender_id`),
  UNIQUE KEY `gender_name` (`gender_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `item_description` text DEFAULT NULL,
  `id_subcategory` smallint(6) NOT NULL,
  `item_coefficient` float NOT NULL DEFAULT 1,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `item_name` (`item_name`),
  KEY `id_subcategory` (`id_subcategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_conditions`
--

DROP TABLE IF EXISTS `item_conditions`;
CREATE TABLE IF NOT EXISTS `item_conditions` (
  `condition_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `condition_name` varchar(30) NOT NULL,
  PRIMARY KEY (`condition_id`),
  UNIQUE KEY `condition_name` (`condition_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `limitations`
--

DROP TABLE IF EXISTS `limitations`;
CREATE TABLE IF NOT EXISTS `limitations` (
  `limitation_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_material` smallint(6) NOT NULL,
  `id_service` smallint(6) NOT NULL,
  PRIMARY KEY (`limitation_id`),
  KEY `id_material` (`id_material`),
  KEY `id_service` (`id_service`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `materials`
--

DROP TABLE IF EXISTS `materials`;
CREATE TABLE IF NOT EXISTS `materials` (
  `material_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `material_name` varchar(30) NOT NULL,
  `material_coefficient` float NOT NULL DEFAULT 1,
  PRIMARY KEY (`material_id`),
  UNIQUE KEY `material_name` (`material_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user_customer` varchar(50) NOT NULL,
  `order_create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `order_deposit_date` date NOT NULL,
  `id_payment` tinyint(4) NOT NULL,
  `order_to_deliver` tinyint(1) NOT NULL,
  `order_delivery_address` varchar(80) DEFAULT NULL,
  `order_delivery_date` date DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `id_payment` (`id_payment`),
  KEY `id_user_customer` (`id_user_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
CREATE TABLE IF NOT EXISTS `payment_methods` (
  `payment_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `payment_name` varchar(30) NOT NULL,
  PRIMARY KEY (`payment_id`),
  UNIQUE KEY `payment_name` (`payment_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
  `service_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(30) NOT NULL,
  `service_price` float NOT NULL,
  `service_description` text DEFAULT NULL,
  PRIMARY KEY (`service_id`),
  UNIQUE KEY `service_name` (`service_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

DROP TABLE IF EXISTS `subcategories`;
CREATE TABLE IF NOT EXISTS `subcategories` (
  `subcategory_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `subcategory_name` varchar(30) NOT NULL,
  `id_category` smallint(6) NOT NULL,
  PRIMARY KEY (`subcategory_id`),
  UNIQUE KEY `subcategory_name` (`subcategory_name`),
  KEY `id_category` (`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` varchar(50) NOT NULL,
  `user_create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `user_firstname` varchar(50) NOT NULL,
  `user_lastname` varchar(50) NOT NULL,
  `id_gender` tinyint(4) NOT NULL,
  `user_email` varchar(150) NOT NULL,
  `user_password` varchar(30) NOT NULL,
  `user_bday` date NOT NULL,
  `user_address` varchar(80) NOT NULL,
  `id_role` tinyint(4) NOT NULL,
  `id_city` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_email` (`user_email`),
  KEY `id_city` (`id_city`),
  KEY `id_gender` (`id_gender`),
  KEY `id_role` (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE IF NOT EXISTS `user_roles` (
  `role_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(30) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_id` (`role_id`,`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`id_condition`) REFERENCES `item_conditions` (`condition_id`),
  ADD CONSTRAINT `articles_ibfk_2` FOREIGN KEY (`id_item`) REFERENCES `items` (`item_id`),
  ADD CONSTRAINT `articles_ibfk_3` FOREIGN KEY (`id_material`) REFERENCES `materials` (`material_id`),
  ADD CONSTRAINT `articles_ibfk_4` FOREIGN KEY (`id_order`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `articles_ibfk_5` FOREIGN KEY (`id_service`) REFERENCES `services` (`service_id`),
  ADD CONSTRAINT `articles_ibfk_6` FOREIGN KEY (`id_status`) REFERENCES `article_status` (`status_id`),
  ADD CONSTRAINT `articles_ibfk_7` FOREIGN KEY (`id_user_employee`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`id_country`) REFERENCES `country` (`country_id`);

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`id_subcategory`) REFERENCES `subcategories` (`subcategory_id`);

--
-- Constraints for table `limitations`
--
ALTER TABLE `limitations`
  ADD CONSTRAINT `limitations_ibfk_1` FOREIGN KEY (`id_material`) REFERENCES `materials` (`material_id`),
  ADD CONSTRAINT `limitations_ibfk_2` FOREIGN KEY (`id_service`) REFERENCES `services` (`service_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_payment`) REFERENCES `payment_methods` (`payment_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`id_user_customer`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `categories` (`category_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_city`) REFERENCES `cities` (`city_id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`id_gender`) REFERENCES `gender` (`gender_id`),
  ADD CONSTRAINT `users_ibfk_3` FOREIGN KEY (`id_role`) REFERENCES `user_roles` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
