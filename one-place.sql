-- phpMyAdmin SQL Dump
-- version 5.0.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- Creación de la base de datos
CREATE DATABASE IF NOT EXISTS `one-place` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `one-place`;

-- Tabla `accounts`
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` text DEFAULT NULL,
  `password` text DEFAULT NULL,
  `role` text DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `accounts` (`id`, `username`, `password`, `role`, `dateCreated`) VALUES
(1, 'admin', '$2b$10$J1JTnk4KtLylMznNjWlRsOKPvsDEYDX.xyP77EY/Gq1JpccSnr3qa', 'admin', '2022-10-25');

-- Tabla `calendar`
CREATE TABLE `calendar` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` text DEFAULT NULL,
  `details` text DEFAULT NULL,
  `deadlineDate` date DEFAULT NULL,
  `hours` text DEFAULT NULL,
  `addDate` date DEFAULT NULL,
  `worker` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla `clients`
CREATE TABLE `clients` (
  `client_id` int(15) NOT NULL AUTO_INCREMENT,
  `client` text DEFAULT NULL,
  `clientDetails` text DEFAULT NULL,
  `phone` text DEFAULT NULL,
  `country` text DEFAULT NULL,
  `street` text DEFAULT NULL,
  `city` text DEFAULT NULL,
  `postalCode` text DEFAULT NULL,
  `clientDateCreated` date DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla `orders`
CREATE TABLE `orders` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `client_id` int(15) NOT NULL,
  `date` date DEFAULT NULL,
  `price` float DEFAULT NULL,
  `status` text DEFAULT NULL,
  `workerName` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla `products`
CREATE TABLE `products` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `order_id` int(15) DEFAULT NULL,
  `productName` text DEFAULT NULL,
  `amount` int(5) DEFAULT NULL,
  `itemPrice` float DEFAULT NULL,
  `totalPrice` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

COMMIT;
