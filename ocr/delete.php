<?php
    include "../connect.php";

    $imagename = filtersRequest("imgname");

    $stmt = $con->prepare("DELETE FROM `ocr` WHERE `image name` = ?");
    $stmt -> execute(array($imagename));

    $count = $stmt->rowCount();
    if($count>0){
        deleteFile("../upload", $imagename);
        echo json_encode(array("status" => "success"));
    }else{
        echo json_encode(array("status" => "fail"));
    }
    