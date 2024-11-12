<?php
if(count($products) > 0){
  foreach ($products as $product) {
?>
<p><?= $product?> </p>
<?php
  } //end if
}else{
?>
  <p>The cart is empty</p>
<?
} //end else
?>
<button onclick="clearMessage()">Go back shopping</button>