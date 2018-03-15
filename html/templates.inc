<?php
function print_header($title)
{
    ?>  <!DOCTYPE html>
  <html lang="en">
  <head>
    <meta charset="utf-8">
    <title>
      <?php
      echo $title; ?>
    </title>
  </head>
    <?php
}

function connect_DB()
{
    global $db;

    // Check connection
    try {
        $db = new PDO("mysql:host=db;dbname=Film_Nicolas", "root", "root");
        error_log("Connection succes");
        return $db;
    } catch (Exception $e) {
        echo "Connection failed";
    }
}


function print_nav_menu()
{
    ?>  <ul>
    <li> <a href="index.php">HOME</a><br></li>
    <li> <a href="list_video.php">VIDEO</a><br></li>
    <li> <a href="edit_videos.php">CREATE</a><br></li>
  </ul>
<?php
}

function print_scripts()
{
    ?>
  <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
  <?php
}
?>
