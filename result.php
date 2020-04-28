<?php
    session_start();
    require_once 'dbConfig.php';
    $user_id = $_SESSION["last_id"];
    $sql = $db->prepare("SELECT user_ans.user_id, user_ans.question_id, user_ans.user_answer,                          question.questions, question.main_answer
                         FROM user_ans
                         INNER JOIN question
                         ON question.question_id = user_ans.question_id WHERE user_id = $user_id;");
    $sql->execute();
    $result = $sql->get_result();
    
    //code for fetching total questions user answered 
    
    $sql2 = "SELECT COUNT(user_id) AS user_total_questions FROM user_ans WHERE user_id= ?";
    $stmt = $db->prepare($sql2);
    $stmt->bind_param("i", $_SESSION["last_id"]);
    $stmt->execute();
    $row2 = $stmt->get_result()->fetch_row(); 
    
    //code for counting user ans whether it is right or wrong 
  
?>

<!DOCTYPE html>
<html>
    <head>
        <script src="/sagar/task2/jquery.js"></script>
    </head>
    <body>
        <center>
            <h3>Your Result is</h3>
            <table border='1' cellpadding='3px'>
                <tr>
                    <th>Total Question(s)</th>
                    <th>Question</th>
                    <th>Your Answer</th>
                    <th>Right Answer</th>
                    <th>Analysis</th>
                </tr>
                <?php if($result->num_rows > 0) { 
                        $i = 1;
                        while ($row = $result->fetch_assoc()) { ?>
                <tr> 
                    <td><?php echo $i?></td>
                    <td><?php echo $row['questions']?></td>
                    <td><?php echo $row['user_answer']?></td>
                    <td><?php echo $row['main_answer']?></td>
                    <?php 
                        if($row['user_answer'] == $row['main_answer']){ ?>
                            <td><span>&#10004</span></td>
                            <?php } else { ?>
                            <td><span>&#10008</span></td>
                    <?php } ?>
                </tr>
                <?php 
                     $i++; } 
                    }
                    $right_answer = 0;
                    $wrong_answer = 0;
                    $points = 0;
                    $user_id = $_SESSION["last_id"];
                    $sql3 = $db->prepare("SELECT user_ans.user_answer,question.main_answer FROM user_ans
                                        INNER JOIN question
                                        ON question.question_id = user_ans.question_id WHERE user_id = $user_id");
                    $sql3->execute();
                    $result2 = $sql3->get_result();
                    while($row3 = $result2->fetch_assoc()){
                        if($row3['user_answer'] == $row3['main_answer']){
                            $right_answer++;
                        } else {
                            $wrong_answer++;
                        }
                        if($row3['user_answer'] == $row3['main_answer']){
                            $points = $right_answer*10;
                        } else {
                            $points = ($right_answer*10)-5;
                        }
                    }
                    session_unset();
                ?>
            </table>
            <table border='1' cellpadding ='3px'>
                <h3>Your Score is</h3>
                <tr>
                    <th>Total Answer(s)</th>
                    <th>Right Answer(s)</th>
                    <th>Wrong Answer(s)</th>
                    <th>Score</th>
                </tr>
                <tr>
                    <td><?php echo $row2[0];?></td>
                    <td><?php echo $right_answer ?></td>
                    <td><?php echo $wrong_answer ?></td>
                    <td><?php echo $points ?></td>
                </tr>
            </table>
        </center>
    </body>
</html>