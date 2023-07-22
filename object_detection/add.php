<?php
    include "../connect.php";

    $user_id = filtersRequest("user_id");
    $object_names = filtersRequest("object_names");
    $imgname = filtersRequest("imagename");
    $imagename = imageUpload("file", $imgname);

    if($imagename != 'fail'){
        $stmt = $con->prepare("INSERT INTO `images`(`object Detection`, `object names`, `user_id`) VALUES (? , ?, ?)");
        $stmt->execute(array( $imgname, $object_names, $user_id));

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