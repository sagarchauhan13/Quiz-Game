<?php
$db = new mysqli("localhost","root","","test");
if($db){
//    echo 'Connection Success';
} else {
    echo 'Connection Failed';
}
?>