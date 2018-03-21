<?php
require_once __DIR__."/templates.inc";

$id = $_REQUEST["id"];
if ($_POST) {
    // This is a form submission
    error_log("update\n");
    $db = connect_DB();
    $existing_title = $_POST['title'];
    $existing_duration = $_POST['duration'];
    $existing_episode = $_POST['episode'];
    $existing_Langue = $_POST['Langue'];
    $existing_nom_pays = $_POST['nom_pays'];
    $existing_nom_type = $_POST['nom_type'];
    $existing_nom_version = $_POST['nom_version'];

    // Create or update object from YYY with $db
    if ($id) {
        // UPDATE
    } else {
        // INSERT
        $stmt = $db->prepare("INSERT INTO T_Video (`titre`, `duree`, `episode`) VALUES(?,?,?)");
        $stmt->execute(array('test','00:50:55', 5));
        $id = $db->lastInsertId();
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

      $sql2 = "SELECT T_Video.ID_Video, T_Video.titre, T_Video.episode, T_Video.duree,\n"
    . "      T_Sous_titre.Langue, T_Pays.nom_pays, T_Type.nom_type,\n"
    . "      T_version.nom_version\n"
    . "      FROM T_Video\n"
    . "      LEFT JOIN T_Sous_titre ON T_Video.ID_Sous_titre = T_Sous_titre.ID_Sous_titre\n"
    . "      LEFT JOIN T_Pays ON T_Video.ID_Pays = T_Pays.ID_Pays\n"
    . "      LEFT JOIN T_version on T_Video.ID_Version = T_version.ID_Version\n"
    . "      LEFT JOIN T_Type on T_Video.ID_Type = T_Type.ID_Type";

      print "<br>";
      foreach ($db->query($sql2) as $row) {
          $existing_title = $row['titre']."\n";
          $existing_duration = $row['duree']."\n";
          $existing_episode = $row['episode']."\n";
          $existing_Langue = $row['Langue']."\n";
          $existing_nom_pays = $row['nom_pays']."\n";
          $existing_nom_type = $row['nom_type']."\n";
          $existing_nom_version = $row['nom_version']."\n";
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
    <label for="Langue">Langue: </label>
    <input type="text" name="Langue" id="Langue" value="<?php echo $existing_Langue ?>"><br>
    <label for="nom_pays">nom_pays: </label>
    <input type="text" name="nom_pays" id="nom_pays" value="<?php echo $existing_nom_pays ?>"><br>
    <label for="nom_type">nom_type: </label>
    <input type="text" name="nom_type" id="nom_type" value="<?php echo $existing_nom_type ?>"><br>
    <label for="nom_version">nom_version: </label>
    <input type="text" name="nom_version" id="nom_version" value="<?php echo $existing_nom_version ?>"><br>

    <button type="submit" name="button">OK!</button>
  </form>
  <?php


  ?>
</body>
</html>
