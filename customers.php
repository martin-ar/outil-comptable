<?php

  include  'db.php';

  $method = $_SERVER['REQUEST_METHOD'];

  if($method=='GET'){
    
    $sql = "SELECT id,first_name,last_name FROM customers"; 
    
    $stmt = $conn->prepare($sql);
    $stmt->execute();

    $customers = $stmt->fetchAll(PDO::FETCH_ASSOC);


    $html = "<option value=''class='placeholder'>--Sélectionner un client--</option>";

    $i = 0;

    while($i<count($customers)){

      $id = $customers[$i]["id"];
      $prenom =$customers[$i]["first_name"];
      $nom = $customers[$i]["last_name"];
      $html = $html."<option value='$prenom $nom' name='$id' id='client'>$prenom $nom</option>";
      $i++;
    }
    echo $html;
  }

?>