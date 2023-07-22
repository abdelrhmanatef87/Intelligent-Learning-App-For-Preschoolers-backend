<?php
    include "../connect.php";

    $user_id = filtersRequest("user_id");
    $recognized_text = filtersRequest("recognized_text");
    $imgname = filtersRequest("imgname");
    $imagename = imageUpload("file", $imgname);

    if($imagename != 'fail'){
        $stmt = $con->prepare("INSERT INTO `ocr`(`image name`, `Recognized text`, `user_id`) VALUES (? , ?, ?)");
        $stmt->execute(array( $imgname, $recognized_text, $user_id));

        $count = $stmt->rowCount();
        if($count>0){
            echo json_encode(array("status" => "success"));
        }else{
            echo json_encode(array("status" => "fail"));
        }
    }
    else{
        echo json_encode(array("status" => "fail"));
    }