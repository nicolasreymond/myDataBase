DROP TABLE `T_Hadi`;

CREATE TABLE `T_Hadi` (`ID_Hadi` int(11) NOT NULL, `nom_Hadi` varchar(25) DEFAULT NULL);

INSERT INTO `T_Hadi` (`ID_Hadi`, `nom_Hadi`) VALUES (1, 'bite'), (2, 'arabe'), (3, 'LEO'), (4, '');

SELECT * FROM `T_Hadi` WHERE `ID_Hadi` = 2 ;
SELECT * FROM `T_Hadi` WHERE `ID_Hadi` < 2 ;
SELECT * FROM `T_Hadi` WHERE `ID_Hadi` > 2 ;
SELECT * FROM `T_Hadi` WHERE `ID_Hadi` <= 2 ;
SELECT * FROM `T_Hadi` WHERE `ID_Hadi` >= 2 ;
SELECT * FROM `T_Hadi` WHERE `ID_Hadi` != 2 ;

SELECT * FROM `T_Hadi` WHERE `ID_Hadi` LIKE 2 ;
SELECT * FROM `T_Hadi` WHERE `ID_Hadi` NOT LIKE 2 ;
SELECT * FROM `T_Hadi` WHERE `nom_Hadi` LIKE "%r%" ;

SELECT * FROM `T_Hadi` WHERE `nom_Hadi` ="arabe" ;
SELECT * FROM `T_Hadi` WHERE `nom_Hadi` !="arabe" ;

SELECT * FROM `T_Hadi` WHERE `ID_Hadi` IN (1, 3) ;
SELECT * FROM `T_Hadi` WHERE `ID_Hadi` NOT IN (2, 4) ;

SELECT * FROM `T_Hadi` WHERE `ID_Hadi` BETWEEN 2 AND 3 ;
SELECT * FROM `T_Hadi` WHERE `ID_Hadi` NOT BETWEEN 1 AND 2 ;

SELECT * FROM `T_Hadi` WHERE `ID_Hadi` IS NOT NULL;
