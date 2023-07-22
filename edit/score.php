<?php
    include "../connect.php";
    

    $id = filtersRequest("id");
    $choose = filtersRequest("choose");
    $complete = filtersRequest("complete");
    $match = filtersRequest("match");
    $listen = filtersRequest("listen");
    $read = filtersRequest("read");
    $stmt = $con->prepare("UPDATE `users` SET `choose`=? , `complete`= ?, `match`=?, `listen`=? , `read`= ? WHERE `id`= ?");
    $stmt->execute(array($choose, $complete, $match, $listen, $read, $id));
    $count = $stmt->rowCount();
    if($count>0){
        echo json_encode(array("status" => "success"));
    }else{
        echo json_encode(array("status" => "fail"));
    }