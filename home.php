<?php
session_start();
session_destroy();
?>
<!DOCTYPE html>
<html>
    <head>
        
        <title>Test</title>
        <link rel="stylesheet" href="css.css">
        <script language="javascript">
        </script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="/sagar/task2/jquery.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    </head>
    <body>
        <input type="hidden" id="last_id" name="last_id">
        <div id="before_login" class="container col-lg-6">
            <form method="post" id="form" action="ajaxdata.php" class="form-group"name="form">
                <h3>Start Your Quiz
                <br><font color="red">(You Have Only 60 Seconds)</font>
                <br><br>
                Username:<input type="text" name="username" id="username_input" class="form-control" placeholder="Username" required=""><br>
                <div id="feedback"></div>
                <div id="startbutton">
                <button class="button button2" type="button" name="start" value="start" id="start">Start</button></div>
                </h3>
            </form>
        </div>
        <div id="countdown"></div>
        <div id="after_login"></div>
        <div id="result"></div>
    </body>
</html>
