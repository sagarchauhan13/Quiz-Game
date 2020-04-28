<?php
    require_once 'dbConfig.php';
    $check_query = $db->prepare("SELECT user_name FROM user WHERE user_name = ?");
    $check_query->bind_param("s",$_POST['username']);
    $_POST['username'];
    $check_query->execute();
    $check_query->store_result();
    $username = $_POST['username'];
    $check_num_rows = $check_query->num_rows;
    if($username == NULL){
        echo 'Choose Username First';
    } else if (strlen($username)<=2){
        echo 'Too Short';
    } else {
        if($check_num_rows == 1){
            echo '<div class="warning1">Username Not Available</div>';
        } else if ($check_num_rows == 0){
            echo '<div class="warning2">Username Available</div>';
        }
    }
?>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css.css">
    </head>
    <body>
    </body>
</html>