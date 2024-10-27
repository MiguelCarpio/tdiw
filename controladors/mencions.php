<?php
  $grau = 1;
  if(isset($_REQUEST['grau'])){
    $grau = $_REQUEST['grau'];
  }
  include_once __DIR__ . "/../models/connectaBD.php";
  include_once __DIR__ . "/../models/consultaMencions.php";

  $connexio = connectaBD();
  $resultat_mencions = consultaMencions($connexio, $grau);
  pg_close($connexio);
  include __DIR__ . "/../vistes/opcionsMencions.php";
?>