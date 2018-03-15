-- SELECT * FROM `T_Video` WHERE `ID_Video` > 2 ;

-- SELECT T_Video.ID_Video, T_Video.titre, T_Video.episode, T_Video.duree, T_Sous_titre.Langue, T_Pays.nom_pays, T_Realisateur.nom_realisateur, T_Type.nom_type, T_version.nom_versionFROM T_Video LEFT JOIN T_Sous_titre ON T_Video.ID_Sous_titre = T_Sous_titre.ID_Sous_titreLEFT JOIN T_Pays ON T_Video.ID_Pays = T_Pays.ID_PaysLEFT JOIN T_Realisateur ON T_Video.ID_Realisateur = T_Realisateur.ID_RealisateurLEFT JOIN T_version ON T_Video.ID_Version = T_version.ID_VersionLEFT JOIN T_Type ON T_Video.ID_Type = T_Type.ID_Type ;

CREATE TABLE `T_Hadi` (`ID_Hadi` int(11) NOT NULL, `nom_Hadi` varchar(25) DEFAULT NULL);

INSERT INTO `T_Hadi` (`ID_Hadi`, `nom_Hadi`) VALUES (1, 'bite'), (2, 'arabe');

SELECT * FROM `T_Hadi` WHERE 'ID_Hadi' = 2 ;

DROP TABLE `T_Hadi`;
