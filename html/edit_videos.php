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

  $db = new PDO("mysql:host=db;dbname=Film", "root", "root");
  print_nav_menu();

  echo "<pre>";
  print_r($_POST);
  print_r($_GET);
  echo "</pre>";

  if ($id) {
      echo "This is for an update <br>";
      $db = connect_DB();
      $sql = "SELECT titre, duree FROM View_video WHERE ID_Video = $id";

      $sql2 = "SELECT Video.ID_Video, Video.titre, Sous_titre.Langue, Pays.nom_pays, Realisateur.nom_realisateur,Type.nom_type, version.nom_version FROM Video LEFT JOIN Sous_titre ON Video.ID_Sous_titre = Sous_titre.ID_Sous_titre LEFT JOIN Pays ON Video.ID_Pays = Pays.ID_Pays LEFT JOIN Realisateur ON Video.ID_Realisateur = Realisateur.ID_Realisateur LEFT JOIN version on Video.ID_Version = version.ID_Version LEFT JOIN Type on Video.ID_Type = Type.ID_Type";

      print "<br>";
      foreach ($db->query($sql2) as $row) {
          $existing_title = $row['titre']."\n";
          $existing_duration = $row['duree']."\n";
          $existing_episode = $row['episode']."\n";
          print_r($existing_duration);
      }
  } else {
      echo "This is for an insert";
  }
  // In all cases, (re)display form
  ?>
  <form class="" action="edit_videos.php" method="post">
    <input type="hidden" name="id" value="<?php echo $id ?>">
    <label for="title">title: </label>
    <input type="text" name="title" id="title" value="<?php echo $existing_title ?>">
    <label for="title">duration: </label>
    <input type="text" name="duration" id="duration" value="<?php echo $existing_duration ?>">
    <button type="submit" name="button">OK!</button>
  </form>
  <?php


  ?>
</body>
</html>
