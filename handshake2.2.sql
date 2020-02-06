-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  jeu. 06 fév. 2020 à 21:01
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP :  5.6.40

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

CREATE TABLE `aide` (
  `aideId` int(11) NOT NULL,
  `descriptionAide` varchar(250) NOT NULL,
  `localisationAide` varchar(250) NOT NULL,
  `categorieAide` varchar(250) NOT NULL,
  `donId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `articleId` int(11) NOT NULL,
  `descriptionArticle` varchar(250) NOT NULL,
  `datePublication` date NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `beneficiaire`
--

CREATE TABLE `beneficiaire` (
  `beneficiaireId` int(11) NOT NULL,
  `nomBeneficiaire` varchar(250) NOT NULL,
  `prenomBeneficiaire` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `dateNaissance` date NOT NULL,
  `nationalite` varchar(250) NOT NULL,
  `ville` varchar(250) NOT NULL,
  `rue` varchar(250) NOT NULL,
  `telephone` int(11) NOT NULL,
  `adresseGPS` varchar(250) NOT NULL,
  `role` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

CREATE TABLE `commentaire` (
  `userId` int(11) NOT NULL,
  `questionId` int(11) NOT NULL,
  `texteCommentaire` varchar(250) NOT NULL,
  `dateCommentaire` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `don`
--

CREATE TABLE `don` (
  `donId` int(11) NOT NULL,
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
  `quantiteDonNature` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `evenement`
--

CREATE TABLE `evenement` (
  `evenementId` int(11) NOT NULL,
  `descriptionEvenement` varchar(250) NOT NULL,
  `lieuEvenement` varchar(250) NOT NULL,
  `dateEvenement` date NOT NULL,
  `heureEvenement` int(11) NOT NULL,
  `porteeEvenement` varchar(250) NOT NULL,
  `prixEvenement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `participation`
--

CREATE TABLE `participation` (
  `userId` int(11) NOT NULL,
  `evenementId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

CREATE TABLE `question` (
  `questionId` int(11) NOT NULL,
  `texteQuestion` varchar(255) NOT NULL,
  `dateQuestion` date NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `userId` int(11) NOT NULL,
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
  `role` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `utilisationrefuge`
--

CREATE TABLE `utilisationrefuge` (
  `beneficiareId` int(11) NOT NULL,
  `donId` int(11) NOT NULL,
  `dateDebut` date NOT NULL,
  `dateFin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `aide`
--
ALTER TABLE `aide`
  ADD PRIMARY KEY (`aideId`),
  ADD KEY `fk_aidedonid` (`donId`);

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`articleId`),
  ADD KEY `fk_useridarticle` (`userId`);

--
-- Index pour la table `beneficiaire`
--
ALTER TABLE `beneficiaire`
  ADD PRIMARY KEY (`beneficiaireId`);

--
-- Index pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`userId`,`questionId`);

--
-- Index pour la table `don`
--
ALTER TABLE `don`
  ADD PRIMARY KEY (`donId`);

--
-- Index pour la table `evenement`
--
ALTER TABLE `evenement`
  ADD PRIMARY KEY (`evenementId`);

--
-- Index pour la table `participation`
--
ALTER TABLE `participation`
  ADD PRIMARY KEY (`userId`,`evenementId`);

--
-- Index pour la table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`questionId`),
  ADD KEY `userId` (`userId`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`);

--
-- Index pour la table `utilisationrefuge`
--
ALTER TABLE `utilisationrefuge`
  ADD PRIMARY KEY (`beneficiareId`,`donId`,`dateDebut`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `aide`
--
ALTER TABLE `aide`
  MODIFY `aideId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `articleId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `beneficiaire`
--
ALTER TABLE `beneficiaire`
  MODIFY `beneficiaireId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `don`
--
ALTER TABLE `don`
  MODIFY `donId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `evenement`
--
ALTER TABLE `evenement`
  MODIFY `evenementId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `question`
--
ALTER TABLE `question`
  MODIFY `questionId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `aide`
--
ALTER TABLE `aide`
  ADD CONSTRAINT `fk_aidedonid` FOREIGN KEY (`donId`) REFERENCES `don` (`donId`);

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `fk_useridarticle` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`);

--
-- Contraintes pour la table `participation`
--
ALTER TABLE `participation`
  ADD CONSTRAINT `fk_participuser` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`);

--
-- Contraintes pour la table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
