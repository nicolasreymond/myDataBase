DROP Database IF EXISTS `Film_Nicolas`;
CREATE Database IF NOT EXISTS `Film_Nicolas`;
USE `Film_Nicolas`;
-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: May 03, 2018 at 07:00 AM
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

-- --------------------------------------------------------

--
-- Table structure for table `T_est`
--

CREATE TABLE `T_est` (
  `ID_est` int(11) NOT NULL,
  `fk_Video` int(11) NOT NULL,
  `fk_Genre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `T_est`
--

INSERT INTO `T_est` (`ID_est`, `fk_Video`, `fk_Genre`) VALUES
(1, 1, 1),
(2, 1, 3),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `T_Genre`
--

CREATE TABLE `T_Genre` (
  `ID_Genre` int(11) NOT NULL,
  `nom_genre` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `T_Genre`
--

INSERT INTO `T_Genre` (`ID_Genre`, `nom_genre`) VALUES
(1, 'Action'),
(2, 'Aventure'),
(3, ' Science-fiction'),
(4, 'Horreur'),
(5, 'Comédie');

-- --------------------------------------------------------

--
-- Table structure for table `T_Hadi`
--

CREATE TABLE `T_Hadi` (
  `ID_Hadi` int(11) NOT NULL,
  `nom_Hadi` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `T_Hadi`
--

INSERT INTO `T_Hadi` (`ID_Hadi`, `nom_Hadi`) VALUES
(1, '她今天看起?'),
(2, 'tOto'),
(3, 'Kali'),
(4, 'root'),
(5, 'Malera'),
(6, '?ren');

-- --------------------------------------------------------

--
-- Table structure for table `T_Pays`
--

CREATE TABLE `T_Pays` (
  `ID_Pays` int(11) NOT NULL,
  `nom_pays` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `T_Pays`
--

INSERT INTO `T_Pays` (`ID_Pays`, `nom_pays`) VALUES
(1, 'USA'),
(2, 'Japon');

-- --------------------------------------------------------

--
-- Table structure for table `T_Produit`
--

CREATE TABLE `T_Produit` (
  `ID_Produit` int(11) NOT NULL,
  `fk_Video` int(11) NOT NULL,
  `fk_Realisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `T_Produit`
--

INSERT INTO `T_Produit` (`ID_Produit`, `fk_Video`, `fk_Realisateur`) VALUES
(1, 3, 2),
(2, 12, 1),
(3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `T_Realisateur`
--

CREATE TABLE `T_Realisateur` (
  `ID_Realisateur` int(11) NOT NULL,
  `nom_realisateur` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `T_Realisateur`
--

INSERT INTO `T_Realisateur` (`ID_Realisateur`, `nom_realisateur`) VALUES
(1, 'Minoru Okazaki'),
(2, 'Robert Zemeckis');

-- --------------------------------------------------------

--
-- Table structure for table `T_Sous_titre`
--

CREATE TABLE `T_Sous_titre` (
  `ID_Sous_titre` int(11) NOT NULL,
  `Langue` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `T_Sous_titre`
--

INSERT INTO `T_Sous_titre` (`ID_Sous_titre`, `Langue`) VALUES
(1, 'Français'),
(2, 'Anglais');

-- --------------------------------------------------------

--
-- Table structure for table `T_Type`
--

CREATE TABLE `T_Type` (
  `ID_Type` int(11) NOT NULL,
  `nom_type` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `T_Type`
--

INSERT INTO `T_Type` (`ID_Type`, `nom_type`) VALUES
(1, 'Film'),
(2, 'Série'),
(3, 'Anime');

-- --------------------------------------------------------

--
-- Table structure for table `T_version`
--

CREATE TABLE `T_version` (
  `ID_Version` int(11) NOT NULL,
  `nom_version` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `T_version`
--

INSERT INTO `T_version` (`ID_Version`, `nom_version`) VALUES
(1, 'VO'),
(2, 'VF');

-- --------------------------------------------------------

--
-- Table structure for table `T_Video`
--

CREATE TABLE `T_Video` (
  `ID_Video` int(11) NOT NULL,
  `titre` varchar(25) NOT NULL,
  `duree` time NOT NULL,
  `episode` tinyint(4) NOT NULL,
  `saison` tinyint(4) NOT NULL,
  `date_sortie` year(4) DEFAULT NULL,
  `ID_Type` int(11) DEFAULT NULL,
  `ID_Version` int(11) DEFAULT NULL,
  `ID_Pays` int(11) DEFAULT NULL,
  `ID_Sous_titre` int(11) DEFAULT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `T_Video`
--

INSERT INTO `T_Video` (`ID_Video`, `titre`, `duree`, `episode`, `saison`, `date_sortie`, `ID_Type`, `ID_Version`, `ID_Pays`, `ID_Sous_titre`, `url`) VALUES
(1, 'Dragon Ball', '00:21:23', 1, 1, 2004, 3, 1, 2, 1, 'File:///dev/www/dragon_Ball/Dragon_Ball_ep1'),
(2, 'Dragon Ball', '00:22:42', 2, 1, 2004, 3, 1, 2, 1, ''),
(3, 'Retour vers le futur', '00:00:00', 1, 0, 1997, 1, 2, 1, 2, ''),
(5, 'qwertz', '00:50:55', 5, 0, 0000, 3, NULL, NULL, NULL, ''),
(7, 'asd', '01:01:01', 5, 5, 0000, NULL, NULL, NULL, NULL, ''),
(8, 'test3', '00:00:00', 2, 2, NULL, NULL, NULL, NULL, NULL, '/'),
(10, 'test', '22:22:22', 2, 2, NULL, NULL, NULL, NULL, NULL, '/'),
(11, 'asdg', '11:00:00', 2, 2, NULL, NULL, NULL, NULL, NULL, '/'),
(12, 'hddfhfhfh', '11:00:00', 2, 2, NULL, NULL, NULL, NULL, NULL, '/');

-- --------------------------------------------------------

--
-- Stand-in structure for view `T_View_video`
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
-- Structure for view `T_View_video`
--
DROP TABLE IF EXISTS `T_View_video`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `T_View_video`  AS  select `T_Video`.`ID_Video` AS `ID_Video`,`T_Video`.`titre` AS `titre`,`T_Video`.`duree` AS `duree`,`T_Video`.`episode` AS `episode`,`T_Video`.`saison` AS `saison`,`T_Video`.`date_sortie` AS `date_sortie`,`T_Video`.`ID_Type` AS `ID_Type`,`T_Video`.`ID_Version` AS `ID_Version`,`T_Video`.`ID_Pays` AS `ID_Pays`,`T_Video`.`ID_Sous_titre` AS `ID_Sous_titre` from `T_Video` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `T_est`
--
ALTER TABLE `T_est`
  ADD PRIMARY KEY (`ID_est`),
  ADD UNIQUE KEY `est_unique` (`fk_Video`,`fk_Genre`),
  ADD KEY `FK_est_ID_Genre` (`fk_Genre`);

--
-- Indexes for table `T_Genre`
--
ALTER TABLE `T_Genre`
  ADD PRIMARY KEY (`ID_Genre`);

--
-- Indexes for table `T_Hadi`
--
ALTER TABLE `T_Hadi`
  ADD PRIMARY KEY (`ID_Hadi`);

--
-- Indexes for table `T_Pays`
--
ALTER TABLE `T_Pays`
  ADD PRIMARY KEY (`ID_Pays`);

--
-- Indexes for table `T_Produit`
--
ALTER TABLE `T_Produit`
  ADD PRIMARY KEY (`ID_Produit`),
  ADD KEY `FK_Produit_ID_Realisateur` (`fk_Realisateur`),
  ADD KEY `FK_Produit_ID_Video` (`fk_Video`);

--
-- Indexes for table `T_Realisateur`
--
ALTER TABLE `T_Realisateur`
  ADD PRIMARY KEY (`ID_Realisateur`);

--
-- Indexes for table `T_Sous_titre`
--
ALTER TABLE `T_Sous_titre`
  ADD PRIMARY KEY (`ID_Sous_titre`);

--
-- Indexes for table `T_Type`
--
ALTER TABLE `T_Type`
  ADD PRIMARY KEY (`ID_Type`);

--
-- Indexes for table `T_version`
--
ALTER TABLE `T_version`
  ADD PRIMARY KEY (`ID_Version`);

--
-- Indexes for table `T_Video`
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
-- AUTO_INCREMENT for table `T_est`
--
ALTER TABLE `T_est`
  MODIFY `ID_est` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `T_Genre`
--
ALTER TABLE `T_Genre`
  MODIFY `ID_Genre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `T_Hadi`
--
ALTER TABLE `T_Hadi`
  MODIFY `ID_Hadi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `T_Pays`
--
ALTER TABLE `T_Pays`
  MODIFY `ID_Pays` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `T_Produit`
--
ALTER TABLE `T_Produit`
  MODIFY `ID_Produit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `T_Realisateur`
--
ALTER TABLE `T_Realisateur`
  MODIFY `ID_Realisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `T_Sous_titre`
--
ALTER TABLE `T_Sous_titre`
  MODIFY `ID_Sous_titre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `T_Type`
--
ALTER TABLE `T_Type`
  MODIFY `ID_Type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `T_version`
--
ALTER TABLE `T_version`
  MODIFY `ID_Version` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `T_Video`
--
ALTER TABLE `T_Video`
  MODIFY `ID_Video` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `T_est`
--
ALTER TABLE `T_est`
  ADD CONSTRAINT `FK_est_ID_Genre` FOREIGN KEY (`fk_Genre`) REFERENCES `T_Genre` (`ID_Genre`),
  ADD CONSTRAINT `FK_est_ID_Video` FOREIGN KEY (`fk_Video`) REFERENCES `T_Video` (`ID_Video`);

--
-- Constraints for table `T_Produit`
--
ALTER TABLE `T_Produit`
  ADD CONSTRAINT `FK_Produit_ID_Realisateur` FOREIGN KEY (`fk_Realisateur`) REFERENCES `T_Realisateur` (`ID_Realisateur`),
  ADD CONSTRAINT `FK_Produit_ID_Video` FOREIGN KEY (`fk_Video`) REFERENCES `T_Video` (`ID_Video`);

--
-- Constraints for table `T_Video`
--
ALTER TABLE `T_Video`
  ADD CONSTRAINT `FK_Video_ID_Pays` FOREIGN KEY (`ID_Pays`) REFERENCES `T_Pays` (`ID_Pays`),
  ADD CONSTRAINT `FK_Video_ID_Sous_titre` FOREIGN KEY (`ID_Sous_titre`) REFERENCES `T_Sous_titre` (`ID_Sous_titre`),
  ADD CONSTRAINT `FK_Video_ID_Type` FOREIGN KEY (`ID_Type`) REFERENCES `T_Type` (`ID_Type`),
  ADD CONSTRAINT `FK_Video_ID_Version` FOREIGN KEY (`ID_Version`) REFERENCES `T_version` (`ID_Version`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
