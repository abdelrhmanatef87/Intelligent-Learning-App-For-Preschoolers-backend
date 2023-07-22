<?php
    include "../connect.php";
    

    $id = filtersRequest("id");
    $review = filtersRequest("review");
    $positive = filtersRequest("positive");
    $negative = filtersRequest("negative");
    $stmt = $con->prepare("UPDATE `users` SET `review`=? ,`positive`= ?,`negative`=? WHERE `id`= ?");
    $stmt->execute(array($review, $positive, $negative, $id));
    $count = $stmt->rowCount();
    if($count>0){
        echo json_encode(array("status" => "success"));
    }else{
        echo json_encode(array("status" => "fail"));
    }