
<?php

$hostName = "localhost";
$userName = "root";
$password = "admin";
$dbName = "mydb";

$conn = new mysqli($hostName,$userName,$password,$dbName);
if($conn->connect_errno){
    echo "connectio error ".$conn->connect_error;
  
}


 if($_SERVER['REQUEST_METHOD']=='GET'){
   
    $id = $conn->real_escape_string($_GET['id']);

    $sql = "SELECT * FROM user_info WHERE id = '$id'";
    $result = $conn->query($sql);
       
    if($result->num_rows>0){
       
        while($row=$result->fetch_assoc()){
            $return['id'] = $row['id'];
            $return['name'] = $row['name'];
             $return['email'] = $row['email'];
            $return['photo'] = $row['photo'];
        }
    }
   else {
        echo "Error ".$conn->error;
    }
}
else{
    echo "Method erro";
}


$conn->close();

header("Content-Type:application/json");
echo json_encode($return);

?>