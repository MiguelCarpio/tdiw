<?php
  function consultaGraus($connexio){
    $sql_graus = "SELECT id,nom FROM graus";
    $consulta_graus = pg_query($connexio, $sql_graus) or die("Error sql graus");
    $resultat_graus = pg_fetch_all($consulta_graus);
    return($resultat_graus);
  }
?>