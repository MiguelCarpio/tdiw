<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        p{font-weight: bold;}
    </style>
</head>
<body>
    <p>The following information has been updated successfully: </p>
    <?php
if(isset($_REQUEST['name'])&&isset($_REQUEST['updates'])&&isset($_REQUEST['age'])){
    $name = htmlspecialchars($_REQUEST['name']);
	$updates = htmlspecialchars($_REQUEST['updates']);
    $age = htmlspecialchars($_REQUEST['age']);
	echo "Name: "."$name"."</br>"; 
    echo "Age: "."$age"."</br>";
    echo "Updates: "."$updates";
}
?>
</body>
</html>

