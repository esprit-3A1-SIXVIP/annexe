-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 26, 2020 at 04:40 AM
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
CREATE DATABASE IF NOT EXISTS `handshake` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `handshake`;

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
  PRIMARY KEY (`aideId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `aide`
--

INSERT INTO `aide` (`aideId`, `descriptionAide`, `localisationAide`, `categorieAide`) VALUES
(1, 'malek', 'tunis', 'malek'),
(2, 'desc', 'local', 'categ'),
(3, 'DACCORD', 'JE FAIS CA', 'MERCI BERTIN'),
(4, 'OKOKOK', 'OKOKOKOK', 'OKOKOKOK');

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `articleId` int(11) NOT NULL AUTO_INCREMENT,
  `auteur` varchar(250) DEFAULT NULL,
  `titre` varchar(250) DEFAULT NULL,
  `descriptionArticle` varchar(250) NOT NULL,
  `datePublication` date NOT NULL,
  `img` varchar(250) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`articleId`),
  KEY `fk_useridarticle` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`articleId`, `auteur`, `titre`, `descriptionArticle`, `datePublication`, `img`, `userId`) VALUES
(0, 'Malek Taktak', 'L\'intégration', 'C\'est un très grand problème Monsieur le PDG.', '2020-02-12', NULL, 22);

-- --------------------------------------------------------

--
-- Table structure for table `beneficiaire`
--

DROP TABLE IF EXISTS `beneficiaire`;
CREATE TABLE IF NOT EXISTS `beneficiaire` (
  `beneficiaireId` int(11) NOT NULL AUTO_INCREMENT,
  `aideId` int(11) NOT NULL,
  `nomBeneficiaire` varchar(250) NOT NULL,
  `prenomBeneficiaire` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `dateNaissance` date NOT NULL,
  `ville` varchar(250) NOT NULL,
  `telephone` int(11) NOT NULL,
  `adresseGPS` varchar(250) NOT NULL,
  `role` varchar(250) DEFAULT NULL,
  `besoin` varchar(250) DEFAULT NULL,
  `nationalite` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`beneficiaireId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `beneficiaire`
--

INSERT INTO `beneficiaire` (`beneficiaireId`, `aideId`, `nomBeneficiaire`, `prenomBeneficiaire`, `email`, `dateNaissance`, `ville`, `telephone`, `adresseGPS`, `role`, `besoin`, `nationalite`) VALUES
(1, 1, 'xdfdfg', 'fgfghgf', 'malek.taktak@esprit.tn', '2020-02-18', 'Tunis', 28328382, 'tunis', 'Refugie', NULL, 'tunisien'),
(2, 2, 'Taktak', 'Malek', 'malek.taktak@esprit.tn', '2020-02-05', 'TUNIS', 984912492, 'STRING', 'Necessiteux', 'ARGENT', NULL),
(3, 3, 'JUNIOR', 'BERTIN', 'malek.taktak@esprit.tn', '2020-02-05', 'TUNIS', 12321312, 'STRING', 'Necessiteux', 'SOMMEIL', NULL),
(4, 4, 'STEPHANE', 'JORDY', 'malek.taktak@esprit.tn', '2020-02-08', 'TUNIS', 12345678, 'VFGHJ', 'Necessiteux', 'MANGER', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `commentaire`
--

DROP TABLE IF EXISTS `commentaire`;
CREATE TABLE IF NOT EXISTS `commentaire` (
  `userId` int(11) NOT NULL,
  `questionId` int(11) NOT NULL,
  `texteCommentaire` varchar(250) NOT NULL,
  `score` int(11) NOT NULL DEFAULT '0',
  `dateCommentaire` date NOT NULL,
  PRIMARY KEY (`userId`,`questionId`,`dateCommentaire`),
  KEY `fk_commentairequestionId` (`questionId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `commentaire`
--

INSERT INTO `commentaire` (`userId`, `questionId`, `texteCommentaire`, `score`, `dateCommentaire`) VALUES
(22, 5, 'Merci Mohamed, est ce que je peux le récupèrer demain à 10H du matin dans la buvette?', 1, '2020-02-23'),
(23, 5, 'Salut Malek, j`ai trouvé ton portefeuille, tu peux me contacter je te le rends.', 1, '2020-02-11');

-- --------------------------------------------------------

--
-- Table structure for table `don`
--

DROP TABLE IF EXISTS `don`;
CREATE TABLE IF NOT EXISTS `don` (
  `donId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `typeDon` varchar(250) NOT NULL,
  `montantDon` int(11) DEFAULT NULL,
  `cibleDon` varchar(250) DEFAULT NULL,
  `libelleDonNature` varchar(250) DEFAULT NULL,
  `categorieDonNature` varchar(250) DEFAULT NULL,
  `rueRefuge` varchar(250) DEFAULT NULL,
  `villeRefuge` varchar(250) DEFAULT NULL,
  `paysRefuge` varchar(250) DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `disponibiliteRefuge` varchar(250) DEFAULT NULL,
  `capaciteRefuge` int(11) DEFAULT NULL,
  `quantiteDonNature` int(11) DEFAULT NULL,
  `dateDon` date DEFAULT NULL,
  `dateDebutRefuge` date DEFAULT NULL,
  `dateFinRefuge` date DEFAULT NULL,
  PRIMARY KEY (`donId`),
  KEY `fk_donUser` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `don`
--

INSERT INTO `don` (`donId`, `userId`, `typeDon`, `montantDon`, `cibleDon`, `libelleDonNature`, `categorieDonNature`, `rueRefuge`, `villeRefuge`, `paysRefuge`, `longitude`, `latitude`, `disponibiliteRefuge`, `capaciteRefuge`, `quantiteDonNature`, `dateDon`, `dateDebutRefuge`, `dateFinRefuge`) VALUES
(23, 23, 'Refuge', NULL, NULL, NULL, NULL, 'GGG', 'GG', 'GG', 23.7654, 77.009, '0', 12, NULL, NULL, '2020-02-28', '2020-02-29');

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
  `heureEvenement` time NOT NULL,
  `porteeEvenement` varchar(250) NOT NULL,
  `prixEvenement` int(11) NOT NULL,
  `image` varchar(250) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`evenementId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `evenement`
--

INSERT INTO `evenement` (`evenementId`, `descriptionEvenement`, `lieuEvenement`, `dateEvenement`, `heureEvenement`, `porteeEvenement`, `prixEvenement`, `image`, `userId`) VALUES
(5, 'Nouvel event', 'Ghazela', '2020-02-14', '01:58:00', 'Les jeunes de 18 ans', 0, 'C:UsersghostPictureshandshakegray.png', 23);

-- --------------------------------------------------------

--
-- Table structure for table `participation`
--

DROP TABLE IF EXISTS `participation`;
CREATE TABLE IF NOT EXISTS `participation` (
  `userId` int(11) NOT NULL,
  `evenementId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`evenementId`),
  KEY `fk_paticipevent` (`evenementId`),
  KEY `userId` (`userId`)
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
  `score` int(11) NOT NULL DEFAULT '0',
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`questionId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`questionId`, `texteQuestion`, `dateQuestion`, `score`, `userId`) VALUES
(5, 'Bonsoir tout le monde, auriez vous vu un portefeuille marron à ESPRIT Ghazela? Je l`ai perdu aujourd`hui dans la buvette.', '2020-02-11', 3, 22),
(15, 'Bonsoir, est ce quelqu\'un a perdu un portefeuille marron à ESPRIT? Je l\'a trouvé aujourd\'hui à la buvette.', '2020-02-17', 0, 23);

-- --------------------------------------------------------

--
-- Table structure for table `reponse`
--

DROP TABLE IF EXISTS `reponse`;
CREATE TABLE IF NOT EXISTS `reponse` (
  `donId` int(11) NOT NULL,
  `aideId` int(11) NOT NULL,
  `dateReponse` date NOT NULL,
  PRIMARY KEY (`donId`,`aideId`,`dateReponse`),
  KEY `donId` (`donId`),
  KEY `aideId` (`aideId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `profil` varchar(250) DEFAULT NULL,
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
  `accesShakeHub` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userId` (`userId`),
  UNIQUE KEY `login` (`login`,`email`),
  UNIQUE KEY `telephone` (`telephone`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `login`, `password`, `profil`, `nomUser`, `prenomUser`, `email`, `telephone`, `nomOrganisation`, `ville`, `rue`, `pays`, `domaine`, `role`, `accesShakeHub`) VALUES
(22, 'Malek', '1234', 'file:///C:/Users/ghost/Pictures/malek.jpg', 'Taktak', 'Malek', 'malek.taktak@esprit.tn', NULL, NULL, NULL, NULL, NULL, NULL, 'admin', 1),
(23, 'Mohamed', '1212', 'file:///C:/Users/ghost/Pictures/Woah.png', 'Daghbari', 'Mohamed Ali', 'mohamed@esprit.tn', NULL, NULL, NULL, NULL, NULL, NULL, 'User Simple', 1);

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
  KEY `fk_utilisadonId` (`donId`),
  KEY `beneficiaireId` (`beneficiaireId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Constraints for dumped tables
--

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
-- Constraints for table `don`
--
ALTER TABLE `don`
  ADD CONSTRAINT `fk_donUser` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `evenement`
--
ALTER TABLE `evenement`
  ADD CONSTRAINT `fk_evenementuserId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Constraints for table `reponse`
--
ALTER TABLE `reponse`
  ADD CONSTRAINT `fk_aide` FOREIGN KEY (`aideId`) REFERENCES `aide` (`aideId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_don` FOREIGN KEY (`donId`) REFERENCES `don` (`donId`) ON DELETE CASCADE ON UPDATE CASCADE;

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
