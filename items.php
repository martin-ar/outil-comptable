<?php

  include  'db.php';

  $method = $_SERVER['REQUEST_METHOD'];

  if($method=='GET'){
    
      // la requete SQL selectione seulement les produits disponibles
    $sql = "SELECT item_id,item_name,unit_price FROM items WHERE is_available=1";
    
    $stmt = $conn->prepare($sql);
    $stmt->execute();

    $items = $stmt->fetchAll(PDO::FETCH_ASSOC);


    $html = "<option name='0.00' class='placeholder'>--Sélectionner un produit--</option>";

    $i = 0;

    while($i<count($items)){

      $id = $items[$i]["item_id"];
      $name =$items[$i]["item_name"];
      $price = $items[$i]["unit_price"];
      $html = $html."<option id='produit_$id' name='$price' value='$name'>$name</option>";
      $i++;
    }
    echo $html;
  }

?>