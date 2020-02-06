
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
) ;


CREATE TABLE IF NOT EXISTS `aide` (
  `aideId` int(11) NOT NULL AUTO_INCREMENT,
  `descriptionAide` varchar(250) NOT NULL,
  `localisationAide` varchar(250) NOT NULL,
  `categorieAide` varchar(250) NOT NULL,
  `donId` int(11) NOT NULL,
  PRIMARY KEY (`aideId`),
  foreign key (donId) references don(donId)
) ;

CREATE TABLE IF NOT EXISTS  `evenement` (
  `evenementId` int(11) NOT NULL AUTO_INCREMENT,
  `descriptionEvenement` varchar(250) NOT NULL,
  `lieuEvenement` varchar(250) NOT NULL,
  `dateEvenement` date NOT NULL,
  `heureEvenement` int(11) NOT NULL,
  `porteeEvenement` varchar(250) NOT NULL,
  `prixEvenement` int(11) NOT NULL,
  PRIMARY KEY (evenementId)
) ;


CREATE TABLE IF NOT EXISTS `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (userId)
) ;




CREATE TABLE  IF NOT EXISTS `article` (
  `articleId` int(11) NOT NULL AUTO_INCREMENT,
  `descriptionArticle` varchar(250) NOT NULL,
  `datePublication` date NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (articleId),
 constraint fk_useridarticle foreign key(userId) references user(userId)
) ;


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
  PRIMARY KEY (beneficiaireId)
) ;


CREATE TABLE IF NOT EXISTS `question` (
  `questionId` int(11) NOT NULL AUTO_INCREMENT,
  `texteQuestion` varchar(255) NOT NULL,
  `dateQuestion` date NOT NULL,
  `userId` int(11) ,
  constraint foreign key (userId)references user(userId),
  PRIMARY KEY (questionId)
) 

CREATE TABLE IF NOT EXISTS `commentaire` (
  `userId` int(11) references user(userId),
  `questionId` int(11) references question(questionId),
  `texteCommentaire` varchar(250) NOT NULL,
  `dateCommentaire` date NOT NULL,
  PRIMARY KEY (userId,questionId)

);



CREATE TABLE IF NOT EXISTS `participation` (
  `userId` int(11) references user(userId),
  `evenementId` int(11) references evenement(evenementId),
  PRIMARY KEY (userId,evenementId)
) ;


CREATE TABLE IF NOT EXISTS `utilisationrefuge` (
  `beneficiareId` int(11) references beneficiaire(beneficiareId),
  `donId` int(11) references don(donId),
  `dateDebut` date ,
  `dateFin` date NOT NULL,
  PRIMARY key(beneficiareId,donId,dateDebut)
) ;
COMMIT;
