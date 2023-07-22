<?php
    define('MB', 1048576);

    function filtersRequest($requestname){
        return htmlspecialchars(strip_tags($_POST[$requestname]));
    }

    function imageUpload($imageRequest, $imgname){
        global $msgError;
        $imagename =  $imgname;
        $imagetmp = $_FILES[$imageRequest]['tmp_name'];
        $imagesize = $_FILES[$imageRequest]['size'];
        $allowExt = array("jpg", "png", "gif", "mp3", "pdf");
        $strToArray = explode(".", $imagename);
        $ext = end($strToArray);
        $ext = strtolower($ext);
        if(!empty($imagename) && !in_array($ext, $allowExt)){
            $msgError[] = "Ext";
        }
        if($imagesize > 5*MB){
            $msgError[] = "size";
        }
        if(empty($msgError)){
            move_uploaded_file($imagetmp, "../upload/".$imagename);
            return $imagename;
        }else{
            return "fail";
        }
    }

    function deleteFile($dir, $imagename){
        if(file_exists($dir . "/" . $imagename)){
            unlink($dir . "/" . $imagename);
        }
    }