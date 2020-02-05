-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 05 fév. 2020 à 12:51
-- Version du serveur :  5.7.26
-- Version de PHP :  7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `handshake`
--

-- --------------------------------------------------------

--
-- Structure de la table `aide`
--

DROP TABLE IF EXISTS `aide`;
CREATE TABLE IF NOT EXISTS `aide` (
  `aideID` int(11) NOT NULL AUTO_INCREMENT,
  `descriptionAide` varchar(250) DEFAULT NULL,
  `localisationAide` varchar(250) NOT NULL,
  `categorieAide` varchar(250) NOT NULL,
  `donId` int(11) NOT NULL,
  PRIMARY KEY (`aideID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `articleId` int(11) NOT NULL AUTO_INCREMENT,
  `descriptionArticle` varchar(250) NOT NULL,
  `datePublication` date NOT NULL,
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`articleId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `beneficiaire`
--

DROP TABLE IF EXISTS `beneficiaire`;
CREATE TABLE IF NOT EXISTS `beneficiaire` (
  `beneficiaireID` int(11) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`beneficiaireID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

DROP TABLE IF EXISTS `commentaire`;
CREATE TABLE IF NOT EXISTS `commentaire` (
  `userID` int(11) NOT NULL,
  `questionID` int(11) NOT NULL,
  `texteCommentaire` varchar(250) NOT NULL,
  `dateCommentaire` date NOT NULL,
  PRIMARY KEY (`userID`,`questionID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `don`
--

DROP TABLE IF EXISTS `don`;
CREATE TABLE IF NOT EXISTS `don` (
  `donId` int(11) NOT NULL AUTO_INCREMENT,
  `aideId` int(11) NOT NULL,
  `typeDon` varchar(250) NOT NULL,
  `montantDon` int(11) NOT NULL,
  `cibleDon` varchar(250) NOT NULL,
  `libelleDonNature` varchar(250) NOT NULL,
  `categorieDonNature` varchar(250) NOT NULL,
  `rueRefuge` varchar(250) NOT NULL,
  `villeRefuge` varchar(250) NOT NULL,
  `paysRefuge` varchar(250) NOT NULL,
  `disponibiliteRefuge` varchar(250) NOT NULL,
  `capaciteRefuge` int(11) NOT NULL,
  `quantiteDonNature` int(11) NOT NULL,
  PRIMARY KEY (`donId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `evenement`
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `participation`
--

DROP TABLE IF EXISTS `participation`;
CREATE TABLE IF NOT EXISTS `participation` (
  `idUser` int(11) NOT NULL,
  `idEvenement` int(11) NOT NULL,
  PRIMARY KEY (`idUser`,`idEvenement`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `questionID` int(11) NOT NULL AUTO_INCREMENT,
  `texteQuestion` varchar(255) NOT NULL,
  `dateQuestion` date NOT NULL,
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`questionID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `nomUser` varchar(250) DEFAULT NULL,
  `prenomUser` varchar(250) DEFAULT NULL,
  `email` varchar(250) NOT NULL,
  `telephone` int(11) NOT NULL,
  `nomOrganisation` varchar(250) DEFAULT NULL,
  `ville` varchar(250) NOT NULL,
  `rue` varchar(250) NOT NULL,
  `pays` varchar(250) NOT NULL,
  `domaine` varchar(250) DEFAULT NULL,
  `role` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`userID`, `login`, `password`, `nomUser`, `prenomUser`, `email`, `telephone`, `nomOrganisation`, `ville`, `rue`, `pays`, `domaine`, `role`) VALUES
(1, 'seqesrdtfh', 'serdtfyuh', 'dxcfvhbj', 'dxcftvy', 'wsdxcfv', 59555454, 'xdfcv', 'xdcfvy', 'acfvbhnj', 'hhjh', 'ioioo', ''),
(2, 'a', 'b', 'c', 'd', 'e', 1235, 'h', 'p', 'h', 'juh', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `utilisationrefuge`
--

DROP TABLE IF EXISTS `utilisationrefuge`;
CREATE TABLE IF NOT EXISTS `utilisationrefuge` (
  `beneficiareId` int(11) NOT NULL,
  `donId` int(11) NOT NULL,
  `dateDebut` date NOT NULL,
  `dateFin` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
