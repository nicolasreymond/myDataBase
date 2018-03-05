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
      echo "This is for an update\n";
      $existing_title = $db->query('SELECT * FROM View_video');
      print_r($existing_title);
      echo $row['titre']."toto";
  // TODO: Populate $existing_title etc.
  } else {
      echo "This is for an insert";
  }
  // In all cases, (re)display form
  ?>
  <form class="" action="edit_videos.php" method="post">
    <input type="hidden" name="id" value="<?php echo $id ?>">
    <label for="title">title: </label>
    <input type="text" name="title" id="title" value="<?php echo $existing_title ?>">
    <button type="submit" name="button">OK!</button>
  </form>
  <?php


  ?>
</body>
</html>
