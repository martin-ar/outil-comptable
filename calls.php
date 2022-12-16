<?php
    
    include 'db.php';

    $method = $_SERVER['REQUEST_METHOD'];

    if($method=='GET'){
        
        $sql = "SELECT id,call_date,customer_id,item_name,item_price,item_quantity FROM calls ORDER BY call_date ASC";
        
        $stmt = $conn->prepare($sql);
        $stmt->execute();
    
        $calls = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    
        $html = "";
    
        $i = 0;
        $sales_total = 0;
    
        while($i<count($calls)){
    
          $id = $calls[$i]["id"];
          $date = $calls[$i]["call_date"];
          $client =$calls[$i]["customer_id"];
          $item = $calls[$i]["item_name"];
          $quantity = $calls[$i]["item_quantity"];
          $price = $calls[$i]["item_price"];
          $sale_income = $price * $quantity;
          $sales_total = $sales_total + $sale_income;
          $i++;
          $html = $html."<tr>
          <td scope='row'>$i</td>
          <td>$date</td>
          <td>$client</td>
          <td>$item</td>
          <td>$quantity</td>
          <td>$price</td>
          <td>$sale_income € (TTC)</td>
          <td>
            <button type='button' class='btn btn-danger' onclick='deleteCall($id)'>
              <span><object data='trash-bin.svg'></object></span>
            </button>
          </td></tr>
          ";
        }
        $html = $html."<tr class='table-info'><td></td><td></td>
        <td colspan='3'><p><strong>Nombre de commandes : $i</strong></p></td>
        <td colspan='3'><p><strong>Revenue total : $sales_total €</strong></p></td>
        </tr>";

        echo $html;
      }

      if($method=='POST'){

        //vérifier que tous les champs soient bien remplis

        if(empty($_POST['call_date']) || empty($_POST['customer_id']) || empty($_POST['item_name'])
        || empty($_POST['item_price'])|| empty($_POST['item_quantity'])){
          
          echo "Merci de bien remplir tous les champs ;)";
        }else{
          $date = $_POST['call_date'];
          $client = $_POST['customer_id'];
          $item = $_POST['item_name'];
          $price = $_POST['item_price'];
          $quantity = $_POST['item_quantity'];
          if ($quantity > 999) {
            echo 'La quantité ne doit pas dépasser les 999 unités.';
          }else{
      
          $sql = "INSERT INTO calls(call_date,customer_id,item_name,item_price,item_quantity)
                  VALUES('$date','$client','$item','$price','$quantity')";
          
          $stmt = $conn->prepare($sql);
          if($stmt->execute()){
            echo 'La commande a été ajoutée';
          }else{
            echo 'Erreur';
          }
        }
      }
    }
      
        if($method=='DELETE'){
          $id = $_GET['id'];
      
          $sql="DELETE FROM calls WHERE id=$id";
      
          $stmt = $conn->prepare($sql);
      
          if ($stmt->execute()){
            echo "La commande #$id à été supprimée";
          }else{
            echo 'Erreur';
          }
        
        }
      
    
?>
