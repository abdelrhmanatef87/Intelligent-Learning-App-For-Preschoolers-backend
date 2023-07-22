<?php
    include "../connect.php";
    
    $username = filtersRequest("username");
    $email = filtersRequest("email");
    $password = filtersRequest("password");
    $gender = filtersRequest("gender");
    $stmt = $con->prepare("INSERT INTO `users`(`username`, `email`, `password`, `gender`) VALUES ( ? , ? , ? , ? )");
    $stmt->execute(array($username, $email, $password, $gender));
    $count = $stmt->rowCount();
    if($count>0){
        echo json_encode(array("status" => "success"));
    }else{
        echo json_encode(array("status" => "fail"));
    }