-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : mer. 21 déc. 2022 à 22:24
-- Version du serveur :  5.7.34
-- Version de PHP : 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `business`
--

-- --------------------------------------------------------

--
-- Structure de la table `calls`
--

CREATE TABLE `calls` (
  `id` int(11) NOT NULL,
  `call_date` date NOT NULL,
  `customer_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `item_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `item_price` decimal(6,2) NOT NULL,
  `item_quantity` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `customers`
--

INSERT INTO `customers` (`id`, `first_name`, `last_name`, `address`, `phone_number`) VALUES
(1, 'Leopold', 'Bloom', 'Finner Rd Bundoran', 61415146),
(3, 'Stephen', 'Dedalus', 'Clare St. Clinic, 66 Clare St.', 9841986),
(4, 'Molly', 'Bloom', '13 Market St.', 67123099),
(5, 'Buck', 'Mulligan', '13 Patrick St.', 51873742),
(6, 'Mina', 'Purefoy', 'Main st Kinsale', 24774554),
(7, 'Kitty', 'Ricketts', 'Unit 3 Tower Shopping', 67123099),
(8, 'Martin', 'Cunningham', 'Dublin, Dublin 1', 27690342);

-- --------------------------------------------------------

--
-- Structure de la table `items`
--

CREATE TABLE `items` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `unit_price` decimal(6,2) NOT NULL,
  `is_available` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `items`
--

INSERT INTO `items` (`item_id`, `item_name`, `unit_price`, `is_available`) VALUES
(1, 'Nicolas Cage mug', '7.80', 1),
(2, 'Pilules de drama', '15.80', 1),
(3, 'Coussin en forme de avocat', '34.00', 1),
(4, 'Escalier inversée', '170.50', 1),
(5, 'Couteau limace', '25.30', 1),
(6, 'Wesh en vrac', '55.00', 1),
(7, 'Salade Truss', '2.80', 0),
(8, 'Ennio M Bootleg Cds', '2000.00', 0),
(9, 'Best of Madonna', '12.99', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `calls`
--
ALTER TABLE `calls`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `calls`
--
ALTER TABLE `calls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `items`
--
ALTER TABLE `items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
