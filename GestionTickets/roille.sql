-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 08 mai 2022 à 21:33
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `roille`
--

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `codeCl` int(11) NOT NULL AUTO_INCREMENT,
  `nomC` varchar(30) NOT NULL,
  `prenomC` varchar(30) NOT NULL,
  `loginC` varchar(30) NOT NULL,
  `mdpC` varchar(30) NOT NULL,
  UNIQUE KEY `codeCl` (`codeCl`),
  UNIQUE KEY `loginC` (`loginC`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`codeCl`, `nomC`, `prenomC`, `loginC`, `mdpC`) VALUES
(1, 'dxd', 'sq', 'z', 'ad');

-- --------------------------------------------------------

--
-- Structure de la table `commerciaux`
--

DROP TABLE IF EXISTS `commerciaux`;
CREATE TABLE IF NOT EXISTS `commerciaux` (
  `idC` int(11) NOT NULL AUTO_INCREMENT,
  `nomC` varchar(30) NOT NULL,
  `prenomC` varchar(30) NOT NULL,
  `loginC` varchar(30) NOT NULL,
  `mdpC` varchar(30) NOT NULL,
  UNIQUE KEY `idC` (`idC`),
  UNIQUE KEY `loginC` (`loginC`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commerciaux`
--

INSERT INTO `commerciaux` (`idC`, `nomC`, `prenomC`, `loginC`, `mdpC`) VALUES
(1, 'toto', 'toto', 'toto', 'toto'),
(2, 'egzyfdsiu', 'feyuzi', 'fedsbuxiwolmn', 'gbrydsiuoi'),
(3, 'nji', 'jno', 'gjesdfo', 'jk'),
(4, 'prof', 'prof', 'prof', 'prof'),
(5, 'ayme', 'a', 'aym', '123'),
(6, 'rob', 'Damien', 'ROBEN', 'ROBEN');

-- --------------------------------------------------------

--
-- Structure de la table `contrats`
--

DROP TABLE IF EXISTS `contrats`;
CREATE TABLE IF NOT EXISTS `contrats` (
  `idContrat` int(11) NOT NULL AUTO_INCREMENT,
  `codeCl` int(11) NOT NULL,
  `idRoille` int(11) NOT NULL,
  UNIQUE KEY `idContrat` (`idContrat`),
  KEY `idRoille` (`idRoille`),
  KEY `codeCl` (`codeCl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

DROP TABLE IF EXISTS `facture`;
CREATE TABLE IF NOT EXISTS `facture` (
  `idFacture` int(11) NOT NULL AUTO_INCREMENT,
  `codeCl` int(11) NOT NULL,
  `codeM` int(11) NOT NULL,
  `codeF` int(11) NOT NULL,
  `quant_Emp` int(11) NOT NULL,
  `quant_Ret` int(11) NOT NULL,
  `prix` int(11) NOT NULL,
  UNIQUE KEY `idFacture` (`idFacture`),
  KEY `codeCl` (`codeCl`),
  KEY `codeM` (`codeM`),
  KEY `codeF` (`codeF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `fournitures`
--

DROP TABLE IF EXISTS `fournitures`;
CREATE TABLE IF NOT EXISTS `fournitures` (
  `codeF` int(11) NOT NULL,
  `designationF` varchar(40) NOT NULL,
  UNIQUE KEY `codeF` (`codeF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `intervention`
--

DROP TABLE IF EXISTS `intervention`;
CREATE TABLE IF NOT EXISTS `intervention` (
  `codeI` int(11) NOT NULL AUTO_INCREMENT,
  `idT` int(11) NOT NULL,
  `codeCl` int(11) NOT NULL,
  `intervention` enum('Installer','Entretenir','Reparer') NOT NULL,
  `motif` varchar(150) NOT NULL,
  PRIMARY KEY (`codeI`),
  KEY `idT` (`idT`),
  KEY `codeCl` (`codeCl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `materiels`
--

DROP TABLE IF EXISTS `materiels`;
CREATE TABLE IF NOT EXISTS `materiels` (
  `codeM` int(11) NOT NULL,
  `designationM` varchar(40) NOT NULL,
  UNIQUE KEY `codeM` (`codeM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `roille`
--

DROP TABLE IF EXISTS `roille`;
CREATE TABLE IF NOT EXISTS `roille` (
  `idRoille` int(11) NOT NULL,
  `adresse` varchar(60) DEFAULT NULL,
  `ville` varchar(25) DEFAULT NULL,
  `CodePostal` varchar(10) DEFAULT NULL,
  UNIQUE KEY `idRoille` (`idRoille`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `taches`
--

DROP TABLE IF EXISTS `taches`;
CREATE TABLE IF NOT EXISTS `taches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(200) NOT NULL,
  `etat` varchar(20) NOT NULL,
  `action` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `taches`
--

INSERT INTO `taches` (`id`, `nom`, `etat`, `action`) VALUES
(1, 'Contrat Client Société toto', 'EA', 'A refaire'),
(2, 'Contrat Client Société xxx', 'EC', 'Ajouter bornes wifi'),
(3, 'Intervention Société Dupont', 'EC', 'Contenu + CSS'),
(4, 'Visite Client Annuelle Société BBA', 'EA', 'A finir avant le 25 Février');

-- --------------------------------------------------------

--
-- Structure de la table `techniciens`
--

DROP TABLE IF EXISTS `techniciens`;
CREATE TABLE IF NOT EXISTS `techniciens` (
  `idT` int(11) NOT NULL AUTO_INCREMENT,
  `nomT` varchar(30) NOT NULL,
  `prenomT` varchar(30) NOT NULL,
  `loginT` varchar(50) NOT NULL,
  `mdpT` varchar(30) NOT NULL,
  UNIQUE KEY `idT` (`idT`),
  UNIQUE KEY `loginT` (`loginT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `contrats`
--
ALTER TABLE `contrats`
  ADD CONSTRAINT `contrats_ibfk_1` FOREIGN KEY (`idRoille`) REFERENCES `roille` (`idRoille`),
  ADD CONSTRAINT `contrats_ibfk_2` FOREIGN KEY (`codeCl`) REFERENCES `clients` (`codeCl`);

--
-- Contraintes pour la table `facture`
--
ALTER TABLE `facture`
  ADD CONSTRAINT `facture_ibfk_1` FOREIGN KEY (`codeCl`) REFERENCES `clients` (`codeCl`),
  ADD CONSTRAINT `facture_ibfk_2` FOREIGN KEY (`codeM`) REFERENCES `materiels` (`codeM`),
  ADD CONSTRAINT `facture_ibfk_3` FOREIGN KEY (`codeF`) REFERENCES `fournitures` (`codeF`);

--
-- Contraintes pour la table `intervention`
--
ALTER TABLE `intervention`
  ADD CONSTRAINT `intervention_ibfk_1` FOREIGN KEY (`idT`) REFERENCES `techniciens` (`idT`),
  ADD CONSTRAINT `intervention_ibfk_2` FOREIGN KEY (`codeCl`) REFERENCES `clients` (`codeCl`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
