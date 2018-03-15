<?php
require_once __DIR__."/templates.inc";

$id = $_REQUEST["id"];
if ($_POST) {
    // This is a form submission
    error_log("update\n");
    $db = connect_DB();
    // Create or update object from YYY with $db
    if ($id) {
        // UPDATE
    } else {
        // INSERT
      $id = // XXX Newly inserted row's ID
        5;
    }

    Header("HTTP/1.1 301 Moved Permanently");
    Header("Location: edit_videos.php?id=$id");
    die();
}

print_header("Edit video");
?>
<body>
  <?php

  $db = new PDO("mysql:host=db;dbname=Film_Nicolas", "root", "root");
  print_nav_menu();

  echo "<pre>";
  print_r($_POST);
  print_r($_GET);
  echo "</pre>";

  if ($id) {
      echo "This is for an update <br>";
      $db = connect_DB();
      $sql = "SELECT * FROM T_View_video WHERE ID_Video = $id";

      $sql2 = "SELECT T_Video.ID_Video, T_Video.titre, T_Video.episode, T_Video.duree,
      T_Sous_titre.Langue, T_Pays.nom_pays, T_Realisateur.nom_realisateur, T_Type.nom_type,
      T_version.nom_version
      FROM T_Video  
      LEFT JOIN T_Sous_titre ON T_Video.ID_Sous_titre = T_Sous_titre.ID_Sous_titre
      LEFT JOIN T_Pays ON T_Video.ID_Pays = T_Pays.ID_Pays
      LEFT JOIN T_Realisateur ON T_Video.ID_Realisateur = T_Realisateur.ID_Realisateur
      LEFT JOIN T_version on T_Video.ID_Version = T_version.ID_Version
      LEFT JOIN T_Type on T_Video.ID_Type = T_Type.ID_Type";

      print "<br>";
      foreach ($db->query($sql) as $row) {
          $existing_title = $row['titre']."\n";
          $existing_duration = $row['duree']."\n";
          $existing_episode = $row['episode']."\n";
      }
  } else {
      echo "This is for an insert";
  }
  // In all cases, (re)display form
  ?>
  <form class="" action="edit_videos.php" method="post">
    <input type="hidden" name="id" value="<?php echo $id ?>">
    <label for="title">title: </label>
    <input type="text" name="title" id="title" value="<?php echo $existing_title ?>"><br>
    <label for="duration">duration: </label>
    <input type="text" name="duration" id="duration" value="<?php echo $existing_duration ?>"><br>
    <label for="episode">episode: </label>
    <input type="text" name="episode" id="episode" value="<?php echo $existing_episode ?>"><br>

    <button type="submit" name="button">OK!</button>
  </form>
  <?php


  ?>
</body>
</html>
