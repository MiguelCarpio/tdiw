<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <script src="js/functions2.js"></script>
  <link rel="stylesheet" href="css/wine.css">
</head>
<body>
  <div id="layout">
  <header><h1>Bons vins</h1></header>
  <button class="buy" onclick="buy('rioja')">Buy Rioja</button>
  <button class="query" onclick="info('penedes')">Info Penedés</button>
  <button class="buy" onclick="buy('penedes')">Buy Penedés</button>
  <div class="message" id="message"></div>
  </div>
  <div class="cart" id="cart"></div>
  </div>
</body>
</html>