<?php
    $servername = "127.0.0.1";
    $username = "root";
    $passeword = "";
    $dbname = "erp";
    
    header('Conrent-Type: application/json');
    header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");
    header("Access-Control-Allow-Origin: *");
    // create connection
    $conn = mysqli_connect($servername, $username, $passeword, $dbname);

    // test connection
    if(!$conn){
        echo  "connection error";
    }
    else{
        echo  "connection succesful ";
    }

    // get sql command and fire sql query
    $sql = $_POST["command"];
    $result = $conn->query($sql);
    $list = array();

    // set result in array
    if($result->num_rows > 0){
        while ($row = $result->fetch_assoc()){
            array_push($list,$row);
        }
    }

    // return result
    echo json_encode($list);

?> 