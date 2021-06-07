<?php

    $servername = "localhost";
    $username = "root";
    $passeword = "";
    $dbname = "erp";
    

    // create connection
    $conn = new mysqli($servername, $username, $passeword, $dbname);

    $sql = $_POST["command"];
    $result = mysqli_query($conn,$sql);

    // test connection
    if(!$conn){
        echo  "connection error";
    }
    else{
        echo  "connection successful ";
    }

    if($result){
        echo  "done";
    }
    else{
        echo  "error";
    }

?>  