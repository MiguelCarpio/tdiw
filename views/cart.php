<?php
if(count($products) > 0){
  foreach ($products as $product) {
    echo "<p>$product</p>";
  }
}else{
  echo "The cart is empty";
}
?>
<button onclick="clearCart()">Go back shopping</button>