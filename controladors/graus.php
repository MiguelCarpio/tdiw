<?php
  include_once __DIR__ . "/../models/connectaBD.php";
  include_once __DIR__ . "/../models/consultaGraus.php";

  $connexio = connectaBD();
  $resultat_graus = consultaGraus($connexio);
  pg_close($connexio);
  include __DIR__ . "/../vistes/opcionsGraus.php";
?>