<?php
require_once __DIR__."/templates.inc";
print_header("index video");
?><body>

<?php


print_nav_menu();
$db = connect_DB();
$sql = 'SELECT * FROM View_video';
print "<pre>";
foreach ($db->query($sql) as $row) {
    print $row['titre']."\t";
    print $row['episode']."\t";
    print $row['duree']."\n";
}
print "</pre>";
?>    <form id="form1" name="form1" method="post" action="<?php

echo $_SERVER['PHP_SELF']
?>">
      Film List :
      <select Emp Name='NEW'>
        <option value="">--- Select ---</option>
        <?php


foreach ($db->query($sql) as $row) {
    printf('<option value="%d">%s</option>', $row['ID_Video'], $row['titre']);
}

?>    </select>
<button type="button" id="edit">Edit</button>
    </form>

    <?php print_scripts(); ?>
<script type="text/javascript">

$("button#edit").on("click", function() {
  window.location.replace("edit_videos.php?id="+ $("select").val())
})
</script>
</body>

</html>
