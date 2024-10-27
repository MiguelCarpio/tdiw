<?php
  function consultaMencions($connexio, $grau){
    $sql_mencions = "SELECT id,nom FROM mencions WHERE grau=" . $grau;
    $consulta_mencions = pg_query($connexio, $sql_mencions) or die("Error sql mencions");
    $resultat_mencions = pg_fetch_all($consulta_mencions);
    return($resultat_mencions);
  }
?>

