DROP TABLE `T_Hadi`;

CREATE TABLE `T_Hadi` (`ID_Hadi` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT, `nom_Hadi` varchar(25) DEFAULT NULL);

ALTER TABLE `T_Hadi` CHANGE `nom_Hadi` `nom_Hadi` VARCHAR(25) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL;

INSERT INTO `T_Hadi` (`nom_Hadi`) VALUES ('她今天看起来'), ('tOto'), ('Kali'), ('root'), ('Malera'), ('hören'), ('zuzu');

SELECT * FROM `T_Hadi` ORDER BY `ID_Hadi`;

ALTER TABLE `T_Hadi` CHANGE `nom_Hadi` `nom_Hadi` VARCHAR(25) COLLATE utf8_general_ci NULL DEFAULT NULL;

SELECT * FROM `T_Hadi` ORDER BY nom_Hadi;

SELECT * FROM `T_Hadi` WHERE `ID_Hadi` = 2;
SELECT * FROM `T_Hadi` WHERE `ID_Hadi` < 2;
SELECT * FROM `T_Hadi` WHERE `ID_Hadi` > 2;
SELECT * FROM `T_Hadi` WHERE `ID_Hadi` <= 2 ;
SELECT * FROM `T_Hadi` WHERE `ID_Hadi` >= 2 ;
SELECT * FROM `T_Hadi` WHERE `ID_Hadi` != 2 ;

SELECT * FROM `T_Hadi` WHERE `ID_Hadi` LIKE 2 ;
SELECT * FROM `T_Hadi` WHERE `ID_Hadi` NOT LIKE 2 ;
SELECT * FROM `T_Hadi` WHERE `nom_Hadi` LIKE "%r%" ;

SELECT * FROM `T_Hadi` WHERE `nom_Hadi` ="root" ;
SELECT * FROM `T_Hadi` WHERE `nom_Hadi` !="root" ;

SELECT * FROM `T_Hadi` WHERE `ID_Hadi` IN (1, 3) ;
SELECT * FROM `T_Hadi` WHERE `ID_Hadi` NOT IN (2, 3) ;

SELECT * FROM `T_Hadi` WHERE `ID_Hadi` BETWEEN 2 AND 3 ;
SELECT * FROM `T_Hadi` WHERE `ID_Hadi` NOT BETWEEN 1 AND 2 ;

SELECT * FROM `T_Hadi` WHERE `ID_Hadi` IS NOT NULL;

SELECT * FROM `T_Hadi` WHERE (`nom_Hadi` REGEXP '[Kt]\w*');
SELECT * FROM `T_Hadi` WHERE (`nom_Hadi` NOT REGEXP '[Kt]\w*');

SELECT * FROM `T_Hadi` WHERE (`nom_Hadi` REGEXP '^[r].*$');

SELECT * FROM `T_est` AS T1
   INNER JOIN `T_Video` AS T2 ON T2.ID_Video = T1.fk_Video
   INNER JOIN `T_Genre` AS T3 ON T3.ID_Genre = T1.fk_Genre;

SELECT `ID_Video`, `titre`, `nom_genre` FROM `T_Video` T1
   INNER JOIN `T_est` T2 ON T2.fk_Video = T1.ID_Video
   INNER JOIN `T_Genre` T3 ON T3.ID_Genre = T2.fk_Genre
WHERE `ID_est` = 3;

SELECT DISTINCT `titre`, `ID_Genre`,`nom_genre` FROM `T_Video` T1
   LEFT JOIN `T_est` T2 ON T2.fk_Video = T1.ID_Video
   LEFT JOIN `T_Genre` T3 ON T3.ID_Genre = T2.fk_Genre
   INNER JOIN `T_Produit` T4 ON T4.fk_Video = T1.ID_Video
   INNER JOIN `T_Realisateur` T5 ON T5.ID_Realisateur = T4.fk_Realisateur
WHERE `ID_Video` = 2;

SELECT * FROM `T_Hadi` ORDER BY `ID_Hadi` COLLATE latin1_german2_ci;

SELECT (TIMEDIFF(duree, (SELECT duree FROM T_Video WHERE `ID_Video` = 1))) AS time FROM T_Video ;

SELECT COUNT(*) AS nb_video FROM T_Video;
SELECT AVG(date_sortie) FROM T_Video WHERE date_sortie IS NOT NULL;
SELECT MAX(duree) FROM T_Video WHERE duree IS NOT NULL;
SELECT MIN(date_sortie) FROM T_Video WHERE date_sortie IS NOT NULL;

SELECT ID_Video,titre,CHAR_LENGTH(titre) AS lenTitre FROM T_Video ORDER BY lenTitre DESC limit 5;

SELECT (SELECT COUNT(*) FROM T_Video) AS nb_video, (SELECT COUNT(*) FROM T_version) AS nb_version, (SELECT COUNT(*) FROM T_Type) AS nb_type, (SELECT COUNT(*) FROM T_Sous_titre) AS nb_sous_titre, (SELECT COUNT(*) FROM T_Realisateur) AS nb_realisateur, (SELECT COUNT(*) FROM T_Pays) AS nb_pays, (SELECT COUNT(*) FROM T_Hadi) AS nb_Hadi, (SELECT COUNT(*) FROM T_Genre) AS nb_genre;

select tb1.nb_video + tb2.nb_version + tb3.nb_Type + tb4.nb_Genre + tb5.nb_Hadi + tb6.nb_Pays + tb7.nb_Realisateur + tb8.nb_Sous_titre from
    (Select Count(ID_Video) as nb_video From T_Video) tb1,
    (Select Count(ID_Version) as nb_version From T_version) tb2,
    (SELECT COUNT(ID_Type) AS nb_Type FROM T_Type) tb3,
    (SELECT COUNT(ID_Genre) AS nb_Genre FROM T_Genre) tb4,
    (SELECT COUNT(ID_Hadi) AS nb_Hadi FROM T_Hadi) tb5,
    (SELECT COUNT(ID_Pays) AS nb_Pays FROM T_Pays) tb6,
    (SELECT COUNT(ID_Realisateur) AS nb_Realisateur FROM T_Realisateur) tb7,
    (SELECT COUNT(ID_Sous_titre) AS nb_Sous_titre FROM T_Sous_titre) tb8;
