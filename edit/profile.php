<?php
    include "../connect.php";
    

    $id = filtersRequest("id");
    $username = filtersRequest("username");
    $gender = filtersRequest("gender");
    $stmt = $con->prepare("UPDATE `users` SET `username`=? ,`gender`= ? WHERE `id`= ?");
    $stmt->execute(array($username, $gender, $id));
    $count = $stmt->rowCount();
    if($count>0){
        echo json_encode(array("status" => "success"));
    }else{
        echo json_encode(array("status" => "fail"));
    }