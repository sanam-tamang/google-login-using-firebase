
<?php

  $hostName = "localhost";
  $userName = "root";
  $password = "admin";
  $dbName = "mydb";
 

  $conn = new mysqli($hostName,$userName,$password,$dbName);
  if($conn->connect_errno){
      echo "connectio error ";
      $return['error'] = '' .$conn->connect_error;
  }

  echo "Hello hello";

   if($_SERVER['REQUEST_METHOD']=='POST'){
      echo "Entered in post method";
      $id = $conn->real_escape_string($_POST['id']);
      $name = $conn->real_escape_string($_POST['name']);
      $email = $conn->real_escape_string($_POST['email']);
      $photo = $conn->real_escape_string($_POST['photo']);
        
      $sql = "SELECT id FROM user_info WHERE id = '$id'";
      $result = $conn->query($sql);
         
      $count = $result->num_rows;
      if($count==0){
        echo "The user is not in database";
           
        $insertData = "INSERT INTO user_info(id,name,email,photo)VALUES ('$id','$name', '$email', '$photo' )";
                    if($conn->query($insertData)===true){
                        echo "The user is successfully inserted into the database";
                    }

                    else{
                        echo "Error inserting  data";
                    }
        
       }

      
       else{
        echo "User is already exists" ;
        
       }
      
  }

  
  $conn->close();

  

?>
