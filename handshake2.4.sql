-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 11, 2020 at 06:10 PM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `handshake`
--

-- --------------------------------------------------------

--
-- Table structure for table `aide`
--

DROP TABLE IF EXISTS `aide`;
CREATE TABLE IF NOT EXISTS `aide` (
  `aideId` int(11) NOT NULL AUTO_INCREMENT,
  `descriptionAide` varchar(250) NOT NULL,
  `localisationAide` varchar(250) NOT NULL,
  `categorieAide` varchar(250) NOT NULL,
  `donId` int(11) NOT NULL,
  PRIMARY KEY (`aideId`),
  KEY `fk_aidedonid` (`donId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `articleId` int(11) NOT NULL AUTO_INCREMENT,
  `descriptionArticle` varchar(250) NOT NULL,
  `datePublication` date NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`articleId`),
  KEY `fk_useridarticle` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `beneficiaire`
--

DROP TABLE IF EXISTS `beneficiaire`;
CREATE TABLE IF NOT EXISTS `beneficiaire` (
  `beneficiaireId` int(11) NOT NULL AUTO_INCREMENT,
  `nomBeneficiaire` varchar(250) NOT NULL,
  `prenomBeneficiaire` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `dateNaissance` date NOT NULL,
  `nationalite` varchar(250) NOT NULL,
  `ville` varchar(250) NOT NULL,
  `rue` varchar(250) NOT NULL,
  `telephone` int(11) NOT NULL,
  `adresseGPS` varchar(250) NOT NULL,
  `role` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`beneficiaireId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `commentaire`
--

DROP TABLE IF EXISTS `commentaire`;
CREATE TABLE IF NOT EXISTS `commentaire` (
  `userId` int(11) NOT NULL,
  `questionId` int(11) NOT NULL,
  `texteCommentaire` varchar(250) NOT NULL,
  `dateCommentaire` date NOT NULL,
  PRIMARY KEY (`userId`,`questionId`),
  KEY `fk_commentairequestionId` (`questionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `commentaire`
--

INSERT INTO `commentaire` (`userId`, `questionId`, `texteCommentaire`, `dateCommentaire`) VALUES
(23, 5, 'Salut Malek, j\'ai trouvé ton portefeuille, tu peux me contacter je te le rends.', '2020-02-11'),
(23, 6, 'Salut Mohamed, tu as trouvé mon portefeuille, peux tu me le rendre s\'\'il te plait?', '2020-02-11');

-- --------------------------------------------------------

--
-- Table structure for table `don`
--

DROP TABLE IF EXISTS `don`;
CREATE TABLE IF NOT EXISTS `don` (
  `donId` int(11) NOT NULL AUTO_INCREMENT,
  `typeDon` varchar(250) NOT NULL,
  `montantDon` int(11) DEFAULT NULL,
  `cibleDon` varchar(250) DEFAULT NULL,
  `libelleDonNature` varchar(250) DEFAULT NULL,
  `categorieDonNature` varchar(250) DEFAULT NULL,
  `rueRefuge` varchar(250) DEFAULT NULL,
  `villeRefuge` varchar(250) DEFAULT NULL,
  `paysRefuge` varchar(250) DEFAULT NULL,
  `disponibiliteRefuge` varchar(250) DEFAULT NULL,
  `capaciteRefuge` int(11) DEFAULT NULL,
  `quantiteDonNature` int(11) DEFAULT NULL,
  PRIMARY KEY (`donId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `evenement`
--

DROP TABLE IF EXISTS `evenement`;
CREATE TABLE IF NOT EXISTS `evenement` (
  `evenementId` int(11) NOT NULL AUTO_INCREMENT,
  `descriptionEvenement` varchar(250) NOT NULL,
  `lieuEvenement` varchar(250) NOT NULL,
  `dateEvenement` date NOT NULL,
  `heureEvenement` int(11) NOT NULL,
  `porteeEvenement` varchar(250) NOT NULL,
  `prixEvenement` int(11) NOT NULL,
  PRIMARY KEY (`evenementId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `participation`
--

DROP TABLE IF EXISTS `participation`;
CREATE TABLE IF NOT EXISTS `participation` (
  `userId` int(11) NOT NULL,
  `evenementId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`evenementId`),
  KEY `fk_paticipevent` (`evenementId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `questionId` int(11) NOT NULL AUTO_INCREMENT,
  `texteQuestion` varchar(255) NOT NULL,
  `dateQuestion` date NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`questionId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`questionId`, `texteQuestion`, `dateQuestion`, `userId`) VALUES
(5, 'Bonsoir tout le monde, auriez vous vu un portefeuille marron à ESPRIT Ghazela? Je l\'ai perdu aujourd\'hui dans la buvette.', '2020-02-11', 22),
(6, 'Bonsoir tout le monde, auriez vous vu un portefeuille marron à ESPRIT Ghazela? Je l\'ai perdu aujourd\'hui dans la buvette.', '2020-02-11', 22);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `nomUser` varchar(250) DEFAULT NULL,
  `prenomUser` varchar(250) DEFAULT NULL,
  `email` varchar(250) NOT NULL,
  `telephone` int(11) DEFAULT NULL,
  `nomOrganisation` varchar(250) DEFAULT NULL,
  `ville` varchar(250) DEFAULT NULL,
  `rue` varchar(250) DEFAULT NULL,
  `pays` varchar(250) DEFAULT NULL,
  `domaine` varchar(250) DEFAULT NULL,
  `role` varchar(250) NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userId` (`userId`),
  UNIQUE KEY `login` (`login`,`email`),
  UNIQUE KEY `telephone` (`telephone`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `login`, `password`, `nomUser`, `prenomUser`, `email`, `telephone`, `nomOrganisation`, `ville`, `rue`, `pays`, `domaine`, `role`) VALUES
(22, 'Malek', '1234', NULL, NULL, 'malek.takta2k@esprit.tn', NULL, NULL, NULL, NULL, NULL, NULL, 'admin'),
(23, 'Mohamed', '1212', NULL, NULL, 'mohamed2@esprit.tn', NULL, NULL, NULL, NULL, NULL, NULL, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `utilisationrefuge`
--

DROP TABLE IF EXISTS `utilisationrefuge`;
CREATE TABLE IF NOT EXISTS `utilisationrefuge` (
  `beneficiaireId` int(11) NOT NULL,
  `donId` int(11) NOT NULL,
  `dateDebut` date NOT NULL,
  `dateFin` date NOT NULL,
  PRIMARY KEY (`beneficiaireId`,`donId`,`dateDebut`),
  KEY `fk_utilisadonId` (`donId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aide`
--
ALTER TABLE `aide`
  ADD CONSTRAINT `fk_aidedonid` FOREIGN KEY (`donId`) REFERENCES `don` (`donId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `fk_useridarticle` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `fk_commentairequestionId` FOREIGN KEY (`questionId`) REFERENCES `question` (`questionId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_commentaireuserId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `participation`
--
ALTER TABLE `participation`
  ADD CONSTRAINT `fk_participuser` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_paticipevent` FOREIGN KEY (`evenementId`) REFERENCES `evenement` (`evenementId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `utilisationrefuge`
--
ALTER TABLE `utilisationrefuge`
  ADD CONSTRAINT `fk_utilisabId` FOREIGN KEY (`beneficiaireId`) REFERENCES `beneficiaire` (`beneficiaireId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_utilisadonId` FOREIGN KEY (`donId`) REFERENCES `don` (`donId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
