<?php
session_start();
require_once 'dbConfig.php';
if(isset($_POST['username_input'])){
    /* check if user exist in DB then throw the error */
    $check_query = $db->prepare("SELECT user_name FROM user WHERE user_name = ?");
    $check_query->bind_param("s",$_POST['username_input']);
    $check_query->execute();
    $result = $check_query->get_result();
    $row = $result->fetch_assoc();
    if($row==NULL){
        $stmt = $db->prepare("INSERT INTO user (user_name) VALUES (?)");
        $stmt->bind_param("s", $_POST['username_input']);
        $stmt->execute();
        $last_id = mysqli_insert_id($db);
        $_SESSION["last_id"] = $last_id;
//            echo $last_id;
        echo '<input type="hidden" value="'.$last_id['last_id'].'">';
    } else {
        echo "user_exist";
        exit;
    }
}
    
    /*code for fetching question and question_id from question table*/
//    $question_id = isset($_POST["question_id"])?$_POST["question_id"]:'';
//    $question_id2 = isset($_SESSION['question_id']);
//    echo $question_id;
    $query = $db->prepare("SELECT question_id,questions FROM question WHERE question_id NOT IN (SELECT question_id FROM user_ans WHERE user_id = ? ) ORDER BY RAND() LIMIT 1");
    $user_id = $_SESSION["last_id"];
    $query->bind_param("s",$user_id);
    $query->execute();
    $result = $query->get_result(); //get_result() gets a result from prepared statement
    $result->num_rows > 0;
    $row = $result->fetch_assoc(); //fetch_assoc() fetch a result row as an associative array
    ?><div id="question_from_db1"><?php
    echo '<center>'. $row['questions']. '</center>';
    echo '<input type="hidden" value="'.$row['question_id'].'">';
//    echo $row['question_id'];
    ?></div><?php
    
    /*inserting answer into database when quiz starts*/

    if(isset($_POST['user_id'])){
        $stmt = $db->prepare("INSERT INTO user_ans (user_id,question_id,user_answer) VALUES (?,?,?)");
        $stmt->bind_param("iis",$user_id, $question_id,$answer);
        $user_id = $_SESSION["last_id"];
        $question_id = $_POST['question_id'];
        $answer=$_POST['answer'];
        $stmt->execute();
    }
?>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css.css">
    </head>
    <body>
        <center>
            <div id="question_from_db2">
            <form method="post" name="user_ans" id="user_ans" action="ajaxdata.php">
                <input type="radio" value="Animal" name="answer" id="r1"><label for="r1"><span></span>Animal</label><br>
                <input type="radio" value="Bird" name="answer" id="r2"><label for="r2"><span></span>Bird </label><br>
                <input type="hidden" name="user_id" id="user_id" value="<?php echo $_SESSION["last_id"]; ?>">
                <input type="hidden" name="question_id" id="question_id" value="<?php echo $row['question_id'];?>">
                <input type="hidden" name="answer" id="answer" value="">
                <div id="">
                <button class="button button2" type="button" name="next" value="Next" id="next">Next</button>

                </div>
            </form>
            </div>
        </center>
    </body>
</html>