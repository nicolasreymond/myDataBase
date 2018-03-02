<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
  <title>Film</title>
</head>

<body>
  <ul>
    <li> <a href="index.php">HOME</a><br></li>
    <li> <a href="video.php">VIDEO</a><br></li>
  </ul>

  <?php
  // Check connection
  try {
      $db = new PDO("mysql:host=db;dbname=Film", "root", "root");
      echo "Connection succes";

} catch (Exception $e) {
        echo "Connection failed";
    }

    $sql = 'SELECT * FROM View_video';
    print "<pre>";
    foreach ($db->query($sql) as $row) {
        print $row['titre'] . "\t";
        print $row['episode'] . "\t";
        print $row['duree'] . "\n";
    }
    print "</pre>";
    ?>

    <form id="form1" name="form1" method="post" action="<?php echo $_SERVER['PHP_SELF']?>">
      Film List :
      <select Emp Name='NEW'>
        <option value="">--- Select ---</option>
        <?php

        foreach ($db->query($sql) as $row) {
          echo '<option value="">' .$row['titre']; '</option>';
        }

        ?>
    </select>
      <input type="submit">
    </form>


    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
</body>

</html>
