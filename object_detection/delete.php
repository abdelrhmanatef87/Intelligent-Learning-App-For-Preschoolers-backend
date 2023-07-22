<?php
    include "../connect.php";

    $imagename = filtersRequest("imagename");

    $stmt = $con->prepare("DELETE FROM `images` WHERE `object Detection` = ?");
    $stmt -> execute(array($imagename));

    $count = $stmt->rowCount();
    if($count>0){
        deleteFile("../upload", $imagename);
        echo json_encode(array("status" => "success"));
    }else{
        echo json_encode(array("status" => "fail"));
    }
    