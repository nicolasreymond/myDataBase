-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Mar 07, 2018 at 02:46 PM
-- Server version: 5.6.39
-- PHP Version: 7.0.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Film_Nicolas`
--
DROP Database Film_Nicolas;
-- --------------------------------------------------------
CREATE Database Film_Nicolas;
USE Film_Nicolas;
--
-- Table structure for table `est`
--

CREATE TABLE `T_est` (
  `ID_Video` int(11) NOT NULL,
  `ID_Genre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `est`
--

INSERT INTO `T_est` (`ID_Video`, `ID_Genre`) VALUES
(1, 1),
(1, 3),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Genre`
--

CREATE TABLE `T_Genre` (
  `ID_Genre` int(11) NOT NULL,
  `nom_genre` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Genre`
--

INSERT INTO `T_Genre` (`ID_Genre`, `nom_genre`) VALUES
(1, 'Action'),
(2, 'Aventure'),
(3, ' Science-fiction'),
(4, 'Horreur'),
(5, 'Comédie');

-- --------------------------------------------------------

--
-- Table structure for table `Pays`
--

CREATE TABLE `T_Pays` (
  `ID_Pays` int(11) NOT NULL,
  `nom_pays` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Pays`
--

INSERT INTO `T_Pays` (`ID_Pays`, `nom_pays`) VALUES
(1, 'USA'),
(2, 'Japon');

-- --------------------------------------------------------

--
-- Table structure for table `Produit`
--

CREATE TABLE `T_Produit` (
  `ID_Video` int(11) NOT NULL,
  `ID_Realisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Produit`
--

INSERT INTO `T_Produit` (`ID_Video`, `ID_Realisateur`) VALUES
(1, 1),
(2, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Realisateur`
--

CREATE TABLE `T_Realisateur` (
  `ID_Realisateur` int(11) NOT NULL,
  `nom_realisateur` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Realisateur`
--

INSERT INTO `T_Realisateur` (`ID_Realisateur`, `nom_realisateur`) VALUES
(1, 'Minoru Okazaki'),
(2, 'Robert Zemeckis');

-- --------------------------------------------------------

--
-- Table structure for table `Sous_titre`
--

CREATE TABLE `T_Sous_titre` (
  `ID_Sous_titre` int(11) NOT NULL,
  `Langue` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Sous_titre`
--

INSERT INTO `T_Sous_titre` (`ID_Sous_titre`, `Langue`) VALUES
(1, 'Français'),
(2, 'Anglais');

-- --------------------------------------------------------

--
-- Table structure for table `Type`
--

CREATE TABLE `T_Type` (
  `ID_Type` int(11) NOT NULL,
  `nom_type` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Type`
--

INSERT INTO `T_Type` (`ID_Type`, `nom_type`) VALUES
(1, 'Film'),
(2, 'Série'),
(3, 'Anime');

-- --------------------------------------------------------

--
-- Table structure for table `version`
--

CREATE TABLE `T_version` (
  `ID_Version` int(11) NOT NULL,
  `nom_version` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `version`
--

INSERT INTO `T_version` (`ID_Version`, `nom_version`) VALUES
(1, 'VO'),
(2, 'VF');

-- --------------------------------------------------------

--
-- Table structure for table `Video`
--

CREATE TABLE `T_Video` (
  `ID_Video` int(11) NOT NULL,
  `titre` varchar(25) NOT NULL,
  `duree` time NOT NULL,
  `episode` tinyint(4) NOT NULL,
  `saison` tinyint(4) NOT NULL,
  `date_sortie` year(4) NOT NULL,
  `ID_Type` int(11) DEFAULT NULL,
  `ID_Version` int(11) DEFAULT NULL,
  `ID_Pays` int(11) DEFAULT NULL,
  `ID_Sous_titre` int(11) DEFAULT NULL,
  `ID_Realisateur` int(11) DEFAULT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Video`
--

INSERT INTO `T_Video` (`ID_Video`, `titre`, `duree`, `episode`, `saison`, `date_sortie`, `ID_Type`, `ID_Version`, `ID_Pays`, `ID_Sous_titre`, `url`) VALUES
(1, 'Dragon Ball', '00:21:23', 1, 1, 2004, 3, 1, 2, 1, 'File:///dev/www/dragon_Ball/Dragon_Ball_ep1'),
(2, 'Dragon Ball', '00:22:42', 2, 1, 2004, 3, 1, 2, 1, ''),
(3, 'Retour vers le futur', '02:02:02', 1, 0, 1997, 1, 2, 1, 2, '');

-- --------------------------------------------------------

--
-- Stand-in structure for view `View_video`
-- (See below for the actual view)
--
CREATE TABLE `T_View_video` (
`ID_Video` int(11)
,`titre` varchar(25)
,`duree` time
,`episode` tinyint(4)
,`saison` tinyint(4)
,`date_sortie` year(4)
,`ID_Type` int(11)
,`ID_Version` int(11)
,`ID_Pays` int(11)
,`ID_Sous_titre` int(11)
);

-- --------------------------------------------------------

--
-- Structure for view `View_video`
--
DROP TABLE IF EXISTS `T_View_video`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `T_View_video`  AS  select `T_Video`.`ID_Video` AS `ID_Video`,`T_Video`.`titre` AS `titre`,`T_Video`.`duree` AS `duree`,`T_Video`.`episode` AS `episode`,`T_Video`.`saison` AS `saison`,`T_Video`.`date_sortie` AS `date_sortie`,`T_Video`.`ID_Type` AS `ID_Type`,`T_Video`.`ID_Version` AS `ID_Version`,`T_Video`.`ID_Pays` AS `ID_Pays`,`T_Video`.`ID_Sous_titre` AS `ID_Sous_titre` from `T_Video` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `est`
--
ALTER TABLE `T_est`
  ADD UNIQUE KEY `est_unique` (`ID_Video`,`ID_Genre`),
  ADD KEY `FK_est_ID_Genre` (`ID_Genre`);

--
-- Indexes for table `Genre`
--
ALTER TABLE `T_Genre`
  ADD PRIMARY KEY (`ID_Genre`);

--
-- Indexes for table `Pays`
--
ALTER TABLE `T_Pays`
  ADD PRIMARY KEY (`ID_Pays`);

--
-- Indexes for table `Produit`
--
ALTER TABLE `T_Produit`
  ADD PRIMARY KEY (`ID_Video`,`ID_Realisateur`),
  ADD KEY `FK_Produit_ID_Realisateur` (`ID_Realisateur`);

--
-- Indexes for table `Realisateur`
--
ALTER TABLE `T_Realisateur`
  ADD PRIMARY KEY (`ID_Realisateur`);

--
-- Indexes for table `Sous_titre`
--
ALTER TABLE `T_Sous_titre`
  ADD PRIMARY KEY (`ID_Sous_titre`);

--
-- Indexes for table `Type`
--
ALTER TABLE `T_Type`
  ADD PRIMARY KEY (`ID_Type`);

--
-- Indexes for table `version`
--
ALTER TABLE `T_version`
  ADD PRIMARY KEY (`ID_Version`);

--
-- Indexes for table `Video`
--
ALTER TABLE `T_Video`
  ADD PRIMARY KEY (`ID_Video`),
  ADD KEY `FK_Video_ID_Type` (`ID_Type`),
  ADD KEY `FK_Video_ID_Version` (`ID_Version`),
  ADD KEY `FK_Video_ID_Pays` (`ID_Pays`),
  ADD KEY `FK_Video_ID_Sous_titre` (`ID_Sous_titre`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Genre`
--
ALTER TABLE `T_Genre`
  MODIFY `ID_Genre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Pays`
--
ALTER TABLE `T_Pays`
  MODIFY `ID_Pays` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Realisateur`
--
ALTER TABLE `T_Realisateur`
  MODIFY `ID_Realisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Sous_titre`
--
ALTER TABLE `T_Sous_titre`
  MODIFY `ID_Sous_titre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Type`
--
ALTER TABLE `T_Type`
  MODIFY `ID_Type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `version`
--
ALTER TABLE `T_version`
  MODIFY `ID_Version` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Video`
--
ALTER TABLE `T_Video`
  MODIFY `ID_Video` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `est`
--
ALTER TABLE `T_est`
  ADD CONSTRAINT `FK_est_ID_Genre` FOREIGN KEY (`ID_Genre`) REFERENCES `T_Genre` (`ID_Genre`),
  ADD CONSTRAINT `FK_est_ID_Video` FOREIGN KEY (`ID_Video`) REFERENCES `T_Video` (`ID_Video`);

--
-- Constraints for table `Produit`
--
ALTER TABLE `T_Produit`
  ADD CONSTRAINT `FK_Produit_ID_Realisateur` FOREIGN KEY (`ID_Realisateur`) REFERENCES `T_Realisateur` (`ID_Realisateur`),
  ADD CONSTRAINT `FK_Produit_ID_Video` FOREIGN KEY (`ID_Video`) REFERENCES `T_Video` (`ID_Video`);

--
-- Constraints for table `Video`
--
ALTER TABLE `T_Video`
  ADD CONSTRAINT `FK_Video_ID_Pays` FOREIGN KEY (`ID_Pays`) REFERENCES `T_Pays` (`ID_Pays`),
  ADD CONSTRAINT `FK_Video_ID_Sous_titre` FOREIGN KEY (`ID_Sous_titre`) REFERENCES `T_Sous_titre` (`ID_Sous_titre`),
  ADD CONSTRAINT `FK_Video_ID_Type` FOREIGN KEY (`ID_Type`) REFERENCES `T_Type` (`ID_Type`),
  ADD CONSTRAINT `FK_Video_ID_Version` FOREIGN KEY (`ID_Version`) REFERENCES `T_version` (`ID_Version`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
